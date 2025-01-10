

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Button {
    id: quiteButton
    width: 30
    height: 20
    text: qsTr("X")
    background: Rectangle {
        color: "#9099ad"
        border.color: "#26282a"
        border.width: 1
    }

    Connections {
        target: quiteButton
        onClicked: Qt.quit()
    }
}
