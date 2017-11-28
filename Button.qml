import QtQuick 2.5

Rectangle {
    id: button
    signal clicked
    property alias text: text.text
    border.width: 1
    border.color: "white"
    property real textHeight: height - 2
    property real fontHeight: 0.3
    property bool pressed: mouse.pressed
    property real implicitMargin: (width - text.implicitWidth) / 2

    Text {
        id: text
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.fill: parent

        anchors.top: parent.top
        height: parent.textHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height * fontHeight
        color: "black"
        font.family: "Open Sans Regular"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: button.clicked()
    }
}

