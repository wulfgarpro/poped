import QtQuick 2.5
import QtQuick.Window 2.2
import GameLib 1.0

Window {
    visible: true
    width:  640
    height: 480

    Item {
        id: root
        height: parent.height
        width:  parent.width

        GameCanvas {
            id: canvas
            Component.onCompleted: engine.start();

            GameEngine {
                id: engine
                onCreateCar: {
                    var component = Qt.createComponent("Badcar.qml");
                    var badcar = component.createObject(canvas,
                        {"x":  (canvas.width * .75 * xPosScale + canvas.width*.125 - 50), "velocity": velocity});
                    carCreated(badcar);
                    badcar.y = canvas.height;
                }
            }

            MyCar {
                id: dan
                x: parent.width / 2 - width / 2
                width: 125
                height: 75

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                Component.onCompleted: engine.dansCarCreated(dan);
            }
        }
    }
}
