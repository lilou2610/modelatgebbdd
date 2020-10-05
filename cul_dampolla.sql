
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ulleres` (
  `idUlleres` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `grad_ull_dret` INT NOT NULL,
  `grad_ull_esquerra` INT NOT NULL,
  `montura_flotant` VARCHAR(45) NULL,
  `montura_pasta` VARCHAR(45) NULL,
  `montura_metalica` VARCHAR(45) NULL,
  `color_vidre` VARCHAR(45) NULL,
  `preu` INT NOT NULL,
  PRIMARY KEY (`idUlleres`),
  UNIQUE INDEX `idUlleres_UNIQUE` (`idUlleres` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveidor` (
  `idProveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `carrer` VARCHAR(115) NOT NULL,
  `número` INT NOT NULL,
  `pis` INT NULL,
  `porta` VARCHAR(45) NULL,
  `ciutat` VARCHAR(65) NOT NULL,
  `codi_postal` INT NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  `telèfon` INT NOT NULL,
  `fax` INT NULL,
  `NIF` INT NOT NULL,
  `idUlleres` INT NOT NULL,
  PRIMARY KEY (`idProveidor`),
  INDEX `fk_Proveidor_Ulleres_idx` (`idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidor_Ulleres`
    FOREIGN KEY (`idUlleres`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(150) NOT NULL,
  `adreça` VARCHAR(150) NULL,
  `telefon` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `data_registre` INT NOT NULL,
  `recomenat` VARCHAR(45) NULL,
  `idUlleres` INT NOT NULL,
  PRIMARY KEY (`idClient`, `idUlleres`),
  UNIQUE INDEX `idClient_UNIQUE` (`idClient` ASC) VISIBLE,
  INDEX `fk_Client_Ulleres1_idx` (`idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Ulleres1`
    FOREIGN KEY (`idUlleres`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `idEmpleat` INT NOT NULL AUTO_INCREMENT,
  `Ulleres_idUlleres` INT NOT NULL,
  PRIMARY KEY (`idEmpleat`),
  UNIQUE INDEX `idEmpleat_UNIQUE` (`idEmpleat` ASC) VISIBLE,
  INDEX `fk_Empleat_Ulleres1_idx` (`Ulleres_idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Empleat_Ulleres1`
    FOREIGN KEY (`Ulleres_idUlleres`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

