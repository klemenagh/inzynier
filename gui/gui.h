#ifndef GUI_H
#define GUI_H

#include <QMainWindow>
#include <QPainter>
#include <QTimer>
#include <QKeyEvent>

namespace Ui {
class GUI;
}

class GUI : public QMainWindow
{
    Q_OBJECT
private:
    class Vehicle
    {
    public:
        Vehicle() = default;
        Vehicle(double length, unsigned numAxles, double axles[5], bool is5up) {
            this->length = length;
            this->num_axles = numAxles;

            for(unsigned i = 0; i < numAxles; i++) {
                this->axle_positions[i] = axles[i];
            }
            for(int i = numAxles; i < 5; i++) this->axle_positions[i] = 0;

            this->axle5up = is5up;
        }

        double      getLength() const { return this->length; }
        unsigned    getAxlesNumber() const { return this->num_axles; }
        double      getAxlePosition(unsigned index) const {
            if(this->num_axles < index) return 0;
            else return this->axle_positions[index];
        }
        bool is5up() const { return this->axle5up; }

    private:
        double length;
        unsigned num_axles;
        double axle_positions[5];

        bool axle5up;
    };

public:
    explicit GUI(QWidget *parent = 0);
    ~GUI();
    void drawScale(QPoint scaleCenter, QPoint scaleBottom, QPoint scaleEnd, QPoint scaleTop, QPainter painter, const double scale, QPoint scaleStart, double end, const unsigned v_height, const unsigned starty, double start, const unsigned startx);
protected:
    void paintEvent(QPaintEvent *event);
    void keyPressEvent(QKeyEvent *event);

private:
    Ui::GUI *ui;

    QVector<Vehicle> vehicles;
    int currentVehicle;

    QTimer * timer;

    void GUIupdate();

private slots:
    void on_vehicleNext_clicked();
    void on_vehiclePrevious_clicked();

    void tryLoadData();


signals:
    void keyCaught(QKeyEvent *e);
};

#endif // GUI_H
