#include "gameengine.h"
#include <QQuickItem>
#include <QDebug>
#include "car.h"

GameEngine::GameEngine(QObject *parent) : QObject(parent)
{

}

void GameEngine::collisionTest()
{
    QQuickItem* d = qobject_cast<QQuickItem*>(dansCar);
    for(int i = 0; i < cars.size(); i++)
    {
        QQuickItem* item = qobject_cast<QQuickItem*>(cars[i]);

        qDebug() << "item: " << item->boundingRect();
        qDebug() << "d: " << d->boundingRect();
        qDebug() << item->mapRectToScene(item->boundingRect()).intersects(d->mapRectToScene(d->boundingRect()));
        qDebug() << "mapped item: " << item->mapRectToScene(item->boundingRect());
        qDebug() << "mapped d: " << d->mapRectToScene(d->boundingRect());

        if(item->mapRectToScene(item->boundingRect()).intersects(d->mapRectToScene(d->boundingRect()))) {
            emit collision(item->x(), item->y());
            //item->deleteLater();
            //cars.removeAt(i);
            qDebug() << "collision biatch";
        }

        if(item->y() >= 480) {
            cars.removeAt(i);
            item->deleteLater();
        }
    }
}
