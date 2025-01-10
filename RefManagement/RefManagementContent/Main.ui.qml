

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import RefManagement
import QtQuick.Layouts

Rectangle {
    id: bg
    width: Constants.width
    height: Constants.height
    color: "#232948"
    anchors.fill: parent

    Rectangle {
        id: appBar
        width: 200
        height: bg.height
        color: "#1f2b43"
        anchors.left: bg.left
        anchors.top: bg.top
        anchors.topMargin: 5
        anchors.leftMargin: 5
        anchors.bottom: bg.bottom
        anchors.bottomMargin: 5

        PropertyAnimation {
            id: animationMenue
            target: appBar
            property: "width"
            to: if (appBar.width === 70)
                    return 250
                else
                    return 70
            duration: 500
            easing.type: Easing.InOutQuint
        }

        Button {
            id: barCloseButton

            width: 30
            height: 20
            text: "<font color=\"white\">X</font>"
            anchors.right: parent.right
            anchors.rightMargin: 0
            display: AbstractButton.TextOnly
            background: Rectangle {
                color: appBar.color
                border.width: 0
            }

            Connections {
                target: barCloseButton
                onClicked: animationMenue.running = true
            }
        }

        Column {
            id: columnMenues
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 90
            spacing: 5
            anchors.topMargin: 30

            MenueButton {
                id: homeButton
                width: appBar.width
                text: qsTr("Dashboard")
                isActiveMenu: false
                btnIconSource: "images/icon_home.svg"

                Connections {
                    target: homeButton
                    onClicked: {

                        console.log("Btn Home clicked")
                        appView.push("pages/Home.qml")
                        homeButton.isActiveMenu = true
                        personButton.isActiveMenu = false
                        headerText.text = "Dashboard"
                    }
                }
            }

            MenueButton {
                id: personButton
                width: appBar.width
                text: qsTr("Person")
                isActiveMenu: false
                btnIconSource: "images/icon_person.png"

                Connections {
                    target: personButton
                    onClicked: {

                        console.log("Btn Person clicked")
                        appView.push("pages/Person.qml")
                        homeButton.isActiveMenu = false
                        personButton.isActiveMenu = true
                        headerText.text = "Person"
                    }
                }
            }
        }
    }

    Rectangle {
        id: topBar
        anchors.left: appBar.right
        anchors.leftMargin: 5
        anchors.top: appBar.top
        width: bg.width - appBar.width - 15
        height: 40
        color: bg.color

        CloseButton {
            id: closeButton
            text: "X"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.topMargin: 10
        }

        Text {
            id: headerText
            width: 446
            height: 40
            color: "#ffffff"
            text: "Dashboard"
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 30
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }
    }

    Rectangle {
        id: appContent
        color: bg.color
        anchors.left: appBar.right
        anchors.leftMargin: 5
        anchors.top: topBar.bottom
        anchors.topMargin: 5
        width: bg.width - appBar.width - 15
        height: bg.height - topBar.height - 15

        StackView {
            id: appView
            anchors.fill: appContent
            initialItem: "pages/Person.qml"

            pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 200
                }
            }
            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 200
                }
            }
        }
    }
}
