CREATE TABLE `demoalgorith`.`productos` (
  `productocod` BIGINT(18) NOT NULL AUTO_INCREMENT,
  `productosbarra` VARCHAR(25) NOT NULL,
  `productodesc` VARCHAR(128) NOT NULL,
  `productodesccrt` VARCHAR(64) NOT NULL,
  `categoriacod` INT(5) NOT NULL,
  `productoest` CHAR(3) NOT NULL DEFAULT 'ACT',
  `productotip` CHAR(3) NOT NULL DEFAULT 'SAL',
  `parentcod` BIGINT(18) NULL,
  PRIMARY KEY (`productocod`),
  UNIQUE INDEX `BARRAUNQ` (`productosbarra` ASC));
