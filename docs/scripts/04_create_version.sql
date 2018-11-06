CREATE TABLE `demoalgorith`.`version` (
  `version` DECIMAL(5,2) UNSIGNED NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(128) NOT NULL,
  `proyectos` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`version`));
