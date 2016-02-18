#ifndef CAR_H
#define CAR_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>

class Car : public QQuickPaintedItem
{
    Q_OBJECT
public:
    explicit Car(QQuickItem *parent = 0);

    QImage car() const;
    void setCar(const QImage &car);

signals:

public slots:
    void paint(QPainter *painter);

private:
    QImage m_car;
    QSize  m_scaled = QSize(100,100);
};

#endif // CAR_H
