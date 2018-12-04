CREATE TABLE `snippets` (
  `snpCod` BIGINT(18) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usercod` BIGINT(10) NOT NULL,
  `snpDsc` VARCHAR(255) NULL,
  `snpSts` CHAR(3) NULL DEFAULT 'DRF',
  `snpBdy` MEDIUMTEXT NULL,
  `snpPrc` DECIMAL(18,2) NOT NULL,
  `snpDCr` DATETIME NULL,
  `snpDPb` DATETIME NULL,
  `snpDRt` DATETIME NULL,
  PRIMARY KEY (`snpCod`));

CREATE TABLE `snippet_tags` (
  `snpCod` BIGINT(18) UNSIGNED NOT NULL,
  `snpTag` VARCHAR(45) NOT NULL,
  `snpTCr` DATETIME NULL,
  PRIMARY KEY (`snpCod`, `snpTag`));

CREATE TABLE `snippet_comments` (
  `snpCCod` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `snpCod` bigint(18) unsigned DEFAULT NULL,
  `userCod` bigint(10) DEFAULT NULL,
  `snpCDCr` datetime DEFAULT NULL,
  `snpCEst` char(3) DEFAULT NULL,
  `snpCRm` datetime DEFAULT NULL,
  PRIMARY KEY (`snpCCod`));

ALTER TABLE `snippets`
ADD INDEX `snippets_users_idx` (`usercod` ASC);
;
ALTER TABLE `snippets`
ADD CONSTRAINT `snippets_users`
  FOREIGN KEY (`usercod`)
  REFERENCES `usuario` (`usercod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `snippet_comments`
ADD INDEX `snippets_commet_user_idx` (`userCod` ASC),
ADD INDEX `snipets_commet_snippet_idx` (`snpCod` ASC);
;
ALTER TABLE `snippet_comments`
ADD CONSTRAINT `snippets_commet_user`
  FOREIGN KEY (`userCod`)
  REFERENCES `usuario` (`usercod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `snipets_commet_snippet`
  FOREIGN KEY (`snpCod`)
  REFERENCES `snippets` (`snpCod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  ALTER TABLE `snippet_tags`
ADD CONSTRAINT `snippets_tag_snippets`
  FOREIGN KEY (`snpCod`)
  REFERENCES `snippets` (`snpCod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `snippet_cart` (
  `userCod` BIGINT(10) NOT NULL,
  `snpCod` BIGINT(18) UNSIGNED NOT NULL,
  `snpCPrc` DECIMAL(18,2) NOT NULL,
  `snpCDCr` DATETIME NULL,
  `snpCCmt` VARCHAR(255) NULL,
  PRIMARY KEY (`userCod`, `snpCod`));

ALTER TABLE `snippet_cart`
ADD INDEX `snippet_cart_snippet_idx` (`snpCod` ASC);
;
ALTER TABLE `snippet_cart`
ADD CONSTRAINT `snippet_cart_user`
  FOREIGN KEY (`userCod`)
  REFERENCES `usuario` (`usercod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `snippet_cart_snippet`
  FOREIGN KEY (`snpCod`)
  REFERENCES `snippets` (`snpCod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `snippets_purchased` (
  `userCod` BIGINT(10) NOT NULL,
  `snpCod` BIGINT(18) UNSIGNED NOT NULL,
  `snpPDt` DATETIME NULL,
  `snpPOrd` BIGINT(18) UNSIGNED NOT NULL,
  `snpRate` INT NULL,
  `snpQutoe` VARCHAR(255) NULL,
  PRIMARY KEY (`userCod`, `snpCod`));

ALTER TABLE `snippets_purchased` 
ADD INDEX `snippet_purchased_snippet_idx` (`snpCod` ASC);
;
ALTER TABLE `snippets_purchased` 
ADD CONSTRAINT `snippet_purchased_snippet`
  FOREIGN KEY (`snpCod`)
  REFERENCES`snippets` (`snpCod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `snippet_purchased_user`
  FOREIGN KEY (`userCod`)
  REFERENCES `usuario` (`usercod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `snippet_orders` (
  `snpPOrd` BIGINT(18) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userCod` BIGINT(10) NULL,
  `snpPOrdDt` DATETIME NULL,
  `snpPOrdMth` CHAR(3) NULL,
  `snpPOMnt` DECIMAL(18,3) NULL,
  PRIMARY KEY (`snpPOrd`));

ALTER TABLE `snippet_orders`
ADD INDEX `snippet_purchase_order_user_idx` (`userCod` ASC);
;
ALTER TABLE `snippet_orders`
ADD CONSTRAINT `snippet_purchase_order_user`
  FOREIGN KEY (`userCod`)
  REFERENCES `usuario` (`usercod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `snippets_purchased`
ADD INDEX `snippet_purchased_purchase_order_idx` (`snpPOrd` ASC);
;
ALTER TABLE `snippets_purchased`
ADD CONSTRAINT `snippet_purchased_purchase_order`
  FOREIGN KEY (`snpPOrd`)
  REFERENCES `snippet_orders` (`snpPOrd`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `tmp_snippet_cart` (
  `tmpuserid` VARCHAR(64) NOT NULL,
  `snpCod` BIGINT(18) UNSIGNED NOT NULL,
  `tsnpCDt` DATETIME NULL,
  `tsnpPrc` DECIMAL(18,2) NULL,
  PRIMARY KEY (`tmpuserid`, `snpCod`));

ALTER TABLE `tmp_snippet_cart`
ADD INDEX `unsigned_cart_snippet_idx` (`snpCod` ASC);
;
ALTER TABLE `tmp_snippet_cart`
ADD CONSTRAINT `unsigned_cart_snippet`
  FOREIGN KEY (`snpCod`)
  REFERENCES `snippets` (`snpCod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
