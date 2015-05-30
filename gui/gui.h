#ifndef GUI_H
#define GUI_H

#include <QMainWindow>
#include <QPainter>
#include <QTimer>
#include <QKeyEvent>
#include <thread>
#include "vehicle.h"
#include "inputthread.h"


namespace Ui {
class GUI;
}

class GUI : public QMainWindow
{
    Q_OBJECT
private:

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

    std::thread inputThread;

private slots:
    void on_vehicleNext_clicked();
    void on_vehiclePrevious_clicked();

    void GUIupdate();

signals:
    void keyCaught(QKeyEvent *e);
};

#endif // GUI_H
