USE [GD2C2017]

-- ELIMINACION DE OBJETOS NECESARIOS

IF OBJECT_ID('POSTRESQL.UsuarioSucursal', 'U') IS NOT NULL
DROP TABLE POSTRESQL.UsuarioSucursal

IF OBJECT_ID('POSTRESQL.UsuarioRol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.UsuarioRol

IF OBJECT_ID('POSTRESQL.FuncionalidadRol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.FuncionalidadRol

IF OBJECT_ID('POSTRESQL.ItemFactura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.ItemFactura

IF OBJECT_ID('POSTRESQL.Devolucion', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Devolucion

IF OBJECT_ID('POSTRESQL.PagoFactura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.PagoFactura

IF OBJECT_ID('POSTRESQL.Factura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Factura

IF OBJECT_ID('POSTRESQL.Pago', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Pago

IF OBJECT_ID('POSTRESQL.MedioPago', 'U') IS NOT NULL
DROP TABLE POSTRESQL.MedioPago

IF OBJECT_ID('POSTRESQL.Sucursal', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Sucursal

IF OBJECT_ID('POSTRESQL.Usuario', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Usuario

IF OBJECT_ID('POSTRESQL.Rol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rol

IF OBJECT_ID('POSTRESQL.Rendicion', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rendicion

IF OBJECT_ID('POSTRESQL.Funcionalidad', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Funcionalidad

IF OBJECT_ID('POSTRESQL.RubroEmpresa', 'U') IS NOT NULL
DROP TABLE POSTRESQL.RubroEmpresa

IF OBJECT_ID('POSTRESQL.Empresa', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Empresa

IF OBJECT_ID('POSTRESQL.Rubro', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rubro

IF (OBJECT_ID ('POSTRESQL.ItemRendicion', 'U') IS NOT NULL)
DROP TABLE POSTRESQL.ItemRendicion

IF OBJECT_ID('POSTRESQL.Cliente', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Cliente

IF OBJECT_ID('POSTRESQL.login') IS NOT NULL
DROP PROCEDURE POSTRESQL.login

IF (OBJECT_ID ('POSTRESQL.funcionalidades_del_rol') IS NOT NULL)
DROP PROCEDURE POSTRESQL.funcionalidades_del_rol

IF (OBJECT_ID ('POSTRESQL.altaSucursal') IS NOT NULL)
DROP PROCEDURE POSTRESQL.altaSucursal

IF (OBJECT_ID ('POSTRESQL.bajaSucursal') IS NOT NULL)
DROP PROCEDURE POSTRESQL.bajaSucursal

IF (OBJECT_ID ('POSTRESQL.modificarSucursal') IS NOT NULL)
DROP PROCEDURE POSTRESQL.modificarSucursal

IF (OBJECT_ID ('POSTRESQL.todasSucursales') IS NOT NULL)
DROP PROCEDURE POSTRESQL.todasSucursales

IF (OBJECT_ID ('POSTRESQL.filtrarSucursales') IS NOT NULL)
DROP PROCEDURE POSTRESQL.filtrarSucursales

IF (OBJECT_ID ('POSTRESQL.altaCliente') IS NOT NULL)
DROP PROCEDURE POSTRESQL.altaCliente

IF (OBJECT_ID ('POSTRESQL.bajaCliente') IS NOT NULL)
DROP PROCEDURE POSTRESQL.bajaCliente

IF (OBJECT_ID ('POSTRESQL.modificarCliente') IS NOT NULL)
DROP PROCEDURE POSTRESQL.modificarCliente

IF (OBJECT_ID ('POSTRESQL.agregar_funcionalidad') IS NOT NULL)
DROP PROCEDURE POSTRESQL.agregar_funcionalidad

IF (OBJECT_ID ('POSTRESQL.quitar_funcionalidad') IS NOT NULL)
DROP PROCEDURE POSTRESQL.quitar_funcionalidad

IF (OBJECT_ID ('POSTRESQL.obtener_roles_para_modificar') IS NOT NULL)
DROP PROCEDURE POSTRESQL.obtener_roles_para_modificar

IF (OBJECT_ID ('POSTRESQL.borrar_rol_inhabiliado_de_usuario') IS NOT NULL)
DROP PROCEDURE POSTRESQL.borrar_rol_inhabiliado_de_usuario

IF (OBJECT_ID ('POSTRESQL.crear_rol') IS NOT NULL)
DROP PROCEDURE POSTRESQL.crear_rol

IF (OBJECT_ID ('POSTRESQL.modificar_rol') IS NOT NULL)
DROP PROCEDURE POSTRESQL.modificar_rol

IF (OBJECT_ID ('POSTRESQL.altaEmpresa') IS NOT NULL)
DROP PROCEDURE POSTRESQL.altaEmpresa

IF (OBJECT_ID ('POSTRESQL.modificarEmpresa') IS NOT NULL)
DROP PROCEDURE POSTRESQL.modificarEmpresa

IF (OBJECT_ID ('POSTRESQL.bajaEmpresa') IS NOT NULL)
DROP PROCEDURE POSTRESQL.bajaEmpresa

IF (OBJECT_ID ('POSTRESQL.filtrarEmpresas') IS NOT NULL)
DROP PROCEDURE POSTRESQL.filtrarEmpresas

IF (OBJECT_ID ('POSTRESQL.filtrarClientes') IS NOT NULL)
DROP PROCEDURE POSTRESQL.filtrarClientes

IF (OBJECT_ID ('POSTRESQL.obtenerSucursalesDeUsuario') IS NOT NULL)
DROP PROCEDURE POSTRESQL.obtenerSucursalesDeUsuario

IF (OBJECT_ID ('POSTRESQL.bajaRol') IS NOT NULL)
DROP PROCEDURE POSTRESQL.bajaRol

IF OBJECT_ID ('POSTRESQL.listados') IS NOT NULL
DROP PROCEDURE POSTRESQL.listados

IF OBJECT_ID ('POSTRESQL.porcentaje_facturas_empresas_por_mes') IS NOT NULL
DROP PROCEDURE POSTRESQL.porcentaje_facturas_empresas_por_mes

IF OBJECT_ID ('POSTRESQL.empresas_mayor_monto_facturado') IS NOT NULL
DROP PROCEDURE POSTRESQL.empresas_mayor_monto_facturado

IF OBJECT_ID ('POSTRESQL.clientes_mas_pagos') IS NOT NULL
DROP PROCEDURE POSTRESQL.clientes_mas_pagos

IF OBJECT_ID ('POSTRESQL.clientes_cumplidores') IS NOT NULL
DROP PROCEDURE POSTRESQL.clientes_cumplidores

IF OBJECT_ID ('POSTRESQL.facturaPorNumero') IS NOT NULL
DROP PROCEDURE POSTRESQL.facturaPorNumero

IF OBJECT_ID ('POSTRESQL.altaFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.altaFactura

IF OBJECT_ID ('POSTRESQL.filtrarFacturasModificables') IS NOT NULL
DROP PROCEDURE POSTRESQL.filtrarFacturasModificables

IF OBJECT_ID ('POSTRESQL.efectuarDevolucion') IS NOT NULL
DROP PROCEDURE POSTRESQL.efectuarDevolucion

IF OBJECT_ID ('POSTRESQL.registrarPago') IS NOT NULL
DROP PROCEDURE POSTRESQL.registrarPago

IF OBJECT_ID ('POSTRESQL.pagar_factura') IS NOT NULL
DROP PROCEDURE POSTRESQL.pagar_factura

IF OBJECT_ID ('POSTRESQL.bajaFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.bajaFactura

IF OBJECT_ID ('POSTRESQL.altaItemFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.altaItemFactura

IF OBJECT_ID ('POSTRESQL.bajaItemFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.bajaItemFactura

IF OBJECT_ID ('POSTRESQL.itemsPorFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.itemsPorFactura

IF OBJECT_ID ('POSTRESQL.modificarItemFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.modificarItemFactura

IF OBJECT_ID ('POSTRESQL.modificarFactura') IS NOT NULL
DROP PROCEDURE POSTRESQL.modificarFactura

IF OBJECT_ID ('POSTRESQL.facturasARendir') IS NOT NULL
DROP PROCEDURE POSTRESQL.facturasARendir

IF OBJECT_ID ('POSTRESQL.altaRendicion') IS NOT NULL
DROP PROCEDURE POSTRESQL.altaRendicion


IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'POSTRESQL')
DROP SCHEMA POSTRESQL

GO

/* Creación del esquema */

CREATE SCHEMA POSTRESQL AUTHORIZATION gd;
GO

--INICIO CREACION TABLAS

/* Creación de la tabla Cliente */
CREATE TABLE POSTRESQL.Cliente(
	clie_id INT IDENTITY(1,1) PRIMARY KEY,
	clie_dni NUMERIC(18,0) UNIQUE ,
	clie_apellido NVARCHAR(225) ,
	clie_nombre NVARCHAR(225) ,
	clie_fecha_nac DATETIME ,
	clie_mail NVARCHAR(225),
	clie_telefono NUMERIC(18,0),
	clie_direccion NVARCHAR(225) ,
	clie_codigo_postal NVARCHAR(225) ,
	clie_habilitado BIT DEFAULT 1)
GO

/* Creación de la tabla Rubro */
CREATE TABLE [POSTRESQL].[Rubro](
	[rubr_id] numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	[rubr_detalle] [nvarchar](50))
GO

/* Creación de la tabla Empresa */
CREATE TABLE [POSTRESQL].[Empresa](
	empr_id INT IDENTITY(1,1) PRIMARY KEY,
	empr_nombre NVARCHAR(225) ,
	empr_cuit NVARCHAR(50) ,
	empr_direccion NVARCHAR(225) ,
	empr_rubro numeric(18,0) NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Rubro(rubr_id),
	empr_habilitado BIT DEFAULT 1,
	empr_dia_rendicion numeric(18,0) DEFAULT 1)
GO

/* Creación de la tabla Rendicion */
CREATE TABLE [POSTRESQL].[Rendicion](
	[rend_id] [numeric](18, 0) IDENTITY PRIMARY KEY,
	[rend_fecha] DATETIME ,
	[rend_total] [decimal](12, 2) ,
	[rend_coef_comision] [float] NULL,
	[rend_concepto] [char](100) NULL,
	rend_empresa INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Empresa(empr_id))
GO

/* Creación de la tabla Funcionalidad */
CREATE TABLE [POSTRESQL].[Funcionalidad](
	[func_id] INT IDENTITY PRIMARY KEY,
	[func_descripcion] [char](100))
GO

/* Creación de la tabla Rol */
CREATE TABLE [POSTRESQL].[Rol](
	[rol_id] INT IDENTITY PRIMARY KEY,
	[rol_nombre] [char](50) ,
	[rol_habilitado] [bit] DEFAULT 1)
GO

/* Creación de la tabla Funcionalidad - Rol */
CREATE TABLE [POSTRESQL].[FuncionalidadRol](
	[func_rol_rol] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.ROL(rol_id),
	[func_rol_funcionalidad] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Funcionalidad(func_id))
GO

/* Creación de la tabla Usuario */
CREATE TABLE [POSTRESQL].[Usuario](
	[user_id] INT IDENTITY PRIMARY KEY,
	[user_nombre]  NVARCHAR(255) UNIQUE ,
	user_intentos TINYINT,
	[user_habilitado] [bit] ,
	[user_password]  NVARCHAR(255))
GO

/* Creación de la tabla Sucursal */
CREATE TABLE [POSTRESQL].[Sucursal](
	[sucu_id] INT IDENTITY PRIMARY KEY,
	[sucu_nombre] NVARCHAR(50) ,
	[sucu_direccion] NVARCHAR(50) ,
	[sucu_codigo_postal] NUMERIC(18, 0) UNIQUE ,
	[sucu_habilitado] [bit] DEFAULT 1)
GO

/* Creación de la tabla Medio de Pago */
CREATE TABLE [POSTRESQL].[MedioPago](
	[medio_pago_id] INT IDENTITY PRIMARY KEY,
	[medio_pago_descripcion] [nvarchar](225))
GO

/* Creación de la tabla Pago */
CREATE TABLE [POSTRESQL].[Pago](
	[pago_nro] [numeric](18, 0) IDENTITY PRIMARY KEY,
	[pago_fecha] [date] NULL ,
	[pago_total] numeric(18,2) NULL ,
	[pago_medio_pago] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.MedioPago(medio_pago_id) ,
	[pago_sucursal] INT NULL FOREIGN KEY REFERENCES POSTRESQL.Sucursal(sucu_id),
	[pago_usuario]  INT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[pago_cliente] INT NULL FOREIGN KEY REFERENCES POSTRESQL.Cliente(clie_id),
	[pago_anulado] [bit] DEFAULT 0)
GO

/* Creación de la tabla Factura */
CREATE TABLE POSTRESQL.Factura(
    fact_numero [numeric](18, 0) IDENTITY PRIMARY KEY,
    fact_cliente INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Cliente(clie_id),
	fact_empresa INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Empresa(empr_id),
    fact_fecha DATETIME,
	fact_fecha_vencimiento DATETIME,
	fact_total numeric(18,2),
	fact_pago [numeric](18, 0) NULL FOREIGN KEY REFERENCES POSTRESQL.Pago(pago_nro),
	fact_rendicion [numeric](18, 0) FOREIGN KEY REFERENCES POSTRESQL.Rendicion(rend_id),
	fact_pagado [bit] DEFAULT 0) 
GO

/* Creación de la tabla Devolucion */
CREATE TABLE POSTRESQL.Devolucion(
	devo_id INT IDENTITY PRIMARY KEY,
	[devo_pago_factura] [numeric](18, 0) FOREIGN KEY REFERENCES POSTRESQL.Factura(fact_numero),
	devo_motivo NVARCHAR(225) ,
	devo_fecha DATETIME)
GO


/* Creación de la tabla Item - Factura */
CREATE TABLE [POSTRESQL].[ItemFactura](
	[item_fact_monto] [numeric](18, 2) ,
	[item_fact_cantidad] [numeric](18, 0) ,
	[item_fact_factura] [numeric](18, 0) NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Factura(fact_numero),
	[item_fact_concepto] [char](100) ,
	[item_fact_id]  [numeric](18, 0) IDENTITY PRIMARY KEY)
GO

/* Creación de la tabla Item - Rendicion */
CREATE TABLE [POSTRESQL].[ItemRendicion](
	[item_rend_nro] [numeric](18, 0) PRIMARY KEY ,
	[item_rend_importe] [numeric](18, 2))
GO

/* Creación de la tabla Usuario - Rol */
CREATE TABLE [POSTRESQL].[UsuarioRol](
	[user_rol_usuario]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[user_rol_rol] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Rol(rol_id))
GO

/* Creación de la tabla Usuario - Sucursal */
CREATE TABLE [POSTRESQL].[UsuarioSucursal](
	[user_suc_usuario]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[user_suc_sucursal]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Sucursal(sucu_id))
GO

--FIN CREACION TABLAS


-- CREACION INDICES

CREATE INDEX I_Cliente ON POSTRESQL.Cliente (clie_nombre, clie_apellido);

CREATE INDEX I_EMPRESA ON POSTRESQL.Empresa (empr_nombre, empr_cuit);

CREATE INDEX I_SUCURSAL ON POSTRESQL.Sucursal (sucu_nombre, sucu_direccion);


--INICIO MIGRACIONES

-- MIGRACION CLIENTES

INSERT INTO POSTRESQL.Cliente(
	clie_dni, clie_apellido, clie_nombre, clie_fecha_nac, clie_mail,
	clie_direccion, clie_codigo_postal,clie_telefono)
SELECT DISTINCT
	[Cliente-Dni], [Cliente-Apellido], [Cliente-Nombre], [Cliente-Fecha_Nac], [Cliente_Mail],
	[Cliente_Direccion], [Cliente_Codigo_Postal], 0
FROM gd_esquema.Maestra
WHERE [Cliente-Dni] IS NOT NULL
GO

--MIGRACION RUBRO

INSERT INTO POSTRESQL.Rubro(
	rubr_detalle)
SELECT DISTINCT
	[Rubro_Descripcion]
FROM gd_esquema.Maestra
WHERE [Rubro_Descripcion] IS NOT NULL
GO

--MIGRACION EMPRESAS

INSERT INTO POSTRESQL.Empresa(
	empr_nombre, empr_cuit, empr_direccion, empr_rubro)
SELECT DISTINCT
	[Empresa_Nombre], [Empresa_Cuit], [Empresa_Direccion], (select rubr_id from POSTRESQL.Rubro where Rubro_Descripcion = rubr_detalle)
FROM gd_esquema.Maestra
WHERE [Empresa_Nombre] IS NOT NULL
GO

--MIGRACION SUCURSALES

INSERT INTO POSTRESQL.Sucursal(
	sucu_nombre, sucu_direccion, sucu_codigo_postal)
SELECT DISTINCT
	[Sucursal_Nombre], [Sucursal_Dirección], [Sucursal_Codigo_Postal]
FROM gd_esquema.Maestra
WHERE [Sucursal_Nombre] IS NOT NULL
GO

--MIGRACION ITEM_RENDICION

INSERT INTO POSTRESQL.ItemRendicion(
	item_rend_nro, item_rend_importe)
SELECT DISTINCT
	[ItemRendicion_nro], [ItemRendicion_Importe]
FROM gd_esquema.Maestra
WHERE [ItemRendicion_nro] IS NOT NULL
GO

-- MIGRACION MEDIO_PAGO

INSERT INTO POSTRESQL.MedioPago(
	medio_pago_descripcion)
SELECT DISTINCT
	[FormaPagoDescripcion]
FROM gd_esquema.Maestra
WHERE [FormaPagoDescripcion] IS NOT NULL
GO

-- MIGRACION PAGO

SET IDENTITY_INSERT POSTRESQL.Pago ON;
INSERT INTO POSTRESQL.Pago(
	pago_nro, pago_fecha, pago_total, pago_medio_pago, pago_cliente, pago_sucursal)
SELECT DISTINCT
	[Pago_nro], [Pago_Fecha], [Total],
	(SELECT medio_pago_id from POSTRESQL.MedioPago WHERE medio_pago_descripcion = [FormaPagoDescripcion]),
	(SELECT clie_id from POSTRESQL.Cliente WHERE clie_dni = [Cliente-dni]),
	(SELECT sucu_id from POSTRESQL.Sucursal WHERE sucu_nombre = [Sucursal_Nombre])
FROM gd_esquema.Maestra
WHERE [Pago_nro] IS NOT NULL
SET IDENTITY_INSERT POSTRESQL.Pago OFF;
GO

--MIGRACION FACTURAS

SET IDENTITY_INSERT POSTRESQL.Factura ON;
INSERT INTO POSTRESQL.Factura(
	fact_numero, fact_fecha, fact_fecha_vencimiento, fact_total, fact_cliente, fact_empresa)
SELECT DISTINCT
	[Nro_Factura], [Factura_Fecha], [Factura_Fecha_Vencimiento], [Factura_Total], 
(SELECT clie_id from POSTRESQL.Cliente WHERE clie_dni = [Cliente-Dni]),
(SELECT empr_id from POSTRESQL.Empresa WHERE empr_cuit = Empresa_Cuit)
FROM gd_esquema.Maestra
WHERE [Nro_Factura] IS NOT NULL
SET IDENTITY_INSERT POSTRESQL.Factura OFF;
UPDATE POSTRESQL.Factura SET fact_pago = (SELECT DISTINCT[Pago_nro] FROM [gd_esquema].[Maestra] WHERE [Pago_nro] is not null AND [Nro_Factura] = fact_numero)
UPDATE POSTRESQL.Factura
SET fact_pagado = 1
WHERE fact_pago IS NOT NULL
GO

--MIGRACION ITEM_FACTURA

INSERT INTO POSTRESQL.ItemFactura(
	item_fact_monto, item_fact_cantidad, item_fact_factura)
SELECT DISTINCT
	[ItemFactura_Monto], [ItemFactura_Cantidad],
	(SELECT fact_numero from POSTRESQL.Factura WHERE Nro_Factura = fact_numero)
FROM gd_esquema.Maestra
WHERE [ItemFactura_Monto] IS NOT NULL
GO

--MIGRACION RENDICIONES

SET IDENTITY_INSERT POSTRESQL.Rendicion ON;

INSERT INTO POSTRESQL.Rendicion(
	rend_id, rend_fecha, rend_coef_comision, rend_empresa)
SELECT DISTINCT
	[Rendicion_Nro], [Rendicion_Fecha], [ItemRendicion_Importe] * 100 / Factura_Total,
	(SELECT empr_id from POSTRESQL.Empresa WHERE empr_cuit = Empresa_Cuit)
FROM gd_esquema.Maestra
WHERE [Rendicion_Nro] IS NOT NULL
SET IDENTITY_INSERT POSTRESQL.Rendicion OFF;

--MIGRACION RENDICIONES DE FACTURA

UPDATE POSTRESQL.Factura SET fact_rendicion = Rendicion_Nro
FROM gd_esquema.Maestra
WHERE Rendicion_Nro IS NOT NULL AND Nro_Factura = fact_numero 

UPDATE POSTRESQL.Rendicion SET rend_total = (SELECT sum(fact_total) 
FROM POSTRESQL.Factura
WHERE fact_rendicion = rend_id)

GO

--MIGRACION ROLES

INSERT INTO POSTRESQL.Rol (rol_nombre)
	VALUES ('Administrador'), ('Cobrador')
GO

--MIGRACION FUNCIONALIDADES
  
INSERT INTO POSTRESQL.Funcionalidad(func_descripcion)
	VALUES	('ABM Rol'),
			('ABM Clientes'),
			('ABM Empresas'),
			('ABM Sucursal'),
			('ABM Facturas'),
			('Registro de pago de facturas'),
			('Devoluciones'),
			('Rendicion de facturas cobradas'),
			('Listado Estadistico');
GO

-- Usuario admin

DECLARE @hash VARBINARY(225)
SELECT @hash = HASHBYTES('SHA2_256', 'w23e');

/* Inserto el usuario admin */

INSERT INTO POSTRESQL.Usuario(user_nombre, user_password, user_habilitado, user_intentos)
VALUES ('admin', @hash, 1, 0)
GO

/* Inserto el usuario admin en Usuario - Rol */

INSERT INTO POSTRESQL.UsuarioRol(user_rol_rol, user_rol_usuario)
VALUES (1, (SELECT user_id FROM POSTRESQL.Usuario WHERE user_nombre = 'admin'))
GO

DECLARE @passwordCobrador VARBINARY(225)
SELECT @passwordCobrador = HASHBYTES('SHA2_256', 'cobrador');

/* Inserto un usuario cobrador */

INSERT INTO POSTRESQL.Usuario(user_nombre, user_password, user_habilitado, user_intentos)
VALUES ('cobrador', @passwordCobrador, 1, 0)
GO

/* Inserto el usuario cobrador en Usuario - Rol */

INSERT INTO POSTRESQL.UsuarioRol(user_rol_rol, user_rol_usuario)
VALUES (2, (SELECT user_id FROM POSTRESQL.Usuario WHERE user_nombre = 'cobrador'))
GO

/* Inserto el usuario cobrador en Usuario - Sucursal */

INSERT INTO POSTRESQL.UsuarioSucursal(user_suc_sucursal, user_suc_usuario)
VALUES (1, (SELECT user_id FROM POSTRESQL.Usuario WHERE user_nombre = 'cobrador'))
GO


/* Inserto todas las funcionalidaded al rol Administrador y cobrar al rol cobrador */

INSERT INTO POSTRESQL.FuncionalidadRol(func_rol_rol, func_rol_funcionalidad)
values (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 8), (1, 9), (2, 6), (2, 7)
GO

--mail unico 
UPDATE POSTRESQL.Cliente SET clie_mail = NULL
WHERE clie_mail IN ((SELECT clie_mail FROM POSTRESQL.Cliente GROUP BY clie_mail HAVING COUNT (*) > 1)) 
CREATE UNIQUE NONCLUSTERED INDEX idx_yourcolumn_notnull
ON POSTRESQL.Cliente(clie_mail)
WHERE clie_mail IS NOT NULL;
GO

--FIN MIGRACIONES

--CREACION DE OBJECTOS NECESARIOS

-- login

CREATE PROCEDURE POSTRESQL.login (@userName NVARCHAR(255), @password VARCHAR(255)) AS BEGIN
  /* Devuelve una fila por cada rol que el usuario posea con:
    - Si el login fue exitoso o no (BIT)
    - Código de rol (INT)
    - Nombre de rol (NVARCHAR)
    - Cantidad de intentos fallidos (INT)
    - Si el usuario está habilitado o no (BIT)
  */
  DECLARE @ret BIT
  DECLARE @cantidad_intentos_fallidos INT

  PRINT HASHBYTES('SHA2_256', @password)

  SELECT @ret=COUNT(*), @cantidad_intentos_fallidos=MAX(user_intentos)
    FROM POSTRESQL.Usuario
   WHERE user_nombre = @userName
     AND user_password = HASHBYTES('SHA2_256', @password)
     AND user_habilitado = 1

  IF @ret = 0 BEGIN
    --Agrego un login fallido
    UPDATE POSTRESQL.Usuario
       SET user_intentos = user_intentos + 1
     WHERE user_nombre = @userName
    --Deshabilito al usuario si ya tiene 3 logins fallidos
    UPDATE POSTRESQL.Usuario
       SET user_habilitado = 0
     WHERE user_nombre = @userName
       AND user_intentos = 3
  END
  ELSE
    UPDATE POSTRESQL.Usuario
       SET user_intentos = 0
     WHERE user_nombre = @userName

  --Devuelvo los roles asignados al usuario intentando loguearse
  -- o nada, si el login no fue exitoso
  SELECT @ret AS login_valido,
         UxR.user_rol_rol, R.rol_nombre,
         U.user_habilitado, U.user_intentos
    FROM POSTRESQL.UsuarioRol UxR, POSTRESQL.ROl R, POSTRESQL.Usuario U
   WHERE UxR.user_rol_rol = R.rol_id
     AND U.user_nombre = @userName
     AND U.user_id = UxR.user_rol_usuario
END
GO

CREATE PROCEDURE POSTRESQL.funcionalidades_del_rol (@rol_id TINYINT) AS BEGIN
  /* Lista las funcionalidades que tiene asignado un rol */
  SELECT F.func_id, F.func_descripcion
    FROM POSTRESQL.Funcionalidad F, POSTRESQL.FuncionalidadRol Rf, POSTRESQL.Rol R
   WHERE Rf.func_rol_rol = @rol_id
     AND F.func_id = Rf.func_rol_funcionalidad
     AND R.rol_id = @rol_id
END
GO

CREATE PROCEDURE POSTRESQL.altaSucursal (
@nombre NVARCHAR(50),
@direccion NVARCHAR(50),
@codigo_postal NUMERIC(18, 0),
@habilitado bit
)
AS
BEGIN
INSERT INTO POSTRESQL.Sucursal(sucu_nombre,sucu_direccion,sucu_codigo_postal,sucu_habilitado) 
VALUES (@nombre,@direccion,@codigo_postal,@habilitado)
END

GO

CREATE PROCEDURE POSTRESQL.bajaSucursal(
@id numeric(6,0)
)
AS
BEGIN
UPDATE POSTRESQL.Sucursal SET sucu_habilitado = 0
where sucu_id = @id
END

GO

CREATE PROCEDURE POSTRESQL.modificarSucursal(
@id numeric(6,0),
@nombre NVARCHAR(50),
@direccion NVARCHAR(50),
@codigo_postal NUMERIC(18,0),
@habilitado BIT
)
AS
BEGIN
UPDATE POSTRESQL.Sucursal SET sucu_nombre = @nombre,sucu_direccion = @direccion, sucu_codigo_postal = @codigo_postal, sucu_habilitado = @habilitado
where sucu_id = @id
END
GO

CREATE PROCEDURE POSTRESQL.filtrarSucursales(
@nombre nvarchar(50),
@direccion nvarchar(100),
@codigo_postal numeric(18,0)
)
AS 
BEGIN
SELECT * from POSTRESQL.Sucursal 
WHERE (sucu_nombre LIKE '%' + @nombre + '%' OR @nombre LIKE '')
AND (sucu_direccion LIKE '%' + @direccion + '%' OR @direccion LIKE '')
AND (@codigo_postal =0 OR(sucu_codigo_postal = @codigo_postal))
END
GO



CREATE PROCEDURE POSTRESQL.altaCliente (
@dni numeric (18,0),
@apellido char(50),
@nombre char(50),
@fecha date,
@mail char(50),
@telefono numeric(18,0),
@direccion char(100),
@codigo char(20)
)
AS
BEGIN
INSERT INTO POSTRESQL.Cliente (clie_dni,clie_apellido,clie_nombre,clie_fecha_nac,clie_mail,clie_telefono,clie_direccion,clie_codigo_postal,clie_habilitado) 
VALUES (@dni,@apellido,@nombre,@fecha,@mail,@telefono,@direccion,@codigo,1)
END

GO

CREATE PROCEDURE POSTRESQL.bajaCliente(
@id numeric(6,0)
)
AS
BEGIN
UPDATE POSTRESQL.Cliente SET clie_habilitado = 0
where clie_id = @id
END

GO

CREATE PROCEDURE POSTRESQL.bajaRol(
@id numeric(6,0)
)
AS
BEGIN
UPDATE POSTRESQL.Rol SET rol_habilitado = 0
where rol_id = @id
END

GO


CREATE PROCEDURE POSTRESQL.modificarCliente(
@id INT,
@dni numeric (18,0),
@apellido nvarchar(225),
@nombre nvarchar(225),
@fecha datetime,
@mail nvarchar(225),
@telefono numeric (18,0),
@direccion nvarchar(225),
@codigo numeric (18,0),
@habilitado bit
)
AS
BEGIN
UPDATE POSTRESQL.Cliente SET clie_dni = @dni, clie_apellido = @apellido, clie_nombre = @nombre, clie_fecha_nac = @fecha, clie_mail = @mail, clie_direccion = @direccion, clie_codigo_postal = @codigo, clie_habilitado = @habilitado
where clie_id = @id
END
GO

CREATE PROCEDURE POSTRESQL.obtener_roles_para_modificar (@username NVARCHAR(255)) AS BEGIN
  /* Devuelve todos los roles para el administrador general y todos los roles no administrativos
     para el que no lo sea */
  SELECT *
    FROM POSTRESQL.Rol
  WHERE (rol_id NOT IN (1, 2)) OR 1 = (SELECT R.user_rol_rol
                                          FROM POSTRESQL.Usuario U, POSTRESQL.UsuarioRol R
                                         WHERE U.user_nombre = @username
                                           AND R.user_rol_usuario = U.user_id)
END
GO

CREATE PROCEDURE POSTRESQL.borrar_rol_inhabiliado_de_usuario(@rol_id int) AS BEGIN
delete POSTRESQL.UsuarioRol where user_rol_rol = @rol_id
END
GO

CREATE PROCEDURE POSTRESQL.modificar_rol (@rol_id TINYINT, @rol_nombre NVARCHAR(255), @rol_habilitado BIT) AS BEGIN
  UPDATE POSTRESQL.Rol
     SET rol_nombre = @rol_nombre,
         rol_habilitado = @rol_habilitado
   WHERE rol_id = @rol_id
   IF @rol_habilitado = 0
     exec POSTRESQL.borrar_rol_inhabiliado_de_usuario @rol_id
END
GO

CREATE PROCEDURE POSTRESQL.agregar_funcionalidad (@func_rol_rol TINYINT, @func_rol_funcionalidad TINYINT) AS BEGIN
  /* Agrega la funcionalidad descrita por el codigo al rol,
     si es que no lo tenia asignado previamente */
  IF(NOT EXISTS(SELECT 1 FROM POSTRESQL.FuncionalidadRol WHERE func_rol_rol = @func_rol_rol AND func_rol_funcionalidad = @func_rol_funcionalidad)) BEGIN
    INSERT INTO POSTRESQL.FuncionalidadRol (func_rol_rol, func_rol_funcionalidad)
    VALUES (@func_rol_rol, @func_rol_funcionalidad)
  END
END
GO

CREATE PROCEDURE POSTRESQL.quitar_funcionalidad (@func_rol_rol TINYINT, @func_rol_funcionalidad TINYINT) AS BEGIN
  DELETE FROM POSTRESQL.FuncionalidadRol
   WHERE func_rol_rol = @func_rol_rol
     AND func_rol_funcionalidad = @func_rol_funcionalidad
END
GO

CREATE PROCEDURE POSTRESQL.crear_rol (@rol_nombre NVARCHAR(255), @rol_habilitado BIT) AS BEGIN
  INSERT INTO POSTRESQL.Rol (rol_nombre, rol_habilitado)
  OUTPUT INSERTED.rol_id
  VALUES (@rol_nombre, @rol_habilitado)
END
GO

CREATE PROCEDURE POSTRESQL.altaEmpresa (@empr_nombre NVARCHAR(50), @empr_cuit NVARCHAR(50), @empr_direccion NVARCHAR(255), @empr_rubro INT) AS BEGIN
  INSERT INTO POSTRESQL.Empresa (empr_nombre, empr_cuit, empr_direccion, empr_rubro, empr_habilitado)
  VALUES (@empr_nombre, @empr_cuit, @empr_direccion, @empr_rubro, 1)
END
GO

CREATE PROCEDURE POSTRESQL.modificarEmpresa (@empr_id TINYINT, @empr_nombre NVARCHAR(50), @empr_cuit NVARCHAR(50), @empr_direccion NVARCHAR(255), @empr_rubro INT, @empr_habilitado BIT) AS BEGIN
 IF(@empr_habilitado = 0 and (select count(*) from POSTRESQL.Factura where fact_empresa = @empr_id AND fact_rendicion IS NULL) > 0)
   RAISERROR ('No se pudo inhabilitar la empresa porque tiene facturas pendientes', 16, 1)
 ELSE
  UPDATE POSTRESQL.Empresa
     SET empr_nombre = @empr_nombre,
         empr_cuit = @empr_cuit,
		 empr_direccion = @empr_direccion,
		 empr_rubro = @empr_rubro,
		 empr_habilitado = @empr_habilitado
   WHERE empr_id = @empr_id
END
GO

CREATE PROCEDURE POSTRESQL.bajaEmpresa(
@id numeric(6,0)
)
AS
BEGIN
IF ((select count(*) from POSTRESQL.Factura where fact_empresa = @id AND fact_rendicion IS NULL) > 0)
 RAISERROR ('No se pudo inhabilitar la empresa porque tiene facturas pendientes', 16, 1)
ELSE
UPDATE POSTRESQL.Empresa SET empr_habilitado = 0
where empr_id = @id
END

GO


CREATE PROCEDURE POSTRESQL.registrarPago (     
@medio_pago INT,
@sucursal INT,
@usuario nvarchar(255),
@cliente INT,
@fecha datetime,
@total decimal(18,2)
)
AS
BEGIN
DECLARE @idUsuario INT

select @idUsuario = user_id from POSTRESQL.Usuario where user_nombre = @usuario
INSERT INTO POSTRESQL.Pago(pago_fecha,pago_medio_pago,pago_sucursal,pago_cliente,pago_usuario,pago_total) 
VALUES (@fecha,@medio_pago,@sucursal,@cliente,@idUsuario,@total)
END                                       
GO

CREATE PROCEDURE POSTRESQL.pagar_factura
 @cliente numeric(18,0),
 @fecha datetime,
 @importe decimal(18,2),
 @usuario nvarchar(255),
 @sucursal numeric(18,0),
 @medio numeric(18,0),
 @factura numeric(18,0)

AS
BEGIN
DECLARE @idpago numeric(18,0),
@idfactura numeric(18,0),
@idUsuario INT

select @idUsuario = user_id from POSTRESQL.Usuario where user_nombre = @usuario
 Select @idpago = pago_nro 
 From POSTRESQL.Pago 
 where pago_fecha = CONVERT(DateTime, @fecha) AND 
 pago_total = @importe AND 
 pago_cliente = @cliente AND 
 pago_medio_pago = @medio AND
 pago_sucursal = @sucursal AND 
 pago_usuario = @idUsuario

Select @idfactura = fact_numero 
 From POSTRESQL.Factura 
 where fact_numero = @factura

 UPDATE POSTRESQL.Factura 
 SET fact_pagado = 1, fact_pago = @idpago  
 WHERE fact_numero = @idfactura

END
GO


CREATE PROCEDURE POSTRESQL.efectuarDevolucion (     
@factura numeric(6,0),
@motivo nvarchar(255),
@fecha datetime
)
AS
BEGIN
DECLARE @montoFactura numeric(18,2), @pagoId numeric(18,0)
select @montoFactura = fact_total, @pagoId = fact_pago from POSTRESQL.Factura  
where fact_numero = @factura
UPDATE POSTRESQL.PAGO SET pago_total = pago_total - @montoFactura
where pago_nro = @pagoId
INSERT INTO POSTRESQL.Devolucion(devo_pago_factura,devo_motivo,devo_fecha) 
VALUES (@factura,@motivo,@fecha)
UPDATE POSTRESQL.Factura SET fact_pagado = 0, fact_pago = NULL
where fact_numero = @factura
END                                       

GO

CREATE PROCEDURE POSTRESQL.filtrarEmpresas(
@empr_nombre NVARCHAR(50),
@empr_cuit NVARCHAR(50),
@empr_rubro TINYINT
)
AS 
BEGIN
SELECT * from POSTRESQL.Empresa 
where (empr_nombre LIKE '%' + @empr_nombre + '%' OR @empr_nombre LIKE '')
AND (empr_cuit LIKE '%' + @empr_cuit + '%' OR @empr_cuit LIKE '')
AND ((@empr_rubro = 0) OR empr_rubro = @empr_rubro)
END
GO

CREATE PROCEDURE POSTRESQL.filtrarClientes(
@nombre NVARCHAR(225),
@apellido NVARCHAR(225),
@dni Numeric(18, 0)
)
AS 
BEGIN
SELECT * from POSTRESQL.Cliente 
where (clie_nombre LIKE '%' + @nombre + '%' OR @nombre LIKE '')
AND (clie_apellido LIKE '%' + @apellido + '%' OR @apellido LIKE '')
AND ((@dni = 0) OR clie_dni = @dni)
END
GO

CREATE PROCEDURE POSTRESQL.obtenerSucursalesDeUsuario(
@username NVARCHAR(255)
)
AS
BEGIN
SELECT sucu_id, sucu_nombre from POSTRESQL.Sucursal where sucu_habilitado = 1 and sucu_id IN 
(select user_suc_sucursal from POSTRESQL.UsuarioSucursal where user_suc_usuario = 
(select user_id from POSTRESQL.Usuario where user_nombre = @username))
END
GO


CREATE PROCEDURE POSTRESQL.porcentaje_facturas_empresas_por_mes (@anio int, @nro_trim int)
AS BEGIN
SELECT TOP 5 empr_nombre, empr_rubro, empr_cuit, 
isnull((((select count(*) from POSTRESQL.Factura where fact_empresa = empr_id 
and fact_pago IS NOT NULL 
and YEAR(fact_fecha) = @anio
and (MONTH(fact_fecha) = (@nro_trim * 3) OR MONTH(fact_fecha) = (@nro_trim * 3) -1 OR MONTH(fact_fecha) = (@nro_trim * 3) -2)) * 100 /
NULLIF((select count(*) from POSTRESQL.Factura where fact_empresa = empr_id 
and YEAR(fact_fecha) = @anio
and (MONTH(fact_fecha) = (@nro_trim * 3) OR MONTH(fact_fecha) = (@nro_trim * 3) -1 OR MONTH(fact_fecha) = (@nro_trim * 3) -2)), 0))),0) as "Porcentaje de facturas cobradas"
FROM POSTRESQL.Empresa
group by empr_id, empr_nombre, empr_rubro, empr_cuit
ORDER BY 4 DESC;
END
GO

CREATE PROCEDURE POSTRESQL.empresas_mayor_monto_facturado (@anio int, @nro_trim int)
AS BEGIN
SELECT TOP 5 empr_nombre, empr_rubro, empr_cuit, SUM(rend_total) as "Monto total rendido"
FROM POSTRESQL.Empresa join POSTRESQL.Rendicion ON rend_empresa = empr_id
where YEAR(rend_fecha) = @anio
and (MONTH(rend_fecha) = (@nro_trim * 3) OR MONTH(rend_fecha) = (@nro_trim * 3) -1 OR MONTH(rend_fecha) = (@nro_trim * 3) -2)
GROUP BY empr_id, empr_nombre, empr_rubro, empr_cuit
ORDER BY 4 DESC;
END
GO


CREATE PROCEDURE POSTRESQL.clientes_mas_pagos (@anio int, @nro_trim int)
AS BEGIN
SELECT TOP 5 clie_nombre, clie_apellido, clie_dni, clie_mail, 
(SELECT COUNT(*) FROM POSTRESQL.Pago WHERE pago_cliente = clie_id and YEAR(pago_fecha) = @anio
and (MONTH(pago_fecha) = (@nro_trim * 3) OR MONTH(pago_fecha) = (@nro_trim * 3) -1 OR MONTH(pago_fecha) = (@nro_trim * 3) -2))
as "Cantidad de Pagos" 
FROM POSTRESQL.Cliente
GROUP BY clie_nombre, clie_apellido, clie_dni, clie_mail, clie_id
ORDER BY 5 DESC;
END
GO


CREATE PROCEDURE POSTRESQL.clientes_cumplidores (@anio int, @nro_trim int)
AS BEGIN
SELECT TOP 5 clie_nombre, clie_apellido, clie_dni, clie_mail, 
isnull((((select count(*) from POSTRESQL.Factura where fact_cliente = clie_id 
and fact_pago IS NOT NULL 
and YEAR(fact_fecha) = @anio
and (MONTH(fact_fecha) = (@nro_trim * 3) OR MONTH(fact_fecha) = (@nro_trim * 3) -1 OR MONTH(fact_fecha) = (@nro_trim * 3) -2)) * 100 /
NULLIF((select count(*) from POSTRESQL.Factura where fact_cliente = clie_id
and YEAR(fact_fecha) = @anio
and (MONTH(fact_fecha) = (@nro_trim * 3) OR MONTH(fact_fecha) = (@nro_trim * 3) -1 OR MONTH(fact_fecha) = (@nro_trim * 3) -2)), 0))),0) as "Porcentaje de facturas pagadas"
FROM POSTRESQL.Cliente
group by clie_nombre, clie_apellido, clie_dni, clie_mail, clie_id
ORDER BY 5 DESC;
END
GO


CREATE PROCEDURE POSTRESQL.listados (@anio int, @nro_trim int, @tipoListado int)
AS BEGIN

if @tipoListado = 0
    exec POSTRESQL.porcentaje_facturas_empresas_por_mes @anio, @nro_trim
if @tipoListado = 1
    exec POSTRESQL.empresas_mayor_monto_facturado @anio, @nro_trim
if @tipoListado = 2
    exec POSTRESQL.clientes_mas_pagos @anio, @nro_trim
if @tipoListado = 3
    exec POSTRESQL.clientes_cumplidores @anio, @nro_trim

END
GO

CREATE PROCEDURE [POSTRESQL].[facturaPorNumero](
@numero numeric(18,0)
)
AS 
BEGIN
SELECT * FROM POSTRESQL.Factura 
WHERE fact_numero = @numero
END
GO	

CREATE PROCEDURE POSTRESQL.altaFactura (@fact_numero numeric(6,0), @fact_cliente int, @fact_empresa int, @fact_fecha datetime, @fact_fecha_vencimiento datetime, @fact_total numeric(18,2)) 
AS BEGIN
SET IDENTITY_INSERT POSTRESQL.Factura ON;
  INSERT INTO POSTRESQL.Factura (fact_numero, fact_cliente, fact_empresa, fact_fecha, fact_fecha_vencimiento, fact_total)
  VALUES (@fact_numero, @fact_cliente, @fact_empresa, @fact_fecha, @fact_fecha_vencimiento, @fact_total)
  SET IDENTITY_INSERT POSTRESQL.Factura Off;
END
GO

CREATE PROCEDURE POSTRESQL.filtrarFacturasModificables(@fact_cliente int, @fact_empresa int, @fact_numero NVARCHAR(225))
AS BEGIN

SELECT fact_numero, clie_nombre, clie_apellido, empr_nombre, fact_fecha, fact_fecha_vencimiento, fact_total 
FROM POSTRESQL.Factura JOIN POSTRESQL.Cliente ON clie_id = fact_cliente
					   JOIN POSTRESQL.Empresa ON empr_id = fact_empresa
WHERE ((@fact_cliente = 0) OR fact_cliente = @fact_cliente)
AND ((@fact_empresa = 0) OR fact_empresa = @fact_empresa)
AND ((@fact_numero LIKE '') OR fact_numero LIKE '%' + @fact_numero + '%')
AND fact_pago is null
AND fact_rendicion is null
END
GO

CREATE PROCEDURE POSTRESQL.altaItemFactura (@concepto NVARCHAR(225), @cantidad int, @monto numeric(18,2), @numeroFactura numeric(6,0)) 
AS BEGIN
  INSERT INTO POSTRESQL.ItemFactura (item_fact_concepto, item_fact_cantidad, item_fact_monto, item_fact_factura)
  VALUES (@concepto, @cantidad, @monto, @numeroFactura)
END
GO


CREATE PROCEDURE POSTRESQL.bajaFactura(@numero numeric(18,0))
AS BEGIN

DELETE FROM POSTRESQL.ItemFactura WHERE item_fact_factura = @numero;
DELETE FROM POSTRESQL.Factura WHERE fact_numero= @numero;

END
GO

CREATE PROCEDURE POSTRESQL.bajaItemFactura(@id numeric(6,0))
AS BEGIN

DELETE FROM POSTRESQL.ItemFactura WHERE item_fact_id = @id ;

END
GO

CREATE PROCEDURE POSTRESQL.modificarFactura (@fact_numero numeric(6,0), @fact_cliente int, @fact_empresa int, @fact_fecha datetime, @fact_fecha_vencimiento datetime, @fact_total numeric(18,2)) 
AS BEGIN
  UPDATE POSTRESQL.Factura
     SET fact_cliente= @fact_cliente,
         fact_empresa= @fact_empresa,
		 fact_fecha= @fact_fecha,
		 fact_fecha_vencimiento= @fact_fecha_vencimiento,
		 fact_total= @fact_total
   WHERE fact_numero= @fact_numero
END
GO

CREATE PROCEDURE POSTRESQL.modificarItemFactura (@concepto NVARCHAR(225), @cantidad int, @monto numeric(18,2), @id numeric(6,0)) 
AS BEGIN
  UPDATE POSTRESQL.ItemFactura
     SET item_fact_concepto = @concepto,
         item_fact_cantidad = @cantidad,
		 item_fact_monto = @monto
   WHERE item_fact_id = @id
END
GO

CREATE PROCEDURE POSTRESQL.itemsPorFactura(@numeroFactura numeric(6,0))
AS BEGIN
	
	SELECT item_fact_id, item_fact_concepto, item_fact_cantidad, item_fact_monto FROM POSTRESQL.ItemFactura
	WHERE item_fact_factura = @numeroFactura

END
GO	

CREATE PROCEDURE POSTRESQL.facturasARendir(@empresa int, @fecha datetime)
AS BEGIN
	
SELECT fact_numero, (clie_nombre + ' ' + clie_apellido) AS Cliente , fact_fecha, fact_fecha_vencimiento, fact_total 
FROM POSTRESQL.Factura JOIN POSTRESQL.Cliente ON clie_id = fact_cliente
WHERE (fact_empresa = @empresa)
AND fact_pago is not null
AND fact_rendicion is null
AND fact_fecha < @fecha
ORDER BY fact_numero

END
GO	

CREATE PROCEDURE POSTRESQL.altaRendicion(
@empresa numeric(6,0), @fecha datetime, @total decimal(12,2), @coef float
)
AS BEGIN

IF ((select count(*) from POSTRESQL.Rendicion WHERE MONTH(rend_fecha) = MONTH(@fecha)
											   AND YEAR(rend_fecha) = YEAR(@fecha)
											   AND rend_empresa = @empresa) > 0)
 RAISERROR ('Ya hay una rendición para dicha empresa en el mes seleccionado', 16, 1)
ELSE
INSERT INTO POSTRESQL.Rendicion (rend_empresa, rend_fecha, rend_coef_comision, rend_total) 
VALUES (@empresa, @fecha, @coef, @total);
UPDATE POSTRESQL.Factura 
SET fact_rendicion = (SELECT rend_id 
					   FROM POSTRESQL.Rendicion 
					   WHERE rend_empresa = @empresa AND rend_fecha = @fecha)
WHERE fact_empresa = @empresa 
  AND fact_fecha <= @fecha 
  AND fact_pago is not null 
  AND fact_rendicion is null

END

GO