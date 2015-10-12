#ifndef INPUTTHREAD_H
#define INPUTTHREAD_H

#include <QVector>
#include <iostream>
#include <QString>
#include <QTextStream>
#include <chrono>
#include <thread>

#include "vehicle.h"
#define DEBUG false

class InputThread
{
public:
    InputThread(QVector<Vehicle> & v) :vehicles(v) {}
    void operator()() {
        loop();
    }

private:
    void loop();

    QVector<Vehicle> & vehicles;
};

#endif // INPUTTHREAD_H
