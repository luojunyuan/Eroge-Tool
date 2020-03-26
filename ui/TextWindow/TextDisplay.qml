import QtQuick 1.1
import QtDesktop 0.1 as Desktop
import eroge.tool 0.1 as Plugin
import '../lib/QtPlugin/qmleffects' as Effects
import '../lib/QtPlugin/texscript' as TexScript
import '../lib/Ui' as Ui
import '../lib/Share' as Share

Item {
    id: root

    property alias shadowColor: shadow.color
    property alias shadowOpacity: shadow.opacity
    property bool shadowEnabled: true
    property bool alignCenter: true
    property bool ignoresFocus: false
    property bool textVisible: true
    property bool hoverEnabled: true
    property color textColor: '#aa007f'
    property real zoomFactor: 1.0
    property string furiganaType: 'hiragana'

    signal lookupRequested(string text, int x, int y) // popup honyaku of text at (x, y)

    function show() {
        visible = true
    }
    function hide() {
        visible = false
    }
    function renderTex(t) { return t.indexOf('\\') === -1 ? t : tex.toHtml(t) }
    function clear() {
      // pass
      console.log("TextDisplay.qml:clear: pass")
    }

    // 设置文字style
    TexScript.TexHtmlParser {
        id: tex

        settings: TexScript.TexHtmlSettings {
            tinySize: Math.round(zoomFactor * 10) + 'px'
            smallSize: Math.round(zoomFactor * 14) + 'px'
            normalSize: Math.round(zoomFactor * 18) + 'px' // the same as edit.font.pixelSize
            largeSize: Math.round(zoomFactor * 28) + 'px'
            hugeSize: Math.round(zoomFactor * 40) + 'px'

            hrefStyle: "color:snow"
            urlStyle: hrefStyle
       }
    }

    Plugin.TextDisplayProxy {
        id: proxy

        Component.onCompleted: {
            proxy.clear.connect(root.clear)
            proxy.showText.connect(root.showText)
        }
    }

    Item {
        id: textItem
        width: visible ? edit.width: 0
        height: visible ? edit.height + 5: 0 // with margins

        visible: root.textVisible

        TextEdit {
            id: edit

            function renderText(t) {
              return !t ? "" :
                '<span style="background-color:rgba(0,0,0,10)">' + t + '</span>'
            }

            // height is the same as painted height
            width: root.width
            effect: Effects.TextShadow {
              blurRadius: 8
              offset: '1,1'
              color: textCursor.containsMouse ? 'red' :
                     model.type === 'text' ? root_.textColor :
                     'transparent'
            }
            anchors.centerIn: parent
            textFormat: TextEdit.RichText
            text: renderText(
                proxy.renderJapanese(
                    text,
                    root.furiganaType,
                    Math.round(root.width / (24 * zoomFactor)), // char per line
                    Math.round(10 * zoomFactor) + 'px', // ruby size of furigana
                    textCursor.containsMouse, // colorize
                    root.alignCenter
                )
            )
            readOnly: true
            focus: false
            wrapMode: model.needsWrap ? TextEdit.Wrap : TextEdit.NoWrap
            verticalAlignment: TextEdit.AlignVCenter
            horizontalAlignment: root_.alignCenter ? TextEdit.AlignHCenter : TextEdit.AlignLeft
//            font.family: _JAPANESE_FONT
            font.bold: true
            font.pixelSize: 18 * zoomFactor
            color: 'snow'
            onLinkActivated: Qt.openUrlExternally(link)

            MouseArea {
                id: textCursor

                property string lastSelectedText

                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                enabled: true
                hoverEnabled: enabled

                onPositionChanged: {

                    edit.cursorPosition = edit.positionAt(mouse.x, mouse.y)
                    edit.selectWord()
                    var t = edit.selectedText
                    if (t && t !== lastSelectedText) {
                        lastSelectedText = t

                        var gp = mapToItem(null, x + mouse.x, y + mouse.y)
                        root_.yakuAt(t, gp.x, gp.y)
                    }
                 }

                onClicked: {
                    edit.cursorPosition = edit.positionAt(mouse.x, mouse.y)
                    edit.selectWord()
                    var t = edit.selectedText
                    if (t) {
                        lastSelectedText = t

                        var gp = mapToItem(null, x + mouse.x, y + mouse.y)
                        root.yakuAt(t, gp.x, gp.y)

                        if (root_.copyEnabled)
                            edit.copy()
                    }
                }
            }
        }
    }
}
