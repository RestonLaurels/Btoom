#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>

class AppCore : public QObject
{
    Q_OBJECT
public:
    explicit AppCore(QObject *parent = 0);
    int lever;//рычаг для понимания
    double counterlevel;
    double value;
    int oper;


signals:
    /* Сигнал для передачи данных в qml-интерфейс
    *
    */
    void sendToQml(QString count);

public slots:
    // Слот для приёма данных из qml-интерфейса
    void receive_count_FromQml(double val);
    void rezet_count_FromQml();
    void decimal_count_FromQml();
    void operation_FromQml(int operation);

private:
    double count;  // Счетчик, которым будем оперировать

};

#endif // APPCORE_H
