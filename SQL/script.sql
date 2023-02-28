-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistema_resilia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_resilia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_resilia` DEFAULT CHARACTER SET utf8 ;
USE `sistema_resilia` ;

-- -----------------------------------------------------
-- Table `sistema_resilia`.`Unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Unidades` (
  `idUnidades` INT NOT NULL,
  `turma` VARCHAR(45) NULL,
  `curso` VARCHAR(45) NULL,
  PRIMARY KEY (`idUnidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  `turmas` VARCHAR(45) NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = CSV;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Turmas` (
  `idTurmas` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NULL,
  `alunos` VARCHAR(45) NULL,
  `facilitador` VARCHAR(45) NULL,
  PRIMARY KEY (`idTurmas`),
  CONSTRAINT `fk_Turmas_Cursos1`
    FOREIGN KEY (`idTurmas`)
    REFERENCES `sistema_resilia`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turmas_Unidades1`
    FOREIGN KEY (`idTurmas`)
    REFERENCES `sistema_resilia`.`Unidades` (`idUnidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NULL,
  `curso_matriculado` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Alunos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NULL,
  `cpf` INT(11) NULL,
  `endereco` VARCHAR(45) NULL,
  `curso` VARCHAR(45) NULL,
  `Matricula_idMatricula` INT NOT NULL,
  PRIMARY KEY (`id`, `Matricula_idMatricula`),
  INDEX `fk_Alunos_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Turmas1`
    FOREIGN KEY (`id`)
    REFERENCES `sistema_resilia`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alunos_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `sistema_resilia`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Facilitadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Facilitadores` (
  `idFacilitadores` INT NOT NULL AUTO_INCREMENT,
  `nome_facilitador` VARCHAR(45) NULL,
  `curso` VARCHAR(45) NULL,
  PRIMARY KEY (`idFacilitadores`),
  CONSTRAINT `fk_Facilitadores_Turmas1`
    FOREIGN KEY (`idFacilitadores`)
    REFERENCES `sistema_resilia`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facilitadores_Cursos1`
    FOREIGN KEY (`idFacilitadores`)
    REFERENCES `sistema_resilia`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_resilia`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_resilia`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`),
  CONSTRAINT `fk_Endereco_Matricula1`
    FOREIGN KEY (`idEndereco`)
    REFERENCES `sistema_resilia`.`Matricula` (`endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
