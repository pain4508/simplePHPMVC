CREATE TABLE `nw201802`.`productos` (
  `productocod` BIGINT(18) NOT NULL AUTO_INCREMENT,
  `productobarra` VARCHAR(80) NOT NULL,
  `productoCodInt` VARCHAR(45) NOT NULL,
  `productoNombre` VARCHAR(128) NOT NULL,
  `productoTipo` CHAR(3) NULL,
  `productoEstado` CHAR(3) NULL,
  `productoPrecio` DECIMAL(15,2) NULL,
  `productoStock` DECIMAL(8,2) NULL,
  `productoIva` DECIMAL(3,2) NULL,
  PRIMARY KEY (`productocod`),
  UNIQUE INDEX `productobarra_UNIQUE` (`productobarra` ASC),
  UNIQUE INDEX `productoCodInt_UNIQUE` (`productoCodInt` ASC));
