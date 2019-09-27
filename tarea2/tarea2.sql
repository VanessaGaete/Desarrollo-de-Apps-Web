SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tarea2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tarea2` ;

-- -----------------------------------------------------
-- Table `tarea2`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`region` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`comuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`comuna` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`id`, `region_id`),
  INDEX `fk_comuna_region1_idx` (`region_id` ASC),
  CONSTRAINT `fk_comuna_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `tarea2`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`categoria` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `edad` CHAR NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`talla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`talla` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `edad` CHAR NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`disfraz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`disfraz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comuna` INT NOT NULL,
  `nombre_disfraz` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  `categoria` INT NOT NULL,
  `talla` INT NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  `nombre_contacto` VARCHAR(80) NOT NULL,
  `email_contacto` VARCHAR(30) NOT NULL,
  `celular_contacto` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disfraz_comuna1_idx` (`comuna` ASC),
  INDEX `fk_disfraz_categoria1_idx` (`categoria` ASC),
  INDEX `fk_disfraz_talla1_idx` (`talla` ASC),
  CONSTRAINT `fk_disfraz_comuna1`
    FOREIGN KEY (`comuna`)
    REFERENCES `tarea2`.`comuna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disfraz_categoria1`
    FOREIGN KEY (`categoria`)
    REFERENCES `tarea2`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disfraz_talla1`
    FOREIGN KEY (`talla`)
    REFERENCES `tarea2`.`talla` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`foto_disfraz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`foto_disfraz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ruta_archivo` VARCHAR(300) NOT NULL,
  `nombre_archivo` VARCHAR(300) NULL,
  `disfraz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foto_disfraz_disfraz1_idx` (`disfraz_id` ASC),
  CONSTRAINT `fk_foto_disfraz_disfraz1`
    FOREIGN KEY (`disfraz_id`)
    REFERENCES `tarea2`.`disfraz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea2`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea2`.`pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_disfraz` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  `categoria` INT NOT NULL,
  `talla` INT NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  `nombre_solicitante` VARCHAR(80) NOT NULL,
  `email_solicitante` VARCHAR(30) NOT NULL,
  `celular_solicitante` VARCHAR(15) NULL,
  `comuna_solicitante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disfraz_comuna1_idx` (`comuna_solicitante` ASC),
  INDEX `fk_disfraz_categoria1_idx` (`categoria` ASC),
  INDEX `fk_disfraz_talla1_idx` (`talla` ASC),
  CONSTRAINT `fk_disfraz_comuna10`
    FOREIGN KEY (`comuna_solicitante`)
    REFERENCES `tarea2`.`comuna` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disfraz_categoria10`
    FOREIGN KEY (`categoria`)
    REFERENCES `tarea2`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disfraz_talla10`
    FOREIGN KEY (`talla`)
    REFERENCES `tarea2`.`talla` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `tarea2`.`categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea2`;
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (1, 'infantil niña', 'n');
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (2, 'infantil niño', 'n');
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (3, 'infantil unisex', 'n');
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (4, 'mujer', 'a');
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (5, 'hombre', 'a');
INSERT INTO `tarea2`.`categoria` (`id`, `descripcion`, `edad`) VALUES (6, 'adulto unisex', 'a');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea2`.`talla`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea2`;
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (1, '0 meses', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (2, '3 meses', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (3, '6 meses', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (4, '12 meses', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (5, '2-3 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (6, '4-5 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (7, '6-7 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (8, '8-9 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (9, '10-11 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (10, '12-14 años', 'n');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (11, 'XS', 'a');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (12, 'S', 'a');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (13, 'M', 'a');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (14, 'L', 'a');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (15, 'XL', 'a');
INSERT INTO `tarea2`.`talla` (`id`, `descripcion`, `edad`) VALUES (16, 'XXL', 'a');

COMMIT;

