import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2



ApplicationWindow {
    id: window
    visible: true

    width: 280
    height: 380
    title: qsTr("LaCalculator")
    color: "white"
    minimumWidth: 200
    minimumHeight: 320

    Connections {
        target: appCore // Указываем целевое соединение

        onSendToQml: {
            resultText.text = count // Устанавливаем счётчик в текстовый лейбл
        }
    }
    Rectangle {
        id: resultArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height * 2 / 8
        color: "#1a1a1a"

        Text {
            id: resultText
            //maximumLineCount:
            width: parent.width

            anchors.leftMargin: operations.implicitMargin
            anchors.rightMargin: operations.implicitMargin
            anchors.fill: parent

            horizontalAlignment: Text.AlignRight
            verticalAlignment:   Text.AlignVCenter

            text: "0"
            color: "#f5f5f5"

            font.pixelSize: parent.height * 1 / 2
            fontSizeMode: Text.Fit

        }

    }



    Item {
        id: operations
        anchors.top: resultArea.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 300

        Rectangle {
            id: result
            x: parent.width /6
            y: 0
            width: parent.width *5 /6
            height: parent.height /5
            color: "#aa98a9"
            border.width: 1
            border.color: "black"
        }

        Repeater {
            model: ["7", "8", "9", "4", "5", "6", "1", "2", "3"]
            Button {
                x: (index % 3) * width
                y: Math.floor(index / 3 + 1) * height
                width: parent.width / 4
                height: parent.height / 5
                style: ButtonStyle {
                    background: Rectangle {
                        color: control.pressed ? "#151719": "#696969"
                        border.width: 1
                        border.color: "black"

                    }
                    label: Text {
                        text: qsTr(modelData)
                        font.pixelSize: parent.height * 1 / 2
                        fontSizeMode: Text.Fit
                        color: "White"
                        // Устанавливаем текст в центр кнопки
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                onClicked: appCore.receive_count_FromQml(qsTr(modelData))
            }
        }
        //обнуление C

        Button {
            x: 0
            y: 0
            width: parent.width / 6
            height: parent.height/ 5
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#151719": "#696969"
                    border.width: 1
                    border.color: "black"
                }
                label: Text {
                    text: "C"
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.rezet_count_FromQml()
        }
        //0
        Button {
            x: 0
            y: parent.height * 4 / 5
            width: parent.width / 2
            height: parent.height / 5
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#151719": "#696969"
                    border.width: 1
                    border.color: "black"
                }
                label: Text {
                    text: "0"
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.receive_count_FromQml(0)
        }
        // .
        Button {
            x: parent.width /2
            y: parent.height * 4 / 5
            width: parent.width /4
            height: parent.height / 5
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#151719": "#696969"
                    border.width: 1
                    border.color: "black"
                }
                label: Text {
                    text: " ."
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.decimal_count_FromQml()
        }

        //model: ["÷", "×", "-", "+", "="]
            Button {
                x: parent.width *3/4
                y: parent.height *(1/5) + 0 * parent.height *(4/25)
                width: parent.width / 4
                height: parent.height * 4/ 25
                style: ButtonStyle {
                    background: Rectangle {
                        color: control.pressed ? "#e05a00": "#ff6a00"
                        border.width: 1
                        border.color: "black"

                    }
                    label: Text {
                        text: "÷"
                        font.pixelSize: parent.height * 1 / 2
                        fontSizeMode: Text.Fit
                        color: "White"
                        // Устанавливаем текст в центр кнопки
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                onClicked: appCore.operation_FromQml(1)

            }

        Button {
            x: parent.width *3/4
            y: parent.height *(1/5) + 1 * parent.height *(4/25)
            width: parent.width / 4
            height: parent.height * 4/ 25
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#e05a00": "#ff6a00"
                    border.width: 1
                    border.color: "black"

                }
                label: Text {
                    text: "×"
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    // Устанавливаем текст в центр кнопки
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.operation_FromQml(2)

        }
        Button {
            x: parent.width *3/4
            y: parent.height *(1/5) + 2 * parent.height *(4/25)
            width: parent.width / 4
            height: parent.height * 4/ 25
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#e05a00": "#ff6a00"
                    border.width: 1
                    border.color: "black"

                }
                label: Text {
                    text: "-"
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    // Устанавливаем текст в центр кнопки
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.operation_FromQml(3)

        }
        Button {
            x: parent.width *3/4
            y: parent.height *(1/5) + 3 * parent.height *(4/25)
            width: parent.width / 4
            height: parent.height * 4/ 25
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#e05a00": "#ff6a00"
                    border.width: 1
                    border.color: "black"

                }
                label: Text {
                    text: "+"
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    // Устанавливаем текст в центр кнопки
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.operation_FromQml(4)

        }
        Button {
            x: parent.width *3/4
            y: parent.height *(1/5) + 4 * parent.height *(4/25)
            width: parent.width / 4
            height: parent.height * 4/ 25
            style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#e05a00": "#ff6a00"
                    border.width: 1
                    border.color: "black"

                }
                label: Text {
                    text: "="
                    font.pixelSize: parent.height * 1 / 2
                    fontSizeMode: Text.Fit
                    color: "White"
                    // Устанавливаем текст в центр кнопки
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked: appCore.operation_FromQml(0)

        }
    }


}
