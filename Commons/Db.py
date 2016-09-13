import sqlite3

class Configuracion:

    def __init__(self,ConfigFile):
        self.ConfigFile = ConfigFile
        self.conexion = sqlite3.connect(self.ConfigFile)
        self.c = self.conexion.cursor()

    def ListarEntradas(self):
        ListaCondiciones = []
        self.c.execute("SELECT * FROM Entradas")
        for data in self.c.fetchall():
            ListaCondiciones.append(data[1])
        return ListaCondiciones

    def AgregarCondicion(self,Entrada, Valor,Modificador=None):
        self.c.execute("INSERT INTO Condiciones (Entrada,Valor,Modificador) VALUES (?,?,?)",
                       (Entrada,Valor,Modificador))
        self.conexion.commit()

    def ListarCondiciones(self):
        ListaCondiciones = []
        self.c.execute("SELECT * FROM Condiciones")
        for data in self.c.fetchall():
           cond = {"Entrada":data[0],"Valor":data[1],"Modificador":data[2]}
           ListaCondiciones.append(cond)
        return ListaCondiciones
