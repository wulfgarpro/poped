#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "car.h"
#include "gameengine.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Car>("GameLib", 1, 0, "Car");
    qmlRegisterType<GameEngine>("GameLib", 1, 0, "GameEngine");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
