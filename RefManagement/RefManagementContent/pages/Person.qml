import QtQuick
import RefManagement

PersonForm {
    id:personForm

    property color btnColorDefault: "#00a1f1"
    property color btnColorMouseOver: "#38b2ee"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(addButton.down){
                                       addButton.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       addButton.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    Loader{
        id: addPersonloader
    }

    Window{
        id: popup
        flags: Qt.Window | Qt.WindowStaysOnTopHint
        width: Constants.width
        height: Constants.height
        AddPerson{
        }
    }

    addButton.onClicked:{
        console.log("addBtnClicked")
        popup.show()
    }
}



