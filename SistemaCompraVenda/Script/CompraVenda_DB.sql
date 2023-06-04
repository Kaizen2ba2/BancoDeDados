CREATE SCHEMA IF NOT EXISTS `CompraVenda_DB` DEFAULT CHARACTER SET utf8 ;
USE `CompraVenda_DB` ;

-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`CLIENTE` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `endereco_cep` VARCHAR(10) NOT NULL,
  `endereco_bairro` VARCHAR(255) NOT NULL,
  `endereco_rua` VARCHAR(255) NOT NULL,
  `endereco_numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`FORNECEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`FORNECEDOR` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`PRODUTO` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(300) NOT NULL,
  `quantidade_produtos` INT NOT NULL,
  `FORNECEDOR_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_PRODUTO_FORNECEDOR2_idx` (`FORNECEDOR_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUTO_FORNECEDOR2`
    FOREIGN KEY (`FORNECEDOR_codigo`)
    REFERENCES `CompraVenda_DB`.`FORNECEDOR` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`DEPARTAMENTO` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`FUNCIONARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`FUNCIONARIO` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(12) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_FUNCIONARIO_DEPARTAMENTO_idx` (`DEPARTAMENTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_FUNCIONARIO_DEPARTAMENTO`
    FOREIGN KEY (`DEPARTAMENTO_codigo`)
    REFERENCES `CompraVenda_DB`.`DEPARTAMENTO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`COMPRA` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(12) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `FUNCIONARIO_codigo` INT NOT NULL,
  `CLIENTE_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_COMPRA_FUNCIONARIO1_idx` (`FUNCIONARIO_codigo` ASC) VISIBLE,
  INDEX `fk_COMPRA_CLIENTE1_idx` (`CLIENTE_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_COMPRA_FUNCIONARIO1`
    FOREIGN KEY (`FUNCIONARIO_codigo`)
    REFERENCES `CompraVenda_DB`.`FUNCIONARIO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_CLIENTE1`
    FOREIGN KEY (`CLIENTE_codigo`)
    REFERENCES `CompraVenda_DB`.`CLIENTE` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`PRODUTO` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(300) NOT NULL,
  `quantidade_produtos` INT NOT NULL,
  `FORNECEDOR_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_PRODUTO_FORNECEDOR2_idx` (`FORNECEDOR_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUTO_FORNECEDOR2`
    FOREIGN KEY (`FORNECEDOR_codigo`)
    REFERENCES `CompraVenda_DB`.`FORNECEDOR` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`PRODUTO_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`PRODUTO_COMPRA` (
  `COMPRA_codigo` INT NOT NULL,
  `PRODUTO_codigo` INT NOT NULL,
  INDEX `fk_PRODUTO_COMPRA_COMPRA1_idx` (`COMPRA_codigo` ASC) VISIBLE,
  INDEX `fk_PRODUTO_COMPRA_PRODUTO1_idx` (`PRODUTO_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUTO_COMPRA_COMPRA1`
    FOREIGN KEY (`COMPRA_codigo`)
    REFERENCES `CompraVenda_DB`.`COMPRA` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_COMPRA_PRODUTO1`
    FOREIGN KEY (`PRODUTO_codigo`)
    REFERENCES `CompraVenda_DB`.`PRODUTO` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompraVenda_DB`.`CLIENTE_TELEFONE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CompraVenda_DB`.`CLIENTE_TELEFONE` (
  `codigo_telefone` INT NOT NULL AUTO_INCREMENT,
  `CLIENTE_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo_telefone`),
  INDEX `fk_CLIENTE_TELEFONE_CLIENTE1_idx` (`CLIENTE_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENTE_TELEFONE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_codigo`)
    REFERENCES `CompraVenda_DB`.`CLIENTE` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
