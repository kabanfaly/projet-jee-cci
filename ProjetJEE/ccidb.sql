SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ccidb` ;
CREATE SCHEMA IF NOT EXISTS `ccidb` DEFAULT CHARACTER SET latin1 ;
USE `ccidb` ;

-- -----------------------------------------------------
-- Table `ccidb`.`personne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`personne` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`personne` (
  `idpersonne` INT(11) NOT NULL AUTO_INCREMENT ,
  `annee_inscription` INT(11) NULL DEFAULT NULL ,
  `date_de_naissance` DATE NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `login` VARCHAR(255) NULL DEFAULT NULL ,
  `membre` VARCHAR(255) NULL DEFAULT NULL ,
  `mot_de_passe` VARCHAR(255) NULL DEFAULT NULL ,
  `nom` VARCHAR(255) NULL DEFAULT NULL ,
  `prenom` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`idpersonne`) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ccidb`.`carriere`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`carriere` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`carriere` (
  `idcarriere` INT(11) NOT NULL AUTO_INCREMENT ,
  `date_debut` DATE NULL DEFAULT NULL ,
  `date_fin` DATE NULL DEFAULT NULL ,
  `employeur` VARCHAR(255) NULL DEFAULT NULL ,
  `fonction` VARCHAR(255) NULL DEFAULT NULL ,
  `idpersonne` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`idcarriere`) ,
  CONSTRAINT `FK_carriere_idpersonne`
    FOREIGN KEY (`idpersonne` )
    REFERENCES `ccidb`.`personne` (`idpersonne` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_carriere_idpersonne` ON `ccidb`.`carriere` (`idpersonne` ASC) ;


-- -----------------------------------------------------
-- Table `ccidb`.`evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`evenement` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`evenement` (
  `idevenement` INT(11) NOT NULL AUTO_INCREMENT ,
  `description` LONGTEXT NULL DEFAULT NULL ,
  `jour` DATETIME NULL DEFAULT NULL ,
  `lieu` VARCHAR(255) NULL DEFAULT NULL ,
  `titre` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`idevenement`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
