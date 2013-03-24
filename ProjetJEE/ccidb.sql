SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `ccidb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ccidb` ;

-- -----------------------------------------------------
-- Table `ccidb`.`personne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`personne` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`personne` (
  `idpersonne` INT NOT NULL ,
  `nom` VARCHAR(45) NULL ,
  `prenom` VARCHAR(45) NULL ,
  `annee_inscription` VARCHAR(45) NULL ,
  `membre` VARCHAR(45) NULL ,
  `login` VARCHAR(45) NULL ,
  `mot_de_passe` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `date_de_naissance` DATE NULL ,
  PRIMARY KEY (`idpersonne`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccidb`.`carriere`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`carriere` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`carriere` (
  `idcarriere` INT NOT NULL ,
  `idpersonne` INT NOT NULL ,
  `date_debut` YEAR NULL ,
  `date_fin` YEAR NULL ,
  `employeur` VARCHAR(45) NULL ,
  `fonction` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcarriere`) ,
  CONSTRAINT `fk_carriere_personne`
    FOREIGN KEY (`idpersonne` )
    REFERENCES `ccidb`.`personne` (`idpersonne` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_carriere_personne_idx` ON `ccidb`.`carriere` (`idpersonne` ASC) ;


-- -----------------------------------------------------
-- Table `ccidb`.`evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ccidb`.`evenement` ;

CREATE  TABLE IF NOT EXISTS `ccidb`.`evenement` (
  `idevenement` INT NOT NULL ,
  `date` DATETIME NULL ,
  `titre` VARCHAR(45) NULL ,
  `description` TEXT NULL ,
  `lieu` VARCHAR(45) NULL ,
  PRIMARY KEY (`idevenement`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
