// slider.qml
// 1/6/2013 jichi
//
// See: QML dial control example
import QtQuick 1.1
import QtDesktop 0.1 as Desktop

Rectangle { id: root_
  height: 16
  radius: 8
  opacity: 0.7
  smooth: true

  property alias handleWidth: handle_.width
  property alias hover: toolTip_.containsMouse

  property real minimumValue: 0
  property real maximumValue: 100

  //property real value: min + (handle_.x * (max-min) / (width - handle_.width)

  property real value: 0

  // - Private -

  onValueChanged: updateHandle()
  onMaximumValueChanged: updateHandle()
  onMinimumValueChanged: updateHandle()
  onWidthChanged: updateHandle()

  function updateHandle() {
    if (width > handle_.width) {
      var t = Math.round((value - minimumValue) * (width - handle_.width) / (maximumValue - minimumValue))
      if (t != handle_.x)
        handle_.x = t
    }
  }

  function updateValue() {
    if (width > handle_.width) {
      var t = minimumValue + handle_.x * (maximumValue - minimumValue) / (width - handle_.width)
      if (t != value)
        value = t
    }
  }

  //Plugin.SliderBean { Component.onCompleted: init() }

  gradient: Gradient {
    GradientStop { position: 0.0; color: 'gray' }
    GradientStop { position: 1.0; color: 'white' }
  }

  Rectangle { id: handle_
    anchors.verticalCenter: parent.verticalCenter
    y: 1; width: 30; height: 14
    x: 0
    radius: 6
    smooth: true
    gradient: Gradient {
      GradientStop { position: 0.0; color: '#424242' }
      GradientStop { position: 1.0; color: 'black' }
    }

    onXChanged: updateValue()
    onWidthChanged: updateHandle()

    MouseArea {
      anchors.fill: parent
      anchors.margins: -16 // Increase mouse area a lot outside the slider
      drag.target: parent; drag.axis: Drag.XAxis
      drag.minimumX: 0; drag.maximumX: root_.width - handle_.width
    }
  }

  Desktop.TooltipArea { id: toolTip_
    anchors.fill: parent
    text: value.toFixed(2)
  }
}
