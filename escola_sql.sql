-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 ;
USE `escola` ;

-- -----------------------------------------------------
-- Table `escola`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Departamento` (
  `cod_Departamento` INT(4) NOT NULL AUTO_INCREMENT,
  `nome_departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_Departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Professor` (
  `id_Professor` INT(4) NOT NULL,
  `nome_professor` VARCHAR(45) NOT NULL,
  `sobrenome_professor` VARCHAR(50) NOT NULL,
  `status` TINYINT NOT NULL,
  `cod_Departamento` INT(4) NOT NULL,
  PRIMARY KEY (`id_Professor`),
  CONSTRAINT `fk_Professor_Departamento`
    FOREIGN KEY (`cod_Departamento`)
    REFERENCES `escola`.`Departamento` (`cod_Departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Disciplina` (
  `id_disciplina` INT(4) NOT NULL,
  `nome_Disciplina` VARCHAR(20) NOT NULL,
  `cod_Departamento` INT(4) NOT NULL,
  `carga_horaria` INT(4) NOT NULL,
  `Descricao` VARCHAR(50) NOT NULL,
  `Num_alunos` INT(4) NOT NULL,
  PRIMARY KEY (`id_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`prof_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`prof_Disciplina` (
  `id_Professor` INT(4) NOT NULL,
  `id_Disciplinas` INT(4) NOT NULL,
  CONSTRAINT `fk_prof_Disciplina_Professor1`
    FOREIGN KEY (`id_Professor`)
    REFERENCES `escola`.`Professor` (`id_Professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prof_Disciplina_Disciplina1`
    FOREIGN KEY (`id_Disciplinas`)
    REFERENCES `escola`.`Disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`curso` (
  `id_curso` INT(4) NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(40) NOT NULL,
  `cod_Departamento` INT(4) NOT NULL,
  PRIMARY KEY (`id_curso`),
  CONSTRAINT `fk_curso_Departamento1`
    FOREIGN KEY (`cod_Departamento`)
    REFERENCES `escola`.`Departamento` (`cod_Departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`curso_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`curso_Disciplina` (
  `id_curso` INT(4) NOT NULL,
  `id_disciplina` INT(4) NOT NULL,
  CONSTRAINT `fk_curso_Disciplina_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `escola`.`curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_Disciplina_Disciplina1`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `escola`.`Disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`turma` (
  `id_turma` INT(4) NOT NULL AUTO_INCREMENT,
  `id_curso` INT(4) NOT NULL,
  `Período` VARCHAR(8) NOT NULL,
  `num_Alunos` INT(4) NOT NULL,
  `Data_inicio` DATE NOT NULL,
  `Data_fim` DATE NOT NULL,
  PRIMARY KEY (`id_turma`),
  CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `escola`.`curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Aluno` (
  `RA` INT(4) NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NOT NULL,
  `sobre_aluno` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `status` TINYINT NOT NULL,
  `id_turma` INT(4) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `id_curso` INT(4) NOT NULL,
  `nome_pai` VARCHAR(50) NOT NULL,
  `nome_mae` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `whatsapp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RA`),
  CONSTRAINT `fk_Aluno_turma1`
    FOREIGN KEY (`id_turma`)
    REFERENCES `escola`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `escola`.`curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`historico` (
  `id_historico` INT(4) NOT NULL AUTO_INCREMENT,
  `RA` INT(4) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_final` DATE NOT NULL,
  PRIMARY KEY (`id_historico`),
  CONSTRAINT `fk_historico_Aluno1`
    FOREIGN KEY (`RA`)
    REFERENCES `escola`.`Aluno` (`RA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`disc_hist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`disc_hist` (
  `id_historico` INT(4) NOT NULL,
  `id_disciplina` INT(4) NOT NULL,
  `nota` INT(4) NOT NULL,
  `frequencia` INT(4) NOT NULL,
  CONSTRAINT `fk_disc_hist_historico1`
    FOREIGN KEY (`id_historico`)
    REFERENCES `escola`.`historico` (`id_historico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disc_hist_Disciplina1`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `escola`.`Disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`depende`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`depende` (
  `id_disciplina` INT(4) NOT NULL,
  `possui_cod_disciplina` INT(4) NOT NULL,
  CONSTRAINT `fk_depende_Disciplina1`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `escola`.`Disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`aluno_disc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`aluno_disc` (
  `RA` INT(4) NOT NULL,
  `id_disciplina` INT(4) NOT NULL,
  CONSTRAINT `fk_aluno_disc_Aluno1`
    FOREIGN KEY (`RA`)
    REFERENCES `escola`.`Aluno` (`RA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_disc_Disciplina1`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `escola`.`Disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`tipo_telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`tipo_telefone` (
  `id_tipo_telefone` INT(4) NOT NULL AUTO_INCREMENT,
  `tipo_telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tipo_telefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`telefone_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`telefone_aluno` (
  `id_telefone_aluno` INT(4) NOT NULL AUTO_INCREMENT,
  `RA` INT(4) NOT NULL,
  `id_tipo_telefone` INT(4) NOT NULL,
  `Num_telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_telefone_aluno`),
  CONSTRAINT `fk_telefone_aluno_Aluno1`
    FOREIGN KEY (`RA`)
    REFERENCES `escola`.`Aluno` (`RA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_aluno_tipo_telefone1`
    FOREIGN KEY (`id_tipo_telefone`)
    REFERENCES `escola`.`tipo_telefone` (`id_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`tipo_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`tipo_endereco` (
  `id_tipo_endereco` INT(4) NOT NULL AUTO_INCREMENT,
  `tipo_endereco` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id_tipo_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`endereco_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`endereco_aluno` (
  `id_endereco_aluno` INT(4) NOT NULL AUTO_INCREMENT,
  `RA` INT(4) NOT NULL,
  `id_tipo_endereco` INT(4) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT(4) NOT NULL,
  `complemento` VARCHAR(100) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_endereco_aluno`),
  CONSTRAINT `fk_endereco_aluno_Aluno1`
    FOREIGN KEY (`RA`)
    REFERENCES `escola`.`Aluno` (`RA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_aluno_tipo_endereco1`
    FOREIGN KEY (`id_tipo_endereco`)
    REFERENCES `escola`.`tipo_endereco` (`id_tipo_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


