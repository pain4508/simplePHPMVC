
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Lubricantes_XYZ
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lubricantes_XYZ
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lubricantes_XYZ` DEFAULT CHARACTER SET utf8 ;
USE `Lubricantes_XYZ` ;

-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`bitacora` (
  `bitacoracod` INT(11) NOT NULL AUTO_INCREMENT,
  `bitacorafch` DATETIME NULL DEFAULT NULL,
  `bitprograma` VARCHAR(15) NULL DEFAULT NULL,
  `bitdescripcion` VARCHAR(255) NULL DEFAULT NULL,
  `bitobservacion` MEDIUMTEXT NULL DEFAULT NULL,
  `bitTipo` CHAR(3) NULL DEFAULT NULL,
  `bitusuario` BIGINT(18) NULL DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`categoria` (
  `idCategoria` INT(11) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`detalleFactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`detalleFactura` (
  `idDetalleFactura` INT(11) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `isv` DOUBLE NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`idDetalleFactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`formaPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`formaPago` (
  `idFormaPago` INT(11) NOT NULL,
  `formaPago` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idFormaPago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`paisDestino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`paisDestino` (
  `idPaisDestino` INT(11) NOT NULL,
  `paisDestino` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPaisDestino`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`producto` (
  `idProducto` INT(11) NOT NULL,
  `nombreProducto` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `idCategoria` INT(11) NOT NULL,
  `precio` INT(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_producto_categoria1_idx` (`idCategoria` ASC),
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Lubricantes_XYZ`.`categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`factura` (
  `idFactura` INT(11) NOT NULL,
  `codUsuario` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `idFormaPago` INT(11) NOT NULL,
  `idPaisDestino` INT(11) NOT NULL,
  `idDetalleFactura` INT(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_factura_producto1_idx` (`idProducto` ASC),
  INDEX `fk_factura_formaPago1_idx` (`idFormaPago` ASC),
  INDEX `fk_factura_pais1_idx` (`idPaisDestino` ASC),
  INDEX `fk_factura_detalleFactura1_idx` (`idDetalleFactura` ASC),
  CONSTRAINT `fk_factura_detalleFactura1`
    FOREIGN KEY (`idDetalleFactura`)
    REFERENCES `Lubricantes_XYZ`.`detalleFactura` (`idDetalleFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_formaPago1`
    FOREIGN KEY (`idFormaPago`)
    REFERENCES `Lubricantes_XYZ`.`formaPago` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_pais1`
    FOREIGN KEY (`idPaisDestino`)
    REFERENCES `Lubricantes_XYZ`.`paisDestino` (`idPaisDestino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Lubricantes_XYZ`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`funciones` (
  `fncod` VARCHAR(15) NOT NULL,
  `fndsc` VARCHAR(45) NULL DEFAULT NULL,
  `fnest` CHAR(3) NULL DEFAULT NULL,
  `fntyp` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `rolesdsc` VARCHAR(45) NULL DEFAULT NULL,
  `rolesest` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`funciones_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`funciones_roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `fncod` VARCHAR(15) NOT NULL,
  `fnrolest` CHAR(3) NULL DEFAULT NULL,
  `fnexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`, `fncod`),
  INDEX `rol_funcion_key_idx` (`fncod` ASC),
  CONSTRAINT `funcion_rol_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `Lubricantes_XYZ`.`roles` (`rolescod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key`
    FOREIGN KEY (`fncod`)
    REFERENCES `Lubricantes_XYZ`.`funciones` (`fncod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`usuario` (
  `usercod` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `useremail` VARCHAR(80) NULL DEFAULT NULL,
  `username` VARCHAR(80) NULL DEFAULT NULL,
  `userpswd` VARCHAR(128) NULL DEFAULT NULL,
  `userfching` DATETIME NULL DEFAULT NULL,
  `userpswdest` CHAR(3) NULL DEFAULT NULL,
  `userpswdexp` DATETIME NULL DEFAULT NULL,
  `userest` CHAR(3) NULL DEFAULT NULL,
  `useractcod` VARCHAR(128) NULL DEFAULT NULL,
  `userpswdchg` VARCHAR(128) NULL DEFAULT NULL,
  `usertipo` CHAR(3) NULL DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE INDEX `useremail_UNIQUE` (`useremail` ASC),
  INDEX `usertipo` (`usertipo` ASC, `useremail` ASC, `usercod` ASC, `userest` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lubricantes_XYZ`.`roles_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lubricantes_XYZ`.`roles_usuarios` (
  `usercod` BIGINT(10) NOT NULL,
  `rolescod` VARCHAR(15) NOT NULL,
  `roleuserest` CHAR(3) NULL DEFAULT NULL,
  `roleuserfch` DATETIME NULL DEFAULT NULL,
  `roleuserexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`usercod`, `rolescod`),
  INDEX `rol_usuario_key_idx` (`rolescod` ASC),
  CONSTRAINT `rol_usuario_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `Lubricantes_XYZ`.`roles` (`rolescod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key`
    FOREIGN KEY (`usercod`)
    REFERENCES `Lubricantes_XYZ`.`usuario` (`usercod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
