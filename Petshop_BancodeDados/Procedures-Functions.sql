use petshop;
DELIMITER $
CREATE PROCEDURE `p_inserirDono`(in p_nome varchar(100),in p_telefone1 varchar(15), in p_telefone2 varchar(15), in p_bairro varchar(100), in p_logradouro varchar(100), in p_num varchar(10), in p_complemento varchar(45))
BEGIN
insert into dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento) 
values
(p_nome,p_telefone1, p_telefone2, p_bairro, p_logradouro, p_num, p_complemento);
END
$


DELIMITER $
CREATE PROCEDURE `p_inserirPet`(in p_nome varchar(100),in p_animal varchar(100), in p_raca varchar(100), in p_sexo varchar(100), in p_peso decimal(5,2), in p_tamanho int, in p_dono_id int, in p_nasc date)
BEGIN
insert into Pet(nome,animal, raca, sexo, peso, tamanho, dono_id, nascimento) 
values
(p_nome, p_animal, p_raca, p_sexo, p_peso, p_tamanho, p_dono_id, p_nasc);
END
$
