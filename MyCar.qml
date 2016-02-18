import QtQuick 2.0

Item {
    //anchors.fill: parent
    focus: true

    width: parent.width
    height: parent.height

    Image {
        id: car
        source: "content/dan_car.png"
        anchors.centerIn: parent
        rotation: 90

        width: parent.width
        height: parent.height
    }

    Behavior on rotation {
        NumberAnimation { duration: 50; }
    }

    Timer  {
        running: true
        interval: 16
        onTriggered: {
            parent.updatePosition();
        }
        repeat: true
    }

    property bool moveLeft: false
    onMoveLeftChanged: if (moveLeft) { rotation = -10; } else { rotation = 0; }

    property bool moveRight: false
    onMoveRightChanged: if (moveRight) { rotation = 10; } else { rotation = 0; }

    property int step: 5
    function updatePosition() {
        if (moveLeft){
            x -= step;
            if(x < 0) x = 0;
        }
        if (moveRight) {
            x += step;
            if((x + car.width) > parent.width) x = parent.width - car.width;
        }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Left) {
            moveLeft = true;
        }
        if (event.key === Qt.Key_Right) {
            moveRight = true;
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Left) {
            moveLeft = false;
        }
        if (event.key === Qt.Key_Right) {
            moveRight = false;
        }
    }
}
