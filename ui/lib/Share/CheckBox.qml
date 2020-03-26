// checkbox.qml
// 11/26/2012 jichi
//
// See: http://relog.xii.jp/archives/2011/09/qmlqt_4.html
import QtQuick 1.1
import QtDesktop 0.1 as Desktop
import '.' as Share

MouseArea { id: root_

  property bool checked: false      // チェック状態
  property alias hover: toolTip_.containsMouse
  property alias text: text_.text   // 表示するメッセージ
  property alias color: text_.color // 色
  property alias font: text_.font   // フォント
  property int boxSize: 13          // チェックのサイズ
  property alias toolTip: toolTip_.text

  //hoverEnabled: true

  acceptedButtons: Qt.LeftButton

  // - Private -

  // チェック自体のサイズ変更
  //onBoxSizeChanged:
  //  if (boxSize < 10)
  //    boxSize = 10

  //width: box_.width + text_.width + text_.anchors.leftMargin * 2
  //height: box_.height > text_.height ? box_.height : text_.height

//これは使わずstate の whenを使う方がスマートかも
// 状態が変わった時のイベント
//  onCheckedChanged: {
//     if(checked){
//      state = 'ON'
//    }else{
//      state = ''
//    }
//  }

  // クリックイベント
  onClicked: checked = !checked;

  // チェックマーク
  Rectangle { id: box_
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }
    width: boxSize; height: boxSize
    radius: boxSize/2 + 1

    // ベースのグラデ
    gradient: Gradient {
      GradientStop { position: 0; color: '#555555' }
      GradientStop { position: 1; color: '#333333' }
    }

    // On/Offするところ
    Rectangle {
      width: boxSize - 4; height: boxSize - 4
      radius: parent.radius
      anchors.centerIn: parent
      // グラデ（OFF時の色）
      gradient: Gradient {
        GradientStop { id: boxGradBegin_
          position: 0
          color: '#000000'
        }
        GradientStop { id: boxGradEnd_
          position: 1
          color: '#555555'
        }
      }
    }
  }

  // テキスト
  Text { id: text_
    anchors {
      left: box_.right
      verticalCenter: parent.verticalCenter
      leftMargin: 8
    }
    font.strikeout: !checked
    //style: Text.Outline
    //styleColor: 'black'

    //font.bold: root_.hover
    color: 'snow'

    effect: Share.TextEffect { highlight: root_.hover }
  }

  // 状態管理
  states: [
    State {
      name: 'ON'
      when: root_.checked    // こっちの方がスマートかも
      PropertyChanges {
        target: boxGradBegin_
        //color: '#b5e61d' // green
        color: '#95e6ff'   // blue
      }
      PropertyChanges {
        target: boxGradEnd_
        //color: '#637e0e' // green
        color: '#437eff' // deep sky blue
      }
    }
  ]

  Desktop.TooltipArea { id: toolTip_
    anchors.fill: parent
  }
}
