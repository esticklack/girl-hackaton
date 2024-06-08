-- MySQL Script generated by MySQL Workbench
-- Sat Jun  8 04:09:54 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`tipo_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipo_vehiculo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipo_vehiculo` (
  `tipo_vehiculo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`tipo_vehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estacionamiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estacionamiento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estacionamiento` (
  `idestacionamiento` VARCHAR(20) NOT NULL,
  `sede` ENUM('puerto montt', 'osorno', 'calbuco') NULL,
  `estado` ENUM('ocupado', 'disponible', 'bloqueado') NULL,
  `lugar` VARCHAR(45) NULL,
  `tipo_vehiculo_tipo_vehiculo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idestacionamiento`, `tipo_vehiculo_tipo_vehiculo`),
  INDEX `fk_estacionamiento_tipo_vehiculo1_idx` (`tipo_vehiculo_tipo_vehiculo` ASC) VISIBLE,
  CONSTRAINT `fk_estacionamiento_tipo_vehiculo1`
    FOREIGN KEY (`tipo_vehiculo_tipo_vehiculo`)
    REFERENCES `mydb`.`tipo_vehiculo` (`tipo_vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `correo` VARCHAR(30) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`correo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medio_de_transporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`medio_de_transporte` ;

CREATE TABLE IF NOT EXISTS `mydb`.`medio_de_transporte` (
  `id` VARCHAR(20) NOT NULL,
  `tipo_vehiculo_tipo_vehiculo` VARCHAR(30) NOT NULL,
  `estacionamiento_idestacionamiento` VARCHAR(20) NOT NULL,
  `usuario_correo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`, `tipo_vehiculo_tipo_vehiculo`, `estacionamiento_idestacionamiento`, `usuario_correo`),
  INDEX `fk_medio_de_transporte_tipo_vehiculo_idx` (`tipo_vehiculo_tipo_vehiculo` ASC) VISIBLE,
  INDEX `fk_medio_de_transporte_estacionamiento1_idx` (`estacionamiento_idestacionamiento` ASC) VISIBLE,
  INDEX `fk_medio_de_transporte_usuario1_idx` (`usuario_correo` ASC) VISIBLE,
  CONSTRAINT `fk_medio_de_transporte_tipo_vehiculo`
    FOREIGN KEY (`tipo_vehiculo_tipo_vehiculo`)
    REFERENCES `mydb`.`tipo_vehiculo` (`tipo_vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medio_de_transporte_estacionamiento1`
    FOREIGN KEY (`estacionamiento_idestacionamiento`)
    REFERENCES `mydb`.`estacionamiento` (`idestacionamiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medio_de_transporte_usuario1`
    FOREIGN KEY (`usuario_correo`)
    REFERENCES `mydb`.`usuario` (`correo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
