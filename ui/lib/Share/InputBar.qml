// inputbar.qml
// 10/21/2012 jichi
import QtQuick 1.1
import QtDesktop 0.1 as Desktop
import '.' as Share

Item { id: root_
  property alias text: textInput_.text
  property alias font: textInput_.font
  property alias placeholderText: placeholder_.text
  //property alias rightPlaceholderText: rightPlaceholder_.text
  property alias activeFocus: textInput_.activeFocus
  property alias maximumLength: textInput_.maximumLength
  property alias hover: toolTip_.containsMouse
  property alias toolTip: toolTip_.text

  signal returnPressed

  implicitWidth: 400
  implicitHeight: textInput_.height

  property int textLeftMargin: 0
  property int textRightMargin: 0

  // - Private -

  //radius: 10
  //gradient: Gradient {  // color: aarrggbb
  //  GradientStop { position: 0.0;  color: '#8c8f8c8c' }
  //  GradientStop { position: 0.17; color: '#6a6a6d6a' }
  //  GradientStop { position: 0.77; color: '#3f3f3f3f' }
  //  GradientStop { position: 1.0;  color: '#6a6a6d6a' }
  //}

  Rectangle {
    anchors.fill: parent
    anchors.margins: -8
    z: -1
    radius: 15
    border.width: textInput_.activeFocus || root_.hover ? 1 : 0
    border.color: '#aaffffff'

    gradient: Gradient {  // color: aarrggbb
      //GradientStop { position: 0.0;  color: '#9c8f8c8c' }
      //GradientStop { position: 0.17; color: '#7a6a6d6a' }
      //GradientStop { position: 0.77; color: '#4f3f3f3f' }
      //GradientStop { position: 1.0;  color: '#7a6a6d6a' }
      GradientStop { position: 0.0;  color: '#ec8f8c8c' }
      GradientStop { position: 0.17; color: '#ca6a6d6a' }
      GradientStop { position: 0.77; color: '#9f3f3f3f' }
      GradientStop { position: 1.0;  color: '#ca6a6d6a' }
    }
  }

  TextInput { id: textInput_
    anchors {
      left: parent.left; right: parent.right
      leftMargin: textLeftMargin; rightMargin: textRightMargin
    }
    //focus: true
    selectByMouse: true
    color: 'snow'
    font.pixelSize: 16
    font.bold: true
    onAccepted: root_.returnPressed()

    //onTextChanged:
    //  if (text.length > root_.maximumLength && root_.maximumLength >=0)
    //    text = text.substr(0, root_.maximumLength)

    effect: Share.TextEffect {}

    Text { id: placeholder_
      anchors.fill: parent
      color: '#88ddf5ee'
      font: textInput_.font
      //visible: !textInput_.activeFocus && !textInput_.text
      visible: !textInput_.text
    }

    //Text { id: rightPlaceholder_
    //  anchors.fill: parent
    //  color: '#88ddf5ee'
    //  font: textInput_.font
    //  horizontalAlignment: Text.AlignRight
    //  //visible: !textInput_.activeFocus && !textInput_.text
    //  visible: !textInput_.text
    //}
  }

  // - Context Menu -

  Desktop.ContextMenu { id: contextMenu_
    Desktop.MenuItem {
      text: qsTr("Copy All")
      //shortcut: "Ctrl+C"
      onTriggered: {
        textInput_.selectAll()
        if (textInput_.selectedText)
          textInput_.copy()
      }
    }
    Desktop.MenuItem {
      text: qsTr("Paste")
      shortcut: "Ctrl+V"
      onTriggered: textInput_.paste()
    }
    Desktop.MenuItem {
      text: qsTr("Cut All")
      //shortcut: "Ctrl+X"
      onTriggered: {
        textInput_.selectAll()
        if (textInput_.selectedText)
          textInput_.cut()
      }
    }
    Desktop.MenuItem {
      text: qsTr("Clear")
      //shortcut: "Ctrl+X"
      onTriggered: textInput_.text = ""
    }
  }

  Desktop.TooltipArea { id: toolTip_
    anchors.fill: parent
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.RightButton
    onPressed: {
      //var gp = Util.itemGlobalPos(parent)
      var gp = mapToItem(null, x + mouse.x, y + mouse.y)
      contextMenu_.showPopup(gp.x, gp.y)
    }
  }
}
