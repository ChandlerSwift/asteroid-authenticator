TARGET = asteroid-authenticator
CONFIG += asteroidapp

SOURCES +=     main.cpp \
    twofactor.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += main.qml

lupdate_only{ SOURCES += i18n/asteroid-authenticator.desktop.h }
TRANSLATIONS = $$files(i18n/$$TARGET.*.ts)

HEADERS += \
    twofactor.h

CONFIG += qmltypes
QML_IMPORT_NAME = com.chandlerswift.asteroidos.authenticator
QML_IMPORT_MAJOR_VERSION = 1

INCLUDEPATH += /tmp/botan/botan/build/include
DEPENDPATH += /tmp/botan/botan/build/include

unix:!macx: LIBS += -L/tmp/botan/botan/ -lbotan-2

INCLUDEPATH += $$PWD/botan
DEPENDPATH += $$PWD/botan
