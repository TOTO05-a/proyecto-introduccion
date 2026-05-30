--  Curso: Introduccion a los Sistemas de Computo
--  Carnet: Rodrigo Ambrocio / Andres Godoy
CREATE DATABASE IF NOT EXISTS MotoShop_RA;
USE MotoShop_RA;

--  CREACION DE TABLAS
CREATE TABLE Marca_RA (
    id_marca       INT          NOT NULL AUTO_INCREMENT,
    nombre         VARCHAR(60)  NOT NULL,
    pais_origen    VARCHAR(50),
    PRIMARY KEY (id_marca)
);


CREATE TABLE Moto_RA (
    id_moto        INT           NOT NULL AUTO_INCREMENT,
    id_marca       INT           NOT NULL,
    modelo         VARCHAR(100)  NOT NULL,
    anio           INT,
    cilindrada_cc  INT,
    tipo           VARCHAR(40),
    precio         DECIMAL(10,2),
    stock          INT           DEFAULT 0,
    PRIMARY KEY (id_moto)
);


CREATE TABLE Cliente_RA (
    id_cliente     INT          NOT NULL AUTO_INCREMENT,
    nombre         VARCHAR(60)  NOT NULL,
    apellido       VARCHAR(60)  NOT NULL,
    correo         VARCHAR(100),
    telefono       VARCHAR(20),
    dpi            VARCHAR(20)  UNIQUE,
    PRIMARY KEY (id_cliente)
);


CREATE TABLE Empleado_RA (
    id_empleado    INT          NOT NULL AUTO_INCREMENT,
    nombre         VARCHAR(60)  NOT NULL,
    apellido       VARCHAR(60)  NOT NULL,
    cargo          VARCHAR(60),
    salario        DECIMAL(10,2),
    fecha_ingreso  DATE,
    PRIMARY KEY (id_empleado)
);


CREATE TABLE Venta_RA (
    id_venta       INT           NOT NULL AUTO_INCREMENT,
    id_cliente     INT           NOT NULL,
    id_moto        INT           NOT NULL,
    id_empleado    INT           NOT NULL,
    fecha_venta    DATE          NOT NULL,
    precio_final   DECIMAL(10,2),
    forma_pago     VARCHAR(30),
    PRIMARY KEY (id_venta)
);


CREATE TABLE Servicio_RA (
    id_servicio    INT           NOT NULL AUTO_INCREMENT,
    id_cliente     INT           NOT NULL,
    id_empleado    INT           NOT NULL,
    tipo_servicio  VARCHAR(100),
    descripcion    TEXT,
    costo          DECIMAL(10,2),
    fecha          DATE          NOT NULL,
    PRIMARY KEY (id_servicio)
);



--  LLAVES FORANEAS
ALTER TABLE Moto_RA
    ADD CONSTRAINT fk_moto_marca
    FOREIGN KEY (id_marca) REFERENCES Marca_RA (id_marca);

ALTER TABLE Venta_RA
    ADD CONSTRAINT fk_venta_cliente
    FOREIGN KEY (id_cliente) REFERENCES Cliente_RA (id_cliente);

ALTER TABLE Venta_RA
    ADD CONSTRAINT fk_venta_moto
    FOREIGN KEY (id_moto) REFERENCES Moto_RA (id_moto);

ALTER TABLE Venta_RA
    ADD CONSTRAINT fk_venta_empleado
    FOREIGN KEY (id_empleado) REFERENCES Empleado_RA (id_empleado);

ALTER TABLE Servicio_RA
    ADD CONSTRAINT fk_servicio_cliente
    FOREIGN KEY (id_cliente) REFERENCES Cliente_RA (id_cliente);

ALTER TABLE Servicio_RA
    ADD CONSTRAINT fk_servicio_empleado
    FOREIGN KEY (id_empleado) REFERENCES Empleado_RA (id_empleado);
