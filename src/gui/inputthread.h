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
    InputThread(QVector<Vehicle> & v) :vehicles(v), work(true) {
    }
    void operator()() {
        loop();
    }
    void close() {
        this->work = false;
    }

private:
    void loop();

    QVector<Vehicle> & vehicles;

    bool work;
};

#endif // INPUTTHREAD_H
