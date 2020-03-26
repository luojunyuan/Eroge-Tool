// labeledslider.qml
// 1/6/2013 jichi
//
// See: QML dial control example
import QtQuick 1.1
import QtDesktop 0.1 as Desktop
import '.' as Share

Item { id: root_
  property alias text: label_.text
  property alias font: label_.font
  property alias color: label_.color
  property alias toolTip: toolTip_.text
  property bool hover: toolTip_.containsMouse || slider_.hover
  property alias handleWidth: slider_.handleWidth
  property alias value: slider_.value // real, default 0.0
  property alias maximumValue: slider_.maximumValue // real, default 0.0
  property alias minimumValue: slider_.minimumValue // real, default 100.0

  // - Private -

  Text { id: label_
    anchors {
      top: parent.top; bottom: parent.bottom
      left: parent.left
    }
    verticalAlignment: Qt.AlignVCenter
    color: 'snow'
    effect: Share.TextEffect { highlight: root_.hover }

    font.bold: root_.hover

    Desktop.TooltipArea { id: toolTip_
      anchors.fill: parent
    }
  }

  Share.Slider { id: slider_
    anchors {
      top: parent.top; bottom: parent.bottom
      right: parent.right
      left: label_.right
      leftMargin: 10
    }
  }
}
