INSERT INTO Piloto_3190265947 VALUES (1, 'Max Verstappen', 'Países Bajos', '1997-09-30', 150);
INSERT INTO Piloto_3190265947 VALUES (2, 'Sergio Pérez', 'México', '1990-01-26', 95);
INSERT INTO Piloto_3190265947 VALUES (3, 'Lewis Hamilton', 'Reino Unido', '1985-01-07', 120);
INSERT INTO Piloto_3190265947 VALUES (4, 'Charles Leclerc', 'Mónaco', '1997-10-16', 85);
INSERT INTO Piloto_3190265947 VALUES (5, 'Lando Norris', 'Reino Unido', '1999-11-13', 110);

INSERT INTO Escuderia_3190265947 VALUES (1, 'Red Bull Racing', 'Austria', 'Christian Horner');
INSERT INTO Escuderia_3190265947 VALUES (2, 'Ferrari', 'Italia', 'Fred Vasseur');
INSERT INTO Escuderia_3190265947 VALUES (3, 'McLaren', 'Reino Unido', 'Andrea Stella');
INSERT INTO Escuderia_3190265947 VALUES (4, 'Mercedes', 'Alemania', 'Toto Wolff');
INSERT INTO Escuderia_3190265947 VALUES (5, 'Aston Martin', 'Reino Unido', 'Mike Krack');

INSERT INTO Circuito_3190265947 VALUES (1, 'Autódromo Hermanos Rodríguez', 'México', 4.30);
INSERT INTO Circuito_3190265947 VALUES (2, 'Circuit de Monaco', 'Mónaco', 3.34);
INSERT INTO Circuito_3190265947 VALUES (3, 'Silverstone', 'Reino Unido', 5.89);
INSERT INTO Circuito_3190265947 VALUES (4, 'Autodromo Nazionale Monza', 'Italia', 5.79);
INSERT INTO Circuito_3190265947 VALUES (5, 'Autódromo José Carlos Pace', 'Brasil', 4.31);

INSERT INTO Carrera_3190265947 VALUES (1, '2025-03-15', 1, 1, 1, 1, 25);
INSERT INTO Carrera_3190265947 VALUES (2, '2025-04-10', 2, 1, 2, 3, 15);
INSERT INTO Carrera_3190265947 VALUES (3, '2025-05-20', 3, 2, 3, 2, 18);
INSERT INTO Carrera_3190265947 VALUES (4, '2025-06-05', 4, 2, 4, 4, 12);
INSERT INTO Carrera_3190265947 VALUES (5, '2025-07-15', 5, 3, 5, 1, 25);

UPDATE Piloto_3190265947 SET Puntos_Carrera = 180 WHERE ID_Piloto = 1;
UPDATE Escuderia_3190265947 SET Jefe_Equipo = 'Nuevo Director' WHERE ID_Escuderia = 2;
UPDATE Circuito_3190265947 SET Longitud_km = 5.41 WHERE ID_Circuito = 4;

DELETE FROM Carrera_3190265947 WHERE Posicion > 5;
DELETE FROM Piloto_3190265947 WHERE Puntos_Carrera < 50;
DELETE FROM Escuderia_3190265947 WHERE Pais_Base = 'España';

SELECT Nacionalidad, COUNT(*) as Total, AVG(Puntos_Carrera) as Promedio FROM Piloto_3190265947 GROUP BY Nacionalidad;
SELECT E.Nombre, SUM(C.Puntos) as Total_Puntos FROM Escuderia_3190265947 E JOIN Carrera_3190265947 C ON E.ID_Escuderia = C.ID_Escuderia GROUP BY E.Nombre;
SELECT MAX(Puntos_Carrera) as Max_Puntos, MIN(Puntos_Carrera) as Min_Puntos FROM Piloto_3190265947;
SELECT COUNT(*) as Total_Carreras FROM Carrera_3190265947;
SELECT AVG(Longitud_km) as Promedio_Longitud FROM Circuito_3190265947;