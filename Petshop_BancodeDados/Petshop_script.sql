SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
set global time_zone ='+4:00';

-- -----------------------------------------------------
-- Schema petshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema petshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petshop` DEFAULT CHARACTER SET utf8 ;
USE `petshop` ;

-- -----------------------------------------------------
-- Table `petshop`.`Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Pet` (
  `idPet` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `animal` VARCHAR(50) NOT NULL,
  `raca` VARCHAR(50) NULL,
  `sexo` VARCHAR(100) NULL,
  `peso` DECIMAL(5,2) NOT NULL,
  `tamanho` Decimal(4,2) NOT NULL,
  `Dono_id` INT NOT NULL,
  `nascimento` date NULL,
  
  PRIMARY KEY (`idPet`),
  CONSTRAINT `fk_pet_dono_Dono`
    FOREIGN KEY (`Dono_id`)
    REFERENCES `petshop`.`Dono` (`idDono`),
  UNIQUE INDEX `idPet_UNIQUE` (`idPet` ASC) VISIBLE)
  
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Dono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Dono` (
  `idDono` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone1` VARCHAR(15) NOT NULL,
  `telefone2` VARCHAR(15) NULL,
  `bairro` VARCHAR(100) NULL,
  `logradouro` VARCHAR(100) NULL,
  `num` VARCHAR(10) NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`idDono`),
  UNIQUE INDEX `idDono_UNIQUE` (`idDono` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`usuarios` (
  `login` VARCHAR(16) NOT NULL,
  `email` VARCHAR(150) NULL,
  `senha` VARCHAR(32) NOT NULL,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC));


-- -----------------------------------------------------
-- Table `petshop`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Servicos` (
  `idServicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`idServicos`),
  UNIQUE INDEX `idServicos_UNIQUE` (`idServicos` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NULL,
  `hora` VARCHAR(5) NULL,
  `Pet_id` INT NOT NULL,
  `Servicos_id` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`, `Pet_id`),
  UNIQUE INDEX `idAgendamento_UNIQUE` (`idAgendamento` ASC) VISIBLE,
  INDEX `fk_Agendamento_Pet1_idx` (`Pet_id` ASC) VISIBLE,
  INDEX `fk_Agendamento_Servicos1_idx` (`Servicos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamento_Pet1`
    FOREIGN KEY (`Pet_id`)
    REFERENCES `petshop`.`Pet` (`idPet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_Servicos1`
    FOREIGN KEY (`Servicos_id`)
    REFERENCES `petshop`.`Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `categoria` VARCHAR(45) NULL,
  `descricao` VARCHAR(255) NULL,
  `validade` Date NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `Produto_id` INT NOT NULL,
  PRIMARY KEY (`idEstoque`, `Produto_id`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idEstoque` ASC) VISIBLE,
  INDEX `fk_Estoque_Produto1_idx` (`Produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_Produto1`
    FOREIGN KEY (`Produto_id`)
    REFERENCES `petshop`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL,
  `valortotal` DECIMAL(9,2) NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Estoque_Produto_id` INT NOT NULL,
  `ValorRecebido` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`idVenda`, `Estoque_idEstoque`, `Estoque_Produto_id`),
  UNIQUE INDEX `idVenda_UNIQUE` (`idVenda` ASC) VISIBLE,
  INDEX `fk_Venda_Estoque1_idx` (`Estoque_idEstoque` ASC, `Estoque_Produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque` , `Estoque_Produto_id`)
    REFERENCES `petshop`.`Estoque` (`idEstoque` , `Produto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`fatura` (
  `idfatura` INT NOT NULL AUTO_INCREMENT,
  `Valortotal` DECIMAL(7,2) NOT NULL,
  `Data` DATETIME NULL,
  `Agendamento_idAgendamento` INT NOT NULL,
  `Agendamento_Pet_id` INT NOT NULL,
  `ValorRecebido` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`idfatura`, `Agendamento_idAgendamento`, `Agendamento_Pet_id`),
  UNIQUE INDEX `idfatura_UNIQUE` (`idfatura` ASC) VISIBLE,
  INDEX `fk_fatura_Agendamento1_idx` (`Agendamento_idAgendamento` ASC, `Agendamento_Pet_id` ASC) VISIBLE,
  CONSTRAINT `fk_fatura_Agendamento1`
    FOREIGN KEY (`Agendamento_idAgendamento` , `Agendamento_Pet_id`)
    REFERENCES `petshop`.`Agendamento` (`idAgendamento` , `Pet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
