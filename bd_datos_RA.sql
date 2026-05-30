-- Inserts, Updates, Deletes y Selects
--  Curso: Introduccion a los Sistemas de Computo
--  Carnet: Rodrigo Ambrocio / Andres Godoy
USE MotoShop_RA;


--  INSERTS

INSERT INTO Marca_RA (nombre, pais_origen) VALUES
('Honda',    'Japon'),
('Yamaha',   'Japon'),
('Suzuki',   'Japon'),
('Kawasaki', 'Japon'),
('Bajaj',    'India');


-- Moto_RA
INSERT INTO Moto_RA (id_marca, modelo, anio, cilindrada_cc, tipo, precio, stock) VALUES
(1, 'CB 500F',       2023, 500, 'Naked',      45000.00, 3),
(1, 'XR 150L',       2022, 150, 'Off-road',   22000.00, 5),
(2, 'MT-07',         2022, 689, 'Naked',      62000.00, 2),
(2, 'YBR 125',       2021, 125, 'Urbana',     14000.00, 7),
(3, 'GSX-R 150',     2023, 150, 'Deportiva',  28000.00, 4),
(4, 'Z400',          2023, 399, 'Naked',      38000.00, 2),
(5, 'Pulsar NS200',  2020, 200, 'Deportiva',  15000.00, 6);


-- Cliente_RA
INSERT INTO Cliente_RA (nombre, apellido, correo, telefono, dpi) VALUES
('Juan',    'Lopez',    'juan.lopez@gmail.com',    '5511-2233', '1234567890101'),
('Maria',   'Garcia',   'maria.garcia@gmail.com',  '5522-3344', '2345678901202'),
('Carlos',  'Mendez',   'carlos.m@hotmail.com',    '5533-4455', '3456789012303'),
('Sofia',   'Ramirez',  'sofia.r@gmail.com',       '5544-5566', '4567890123404'),
('Pedro',   'Castillo', 'pedro.c@yahoo.com',       '5555-6677', '5678901234505'),
('Lucia',   'Torres',   'lucia.t@gmail.com',       '5566-7788', '6789012345606');


-- Empleado_RA
INSERT INTO Empleado_RA (nombre, apellido, cargo, salario, fecha_ingreso) VALUES
('Carlos',  'Mendez',   'Gerente General',  12000.00, '2010-01-01'),
('Ana',     'Solis',    'Vendedora',         5500.00, '2015-06-01'),
('Roberto', 'Garcia',   'Mecanico Jefe',     6000.00, '2012-03-15'),
('Luis',    'Perez',    'Mecanico',          4500.00, '2018-09-10'),
('Diana',   'Herrera',  'Administracion',    4000.00, '2020-01-05');


-- Venta_RA
INSERT INTO Venta_RA (id_cliente, id_moto, id_empleado, fecha_venta, precio_final, forma_pago) VALUES
(1, 1, 2, '2024-01-15', 45000.00, 'contado'),
(2, 3, 2, '2024-01-28', 60000.00, 'credito'),
(3, 5, 2, '2024-02-10', 18500.00, 'contado'),
(4, 6, 2, '2024-02-20', 37000.00, 'credito'),
(5, 2, 2, '2024-03-05', 22000.00, 'contado'),
(6, 7, 2, '2024-03-18', 14500.00, 'credito'),
(1, 4, 2, '2024-04-10', 13500.00, 'contado');


-- Servicio_RA
INSERT INTO Servicio_RA (id_cliente, id_empleado, tipo_servicio, descripcion, costo, fecha) VALUES
(1, 3, 'Cambio de aceite',    'Aceite 10W40 mas filtro',          150.00, '2024-02-01'),
(2, 3, 'Afinacion basica',    'Bujias, filtro aire, carburador',  350.00, '2024-02-15'),
(3, 4, 'Cambio de pastillas', 'Frenos delantero y trasero',       280.00, '2024-03-01'),
(1, 3, 'Revision general',    'Chequeo completo de 30 puntos',    200.00, '2024-03-10'),
(4, 4, 'Cambio de cadena',    'Kit completo cadena y pinhones',   450.00, '2024-03-25'),
(5, 3, 'Cambio de aceite',    'Aceite sintetico mas filtro',      175.00, '2024-04-05');


--  UPDATES 
-- 1. Bajar el precio de una moto que tiene mucho stock
UPDATE Moto_RA
SET precio = 42000.00
WHERE id_moto = 1 AND stock > 2;

-- 2. Actualizar el telefono de un cliente que cambio de numero
UPDATE Cliente_RA
SET telefono = '5599-0011'
WHERE dpi = '1234567890101';

-- 3. Aumentar el salario del mecanico jefe
UPDATE Empleado_RA
SET salario = 6500.00
WHERE id_empleado = 3 AND cargo = 'Mecanico Jefe';


--  DELETES
-- 1. Eliminar un servicio que fue cancelado por el cliente
DELETE FROM Servicio_RA
WHERE id_servicio = 6 AND fecha = '2024-04-05';

-- 2. Eliminar la venta con credito mas antigua que fue anulada
DELETE FROM Venta_RA
WHERE id_venta = 6 AND forma_pago = 'credito';

-- 3. Eliminar un empleado que ya no trabaja en la tienda
DELETE FROM Empleado_RA
WHERE id_empleado = 5 AND cargo = 'Administracion';

--  CONSULTAS SELECT
-- 1. Cantidad de modelos, stock y rango de precios por tipo de moto
SELECT
    tipo,
    COUNT(id_moto)  AS cantidad_modelos,
    SUM(stock)      AS unidades_en_stock,
    MIN(precio)     AS precio_minimo,
    MAX(precio)     AS precio_maximo
FROM Moto_RA
GROUP BY tipo;


-- 2. Total de ventas, promedio e ingreso por forma de pago
SELECT
    forma_pago,
    COUNT(id_venta)       AS total_ventas,
    SUM(precio_final)     AS ingresos_totales,
    AVG(precio_final)     AS promedio_por_venta,
    MAX(precio_final)     AS venta_mas_alta
FROM Venta_RA
GROUP BY forma_pago;


-- 3. Ingresos del taller agrupados por tipo de servicio
SELECT
    tipo_servicio,
    COUNT(id_servicio)  AS veces_realizado,
    SUM(costo)          AS ingreso_total,
    AVG(costo)          AS costo_promedio,
    MIN(costo)          AS costo_minimo
FROM Servicio_RA
GROUP BY tipo_servicio
ORDER BY ingreso_total DESC;


-- 4. Cuantas ventas hizo cada empleado y cuanto genero en total
SELECT
    e.nombre,
    e.apellido,
    e.cargo,
    COUNT(v.id_venta)    AS ventas_realizadas,
    SUM(v.precio_final)  AS total_vendido,
    AVG(v.precio_final)  AS promedio_por_venta
FROM Empleado_RA e
LEFT JOIN Venta_RA v ON e.id_empleado = v.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido, e.cargo;


-- 5. Modelos disponibles y precio promedio por marca
SELECT
    ma.nombre              AS marca,
    COUNT(mo.id_moto)      AS modelos_disponibles,
    SUM(mo.stock)          AS total_en_stock,
    AVG(mo.precio)         AS precio_promedio,
    MAX(mo.precio)         AS moto_mas_cara
FROM Marca_RA ma
LEFT JOIN Moto_RA mo ON ma.id_marca = mo.id_marca
GROUP BY ma.id_marca, ma.nombre
ORDER BY total_en_stock DESC;
