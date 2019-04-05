-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Cedula
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cedula
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cedula` DEFAULT CHARACTER SET utf8 ;
USE `Cedula` ;

-- -----------------------------------------------------
-- Table `Cedula`.`Arbitros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Arbitros` (
  `idArbitros` INT NOT NULL DEFAULT 1,
  `Arbitro` VARCHAR(45) NULL,
  `Asist1` VARCHAR(45) NULL,
  `Asist2` VARCHAR(45) NULL,
  PRIMARY KEY (`idArbitros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Campo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Campo` (
  `idCampo` INT NOT NULL,
  `Name-camp` VARCHAR(45) NULL,
  PRIMARY KEY (`idCampo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Date` (
  `idFecha` INT NOT NULL,
  `Dia` VARCHAR(45) NULL,
  `Fecha` VARCHAR(45) NULL,
  `Mes` VARCHAR(45) NULL,
  `Año` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Arbitros_idArbitros` INT NOT NULL,
  `Partido_idPartido` INT NOT NULL,
  `Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Partido_Arbitros_idArbitros` INT NOT NULL,
  `Campo_idCampo` INT NOT NULL,
  PRIMARY KEY (`idFecha`, `Arbitros_idArbitros`, `Partido_idPartido`, `Partido_Equipo Local_idEquipo Local`, `Partido_Arbitros_idArbitros`, `Campo_idCampo`),
  INDEX `fk_Date_Arbitros1_idx` (`Arbitros_idArbitros` ASC),
  INDEX `fk_Date_Campo1_idx` (`Campo_idCampo` ASC),
  CONSTRAINT `fk_Date_Arbitros1`
    FOREIGN KEY (`Arbitros_idArbitros`)
    REFERENCES `Cedula`.`Arbitros` (`idArbitros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Date_Campo1`
    FOREIGN KEY (`Campo_idCampo`)
    REFERENCES `Cedula`.`Campo` (`idCampo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Torneo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Torneo` (
  `idTorneo` INT NOT NULL,
  `Name-torneo` VARCHAR(45) NULL,
  `Date_idFecha` INT NOT NULL,
  `Date_Arbitros_idArbitros` INT NOT NULL,
  PRIMARY KEY (`idTorneo`, `Date_idFecha`, `Date_Arbitros_idArbitros`),
  INDEX `fk_Torneo_Date1_idx` (`Date_idFecha` ASC, `Date_Arbitros_idArbitros` ASC),
  CONSTRAINT `fk_Torneo_Date1`
    FOREIGN KEY (`Date_idFecha` , `Date_Arbitros_idArbitros`)
    REFERENCES `Cedula`.`Date` (`idFecha` , `Arbitros_idArbitros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `Date_idFecha` INT NOT NULL,
  `Date_Arbitros_idArbitros` INT NOT NULL,
  `Date_Partido_idPartido` INT NOT NULL,
  `Date_Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Date_Partido_Arbitros_idArbitros` INT NOT NULL,
  `Date_Campo_idCampo` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`, `Date_idFecha`, `Date_Arbitros_idArbitros`, `Date_Partido_idPartido`, `Date_Partido_Equipo Local_idEquipo Local`, `Date_Partido_Arbitros_idArbitros`, `Date_Campo_idCampo`),
  INDEX `fk_Categoria_Date1_idx` (`Date_idFecha` ASC, `Date_Arbitros_idArbitros` ASC, `Date_Partido_idPartido` ASC, `Date_Partido_Equipo Local_idEquipo Local` ASC, `Date_Partido_Arbitros_idArbitros` ASC, `Date_Campo_idCampo` ASC),
  CONSTRAINT `fk_Categoria_Date1`
    FOREIGN KEY (`Date_idFecha` , `Date_Arbitros_idArbitros` , `Date_Partido_idPartido` , `Date_Partido_Equipo Local_idEquipo Local` , `Date_Partido_Arbitros_idArbitros` , `Date_Campo_idCampo`)
    REFERENCES `Cedula`.`Date` (`idFecha` , `Arbitros_idArbitros` , `Partido_idPartido` , `Partido_Equipo Local_idEquipo Local` , `Partido_Arbitros_idArbitros` , `Campo_idCampo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Equipo Local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Equipo Local` (
  `idEquipo Local` INT NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Date_idFecha` INT NOT NULL,
  `Date_Arbitros_idArbitros` INT NOT NULL,
  `Date_Partido_idPartido` INT NOT NULL,
  `Date_Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Date_Partido_Arbitros_idArbitros` INT NOT NULL,
  `Date_Campo_idCampo` INT NOT NULL,
  `Causal` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipo Local`, `Date_idFecha`, `Date_Arbitros_idArbitros`, `Date_Partido_idPartido`, `Date_Partido_Equipo Local_idEquipo Local`, `Date_Partido_Arbitros_idArbitros`, `Date_Campo_idCampo`),
  INDEX `fk_Equipo Local_Date1_idx` (`Date_idFecha` ASC, `Date_Arbitros_idArbitros` ASC, `Date_Partido_idPartido` ASC, `Date_Partido_Equipo Local_idEquipo Local` ASC, `Date_Partido_Arbitros_idArbitros` ASC, `Date_Campo_idCampo` ASC),
  CONSTRAINT `fk_Equipo Local_Date1`
    FOREIGN KEY (`Date_idFecha` , `Date_Arbitros_idArbitros` , `Date_Partido_idPartido` , `Date_Partido_Equipo Local_idEquipo Local` , `Date_Partido_Arbitros_idArbitros` , `Date_Campo_idCampo`)
    REFERENCES `Cedula`.`Date` (`idFecha` , `Arbitros_idArbitros` , `Partido_idPartido` , `Partido_Equipo Local_idEquipo Local` , `Partido_Arbitros_idArbitros` , `Campo_idCampo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Equipo Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Equipo Visitante` (
  `idEquipo Visitante` INT NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Partido_idPartido` INT NOT NULL,
  `Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Date_idFecha` INT NOT NULL,
  `Date_Arbitros_idArbitros` INT NOT NULL,
  `Date_Partido_idPartido` INT NOT NULL,
  `Date_Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Date_Partido_Arbitros_idArbitros` INT NOT NULL,
  `Date_Campo_idCampo` INT NOT NULL,
  PRIMARY KEY (`idEquipo Visitante`, `Partido_idPartido`, `Partido_Equipo Local_idEquipo Local`, `Date_idFecha`, `Date_Arbitros_idArbitros`, `Date_Partido_idPartido`, `Date_Partido_Equipo Local_idEquipo Local`, `Date_Partido_Arbitros_idArbitros`, `Date_Campo_idCampo`),
  INDEX `fk_Equipo Visitante_Date1_idx` (`Date_idFecha` ASC, `Date_Arbitros_idArbitros` ASC, `Date_Partido_idPartido` ASC, `Date_Partido_Equipo Local_idEquipo Local` ASC, `Date_Partido_Arbitros_idArbitros` ASC, `Date_Campo_idCampo` ASC),
  CONSTRAINT `fk_Equipo Visitante_Date1`
    FOREIGN KEY (`Date_idFecha` , `Date_Arbitros_idArbitros` , `Date_Partido_idPartido` , `Date_Partido_Equipo Local_idEquipo Local` , `Date_Partido_Arbitros_idArbitros` , `Date_Campo_idCampo`)
    REFERENCES `Cedula`.`Date` (`idFecha` , `Arbitros_idArbitros` , `Partido_idPartido` , `Partido_Equipo Local_idEquipo Local` , `Partido_Arbitros_idArbitros` , `Campo_idCampo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Cambios Local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Cambios Local` (
  `idCambios Local` INT NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Equipo Local_idEquipo Local` INT NOT NULL,
  PRIMARY KEY (`idCambios Local`, `Equipo Local_idEquipo Local`),
  INDEX `fk_Cambios Local_Equipo Local1_idx` (`Equipo Local_idEquipo Local` ASC),
  CONSTRAINT `fk_Cambios Local_Equipo Local1`
    FOREIGN KEY (`Equipo Local_idEquipo Local`)
    REFERENCES `Cedula`.`Equipo Local` (`idEquipo Local`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Cambios Visistante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Cambios Visistante` (
  `idCambios Visitante` INT NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Equipo Visitante_idEquipo Visitante` INT NOT NULL,
  PRIMARY KEY (`idCambios Visitante`, `Equipo Visitante_idEquipo Visitante`),
  INDEX `fk_Cambios Visistante_Equipo Visitante1_idx` (`Equipo Visitante_idEquipo Visitante` ASC),
  CONSTRAINT `fk_Cambios Visistante_Equipo Visitante1`
    FOREIGN KEY (`Equipo Visitante_idEquipo Visitante`)
    REFERENCES `Cedula`.`Equipo Visitante` (`idEquipo Visitante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cedula`.`Expulsiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cedula`.`Expulsiones` (
  `idExpulsiones` INT NOT NULL,
  `Date_idFecha` INT NOT NULL,
  `Date_Arbitros_idArbitros` INT NOT NULL,
  `Date_Partido_idPartido` INT NOT NULL,
  `Date_Partido_Equipo Local_idEquipo Local` INT NOT NULL,
  `Date_Partido_Arbitros_idArbitros` INT NOT NULL,
  `Date_Campo_idCampo` INT NOT NULL,
  `#camiseta` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Equipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idExpulsiones`, `Date_idFecha`, `Date_Arbitros_idArbitros`, `Date_Partido_idPartido`, `Date_Partido_Equipo Local_idEquipo Local`, `Date_Partido_Arbitros_idArbitros`, `Date_Campo_idCampo`),
  INDEX `fk_Expulsiones_Date1_idx` (`Date_idFecha` ASC, `Date_Arbitros_idArbitros` ASC, `Date_Partido_idPartido` ASC, `Date_Partido_Equipo Local_idEquipo Local` ASC, `Date_Partido_Arbitros_idArbitros` ASC, `Date_Campo_idCampo` ASC),
  CONSTRAINT `fk_Expulsiones_Date1`
    FOREIGN KEY (`Date_idFecha` , `Date_Arbitros_idArbitros` , `Date_Partido_idPartido` , `Date_Partido_Equipo Local_idEquipo Local` , `Date_Partido_Arbitros_idArbitros` , `Date_Campo_idCampo`)
    REFERENCES `Cedula`.`Date` (`idFecha` , `Arbitros_idArbitros` , `Partido_idPartido` , `Partido_Equipo Local_idEquipo Local` , `Partido_Arbitros_idArbitros` , `Campo_idCampo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
