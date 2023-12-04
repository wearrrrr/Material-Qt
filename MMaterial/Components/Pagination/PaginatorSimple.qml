import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle {
    id: _root

    required property SwipeView indexView

    property int numberOfPages: indexView.count

    implicitWidth: height * 3 - Size.pixel4
    implicitHeight: Size.pixel32

    anchors.bottom: parent.bottom

    radius: 8
    color: Theme.main.p800

    Item {
        id: _leftArrow

        anchors.left: _root.left

        height: _root.height
        width: height

        Icon {
            anchors.centerIn: _leftArrow

            iconData: Icons.light.arrow
            color: Theme.common.white
            size: _leftArrow.height * 0.3
            rotation: 90
            interactive: true
            enabled: _root.indexView.currentIndex > 0
            opacity: enabled ? 1 : 0.48

            onClicked: _root.indexView.decrementCurrentIndex();
        }
    }

    Subtitle2 {
        anchors{
            left: _leftArrow.right
            right: _rightArrow.left
        }

        height: _root.height

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter

        text: _root.indexView.currentIndex + 1 + "/" + _root.numberOfPages
        color: Theme.common.white

        font {
            bold: true
            pixelSize: _root.height * 0.45
        }
    }

    Item {
        id: _rightArrow

        anchors.right: _root.right

        height: _root.height
        width: height

        Icon {
            anchors.centerIn: _rightArrow

            iconData: Icons.light.arrow
            color: Theme.common.white
            size: _rightArrow.height * 0.3
            rotation: -90
            interactive: true
            enabled: _root.indexView.currentIndex < _root.indexView.count - 1
            opacity: enabled ? 1 : 0.48

            onClicked: _root.indexView.incrementCurrentIndex();
        }
    }
}
