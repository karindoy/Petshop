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

insert into servicos(nome,preco) 
values
("banho", "30.50"),
("tosa", "20.50"),
("unhas", "10"),
("Banho e unhas", "35.50"),
("Banho e tosa", "40.50"),
("completo", "45");


-- -----------------------------------------------------
-- Table `petshop`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NULL,
  `hora` VARCHAR(5) NULL,
  `estado` VARCHAR(20) NULL,
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
  `quantidade` INT NULL,
  `descricao` VARCHAR(255) NULL,
  `validade` Date NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop`.`Venda`
-- -----------------------------------------------------
CREATE TABLE `petshop`.`venda` (
  `idvenda` INT NOT NULL,
  `dia` DATE NULL,
  `valortotal` decimal(9,2) NULL,
  `quantidade` int NULL,
  `Produto_id` INT NOT NULL,
  PRIMARY KEY (`idvenda`),
  INDEX `Produto_id_idx` (`Produto_id` ASC) VISIBLE,
  CONSTRAINT `Produto_id`
    FOREIGN KEY (`Produto_id`)
    REFERENCES `petshop`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `petshop`.`fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop`.`fatura` (
  `idfatura` INT NOT NULL AUTO_INCREMENT,
  `Valortotal` DECIMAL(7,2) NOT NULL,
  `Agendamento_id` INT NOT NULL,
  `ValorRecebido` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`idfatura`, `Agendamento_id`),
  UNIQUE INDEX `idfatura_UNIQUE` (`idfatura` ASC) VISIBLE,
  INDEX `fk_fatura_Agendamento1_idx` (`Agendamento_id` ASC) VISIBLE,
  CONSTRAINT `fk_fatura_Agendamento1`
    FOREIGN KEY (`Agendamento_idAgendamento`)
    REFERENCES `petshop`.`Agendamento` (`idAgendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
