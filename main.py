import sys

from PySide.QtDeclarative import QDeclarativeView, qmlRegisterType
from qtpy.QtCore import Qt, Slot
from qtpy.QtWidgets import QApplication, QMainWindow, QGraphicsColorizeEffect, QGraphicsDropShadowEffect, \
    QGraphicsOpacityEffect, QGraphicsBlurEffect

from ui.process_select import ProcessSelectPage
from ui.text_select import TextPrefDialog
from ui.tray import TrayIcon
from utils import Logger
import resource

debug = Logger.debug()


def _register():
    def reg(cls, component):
        qmlRegisterType(cls, 'eroge.tool', 0, 1, component)

    # See: http://stackoverflow.com/questions/8894244/qml-and-blurring-image
    reg(QGraphicsBlurEffect, 'Blur')
    reg(QGraphicsColorizeEffect, 'Colorize')
    reg(QGraphicsDropShadowEffect, 'DropShadow')
    reg(QGraphicsOpacityEffect, 'Opacity')


class MainWindow(QMainWindow):

    def __init__(self, parent=None):
        super().__init__(parent)

        self.process_page = ProcessSelectPage(self)
        self.setCentralWidget(self.process_page)
        self.text = TextPrefDialog(self)
        self.view = QDeclarativeView()
        self.tray = TrayIcon(self)
        self.tray.show()

        self._connect()

    def _connect(self):
        self.text.textSelected.connect(self.text_display)

    def open_filter(self):
        self.text.set_active(True)
        self.text.show()

    @Slot()
    def text_display(self):
        _register()
        self.view.engine().addImportPath('ui/lib')

        self.view.setSource(':ui/text_window.qml')
        self.view.setAttribute(Qt.WA_TranslucentBackground)
        self.view.setStyleSheet("background-color:transparent")
        self.view.setWindowFlags(Qt.SplashScreen | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
        self.view.showFullScreen()


if __name__ == '__main__':
    app = QApplication([])

    win = MainWindow()
    win.show()

    sys.exit(app.exec_())
