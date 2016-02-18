#ifndef GAMEENGINE_H
#define GAMEENGINE_H
#include <QList>
#include <QObject>
#include <QTimer>

class GameEngine : public QObject
{
    Q_OBJECT
public:
    explicit GameEngine(QObject* parent = 0);

    Q_INVOKABLE
    void start() {
        carCreationTimer.setInterval(1000);
        collisionDetectionTimer.setInterval(20);

        connect(&carCreationTimer, SIGNAL(timeout()), this, SLOT(makeCars()));
        connect(&collisionDetectionTimer, SIGNAL(timeout()), this, SLOT(collisionTest()));

        carCreationTimer.start();
        collisionDetectionTimer.start();
        qsrand(000);
    }

    Q_INVOKABLE
    void carCreated(QObject* car) {
        cars.push_back(car);
    }

    Q_INVOKABLE
    void dansCarCreated(QObject* car) {
        dansCar = car;
    }

signals:
    void createCar(float xPosScale, int velocity);
    void collision(int x, int y);

public slots:
    void makeCars() {
        //do something random to create a car
        float rand = (float) qrand() / RAND_MAX;
        emit createCar(rand,1000);
    }
    void collisionTest();

protected:
    QTimer carCreationTimer;
    QTimer collisionDetectionTimer;
    QList<QObject*> cars;
    QObject* dansCar;
};

#endif // GAMEENGINE_H
