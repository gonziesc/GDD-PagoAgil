USE [GD2C2017]

-- ELIMINACION DE TABLAS NECESARIAS


IF OBJECT_ID('POSTRESQL.UsuarioSucursal', 'U') IS NOT NULL
DROP TABLE POSTRESQL.UsuarioSucursal

IF OBJECT_ID('POSTRESQL.UsuarioRol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.UsuarioRol

IF OBJECT_ID('POSTRESQL.RubroEmpresa', 'U') IS NOT NULL
DROP TABLE POSTRESQL.RubroEmpresa

IF OBJECT_ID('POSTRESQL.FuncionalidadRol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.FuncionalidadRol

IF OBJECT_ID('POSTRESQL.ItemFactura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.ItemFactura

IF OBJECT_ID('POSTRESQL.Devolucion', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Devolucion

IF OBJECT_ID('POSTRESQL.PagoFactura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.PagoFactura

IF OBJECT_ID('POSTRESQL.Pago', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Pago

IF OBJECT_ID('POSTRESQL.Factura', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Factura

IF OBJECT_ID('POSTRESQL.MedioPago', 'U') IS NOT NULL
DROP TABLE POSTRESQL.MedioPago

IF OBJECT_ID('POSTRESQL.Sucursal', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Sucursal

IF OBJECT_ID('POSTRESQL.Usuario', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Usuario

IF OBJECT_ID('POSTRESQL.Rubro', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rubro

IF OBJECT_ID('POSTRESQL.Rol', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rol

IF OBJECT_ID('POSTRESQL.Rendicion', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Rendicion

IF OBJECT_ID('POSTRESQL.Funcionalidad', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Funcionalidad

IF OBJECT_ID('POSTRESQL.Empresa', 'U') IS NOT NULL
DROP TABLE POSTRESQL.Empresa

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

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'POSTRESQL')
    DROP SCHEMA POSTRESQL
GO

/* Creación del esquema */

CREATE SCHEMA POSTRESQL AUTHORIZATION gd;
GO


CREATE TABLE POSTRESQL.Cliente(
	clie_id INT IDENTITY(1,1) PRIMARY KEY,
	clie_dni NUMERIC(18,0) UNIQUE ,
	clie_apellido NVARCHAR(225) ,
	clie_nombre  NVARCHAR(225) ,
	clie_fecha_nac DATETIME ,
	clie_mail NVARCHAR(225),
	clie_direccion NVARCHAR(225) ,
	clie_codigo_postal NUMERIC(18,0) ,
	clie_habilitado BIT DEFAULT 1
)


GO
CREATE TABLE POSTRESQL.Devolucion(
	devo_id INT PRIMARY KEY,
	[devo_pago_factura] [numeric](6, 0) ,
	devo_motivo NVARCHAR(225) ,
	devo_fecha DATETIME
)



GO
CREATE TABLE [POSTRESQL].[Empresa](
	empr_id INT IDENTITY(1,1) PRIMARY KEY,
	empr_nombre NVARCHAR(50) ,
	empr_cuit NVARCHAR(50) ,
	empr_direccion NVARCHAR(225) ,
	empr_rubro numeric(18,0) NULL,
	empr_habilitado BIT DEFAULT 1
)
GO

CREATE TABLE [POSTRESQL].[Rendicion](
	[rend_id] INT IDENTITY PRIMARY KEY,
	[rend_fecha] DATETIME ,
	[rend_total] [decimal](12, 2) ,
	[rend_coef_comision] [float] NULL,
	[rend_concepto] [char](100) NULL,
	rend_empresa INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Empresa(empr_id))
GO

CREATE TABLE POSTRESQL.Factura(
    fact_numero INT IDENTITY PRIMARY KEY,
    fact_cliente INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Cliente(clie_id),
	fact_empresa INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Empresa(empr_id),
    fact_fecha DATETIME,
	fact_fecha_vencimiento DATETIME,
	fact_total INT, 
	fact_cobrada BIT DEFAULT 0,
	fact_rendicion INT FOREIGN KEY REFERENCES POSTRESQL.Rendicion(rend_id)) 

GO
CREATE TABLE [POSTRESQL].[Funcionalidad](
	[func_id] INT IDENTITY PRIMARY KEY,
	[func_descripcion] [char](100))
GO

CREATE TABLE [POSTRESQL].[Rol](
	[rol_id] INT IDENTITY PRIMARY KEY,
	[rol_nombre] [char](50) ,
	[rol_habilitado] [bit] DEFAULT 1)


GO

CREATE TABLE [POSTRESQL].[FuncionalidadRol](
	[func_rol_rol] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.ROL(rol_id),
	[func_rol_funcionalidad] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Funcionalidad(func_id))


GO
CREATE TABLE [POSTRESQL].[ItemFactura](
	[item_fact_monto] [decimal](12, 2) ,
	[item_fact_cantidad] [decimal](12, 2) ,
	[item_fact_factura] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Factura(fact_numero),
	[item_fact_concepto] [char](100) ,
	[item_fact_id]  INT IDENTITY PRIMARY KEY)


GO

CREATE TABLE [POSTRESQL].[ItemRendicion](
	[item_rend_nro] [numeric](18, 0) PRIMARY KEY ,
	[item_rend_importe] [decimal](12, 2))


GO

CREATE TABLE [POSTRESQL].[MedioPago](
	[medio_pago_id] INT IDENTITY PRIMARY KEY,
	[medio_pago_descripcion] [char](50))


GO

CREATE TABLE [POSTRESQL].[Usuario](
	[user_id] INT IDENTITY PRIMARY KEY,
	[user_nombre]  NVARCHAR(255) UNIQUE ,
	user_intentos TINYINT,
	[user_habilitado] [bit] ,
	[user_password]  NVARCHAR(255))


GO

CREATE TABLE [POSTRESQL].[Sucursal](
	[sucu_id] INT IDENTITY PRIMARY KEY,
	[sucu_nombre] [char](50) ,
	[sucu_direccion] [char](100) ,
	[sucu_codigo_postal] [char](20) UNIQUE ,
	[sucu_habilitado] [bit] DEFAULT 1)


GO

CREATE TABLE [POSTRESQL].[Pago](
	[pago_nro] INT IDENTITY PRIMARY KEY,
	[pago_fecha] [date] NULL ,
	[pago_total] numeric(18,2) NULL ,
	[pago_itemPago_nro] numeric(18,0) NULL,
	[pago_medio_pago] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.MedioPago(medio_pago_id) ,
	[pago_sucursal] INT NULL FOREIGN KEY REFERENCES POSTRESQL.Sucursal(sucu_id),
	[pago_usuario]  INT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[pago_cliente] INT NULL FOREIGN KEY REFERENCES POSTRESQL.Cliente(clie_id))

GO
CREATE TABLE [POSTRESQL].[PagoFactura](
	[pago_fact_pago]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Pago(pago_nro),
	[pago_fact_factura] INT FOREIGN KEY REFERENCES POSTRESQL.Factura(fact_numero),
	[pago_fact_anulado] [bit] DEFAULT 0,
	[pago_fact_fecha] [datetime],
	[pago_fact_numero]INT IDENTITY PRIMARY KEY
)

GO

CREATE TABLE [POSTRESQL].[Rubro](
	[rubr_id] INT IDENTITY(1,1) PRIMARY KEY,
	[rubr_detalle] [char](100))

GO
CREATE TABLE [POSTRESQL].[RubroEmpresa](
	[empr_id] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Empresa(empr_id),
	[rubr_id]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Rubro(rubr_id))

GO

CREATE TABLE [POSTRESQL].[UsuarioRol](
	[user_rol_usuario]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[user_rol_rol] INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Rol(rol_id))

GO
CREATE TABLE [POSTRESQL].[UsuarioSucursal](
	[user_suc_usuario]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Usuario(user_id),
	[user_suc_sucursal]  INT NOT NULL FOREIGN KEY REFERENCES POSTRESQL.Sucursal(sucu_id))
GO


--INICIO MIGRACIONES

-- MIGRACION CLIENTES

INSERT INTO POSTRESQL.Cliente(
	clie_dni, clie_apellido, clie_nombre, clie_fecha_nac, clie_mail,
	clie_direccion, clie_codigo_postal)
SELECT DISTINCT
	[Cliente-Dni], [Cliente-Apellido], [Cliente-Nombre], [Cliente-Fecha_Nac], [Cliente_Mail],
	[Cliente_Direccion], [Cliente_Codigo_Postal]
FROM gd_esquema.Maestra
WHERE [Cliente-Dni] IS NOT NULL
-- 

GO

--MIGRACION EMPRESAS

INSERT INTO POSTRESQL.Empresa(
	empr_nombre, empr_cuit, empr_direccion, empr_rubro)
SELECT DISTINCT
	[Empresa_Nombre], [Empresa_Cuit], [Empresa_Direccion], [Empresa_Rubro]
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

--MIGRACION RUBRO
INSERT INTO POSTRESQL.Rubro(
	rubr_detalle)
SELECT DISTINCT
	[Rubro_Descripcion]
FROM gd_esquema.Maestra
WHERE [Rubro_Descripcion] IS NOT NULL

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
	pago_nro, pago_fecha, pago_total, pago_itemPago_nro, pago_medio_pago, pago_cliente, pago_sucursal)
SELECT DISTINCT
	[Pago_nro], [Pago_Fecha], [Total], [ItemPago_nro],
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

UPDATE POSTRESQL.Factura SET fact_rendicion = Rendicion_Nro
FROM gd_esquema.Maestra
WHERE Rendicion_Nro IS NOT NULL AND Nro_Factura = fact_numero 

UPDATE POSTRESQL.Rendicion SET rend_total = (SELECT sum(fact_total) 
FROM POSTRESQL.Factura
WHERE fact_rendicion = rend_id)


GO
--MIGRACION PAGO_FACTURA

INSERT INTO POSTRESQL.PagoFactura(pago_fact_fecha, pago_fact_factura, pago_fact_pago)
SELECT DISTINCT
	[Pago_Fecha], [Nro_Factura], [Pago_nro]  
FROM gd_esquema.Maestra
WHERE Nro_Factura IS NOT NULL AND Pago_nro IS NOT NULL

GO


--MIGRACION RUBRO_EMPRESA

INSERT INTO POSTRESQL.RubroEmpresa(empr_id, rubr_id)
VALUES(
	(SELECT empr_id from POSTRESQL.Empresa join POSTRESQL.Rubro on empr_rubro = rubr_id),
	(SELECT rubr_id from POSTRESQL.Rubro join POSTRESQL.Empresa on empr_rubro = rubr_id))
GO



--MIGRACION ROLES

INSERT INTO POSTRESQL.Rol (rol_nombre)
	VALUES ('Administrador'), ('Cobrador')

GO

--MIGRACION FUNCIONALIDADES
  
INSERT INTO POSTRESQL.Funcionalidad(func_descripcion)
	VALUES	('ABM Rol'),
			('Login y Seguridad'),
			('Registro de Usuarios'),
			('ABM Clientes'),
			('ABM Empresas'),
			('ABM Sucursal'),
			('ABM Facturas'),
			('ABM Rubro'),
			('Registro de pago de facturas'),
			('Rendicion de facturas cobradas'),
			('Devoluciones'),
			('Listado Estadistico'),
			('Cambiar password');

GO
--FIN MIGRACIONES

-- Usuario admin
DECLARE @hash VARBINARY(225)
SELECT @hash = HASHBYTES('SHA2_256', 'w23e');

/* Inserto el usuario admin */
INSERT INTO POSTRESQL.Usuario(user_nombre, user_password, user_habilitado, user_intentos)
VALUES ('admin', @hash, 1, 0), ('Administrador',@hash,1,0);

GO

INSERT INTO POSTRESQL.UsuarioRol(user_rol_rol, user_rol_usuario)
VALUES (1, (SELECT user_id FROM POSTRESQL.Usuario WHERE user_nombre = 'admin'))

GO

INSERT INTO POSTRESQL.FuncionalidadRol(func_rol_rol, func_rol_funcionalidad)
values (1, 6)
GO

INSERT INTO POSTRESQL.FuncionalidadRol(func_rol_rol, func_rol_funcionalidad)
values (1, 4)
GO

--mail unico 
UPDATE POSTRESQL.Cliente SET clie_mail = NULL
WHERE ((SELECT COUNT(*) clie_mail FROM POSTRESQL.Cliente c2 where c2.clie_mail = clie_mail) > 1) 
CREATE UNIQUE NONCLUSTERED INDEX idx_yourcolumn_notnull
ON POSTRESQL.Cliente(clie_mail)
WHERE clie_mail IS NOT NULL;
GO

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
@nombre char(50),
@direccion char(100),
@codigo_postal char(30),
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
@nombre char(50),
@direccion char(100),
@codigo_postal char(30)
)
AS
BEGIN
UPDATE POSTRESQL.Sucursal SET sucu_nombre = @nombre,sucu_direccion = @direccion, sucu_codigo_postal = @codigo_postal
where sucu_id = @id
END
GO

CREATE PROCEDURE POSTRESQL.todasSucursales
AS 
BEGIN
SELECT * from POSTRESQL.Sucursal where sucu_habilitado = 1
END
GO

CREATE PROCEDURE POSTRESQL.filtrarSucursales(
@nombre char(50),
@direccion char(100),
@codigo_postal char(30)
)
AS 
BEGIN
SELECT * from POSTRESQL.Sucursal 
where sucu_habilitado = 1
AND (sucu_nombre = @nombre OR @nombre LIKE '')
AND (sucu_direccion = @direccion OR @direccion LIKE '')
AND (sucu_codigo_postal = @codigo_postal OR @codigo_postal LIKE '')
END
GO






