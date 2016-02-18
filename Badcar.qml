import QtQuick 2.5
import QtQuick.Window 2.2
import GameLib 1.0

Car {
    id: badcar
    width: 100
    height: 100

    property alias velocity: anim.duration

    Timer  {
        running: true
        interval: 1000
        onTriggered: {
            //parent.destroy();
        }
        repeat: false
    }

    Behavior on y {
        NumberAnimation {id: anim; duration: 1000}
    }
}
