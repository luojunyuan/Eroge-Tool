// textbutton.qml
// 10/17/2012 jichi
//
// CSS: http://www.qtcentre.org/wiki/index.php?title=AeroButton
import QtQuick 1.1
import QtDesktop 0.1 as Desktop

MouseArea { id: root_
  property alias text: text_.text
  property alias font: text_.font
  property alias color: text_.color
  property alias border: shadow_.border
  property alias backgroundColor: shadow_.backgroundColor
  property alias toolTip: toolTip_.text
  property alias shadowWidth: shadow_.width
  property alias shadowHeight: shadow_.height
  property alias radius: shadow_.radius
  property alias style: text_.style
  property alias styleColor: text_.styleColor

  //property alias pressed: mouse_.pressed
  property alias hover: toolTip_.containsMouse

  //signal clicked(variant mouse)

  acceptedButtons: Qt.LeftButton

  // - Private -
  //hoverEnabled: true

  Text { id: text_
    anchors.fill: parent
    horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
    //font.pixelSize: 12
    font.bold: true
    //style: Text.Outline; styleColor: 'black'
    smooth: true
    color: 'snow'
  }

  Rectangle { id: shadow_
    property color backgroundColor: '#ccadd8e6' // light blue
    width: text_.width + 25; height: text_.height + 15
    z: -1
    anchors.centerIn: parent
    radius: 15
    smooth: true

    border.width: hover ? 2 : 0
    //border.color: '#aa00bfff'
    border.color: '#99ffffaa' // yellow

    gradient: Gradient {
      GradientStop {
        position: 0.0
        color: root_.pressed ? Qt.darker(backgroundColor) :
               root_.hover ? Qt.lighter(backgroundColor) :
               Qt.lighter(backgroundColor)
      }
      GradientStop {
        position: 1.0
        color: root_.pressed ? Qt.darker(backgroundColor) :
               root_.hover ? Qt.lighter(backgroundColor) :
               backgroundColor
      }
    }

    //MouseArea { id: mouse_
    //  anchors.fill: parent
    //  hoverEnabled: true
    //  onClicked: root_.clicked(mouse)
    //}

    // Border
    //Rectangle { id: border_
    //  anchors.fill: parent
    //  anchors.margins: root_.borderWidth
    //  radius: 8
    //  smooth: true
    //  color: '#aa00bfff'
    //  z: parent.z -1
    //  visible: root_.hover
    //}
  }

  Desktop.TooltipArea { id: toolTip_
    anchors.fill: parent
  }
}
