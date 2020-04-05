import QtQuick 1.1
// import QtDesktop 0.1 as Desktop
// import eroge.tool 0.1 as Plugin
import 'TextWindow'
import 'lib/QtPlugin/texscript' as TexScript
Item {
    id: root

    // If you fon't set full screen in python, it will show 800*600 by default
    implicitWidth: 800
    implicitHeight: 600
    // TexScript.TexHtmlParser {}
//    property bool ignoresFocus: dock_.ignoresFocusChecked && gameProxy_.fullScreen


    Component.onCompleted: {
//        console.log("text_window.qml: taskbar height =", taskBar_.height)
        console.log("text_display.qml:completed: pass")
    }

    Component.onDestruction: {
        console.log("text_display.qml:destroy: pass")
    }


//    Item {
//        id: gamePanel
//
//        anchors.fill: parent
//
//        visible: true  // gameProxy_.visible && !gameProxy_.minimized
//
//        onVisibleChanged: console.log("text_display.qml: visible =", visible)

//        Kagami.CentralArea {
//            id: center_
//
//            height: gameProxy_.height
//            width: gameProxy_.width
//            x: gameProxy_.x
//            y: gameProxy_.y
//
//            // XXX what is this use for?
//            borderVisible: dock_.gameBorderChecked && Qt.application.active && !root.ignoresFocus
//        }
//
//        Kagami.Grimoire {
//            id: grimoire_
//            //anchors {
//            //  fill: locked ? center_ : undefined
//            //  leftMargin: center_.width * (1 - widthFactor) / 2
//            //  rightMargin: center_.width * (1 - widthFactor) / 2
//            //  bottomMargin: center_.height / 4
//            //  topMargin: gameProxy_.fullScreen ? 0 : 25
//            //}
//            x: locked ? relativeX + center_.x : x
//            y: locked ? relativeY + center_.y : y
//            width: center_.width * widthFactor
//            height: center_.height * 3 / 4
//
//            function ensureVisible() {
//                if (x < center_.x || x+width/2 > center_.x+center_.width) {
//                    if (locked) relativeX = (center_.width - width) / 2
//                    else x = center_.x + (center_.width - width) / 2
//                }
//                if (y < center_.y || y+height/2 > center_.y+center_.height) {
//                    if (locked) relativeY = 25
//                    else y = center_.y + 25
//                }
//            }
//
//            furiganaType: settings_.furiganaType
//
//            alignCenter: dock_.alignCenterChecked
//
//            shadowOpacity: dock_.shadowOpacity
//            shadowColor: settings_.grimoireShadowColor
//            textColor: settings_.grimoireTextColor
//            translationColor: settings_.grimoireTranslationColor
//            commentColor: settings_.grimoireSubtitleColor
//
//            property int relativeX: (center_.width - width) / 2
//            property int relativeY: gameProxy_.fullScreen ? 0 : 25
//
//            onLockedChanged: {
//                relativeX = x - center_.x
//                relativeY = y - center_.y
//            }
//
//            ignoresFocus: root.ignoresFocus
//
//            //borderVisible: dock_.borderChecked
//            //locked: dock_.lockChecked
//
//            zoomFactor: dock_.zoomFactor
//            property alias widthFactor: dock_.widthFactor
//
//            textVisible: dock_.textChecked
//            translationVisible: dock_.translationChecked
//            commentVisible: dock_.subtitleChecked
//            readEnabled: dock_.readChecked
//            copyEnabled: dock_.copyChecked
//            hoverEnabled: dock_.hoverChecked
//            shadowEnabled: dock_.shadowChecked
//            //revertsColor: dock_.revertsColorChecked
//
//            onVisibleChanged:
//                if (visible != dock_.visibleChecked)
//                    dock_.visibleChecked = visible
//
//            //visible: dock_.visibleChecked
//            //onVisibleChanged: {
//            //  console.log("text_window.qml:grimoire: visible =", visible)
//            //  if (visible)
//            //    scrollEnd()
//            //  //else
//            //  //  repaint()
//            //}
//        }
//
//        // Kagami.Gospel {
//        //   minimumX: 0; minimumY: 0
//        //   maximumX: parent.width - width
//        //   maximumY: parent.height - height
//
//        //   ignoresFocus: root.ignoresFocus
//        //   effectColor: settings_.grimoireCommentColor
//
//        //   commentVisible: dock_.subtitleChecked
//
//        //   property bool invisible: !visible || !opacity
//        //   onInvisibleChanged:
//        //     if (!invisible)
//        //       updatePosition()
//
//        //   function updatePosition() {
//        //     x = center_.x + center_.width - width - 20 // margin right
//        //     y = center_.y + (center_.height - height) / 2
//        //     ensureVisible()
//        //   }
//        // }
//
//        Kagami.Dock {
//            id: dock_
//
//            anchors.verticalCenter: center_.verticalCenter
//            anchors.left: alignment == Qt.AlignLeft ? center_.left : undefined
//            anchors.right: alignment == Qt.AlignRight ? center_.left : undefined
//
//            //alignment: root.ignoresFocus ? Qt.AlignLeft : Qt.AlignRight
//            alignment: Qt.AlignLeft
//
//            //onIgnoresFocusCheckedChanged:
//            //  settings_.text_displayIgnoresFocus = ignoresFocusChecked
//
//            onUpButtonClicked: grimoire_.scrollBeginning()
//            onDownButtonClicked: grimoire_.scrollEnd()
//
//            onVisibleCheckedChanged:
//                if (visibleChecked != grimoire_.visible) {
//                    if (visibleChecked)
//                        grimoire_.show()
//                    else
//                        grimoire_.hide()
//                }
//        }
//    }
}
//    Plugin.MainObjectProxy { id: main_ } //no used in this file

//    Plugin.GameWindowProxy {
//        id: gameProxy_
//
//        onMinimizedChanged:
//            //console.log("text_window.qml:gamewindowproxy: minimized =", minimized)
//            if (!minimized)
//                grimoire_.scrollEnd()
//
//        onWindowClosed:
//            shiori_.hideNow()
//
//        onFullScreenChanged: {
//            if (fullScreen)
//                grimoire_.ensureVisible()
//            grimoire_.scrollEnd()
//        }
//    }

    //Plugin.TaskBarProxy { id: taskBar_ }
    //property int taskBarHeight: taskBar_.visible ? taskBar_.height : 0
