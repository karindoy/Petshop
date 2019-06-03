use petshop;


-- -----------------------------------------------------
-- 				PROCEDURE `p_inserirDono`
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirDono`(in p_nome varchar(100),in p_telefone1 varchar(15), in p_telefone2 varchar(15), in p_bairro varchar(100), in p_logradouro varchar(100), in p_num varchar(10), in p_complemento varchar(45), out p_iddono int)
BEGIN
insert into dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento) 
values
(p_nome,p_telefone1, p_telefone2, p_bairro, p_logradouro, p_num, p_complemento);

set p_iddono = (select idDono from Dono 
order by iddono 
desc limit 1);
END
$


call p_inserirDono ("nome","tel1","tel2","bairro","log","num","compt", @p_iddono);
select @p_iddono;
-- -----------------------------------------------------
-- 				PROCEDURE `p_inserirPet`
-- -----------------------------------------------------

DELIMITER $
CREATE PROCEDURE `p_inserirPet`(in p_nome varchar(100),in p_animal varchar(100), in p_raca varchar(100), in p_sexo varchar(100), in p_peso decimal(5,2), in p_tamanho int, in p_dono_id int, in p_nasc date)
BEGIN
insert into Pet(nome,animal, raca, sexo, peso, tamanho, dono_id, nascimento) 
values
(p_nome, p_animal, p_raca, p_sexo, p_peso, p_tamanho, p_dono_id, p_nasc);
END
$
-- -----------------------------------------------------
-- 				consultar dono por nome
-- -----------------------------------------------------
SELECT * FROM dono 
WHERE nome LIKE '%karin%' 
order by iddono 
desc limit 10;

-- -----------------------------------------------------
-- 		[Agendamento/ Pet] consultar ultimos pets cadastrados
-- -----------------------------------------------------
call `p_consultapet`
DELIMITER $
CREATE PROCEDURE `p_consultapet`()
begin
SELECT pet.nome as nome_pet , pet.animal, dono.nome as nome_dono
FROM pet
inner join dono
where Dono_id= idDono and dono.nome LIKE '%%'
order by idpet desc;
end
$
-- -----------------------------------------------------
-- 		[Agendamento] inserir agendamento
-- -----------------------------------------------------
call p_inserirAgenda ("2019/06/23", "15:00", 1, 3);

DELIMITER $
CREATE PROCEDURE `p_inserirAgenda`(in p_dia varchar(10),in p_hora varchar(5), in p_pet_id int, in p_servicos_id int)
BEGIN
insert into agendamento(dia,hora,estado, pet_id, servicos_id) 
values
(p_dia, p_hora,"agendado", p_pet_id, p_servicos_id);
END
$

-- -----------------------------------------------------
-- 		[ver Agenda] consultar agendamento
-- -----------------------------------------------------
call p_consultaAgenda ("2019/06/23");

DELIMITER $
CREATE PROCEDURE `p_consultaAgenda`(in p_dia varchar(10))
BEGIN
select ag.dia, ag.hora, pet.nome as pet_nome, serv.nome 
from agendamento ag 
inner join pet pet
on ag.pet_id= pet.idPet
inner join servicos serv 
on ag.servicos_id=serv.idservicos 
 where ag.dia = p_dia and estado ="agendado";
END
$

-- -----------------------------------------------------
-- 		[Produto] inserir produto
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirProduto`(in p_nome varchar(45),in p_preco DECIMAL(8,2), in p_categoria VARCHAR(45),in p_quantidade int, in p_descricao VARCHAR(255), in p_validade varchar(10))
BEGIN
insert into produto(nome,preco, categoria,quantidade, descricao, validade) 
values
(p_nome, p_preco, p_categoria,p_quantidade, p_descricao, p_validade);
END
$

select * from produto
-- -----------------------------------------------------
-- 		[Produto] consultar produto
-- -----------------------------------------------------

DELIMITER $
CREATE PROCEDURE `consultaTodosProduto`( in p_categoria VARCHAR(45), in detalhes VARCHAR(20))
BEGIN
	if (p_categoria is null) then
		select nome, preco, quantidade 
		from produto;
	else 
		select nome, preco, quantidade 
		from produto
		where  categoria = p_categoria;
    end if;
END
$


call `consultaTodosProduto` (null, "detalhada");
/*
`consultaTodosProduto` (null, "detalhada"); 
se null mostrar tudo
else
mostrar pela categoria
*/
