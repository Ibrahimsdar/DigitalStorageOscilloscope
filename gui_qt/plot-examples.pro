#
#  QCustomPlot Plot Examples
#

QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

TARGET = plot-examples
TEMPLATE = app

SOURCES += main.cpp\
           mainwindow.cpp \
         ../../qcustomplot.cpp

HEADERS  += mainwindow.h \
         ../../qcustomplot.h \
         alt_gpio.h \
         hps.h \
         hps_0.h \
         hwlib.h \
         socal.h

FORMS    += mainwindow.ui

#INCLUDEPATH += /home/terasic/altera/13.1/embedded/ip/altera/hps/altera_hps/hwlib/include
#DEPENDPATH += /home/terasic/altera/13.1/embedded/ip/altera/hps/altera_hps/hwlib/include

DISTFILES += \
    testData.txt

QMAKE_CXXFLAGS += -std=gnu++11
