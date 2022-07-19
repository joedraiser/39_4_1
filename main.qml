import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: "Make transition"

    Rectangle
    {
        id: scene
        anchors.fill: parent
        state: "Initial state"

        Rectangle
        {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                 id: moveID
                 anchors.centerIn: parent
                 text: "move"
                 }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                           if(ball.x >= rightRectangle.x)
                           {
                               scene.state = "Initial state";
                           }
                           else
                           {
                               scene.state = "Other state"
                               ball.x += 30;
                           }
                }
            }
        }
        Rectangle
        {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                 id: returnID
                 anchors.centerIn: parent
                 text: "return"
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked: scene.state = "Initial state"
            }
        }

        Rectangle
        {
            id: ball
            color: "darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: 45
        }

        states: [
            State{
             name: "Other state"
             PropertyChanges{
                 target: ball
                 x: ball.x
             }
            },
            State{
             name: "Initial state"
             PropertyChanges{
                 target: ball
                 x: leftRectangle.x + 5
             }
            }
        ]

        transitions: [
            Transition{
                from: "Other state"
                to: "Initial state"

                NumberAnimation
                {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
