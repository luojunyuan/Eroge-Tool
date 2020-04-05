from qtpy.QtWidgets import QGraphicsBlurEffect, QGraphicsColorizeEffect, QGraphicsDropShadowEffect, \
    QGraphicsOpacityEffect
from PySide.QtDeclarative import qmlRegisterType

from text import TextManagerQMLPlugin

_QML_EFFECT = 'QtEffects'
_QML_PLUGIN = 'eroge.tool'


def reg(cls, component):
    qmlRegisterType(cls, _QML_PLUGIN, 1, 0, component)


def register_qml_type():
    reg(TextManagerQMLPlugin, 'ReciveText')
    # See: http://stackoverflow.com/questions/8894244/qml-and-blurring-image
    # reg(QGraphicsBlurEffect, 'Blur')
    # reg(QGraphicsColorizeEffect, 'Colorize')
    # reg(QGraphicsDropShadowEffect, 'DropShadow')
    # reg(QGraphicsOpacityEffect, 'Opacity')

# qmlRegisterType(QGraphicsBlurEffect, _QML_EFFECT, 0, 1, 'Blur')
# qmlRegisterType(main.MainObjectProxy, _QML_PLUGIN, 1, 0, 'MainObjectProxy')
# qmlRegisterType(gameman.GameWindowProxy, _QML_PLUGIN, 1, 0, 'GameWindowProxy')

# import settings
# qmlRegisterType(settings.SettingsProxy, _QML_PLUGIN, 1, 0, 'Settings')

# import status
# qmlRegisterType(status.SystemStatus, _QML_PLUGIN, 1, 0, 'SystemStatus')

# import kagami
# qmlRegisterType(kagami.GospelBean, _QML_PLUGIN, 1, 0, 'GospelBean')
# qmlRegisterType(kagami.GossipBean, _QML_PLUGIN, 1, 0, 'GossipBean')
# qmlRegisterType(kagami.GrimoireBean, _QML_PLUGIN, 1, 0, 'GrimoireBean')

# import gameman
# qmlRegisterType(gameman.TaskBarProxy, _QML_PLUGIN, 1, 0, 'TaskBarProxy')
# qmlRegisterType(gameman.GameProxy, _QML_PLUGIN, 1, 0, 'GameProxy')

# qmlRegisterType(gameman.GameModel, _QML_PLUGIN, 1, 0, 'GameModel')
# qmlRegisterType(gameman.GameManagerProxy, _QML_PLUGIN, 1, 0, 'GameManagerProxy')

# import qmlutil
# qmlRegisterType(qmlutil.QmlUtil, _QML_PLUGIN, 1, 0, 'Util')

#import qmlbeans
#qmlRegisterType(qmlbeans.SliderBean, _QML_PLUGIN, 1, 0, 'SliderBean')

# import spell
# qmlRegisterType(spell.SpellChecker, _QML_PLUGIN, 1, 0, 'SpellChecker')

# import mecabjlp
# qmlRegisterType(mecabjlp.QmlMeCabHighlighter, _QML_PLUGIN, 1, 0, 'MeCabHighlighter')



# import growl
# qmlRegisterType(growl.GrowlBean, _QML_PLUGIN, 1, 0, 'GrowlBean')
# qmlRegisterType(growl.GrowlProxy, _QML_PLUGIN, 1, 0, 'Growl')



# qmlRegisterType(kagami.ShioriBean, _QML_PLUGIN, 1, 0, 'ShioriBean')
# qmlRegisterType(kagami.ShioriProxy, _QML_PLUGIN, 1, 0, 'ShioriProxy')

# import tsukasa
# qmlRegisterType(tsukasa.GraffitiBean, _QML_PLUGIN, 1, 0, 'GraffitiBean')

# import textman
# qmlRegisterType(textman.TextManagerProxy, _QML_PLUGIN, 1, 0, 'TextManagerProxy')

# import dataman
# qmlRegisterType(dataman.DataManagerProxy, _QML_PLUGIN, 1, 0, 'DataManagerProxy')



# import subedit
# qmlRegisterType(subedit.SubtitleEditorManagerProxy, _QML_PLUGIN, 1, 0, 'SubtitleEditorManagerProxy')

# import htmljinja
# qmlRegisterType(htmljinja.ShioriJinja, _QML_PLUGIN, 1, 0, 'ShioriJinja')
#qmlRegisterType(htmljinja.MeCabJinja, _QML_PLUGIN, 1, 0, 'MeCabJinja')

# EOF
