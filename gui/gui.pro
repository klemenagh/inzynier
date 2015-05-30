#-------------------------------------------------
#
# Project created by QtCreator 2015-05-28T23:43:45
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = gui
TEMPLATE = app


SOURCES += main.cpp\
        gui.cpp \
    inputthread.cpp

HEADERS  += gui.h \
    inputthread.h \
    vehicle.h

FORMS    += gui.ui

CONFIG += c++11
