CREATE TABLE Piloto_3190265947 (
    ID_Piloto INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    Fecha_Nacimiento DATE,
    Puntos_Carrera INT
);

CREATE TABLE Escuderia_3190265947 (
    ID_Escuderia INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais_Base VARCHAR(50),
    Jefe_Equipo VARCHAR(100)
);

CREATE TABLE Circuito_3190265947 (
    ID_Circuito INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(100),
    Longitud_km DECIMAL(5,2)
);

CREATE TABLE Carrera_3190265947 (
    ID_Carrera INT PRIMARY KEY,
    Fecha DATE,
    ID_Piloto INT,
    ID_Escuderia INT,
    ID_Circuito INT,
    Posicion INT,
    Puntos INT
);

ALTER TABLE Carrera_3190265947 ADD FOREIGN KEY (ID_Piloto) REFERENCES Piloto_3190265947(ID_Piloto);
ALTER TABLE Carrera_3190265947 ADD FOREIGN KEY (ID_Escuderia) REFERENCES Escuderia_3190265947(ID_Escuderia);
ALTER TABLE Carrera_3190265947 ADD FOREIGN KEY (ID_Circuito) REFERENCES Circuito_3190265947(ID_Circuito);