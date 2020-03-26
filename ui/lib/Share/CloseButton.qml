// closebutton.qml
// 10/17/2012 jichi
import '.' as Share

Share.TextButton {

  // - Private -
  width: 10; height: 10
  shadowWidth: width + 15; shadowHeight: height + 15
  font.pixelSize: 10
  font.bold: hover
  //color: hover ? 'red' : 'snow'
  //backgroundColor: hover ? '#44ff33cc' : 'transparent' // magenta
  backgroundColor: hover ? '#556a6d6a' : 'transparent' // black

  text: "×" // ばつ
  toolTip: qsTr("Close")
}
