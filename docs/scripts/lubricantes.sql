-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for lubricantes_xyz
CREATE DATABASE IF NOT EXISTS `lubricantes_xyz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lubricantes_xyz`;

-- Dumping structure for table lubricantes_xyz.bitacora
CREATE TABLE IF NOT EXISTS `bitacora` (
  `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(15) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.bitacora: ~0 rows (approximately)
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.carrito
CREATE TABLE IF NOT EXISTS `carrito` (
  `idcarrito` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usercod` bigint(10) NOT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `FK_carrito_usuario` (`usercod`),
  CONSTRAINT `FK_carrito_usuario` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.carrito: ~1 rows (approximately)
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.categoria: ~2 rows (approximately)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idCategoria`, `categoria`) VALUES
	(1, 'Aceite'),
	(2, 'Grasa');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.detallecarrito
CREATE TABLE IF NOT EXISTS `detallecarrito` (
  `idcarrito` int(10) unsigned NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idcarrito`,`idProducto`),
  KEY `idcarrito` (`idcarrito`),
  KEY `FK_detallecarrito_producto` (`idProducto`),
  CONSTRAINT `FK_detallecarrito_carrito` FOREIGN KEY (`idcarrito`) REFERENCES `carrito` (`idcarrito`) ON DELETE CASCADE,
  CONSTRAINT `FK_detallecarrito_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.detallecarrito: ~3 rows (approximately)
/*!40000 ALTER TABLE `detallecarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecarrito` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.detallefactura
CREATE TABLE IF NOT EXISTS `detallefactura` (
  `idfactura` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`,`idproducto`),
  KEY `idfactura` (`idfactura`),
  KEY `FK_detallefactura_producto` (`idproducto`),
  CONSTRAINT `FK_detallefactura_factura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idFactura`) ON DELETE CASCADE,
  CONSTRAINT `FK_detallefactura_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.detallefactura: ~0 rows (approximately)
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` (`idfactura`, `idproducto`) VALUES
	(1, 1),
	(1, 2),
	(1, 3);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `codUsuario` bigint(10) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `idPaisDestino` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_factura_formaPago1_idx` (`idFormaPago`),
  KEY `fk_factura_pais1_idx` (`idPaisDestino`),
  KEY `FK_factura_usuario` (`codUsuario`),
  CONSTRAINT `FK_factura_usuario` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`usercod`),
  CONSTRAINT `fk_factura_formaPago1` FOREIGN KEY (`idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_pais1` FOREIGN KEY (`idPaisDestino`) REFERENCES `paisdestino` (`idPaisDestino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.factura: ~0 rows (approximately)
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`idFactura`, `codUsuario`, `idFormaPago`, `idPaisDestino`) VALUES
	(1, 4, 1, 1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.formapago
CREATE TABLE IF NOT EXISTS `formapago` (
  `idFormaPago` int(11) NOT NULL,
  `formaPago` varchar(40) NOT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.formapago: ~2 rows (approximately)
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` (`idFormaPago`, `formaPago`) VALUES
	(1, 'Tarjeta de Credito'),
	(2, 'Paypal');
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.funciones
CREATE TABLE IF NOT EXISTS `funciones` (
  `fncod` varchar(15) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.funciones: ~14 rows (approximately)
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
	('admin', 'admin', 'ACT', 'PRG'),
	('carrito', 'carrito', 'ACT', 'PRG'),
	('carrito?mode=VE', 'carrito?mode=VER', 'ACT', 'PRG'),
	('compraProducto', 'compraProducto', 'ACT', 'PRG'),
	('dashboard', 'Menu Principal de Administración', 'ACT', 'PGR'),
	('factura', 'factura', 'ACT', 'PRG'),
	('producto', 'producto', 'ACT', 'PRG'),
	('programa', 'Función', 'ACT', 'PGR'),
	('programas', 'Trabajar con Funciones', 'ACT', 'PGR'),
	('proyectoFinal', 'proyectoFinal', 'ACT', 'PRG'),
	('rol', 'Rol', 'ACT', 'PGR'),
	('roles', 'Trabajar con Roles', 'ACT', 'PGR'),
	('user', 'Usuario', 'ACT', 'PGR'),
	('users', 'Trabajar con Usuarios', 'ACT', 'PGR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.funciones_roles
CREATE TABLE IF NOT EXISTS `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(15) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.funciones_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.paisdestino
CREATE TABLE IF NOT EXISTS `paisdestino` (
  `idPaisDestino` int(11) NOT NULL,
  `paisDestino` varchar(50) NOT NULL,
  PRIMARY KEY (`idPaisDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.paisdestino: ~2 rows (approximately)
/*!40000 ALTER TABLE `paisdestino` DISABLE KEYS */;
INSERT INTO `paisdestino` (`idPaisDestino`, `paisDestino`) VALUES
	(1, 'Honduras'),
	(2, 'USA');
/*!40000 ALTER TABLE `paisdestino` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_producto_categoria1_idx` (`idCategoria`),
  CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.producto: ~3 rows (approximately)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`idProducto`, `nombreProducto`, `descripcion`, `idCategoria`, `precio`) VALUES
	(1, 'Hola', 'Mundo', 1, 100),
	(2, 'Adios', 'Universo', 2, 200),
	(3, 'safasd', 'gagds', 2, 1000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.roles_usuarios
CREATE TABLE IF NOT EXISTS `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.roles_usuarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;

-- Dumping structure for table lubricantes_xyz.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table lubricantes_xyz.usuario: ~1 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
	(4, 'admin@demo.com', 'Administrador', '55c3f3b9fac111c1ea57caff5bc2ed4a', '2019-04-08 15:10:29', 'VGT', NULL, 'ACT', '', NULL, 'ADM');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
