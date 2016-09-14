import PySide
from API import P18F4550
from UI.Main import Ui_MainWindow
from UI.FrmAgregarEvento import Ui_FrmAgregarEvento
from PySide.QtGui import *
from PySide.QtCore import *
from Commons import Db
import sys
import os
ROOT_DIR = os.path.abspath(sys.path[0])
CONF_DIR = os.path.join(ROOT_DIR,"Commons")

class FrmAgregarEvento(QDialog, Ui_FrmAgregarEvento):
    def __init__(self, parent=None):
        super(FrmAgregarEvento, self).__init__(parent)
        self.setAttribute(Qt.WA_DeleteOnClose)
        self.setupUi(self)
        self.CboValorCondicion.addItem("ON")
        self.CboValorCondicion.addItem("OFF")
        self.Config = Db.Configuracion(os.path.join(CONF_DIR,"config.db"))

        for Entrada in self.Config.ListarEntradas():
            self.CboListaCondiciones.addItem(str(Entrada))

        self.CboListaCondiciones.currentIndexChanged.connect(self.ActualizarValue)
        self.BtnAgregarCondicion.clicked.connect(self.AgregarCondicion)
        self.LstCondiciones.clear()
        for Condicion in self.Config.ListarCondiciones():
            self.LstCondiciones.addItem(str(Condicion))
    def AgregarCondicion(self):

        entrada = str(self.CboListaCondiciones.currentText())

        if entrada.startswith("Entrada"):
            valor = str(self.CboValorCondicion.currentText())
        elif entrada.startswith("Temp"):
            valor = str(self.SpnValorCondicion.text())

        if self.RdbAnd.isChecked():
            modificador = "Y"
        elif self.RdbOr.isChecked():
            modificador = "O"
        else:
            modificador = None
        self.Config.AgregarCondicion(entrada, valor, modificador)
        self.LstCondiciones.clear()
        for Condicion in self.Config.ListarCondiciones():
            self.LstCondiciones.addItem(str(Condicion))

    def ActualizarValue(self):
            if str(self.CboListaCondiciones.currentText()).startswith("In"):
                self.TxtValorCondicion.hide()
                self.SpnValorCondicion.hide()
                self.CboValorCondicion.show()
                self.CboValorCondicion.setCurrentIndex(0)
            if str(self.CboListaCondiciones.currentText()).startswith("Temp"):
                self.TxtValorCondicion.hide()
                self.SpnValorCondicion.show()
                self.CboValorCondicion.hide()


class MainWindow(QMainWindow,Ui_MainWindow):

    def __init__(self, parent = None):
        super(MainWindow,self).__init__(parent)
        self.setupUi(self)
        self.WindowAgregarEvento = FrmAgregarEvento(self)
        self.actionSalir.triggered.connect(self.close)
        self.actionProgramador_de_Eventos.triggered.connect(self.ShowFrmAgregarEvento)

    def ShowFrmAgregarEvento(self):
        self.WindowAgregarEvento.show()


app = QApplication(sys.argv)
form = MainWindow()
form.show()
app.exec_()
