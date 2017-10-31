CREATE TABLE `nw201703`.`edificios` (
  `edfcod` CHAR(7) NOT NULL,
  `edfdsc` VARCHAR(45) NULL,
  `edfubc` VARCHAR(65) NULL,
  `edfest` CHAR(3) NULL,
  `edfobs` VARCHAR(500) NULL,
  PRIMARY KEY (`edfcod`),
  INDEX `EDFIND1` (`edfcod` ASC, `edfdsc` ASC));
