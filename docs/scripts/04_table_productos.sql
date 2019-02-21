CREATE TABLE `productos` (
  `prdcod` BIGINT(18) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prddsc` VARCHAR(128) NOT NULL,
  `prdcodbrr` VARCHAR(45) NOT NULL,
  `prdSKU` VARCHAR(45) NOT NULL,
  `prdStock` INT(8) NOT NULL,
  `prdPrcVVnt` DECIMAL(13,4) NOT NULL,
  `prdPrcCpm` DECIMAL(13,4) NOT NULL,
  `prdImgUri` VARCHAR(255) NULL,
  `prdEst` CHAR(3) NULL,
  `prdBio` MEDIUMTEXT NULL,
  PRIMARY KEY (`prdcod`),
  UNIQUE INDEX `prdcodbrr_UNIQUE` (`prdcodbrr` ASC),
  UNIQUE INDEX `prdSKU_UNIQUE` (`prdSKU` ASC));
