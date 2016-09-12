# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\OneDrive\Programador InXource\UI\Main.ui'
#
# Created: Thu Sep 01 09:19:21 2016
#      by: pyside-uic 0.2.15 running on PySide 1.2.4
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.horizontalLayout_2 = QtGui.QHBoxLayout(self.centralwidget)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.mdiArea = QtGui.QMdiArea(self.centralwidget)
        self.mdiArea.setObjectName("mdiArea")
        self.horizontalLayout.addWidget(self.mdiArea)
        self.horizontalLayout_2.addLayout(self.horizontalLayout)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 21))
        self.menubar.setObjectName("menubar")
        self.menuVista = QtGui.QMenu(self.menubar)
        self.menuVista.setObjectName("menuVista")
        self.menuVer = QtGui.QMenu(self.menubar)
        self.menuVer.setObjectName("menuVer")
        self.menuAyuda = QtGui.QMenu(self.menubar)
        self.menuAyuda.setObjectName("menuAyuda")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.actionMonitor = QtGui.QAction(MainWindow)
        self.actionMonitor.setObjectName("actionMonitor")
        self.actionLista_De_Eventos = QtGui.QAction(MainWindow)
        self.actionLista_De_Eventos.setObjectName("actionLista_De_Eventos")
        self.actionProgramador_de_Eventos = QtGui.QAction(MainWindow)
        self.actionProgramador_de_Eventos.setObjectName("actionProgramador_de_Eventos")
        self.actionSalir = QtGui.QAction(MainWindow)
        self.actionSalir.setObjectName("actionSalir")
        self.actionAcerca_De = QtGui.QAction(MainWindow)
        self.actionAcerca_De.setObjectName("actionAcerca_De")
        self.menuVista.addAction(self.actionSalir)
        self.menuVer.addAction(self.actionMonitor)
        self.menuVer.addAction(self.actionLista_De_Eventos)
        self.menuVer.addAction(self.actionProgramador_de_Eventos)
        self.menuAyuda.addAction(self.actionAcerca_De)
        self.menubar.addAction(self.menuVista.menuAction())
        self.menubar.addAction(self.menuVer.menuAction())
        self.menubar.addAction(self.menuAyuda.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QtGui.QApplication.translate("MainWindow", "InXource", None, QtGui.QApplication.UnicodeUTF8))
        self.menuVista.setTitle(QtGui.QApplication.translate("MainWindow", "Archivo", None, QtGui.QApplication.UnicodeUTF8))
        self.menuVer.setTitle(QtGui.QApplication.translate("MainWindow", "Ver", None, QtGui.QApplication.UnicodeUTF8))
        self.menuAyuda.setTitle(QtGui.QApplication.translate("MainWindow", "Ayuda", None, QtGui.QApplication.UnicodeUTF8))
        self.actionMonitor.setText(QtGui.QApplication.translate("MainWindow", "Monitor", None, QtGui.QApplication.UnicodeUTF8))
        self.actionLista_De_Eventos.setText(QtGui.QApplication.translate("MainWindow", "Lista De Eventos", None, QtGui.QApplication.UnicodeUTF8))
        self.actionProgramador_de_Eventos.setText(QtGui.QApplication.translate("MainWindow", "Programador de Eventos", None, QtGui.QApplication.UnicodeUTF8))
        self.actionSalir.setText(QtGui.QApplication.translate("MainWindow", "Salir", None, QtGui.QApplication.UnicodeUTF8))
        self.actionAcerca_De.setText(QtGui.QApplication.translate("MainWindow", "Acerca De", None, QtGui.QApplication.UnicodeUTF8))

