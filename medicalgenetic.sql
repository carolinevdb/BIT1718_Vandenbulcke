-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL,
  `Gene_start` INT(10) NOT NULL,
  `Gene_end` INT(10) NOT NULL,
  `chromosome` VARCHAR(10) NOT NULL,
  `Gene_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patient_name` VARCHAR(45) NOT NULL,
  `Patient_gender` ENUM('V', 'M') NOT NULL,
  `Patient_age_diagnose` DECIMAL NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `idSyndrome` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NOT NULL,
  `Syndrome_descr` TEXT NOT NULL,
  `Gene_idGene` INT NOT NULL,
  PRIMARY KEY (`idSyndrome`),
  INDEX `fk_Syndrome_Gene1_idx` (`Gene_idGene` ASC),
  CONSTRAINT `fk_Syndrome_Gene1`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene_has_Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene_has_Patient` (
  `Gene_idGene` INT NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`Gene_idGene`, `Patient_idPatient`),
  INDEX `fk_Gene_has_Patient_Patient1_idx` (`Patient_idPatient` ASC),
  INDEX `fk_Gene_has_Patient_Gene_idx` (`Gene_idGene` ASC),
  CONSTRAINT `fk_Gene_has_Patient_Gene`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gene_has_Patient_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
