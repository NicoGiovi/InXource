import PySide

from API import P18F4550
from UI.Main import Ui_MainWindow
from UI.FrmAgregarEvento import Ui_FrmAgregarEvento
from PySide.QtGui import *
from PySide.QtCore import *
import sys

class FrmAgregarEvento(QDialog, Ui_FrmAgregarEvento):
    def __init__(self, parent=None):
        super(FrmAgregarEvento, self).__init__(parent)
        self.setAttribute(Qt.WA_DeleteOnClose)
        self.setupUi(self)

class MainWindow(QMainWindow,Ui_MainWindow):
    def __init__(self, parent = None):
        super(MainWindow,self).__init__(parent)
        self.setupUi(self)

        self.WindowAgregarEvento = FrmAgregarEvento(self)
        self.actionSalir.triggered.connect(self.close)
        self.actionProgramador_de_Eventos.triggered.connect(self.ShowFrmAgregarEvento)

    def ShowFrmAgregarEvento(self):
        if not self.WindowAgregarEvento.isVisible():
            self.WindowAgregarEvento.show()


app = QApplication(sys.argv)
form = MainWindow()
form.show()
app.exec_()
