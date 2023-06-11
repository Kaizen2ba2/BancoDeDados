CREATE SCHEMA IF NOT EXISTS `Universidade_DB` DEFAULT CHARACTER SET utf8 ;
USE `Universidade_DB` ;

-- -----------------------------------------------------
-- Table `Universidade_DB`.`ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`ALUNO` (
  `numero_usp` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `ano_ingresso` DATE NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`numero_usp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`TURMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`TURMA` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `numero_alunos` INT NOT NULL,
  `ALUNO_numero_usp` INT NOT NULL,
  PRIMARY KEY (`codigo`, `ALUNO_numero_usp`),
  INDEX `fk_TURMA_ALUNO_idx` (`ALUNO_numero_usp` ASC) VISIBLE,
  CONSTRAINT `fk_TURMA_ALUNO`
    FOREIGN KEY (`ALUNO_numero_usp`)
    REFERENCES `Universidade_DB`.`ALUNO` (`numero_usp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`MATRICULA` (
  `codigo` VARCHAR(255) NOT NULL,
  `ALUNO_numero_usp` INT NOT NULL,
  PRIMARY KEY (`codigo`, `ALUNO_numero_usp`),
  INDEX `fk_MATRICULA_ALUNO1_idx` (`ALUNO_numero_usp` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUNO1`
    FOREIGN KEY (`ALUNO_numero_usp`)
    REFERENCES `Universidade_DB`.`ALUNO` (`numero_usp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`INSTITUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`INSTITUTO` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`DISCIPLINA` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  `oferecimento` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `carga_horaria` INT NOT NULL,
  `INSTITUTO_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `INSTITUTO_codigo`),
  INDEX `fk_DISCIPLINA_INSTITUTO1_idx` (`INSTITUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_DISCIPLINA_INSTITUTO1`
    FOREIGN KEY (`INSTITUTO_codigo`)
    REFERENCES `Universidade_DB`.`INSTITUTO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`PROFESSOR` (
  `numero_usp` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT NULL,
  `INSTITUTO_codigo` INT NOT NULL,
  PRIMARY KEY (`numero_usp`, `INSTITUTO_codigo`),
  INDEX `fk_PROFESSOR_INSTITUTO1_idx` (`INSTITUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_INSTITUTO1`
    FOREIGN KEY (`INSTITUTO_codigo`)
    REFERENCES `Universidade_DB`.`INSTITUTO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`PROFESSOR` (
  `numero_usp` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT NULL,
  `INSTITUTO_codigo` INT NOT NULL,
  PRIMARY KEY (`numero_usp`, `INSTITUTO_codigo`),
  INDEX `fk_PROFESSOR_INSTITUTO1_idx` (`INSTITUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_INSTITUTO1`
    FOREIGN KEY (`INSTITUTO_codigo`)
    REFERENCES `Universidade_DB`.`INSTITUTO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`AULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`AULA` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `horario` DATETIME NOT NULL,
  `duracao` VARCHAR(45) NOT NULL,
  `bloco` VARCHAR(3) NOT NULL,
  `sala` VARCHAR(4) NOT NULL,
  `PROFESSOR_numero_usp` INT NOT NULL,
  `PROFESSOR_INSTITUTO_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `PROFESSOR_numero_usp`, `PROFESSOR_INSTITUTO_codigo`),
  INDEX `fk_AULA_PROFESSOR1_idx` (`PROFESSOR_numero_usp` ASC, `PROFESSOR_INSTITUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_AULA_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_numero_usp` , `PROFESSOR_INSTITUTO_codigo`)
    REFERENCES `Universidade_DB`.`PROFESSOR` (`numero_usp` , `INSTITUTO_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`MATRICULA_has_DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`MATRICULA_has_DISCIPLINA` (
  `MATRICULA_codigo` VARCHAR(255) NOT NULL,
  `MATRICULA_ALUNO_numero_usp` INT NOT NULL,
  `DISCIPLINA_codigo` INT NOT NULL,
  PRIMARY KEY (`MATRICULA_codigo`, `MATRICULA_ALUNO_numero_usp`, `DISCIPLINA_codigo`),
  INDEX `fk_MATRICULA_has_DISCIPLINA_DISCIPLINA1_idx` (`DISCIPLINA_codigo` ASC) VISIBLE,
  INDEX `fk_MATRICULA_has_DISCIPLINA_MATRICULA1_idx` (`MATRICULA_codigo` ASC, `MATRICULA_ALUNO_numero_usp` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_has_DISCIPLINA_MATRICULA1`
    FOREIGN KEY (`MATRICULA_codigo` , `MATRICULA_ALUNO_numero_usp`)
    REFERENCES `Universidade_DB`.`MATRICULA` (`codigo` , `ALUNO_numero_usp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATRICULA_has_DISCIPLINA_DISCIPLINA1`
    FOREIGN KEY (`DISCIPLINA_codigo`)
    REFERENCES `Universidade_DB`.`DISCIPLINA` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade_DB`.`AULA_has_AULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade_DB`.`AULA_has_AULA` (
  `AULA_codigo` INT NOT NULL,
  `AULA_PROFESSOR_numero_usp` INT NOT NULL,
  `AULA_PROFESSOR_INSTITUTO_codigo` INT NOT NULL,
  `AULA_codigo1` INT NOT NULL,
  `AULA_PROFESSOR_numero_usp1` INT NOT NULL,
  `AULA_PROFESSOR_INSTITUTO_codigo1` INT NOT NULL,
  PRIMARY KEY (`AULA_codigo`, `AULA_PROFESSOR_numero_usp`, `AULA_PROFESSOR_INSTITUTO_codigo`, `AULA_codigo1`, `AULA_PROFESSOR_numero_usp1`, `AULA_PROFESSOR_INSTITUTO_codigo1`),
  INDEX `fk_AULA_has_AULA_AULA2_idx` (`AULA_codigo1` ASC, `AULA_PROFESSOR_numero_usp1` ASC, `AULA_PROFESSOR_INSTITUTO_codigo1` ASC) VISIBLE,
  INDEX `fk_AULA_has_AULA_AULA1_idx` (`AULA_codigo` ASC, `AULA_PROFESSOR_numero_usp` ASC, `AULA_PROFESSOR_INSTITUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_AULA_has_AULA_AULA1`
    FOREIGN KEY (`AULA_codigo` , `AULA_PROFESSOR_numero_usp` , `AULA_PROFESSOR_INSTITUTO_codigo`)
    REFERENCES `Universidade_DB`.`AULA` (`codigo` , `PROFESSOR_numero_usp` , `PROFESSOR_INSTITUTO_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AULA_has_AULA_AULA2`
    FOREIGN KEY (`AULA_codigo1` , `AULA_PROFESSOR_numero_usp1` , `AULA_PROFESSOR_INSTITUTO_codigo1`)
    REFERENCES `Universidade_DB`.`AULA` (`codigo` , `PROFESSOR_numero_usp` , `PROFESSOR_INSTITUTO_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)