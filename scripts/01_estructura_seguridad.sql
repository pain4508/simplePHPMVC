CREATE TABLE `programas` (
  `programacod` varchar(15) NOT NULL,
  `programadsc` varchar(45) DEFAULT NULL,
  `programaest` char(3) DEFAULT NULL,
  `programatyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`programacod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `usuario` (
  `usuariocod` bigint(10) NOT NULL AUTO_INCREMENT,
  `usuarioemail` varchar(80) DEFAULT NULL,
  `usuarionom` varchar(80) DEFAULT NULL,
  `usuariopswd` varchar(128) DEFAULT NULL,
  `usuariofching` datetime DEFAULT NULL,
  `usuariopswdest` char(3) DEFAULT NULL,
  `usuariopswdexp` datetime DEFAULT NULL,
  `usuarioest` char(3) DEFAULT NULL,
  `usuarioactcod` varchar(128) DEFAULT NULL,
  `usuariopswdchg` varchar(128) DEFAULT NULL,
  `usuariotipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usuariocod`),
  UNIQUE KEY `usuarioemail_UNIQUE` (`usuarioemail`),
  KEY `usuariotipo` (`usuariotipo`,`usuarioemail`,`usuariocod`,`usuarioest`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



CREATE TABLE `programa_roles` (
  `rolescod` varchar(15) NOT NULL,
  `programacod` varchar(15) NOT NULL,
  `programarolest` char(3) DEFAULT NULL,
  `programarolexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`programacod`),
  KEY `rol_programa_key_idx` (`programacod`),
  CONSTRAINT `programa_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_programa_key` FOREIGN KEY (`programacod`) REFERENCES `programas` (`programacod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `roles_usuarios` (
  `usuariocod` bigint(10) NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleusuarioest` char(3) DEFAULT NULL,
  `roleusuariofch` datetime DEFAULT NULL,
  `roleusuarioexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usuariocod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usuariocod`) REFERENCES `usuario` (`usuariocod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
