import QtQuick 2.0

Rectangle {
    anchors.fill: parent

    Rectangle {
        id: leftborder
        width: parent.width * .125
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "darkgreen"
    }

    Rectangle {
        id: rightborder
        width: parent.width * .125
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "darkgreen"
    }

    ShaderEffectSource {
        id: shaderSrc
        sourceItem: Image { id: img; source: "content/background.jpg" }
        wrapMode: ShaderEffectSource.Repeat
    }

    ShaderEffect {
        property variant src: shaderSrc

        anchors.left: leftborder.right
        anchors.right: rightborder.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        property real time: 0

        NumberAnimation on time{
            id:shaderTimer
            running: true
            from: 0
            to: 1
            duration: 1000
            loops: Animation.Infinite

        }

        vertexShader: "
                   uniform highp mat4 qt_Matrix;
                   attribute highp vec4 qt_Vertex;
                   attribute highp vec2 qt_MultiTexCoord0;
                   varying highp vec2 coord;
                   void main() {
                       coord = qt_MultiTexCoord0;
                       gl_Position = qt_Matrix * qt_Vertex;
                   }"
        fragmentShader: "
                    varying highp vec2 coord;
                    uniform sampler2D src;
                    uniform float time;

                    void main()
                    {
                        gl_FragColor = texture2D( src, vec2((coord.x), coord.y-time) );
                    }"
    }
}
