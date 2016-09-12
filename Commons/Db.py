import sqlite3

class Configuracion:

    def __init__(self,ConfigFile):
        self.ConfigFile = ConfigFile
        self.conexion = sqlite3.connect(self.ConfigFile)
        self.c = self.conexion.cursor()

    def ListarCondiciones(self):
        ListaCondiciones = []
        self.c.execute("SELECT * FROM Condiciones")
        for data in self.c.fetchall():
            ListaCondiciones.append(data[0])
        return ListaCondiciones

