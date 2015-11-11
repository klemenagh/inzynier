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
    const unsigned startx = 50;
    const unsigned starty = 50;
    const unsigned v_height = 120;
    const unsigned wheel_size = 20;
    const int scale_length = 20;

public:
    explicit GUI(QWidget *parent = 0);
    ~GUI();
protected:
    void paintEvent(QPaintEvent *event);
    void keyPressEvent(QKeyEvent *event);

private:
    Ui::GUI *ui;

    QVector<Vehicle> vehicles;
    int currentVehicle;

    QTimer * timer;

    bool automaticMode;
    int numVehicles;

    std::thread inputThread;

    void stopAutomaticMode();
    void GUIupdate();

private slots:
    void on_vehicleNext_clicked();
    void on_vehiclePrevious_clicked();
    void on_vehicleLast_clicked();
    void on_vehicleFirst_clicked();

    void on_automaticModeCheckBox_stateChanged();

    void checkForUpdate();

signals:
    void keyCaught(QKeyEvent *e);
};

#endif // GUI_H
