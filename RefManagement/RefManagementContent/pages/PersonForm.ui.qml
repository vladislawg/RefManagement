

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    id: personUi
    property alias addButton: addButton

    Item {
        id: topBar
        x: 0
        width: parent.width
        height: 68
        anchors.top: parent.top
        anchors.topMargin: 0

        Button {
            id: addButton
            text: qsTr("Left Menu Text")

            // CUSTOM PROPERTIES
            property url btnIconSource: "images/icon_home.svg"
            property int iconWidth: 18
            property int iconHeight: 18
            property color addBtnColor: "blue"
            x: 580
            y: 10

            implicitWidth: 50
            implicitHeight: 50

            anchors.right: parent.right
            anchors.rightMargin: 10

            anchors.top: parent.top
            anchors.topMargin: 10

            background: Rectangle {
                id: bgBtn
                color: internal.dynamicColor
                radius: 20
            }

            contentItem: Item {
                anchors.fill: parent
                id: content
                Image {
                    id: iconBtn
                    source: "../images/icon_add.png"

                    width: 30
                    height: 30
                    fillMode: Image.PreserveAspectFit
                    visible: true
                    anchors.left: parent.horizontalCenter
                    anchors.top: parent.verticalCenter
                    anchors.leftMargin: -15
                    anchors.topMargin: -15
                    antialiasing: true
                }
            }
        }

        Rectangle {
            width: 200
            height: 40
            anchors.left: parent.left
            anchors.leftMargin: 30
            radius: 100
            color: "#00333742"
            border.width: 1
            anchors.verticalCenter: parent.verticalCenter
            border.color: "#464a53"

            TextEdit {
                id: searchText
                color: "#ffffff"

                text: qsTr("Suche")
                anchors.fill: parent
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                textMargin: 15
            }
        }
    }
}
