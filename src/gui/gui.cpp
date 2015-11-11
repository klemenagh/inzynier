#include "gui.h"
#include "ui_gui.h"

GUI::GUI(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::GUI)
{
    ui->setupUi(this);
    this->automaticMode = true;
    this->ui->automaticModeCheckBox->setChecked(this->automaticMode);

    this->currentVehicle = -1;
    this->GUIupdate();

    this->timer = new QTimer(this);
    this->timer->start(10);

    connect(timer, SIGNAL(timeout()), this, SLOT(checkForUpdate()));

    InputThread i(this->vehicles);
    this->inputThread = std::thread{i};
}

GUI::~GUI()
{
    this->inputThread.detach();
    delete ui;

    std::cerr << "Quitting..." << std::endl;
}

void GUI::paintEvent(QPaintEvent *event) {
    event->accept();
    //rysowanie pojazdu
    if(this->vehicles.size() == 0 || currentVehicle < 0 || currentVehicle >= vehicles.size()) return;

    QPainter painter(this);


    Vehicle v = this->vehicles[currentVehicle];
    double length = v.getLength();
    unsigned axles = v.getAxlesNumber();
    double positions[axles];
    for(unsigned i = 0; i < axles; i++) {
        positions[i] = v.getAxlePosition(i);
    }

    const double scale = 1000 / this->scale_length; //1000pix = 24m;

    QPoint vehicleStart, vehicleEnd;
    vehicleStart.setX(this->startx);
    vehicleEnd.setX(this->startx + length * scale);
    vehicleStart.setY(this->starty);
    vehicleEnd.setY(this->starty + this->v_height);

    QRect vehicle;
    vehicle.setTopLeft(vehicleStart);
    vehicle.setBottomRight(vehicleEnd);

    painter.drawRoundedRect(vehicle, 40, 10);
    painter.fillRect(vehicle, QColor(0, 0, 0, 70));


    for(unsigned i = 0; i < axles; i++) {
        //sprawdz warunek na podniesioną oś
        unsigned axle_offset_y = 0;
        if(axles == 5 && v.is5up() && i == 2) axle_offset_y = -5;// 3 os auta 5 os. z podniesioną osią
        QPoint center;
        center.setX(this->startx + scale * positions[i]);
        center.setY(this->starty + this->v_height + axle_offset_y);

        painter.setBrush(QWidget::palette().color(QWidget::backgroundRole()));
        painter.setPen(QWidget::palette().color(QWidget::backgroundRole()));
        painter.drawEllipse(center, this->wheel_size + 5, this->wheel_size + 5);
        painter.setPen(Qt::black);
        painter.setBrush(Qt::black);
        painter.drawEllipse(center, this->wheel_size, this->wheel_size);
        painter.setBrush(Qt::white);
        painter.drawEllipse(center, this->wheel_size - 5, this->wheel_size - 5);
    }

    const unsigned scale_offset = 100;
    QPoint scaleStart, scaleEnd;
    scaleStart.setX(this->startx);
    scaleStart.setY(this->starty + this->v_height + scale_offset);
    scaleEnd.setX(this->startx + scale * this->scale_length);
    scaleEnd.setY(this->starty + this->v_height + scale_offset);

    painter.drawLine(scaleStart, scaleEnd);

    //rysuj skale co 4m
    for(int pos = 0; pos <= this->scale_length; pos += 4) {
        QPoint scaleTop, scaleBottom, scaleCenter;

        scaleTop.setX(this->startx + pos * scale);
        scaleTop.setY(this->starty + this->v_height + scale_offset - 10);
        scaleBottom.setX(this->startx + pos * scale);
        scaleBottom.setY(this->starty + this->v_height + scale_offset + 10);
        scaleCenter.setX(this->startx + pos * scale);
        scaleCenter.setY(this->starty + this->v_height + scale_offset);

        painter.drawLine(scaleTop, scaleBottom);
        painter.drawText(scaleCenter, QString::number(pos) + QString("m"));
    }

    //rysuj wartości położenia dla osi
    //długość pojazdu
    QPoint vehicleLengthStart, vehicleLengthEnd;
    QPoint scaleTop, scaleBottom, scaleCenter;

    vehicleLengthStart.setX(this->startx);
    vehicleLengthEnd.setX(this->startx + length * scale);
    vehicleLengthStart.setY(this->starty + this->v_height + 70);
    vehicleLengthEnd.setY(this->starty + this->v_height + 70);

    painter.drawLine(vehicleLengthStart, vehicleLengthEnd);
    scaleCenter.setX((this->startx + length * scale + this->startx) / 2);
    scaleCenter.setY(this->starty + this->v_height + 70);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", length) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(this->startx);
    scaleTop.setY(this->starty + this->v_height + 70 - 10);
    scaleBottom.setX(this->startx);
    scaleBottom.setY(this->starty + this->v_height + 70 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(this->startx + length * scale);
    scaleTop.setY(this->starty + this->v_height + 70 - 10);
    scaleBottom.setX(this->startx + length * scale);
    scaleBottom.setY(this->starty + this->v_height + 70 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    //odległości między osiami
    double start = 0;
    double end = 0;
    //początek do osi 1
    start = 0;
    end = positions[0];
    scaleStart.setX(this->startx);
    scaleEnd.setX(this->startx + end * scale);
    scaleStart.setY(this->starty + this->v_height + 40);
    scaleEnd.setY(this->starty + this->v_height + 40);

    painter.drawLine(scaleStart, scaleEnd);
    scaleCenter.setX((this->startx + end * scale + this->startx) / 2);
    scaleCenter.setY(this->starty + this->v_height + 40);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", end) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(this->startx);
    scaleTop.setY(this->starty + this->v_height + 40 - 10);
    scaleBottom.setX(this->startx);
    scaleBottom.setY(this->starty + this->v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(this->startx + end * scale);
    scaleTop.setY(this->starty + this->v_height + 40 - 10);
    scaleBottom.setX(this->startx + end * scale);
    scaleBottom.setY(this->starty + this->v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    for(unsigned axle = 0; axle < axles - 1; axle++) {
        start = end;
        end = positions[axle + 1];
        scaleStart.setX(this->startx + start * scale);
        scaleEnd.setX(this->startx + end * scale);
        scaleStart.setY(starty + this->v_height + 40);
        scaleEnd.setY(starty + this->v_height + 40);

        painter.drawLine(scaleStart, scaleEnd);
        scaleCenter.setX((this->startx + end * scale + this->startx + start * scale) / 2);
        scaleCenter.setY(this->starty + this->v_height + 40);

        painter.drawText(scaleCenter, QString().sprintf("%.2f", end - start) + QString("m"));

        //podzialka na początku i końcu
        scaleTop.setX(this->startx + start * scale);
        scaleTop.setY(this->starty + this->v_height + 40 - 10);
        scaleBottom.setX(this->startx + start * scale);
        scaleBottom.setY(this->starty + this->v_height + 40 + 10);
        painter.drawLine(scaleTop, scaleBottom);

        scaleTop.setX(this->startx + end * scale);
        scaleTop.setY(this->starty + this->v_height + 40 - 10);
        scaleBottom.setX(this->startx + end * scale);
        scaleBottom.setY(this->starty + this->v_height + 40 + 10);
        painter.drawLine(scaleTop, scaleBottom);
    }
    //koniec pojazdu

    start = end;
    end = length;
    scaleStart.setX(this->startx + start * scale);
    scaleEnd.setX(this->startx + end * scale);
    scaleStart.setY(this->starty + this->v_height + 40);
    scaleEnd.setY(this->starty + this->v_height + 40);

    painter.drawLine(scaleStart, scaleEnd);
    scaleCenter.setX((this->startx + end * scale + this->startx + start * scale) / 2);
    scaleCenter.setY(this->starty + this->v_height + 40);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", end - start) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(this->startx + start * scale);
    scaleTop.setY(this->starty + this->v_height + 40 - 10);
    scaleBottom.setX(this->startx + start * scale);
    scaleBottom.setY(this->starty + this->v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(this->startx + end * scale);
    scaleTop.setY(this->starty + this->v_height + 40 - 10);
    scaleBottom.setX(this->startx + end * scale);
    scaleBottom.setY(this->starty + this->v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

}

void GUI::stopAutomaticMode() {
    this->automaticMode = false;
    this->ui->automaticModeCheckBox->setChecked(false);
}

void GUI::keyPressEvent(QKeyEvent *event) {

    if(event->key() == Qt::Key_Left) this->on_vehiclePrevious_clicked();
    else if(event->key() == Qt::Key_Right) this->on_vehicleNext_clicked();
    if(event->key() == Qt::Key_Up) this->on_vehicleLast_clicked();
    else if(event->key() == Qt::Key_Down) this->on_vehicleFirst_clicked();
    else if(event->key() == Qt::Key_A) {
        this->ui->automaticModeCheckBox->toggle();
    }
}

void GUI::on_vehicleNext_clicked() {
    if(this->currentVehicle + 1 < this->vehicles.size()) this->currentVehicle++;

    this->stopAutomaticMode();
    this->GUIupdate();
}

void GUI::on_vehiclePrevious_clicked() {
    if(this->currentVehicle > 0) this->currentVehicle--;

    this->stopAutomaticMode();
    this->GUIupdate();
}

void GUI::on_vehicleLast_clicked() {
    this->currentVehicle = numVehicles;

    this->GUIupdate();
}

void GUI::on_vehicleFirst_clicked() {
    this->currentVehicle = 0;

    this->stopAutomaticMode();
    this->GUIupdate();
}

void GUI::on_automaticModeCheckBox_stateChanged() {
    this->automaticMode = this->ui->automaticModeCheckBox->isChecked();
    this->on_vehicleLast_clicked();
}

void GUI::checkForUpdate() {
    if (this->numVehicles != this->vehicles.size() - 1)
        this->GUIupdate();
}

void GUI::GUIupdate() {
    if (this->automaticMode)
        this->currentVehicle = this->vehicles.size() - 1;
    this->ui->vehicleNext->setEnabled(currentVehicle != this->vehicles.size() - 1);
    this->ui->vehicleLast->setEnabled(currentVehicle != this->vehicles.size() - 1);
    this->ui->vehiclePrevious->setEnabled(currentVehicle > 0);
    this->ui->vehicleFirst->setEnabled(currentVehicle > 0);

    this->numVehicles = this->vehicles.size() - 1;

    this->ui->positionLabel->setText(QString("Aktualna pozycja: %1 / %2").arg(currentVehicle + 1).arg(this->vehicles.size()));

    this->update();
    this->setFocus();
}
