#include "car.h"

Car::Car(QQuickItem *parent) : QQuickPaintedItem(parent)
{
    m_car.load(":/content/bad_car.png");
    m_car = m_car.scaled(m_scaled,Qt::AspectRatioMode::KeepAspectRatio);
}

void Car::paint(QPainter *painter)
{
    painter->save();

    //paint my car here    
    painter->drawImage(0,0, this->m_car);
    painter->restore();
}

QImage Car::car() const
{
    return m_car;
}

void Car::setCar(const QImage &car)
{
    m_car = car;
}
