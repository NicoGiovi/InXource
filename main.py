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
        self.Config = Db.Eventos(os.path.join(CONF_DIR, "config.db"))
        self.ListaEntradas = self.Config.ListarEntradas()
        self.ListaSalidas = self.Config.ListarSalidas()
        self.ListaCondiciones = []
        self.ListaAcciones = []
        for entrada in self.ListaEntradas:
            self.CboListaEntradas.addItem(entrada["Nombre"])
        for salida in self.ListaSalidas:
            self.CboListaSalidas.addItem(salida["Nombre"])

        self.CboListaEntradas.currentIndexChanged.connect(self.ActualizarValue)
        self.BtnAgregarCondicion.clicked.connect(self.AgregarCondicion)
        self.LstCondiciones.clear()

    def AgregarCondicion(self):
        Entrada = None
        Valor_Entrada = None
        Modificador_Entrada = None
        # --- Parse Condicion ----
        for entrada in self.ListaEntradas:
            if entrada['Nombre'] == str(self.CboListaEntradas.currentText()):
                Entrada = entrada

        if self.RdbAnd.isChecked():
            Modificador_Entrada = "Y"
        elif self.RdbOr.isChecked():
            Modificador_Entrada = "O"
        else:
            Modificador_Entrada = None

        if Entrada['Tipo'] == "D":
            Valor_Entrada = self.CboValorCondicion.currentText()
        elif Entrada['Tipo'] == "S":
            Valor_Entrada = self.SpnValorCondicion.text()

        condicion = {"Entrada": Entrada, "Valor": Valor_Entrada, "Modificador": Modificador_Entrada}
        self.ListaCondiciones.append(condicion)
        self.LstCondiciones.clear()
        for condicion in self.ListaCondiciones:
            texto = str(condicion['Entrada']['Nombre'])+str(condicion['Valor'])+str(condicion['Modificador'])
            self.LstCondiciones.addItem(texto)
        #--- Fin Parse Condicion ----

    def ActualizarValue(self):
            if str(self.CboListaEntradas.currentText()).startswith("En"):
                self.TxtValorCondicion.hide()
                self.SpnValorCondicion.hide()
                self.CboValorCondicion.show()
                self.CboValorCondicion.setCurrentIndex(0)
            if str(self.CboListaEntradas.currentText()).startswith("Temp"):
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
