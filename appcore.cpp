#include "appcore.h"
#include "string.h"

AppCore::AppCore(QObject *parent) : QObject(parent){
    count = 0;
    lever = 0;
    counterlevel = 1;
    value = 0;//общее значение
    oper=-1;
    greatvalue=0;
}

void AppCore::receive_count_FromQml(double  val){

    if (oper==0){ value=0;}

    if (lever == 0) count = count * 10 + val;
    if (lever == 1) {
        count = count + val * pow(0.1,counterlevel);
        ++counterlevel;
    }
    emit sendToQml(count);
}
void AppCore::rezet_count_FromQml(){

    value = 0; //полное число
    count = 0; //сброс числа
    lever = 0; //сброс десятичности числа
    oper = -1;
    counterlevel = 1;

    emit sendToQml(count);
}

void AppCore::decimal_count_FromQml(){
    lever = 1;
}
void AppCore::operation_FromQml(char operation){
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
    emit sendToQml(value);
    count=0;
    oper=operation;
}

