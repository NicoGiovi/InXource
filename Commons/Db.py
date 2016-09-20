import sqlite3

class Eventos:

    def __init__(self,ConfigFile):
        self.ConfigFile = ConfigFile
        self.conexion = sqlite3.connect(self.ConfigFile)
        self.c = self.conexion.cursor()

    def __crearEvento__(self,nombre):
        self.c.execute("INSERT INTO Eventos(Nombre) VALUES (?)", nombre)
        self.conexion.commit()
        return self.c.lastrowid

    def __crearCondicion__(self, Entrada, Valor, Modificador, IdEvento):
        self.c.execute("INSERT INTO Condiciones (Entrada,Valor,Modificador,IdEvento) VALUES (?,?,?,?)",
                       (Entrada, Valor, Modificador, IdEvento))
        self.conexion.commit()
        return self.c.lastrowid

    def __crearAccion__(self,Salida,Valor,IdEvento):
        self.c.execute("INSERT INTO Acciones (Salida,Valor,IdEvento) VALUES (?,?,?)",
                       (Salida, Valor, IdEvento))
        self.conexion.commit()
        return self.c.lastrowid

    def ListarEntradas(self):
        ListaEntradas = []
        self.c.execute("SELECT * FROM Entradas")
        for data in self.c.fetchall():
            entrada = {"Id": data[0], "Pin": data[1], "Nombre": data[2], "Tipo": data[3]}
            ListaEntradas.append(entrada)
        return ListaEntradas

    def ListarSalidas(self):
        ListaSalidas = []
        self.c.execute("SELECT * FROM Salidas")
        for data in self.c.fetchall():
           salida = {"Id":data[0],"Pin":data[1],"Nombre":data[2]}
           ListaSalidas.append(salida)
        return ListaSalidas

    def ListarCondiciones(self, IdEvento):
        ListaCondiciones = []
        self.c.execute("SELECT * FROM Condiciones Where IdEvento = ?", IdEvento)
        for data in self.c.fetchall():
            condicion = {"Id": data[0], "Entrada": data[1], "Valor": data[2]}
            ListaCondiciones.append(condicion)
        return ListaCondiciones

    def ListarAcciones(self, IdEvento):
        ListaAcciones = []
        self.c.execute("SELECT * FROM Acciones Where IdEvento = ?", IdEvento)
        for data in self.c.fetchall():
            accion = {"Id": data[0], "Salida": data[1], "Valor": data[2]}
            ListaAcciones.append(accion)
        return ListaAcciones

    def ListarEventos(self):
        ListaEventos = []
        self.c.execute("SELECT * FROM Eventos")
        for data in self.c.fetchall():
            evento = {"Id": data[0], "Nombre": data[1]}
            ListaEventos.append(evento)
        return ListaEventos

    def GuardarEvento(self, nombre, condiciones, acciones):
        id_evento = self.__crearEvento__(nombre)
        for condicion in condiciones:
            self.__crearCondicion__(condicion['Entrada']['Id'], condicion['Valor'], condicion['Modificador'], id_evento)
        for accion in acciones:
            self.__crearAccion__(accion['Salida']['Id'], accion['Valor'], id_evento)
