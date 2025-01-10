// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import RefManagement
import QtQuick.Layouts

Window {
    width: Constants.width
    height: Constants.height
    minimumHeight: Constants.height
    minimumWidth: Constants.width
    visible: true
    title: "RefManagement"
    flags: Qt.Window

    Main {
        id: mainScreen
        anchors.fill: parent
    }

}

