#include "appcore.h"
#include "string.h"
#include <QString>


AppCore::AppCore(QObject *parent) : QObject(parent){
    count = 0;
    lever = 0;
    counterlevel = 1;
    value = 0;//общее значение
    oper=-1;
}

void AppCore::receive_count_FromQml(double  val){

    if (oper==0){ value=0; oper=-1;}
    double basis = 0.1;
    if (lever == 0) count = count * 10 + val;
    if (lever == 1) {
        count = count + val * pow(basis,counterlevel);
        ++counterlevel;
    }
    QString str = QString::number(count);
    emit sendToQml(str);
}
void AppCore::rezet_count_FromQml(){

    value = 0; //полное число
    count = 0; //сброс числа
    lever = 0; //сброс десятичности числа
    oper = -1;
    counterlevel = 1;
    QString str = QString::number(count);
    emit sendToQml(str);
}

void AppCore::decimal_count_FromQml(){
    lever = 1;
}
void AppCore::operation_FromQml(int operation){
    lever = 0;
    counterlevel = 1;
    switch (oper){
        case 1:{// пред. операцией было деление
            if (count!=0) value=value/count;
            if (count==0) value=value;
            break;
        }
        case 2:{// пред. операцией было умножение
            value=value*count;
            break;
        }
        case 3:{// пред. операцией было вычитание
            value=value-count;
            break;
        }
        case 4:{// пред. операцией было сложение
            value=value+count;
            break;
        }
        case 0:{
            value=value;
            break;
        }
        default :
            value=count;

            break;
        }

    QString str;

    if (oper == 1){
        if (count==0){
            str = "Inv. operation";
            value=0 ;
        }
        else
            str = QString::number(value);

    }


    else
        str = QString::number(value);

    emit sendToQml(str);
    count=0;
    oper=operation;
}

