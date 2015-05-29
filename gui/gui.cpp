#include "gui.h"
#include "ui_gui.h"

#include <iostream>
#include <cstdio>
#include <QTextStream>

#define DEBUG 1

GUI::GUI(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::GUI)
{
    ui->setupUi(this);

    this->currentVehicle = -1;
    this->GUIupdate();

    this->timer = new QTimer(this);
    this->timer->start(100);

    connect(timer, SIGNAL(timeout()), this, SLOT(tryLoadData()));
}

GUI::~GUI()
{
    delete ui;
}

void GUI::paintEvent(QPaintEvent *event) {

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

    const double scale = 1000 / 24; //1000pix = 24m;
    const unsigned startx = 50, starty = 50;
    const unsigned v_height = 120;
    const unsigned wheel_size = 20;

    QPoint vehicleStart, vehicleEnd;
    vehicleStart.setX(startx);
    vehicleEnd.setX(startx + length * scale);
    vehicleStart.setY(starty);
    vehicleEnd.setY(starty + v_height);

    QRect vehicle;
    vehicle.setTopLeft(vehicleStart);
    vehicle.setBottomRight(vehicleEnd);

    painter.drawRect(vehicle);
    painter.fillRect(vehicle, Qt::blue);

    painter.setBrush(Qt::red);
    for(unsigned i = 0; i < axles; i++) {
        //sprawdz warunek na podniesioną oś
        unsigned axle_offset_y = 0;
        if(axles == 5 && v.is5up() && i == 2) axle_offset_y = -5;// 3 os auta 5 os. z podniesioną osią
        QPoint center;
        center.setX(startx + scale * positions[i]);
        center.setY(starty + v_height + axle_offset_y);

        painter.drawEllipse(center, wheel_size, wheel_size);
    }

    const unsigned scale_offset = 100;
    QPoint scaleStart, scaleEnd;
    scaleStart.setX(startx);
    scaleStart.setY(starty + v_height + scale_offset);
    scaleEnd.setX(startx + scale * 24);
    scaleEnd.setY(starty + v_height + scale_offset);

    painter.drawLine(scaleStart, scaleEnd);

    //rysuj skale co 4m
    for(int pos = 0; pos <= 24; pos += 4) {
        QPoint scaleTop, scaleBottom, scaleCenter;

        scaleTop.setX(startx + pos * scale);
        scaleTop.setY(starty + v_height + scale_offset - 10);
        scaleBottom.setX(startx + pos * scale);
        scaleBottom.setY(starty + v_height + scale_offset + 10);
        scaleCenter.setX(startx + pos * scale);
        scaleCenter.setY(starty + v_height + scale_offset);

        painter.drawLine(scaleTop, scaleBottom);
        painter.drawText(scaleCenter, QString::number(pos) + QString("m"));
    }

    //rysuj wartości położenia dla osi
    //długość pojazdu
    QPoint vehicleLengthStart, vehicleLengthEnd;
    QPoint scaleTop, scaleBottom, scaleCenter;

    vehicleLengthStart.setX(startx);
    vehicleLengthEnd.setX(startx + length * scale);
    vehicleLengthStart.setY(starty + v_height + 70);
    vehicleLengthEnd.setY(starty + v_height + 70);

    painter.drawLine(vehicleLengthStart, vehicleLengthEnd);
    scaleCenter.setX((startx + length * scale + startx) / 2);
    scaleCenter.setY(starty + v_height + 70);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", length) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(startx);
    scaleTop.setY(starty + v_height + 70 - 10);
    scaleBottom.setX(startx);
    scaleBottom.setY(starty + v_height + 70 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(startx + length * scale);
    scaleTop.setY(starty + v_height + 70 - 10);
    scaleBottom.setX(startx + length * scale);
    scaleBottom.setY(starty + v_height + 70 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    //odległości między osiami
    double start = 0;
    double end = 0;
    //początek do osi 1
    start = 0;
    end = positions[0];
    scaleStart.setX(startx);
    scaleEnd.setX(startx + end * scale);
    scaleStart.setY(starty + v_height + 40);
    scaleEnd.setY(starty + v_height + 40);

    painter.drawLine(scaleStart, scaleEnd);
    scaleCenter.setX((startx + end * scale + startx) / 2);
    scaleCenter.setY(starty + v_height + 40);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", end) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(startx);
    scaleTop.setY(starty + v_height + 40 - 10);
    scaleBottom.setX(startx);
    scaleBottom.setY(starty + v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(startx + end * scale);
    scaleTop.setY(starty + v_height + 40 - 10);
    scaleBottom.setX(startx + end * scale);
    scaleBottom.setY(starty + v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    for(unsigned axle = 0; axle < axles - 1; axle++) {
        start = end;
        end = positions[axle + 1];
        scaleStart.setX(startx + start * scale);
        scaleEnd.setX(startx + end * scale);
        scaleStart.setY(starty + v_height + 40);
        scaleEnd.setY(starty + v_height + 40);

        painter.drawLine(scaleStart, scaleEnd);
        scaleCenter.setX((startx + end * scale + startx + start * scale) / 2);
        scaleCenter.setY(starty + v_height + 40);

        painter.drawText(scaleCenter, QString().sprintf("%.2f", end - start) + QString("m"));

        //podzialka na początku i końcu
        scaleTop.setX(startx + start * scale);
        scaleTop.setY(starty + v_height + 40 - 10);
        scaleBottom.setX(startx + start * scale);
        scaleBottom.setY(starty + v_height + 40 + 10);
        painter.drawLine(scaleTop, scaleBottom);

        scaleTop.setX(startx + end * scale);
        scaleTop.setY(starty + v_height + 40 - 10);
        scaleBottom.setX(startx + end * scale);
        scaleBottom.setY(starty + v_height + 40 + 10);
        painter.drawLine(scaleTop, scaleBottom);
    }
    //koniec pojazdu

    start = end;
    end = length;
    scaleStart.setX(startx + start * scale);
    scaleEnd.setX(startx + end * scale);
    scaleStart.setY(starty + v_height + 40);
    scaleEnd.setY(starty + v_height + 40);

    painter.drawLine(scaleStart, scaleEnd);
    scaleCenter.setX((startx + end * scale + startx + start * scale) / 2);
    scaleCenter.setY(starty + v_height + 40);

    painter.drawText(scaleCenter, QString().sprintf("%.2f", end - start) + QString("m"));

    //podzialka na początku i końcu
    scaleTop.setX(startx + start * scale);
    scaleTop.setY(starty + v_height + 40 - 10);
    scaleBottom.setX(startx + start * scale);
    scaleBottom.setY(starty + v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

    scaleTop.setX(startx + end * scale);
    scaleTop.setY(starty + v_height + 40 - 10);
    scaleBottom.setX(startx + end * scale);
    scaleBottom.setY(starty + v_height + 40 + 10);
    painter.drawLine(scaleTop, scaleBottom);

}

void GUI::keyPressEvent(QKeyEvent *event) {

    if(event->key() == Qt::Key_Left) this->on_vehiclePrevious_clicked();
    else if(event->key() == Qt::Key_Right) this->on_vehicleNext_clicked();
}

void GUI::on_vehicleNext_clicked() {
    if(currentVehicle + 1 < this->vehicles.size()) currentVehicle++;

    this->GUIupdate();
}

void GUI::on_vehiclePrevious_clicked() {
    if(currentVehicle > 0) currentVehicle--;

    this->GUIupdate();
}

void GUI::GUIupdate() {
    if(currentVehicle == this->vehicles.size() - 1) this->ui->vehicleNext->setEnabled(false);
    else this->ui->vehicleNext->setEnabled(true);
    if(currentVehicle <= 0) this->ui->vehiclePrevious->setEnabled(false);
    else this->ui->vehiclePrevious->setEnabled(true);

    this->ui->positionLabel->setText(QString("Aktualna pozycja: %1 / %2").arg(currentVehicle + 1).arg(this->vehicles.size()));

    this->update();
    this->setFocus();

}

void GUI::tryLoadData() {
    std::cout <<"try update" << std::endl;
    fflush(stdin);
    QString type;
    unsigned axles;
    bool is5up = false;
    double positions[7];
    char buffer[100];
    char source[100];
    fgets(buffer, sizeof(buffer), stdin);
    QString s(buffer);
    if(DEBUG) std::cout << s.toStdString() << std::endl;
    QTextStream str(&s);
    str >> source >> type;
    if(type == "5up") {
        is5up = true;
        axles = 5;
    }
    else axles = type.toInt();
    for(unsigned i = 0; i < axles + 2; i++) {
        str >> positions[i];
    }
    //wylicz położenia osi
    double axle_pos[axles];
    axle_pos[0] = positions[1];
    for(unsigned i = 1; i < axles; i++) {
        axle_pos[i] = axle_pos[i - 1] + positions[i + 1];
    }

    if(DEBUG) {
        std::cout << "length: " << positions[0] << std::endl;
        std::cout << "axles:  " << axles << std::endl;
        for(unsigned i = 0; i < axles; i++) {
            std::cout << "axle:   " << axle_pos[i] << std::endl;
        }
    }
    if(axles < 2 || axles > 5) return; //nieobsługiwane przypadki

    this->vehicles.push_back(Vehicle(positions[0], axles, axle_pos, is5up));

    this->GUIupdate();
}
