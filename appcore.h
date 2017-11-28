#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>

class AppCore : public QObject
{
    Q_OBJECT
public:
    explicit AppCore(QObject *parent = 0);
    int lever;
    double counterlevel;
    double value;
    int oper;
    double greatvalue;

signals:
    // Сигнал для передачи данных в qml-интерфейс
    void sendToQml(double count);

public slots:
    // Слот для приёма данных из qml-интерфейса
    void receive_count_FromQml(double val);
    void rezet_count_FromQml();
    void decimal_count_FromQml();
    void operation_FromQml(char operation);

private:
    double count;  // Счетчик, которым будем оперировать

};

#endif // APPCORE_H
