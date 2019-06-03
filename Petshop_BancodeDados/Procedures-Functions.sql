use petshop;


-- -----------------------------------------------------
-- 				PROCEDURE `p_inserirDono`
-- Inseri em dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento)  e retorna o id do dono para CADASTRO de PET
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

-- TESTE chamada da procedure inserir dono
call p_inserirDono ("nome","tel1","tel2","bairro","log","num","compt", @p_iddono);
select @p_iddono;

-- -----------------------------------------------------
-- 				consultar dono por nome 
-- consulta de dono por nome, ordena pelos 10 ultimos cadastrados
-- -----------------------------------------------------
SELECT * FROM dono 
WHERE nome LIKE '%karin%' 
order by iddono 
desc limit 10;

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
	case
	when (p_categoria is null and detalhes = "simples")
	then select nome, preco, quantidade 
		 from produto;
	when (p_categoria is not null and detalhes = "simples")
	then select nome, preco, quantidade 
		 from produto
		 where  categoria = p_categoria;
	when (p_categoria is null and detalhes = "detalhada")
	then select * from produto;
         
	when (p_categoria is not null and detalhes = "detalhada")
	then select * from produto
		 where  categoria = p_categoria;
    end case;
END
$


call `consultaTodosProduto` ("alimento", "detalhada");
/*
`consultaTodosProduto` (null, "simples"); 
se null mostrar tudo
else
mostrar pela categoria
*/

select  * from venda

DELIMITER $
CREATE FUNCTION `calculaValorTotal` (p_quantidade int, p_Produto_id int)
RETURNS decimal (9,2)
BEGIN
DECLARE precop decimal (9,2);
DECLARE valortotal decimal (9,2);

set precop =(select preco from produto 
where p_Produto_id= idProduto);

set valortotal= (precop*p_quantidade);

RETURN valortotal;
END
$

DELIMITER $
CREATE PROCEDURE `p_inserirVenda`(in p_idVenda int,in p_dia varchar(10),in p_quantidade int, in p_produto_id int)
BEGIN
	declare valortotal decimal (9,2);
set valortotal=  (select calculaValorTotal (p_quantidade , p_Produto_id));
insert into venda(idvenda,dia, valortotal,quantidade, produto_id) 
values
(p_idVenda, p_dia, p_valortotal,p_quantidade, p_produto_id);
END
$

DELIMITER $
CREATE FUNCTION `F_idVenda` ()
RETURNS int
BEGIN
DECLARE idvenda int;

set idvenda =(select idvenda from venda 
order by idvenda 
desc limit 1);
set idvenda= idvenda+1;

set valortotal= (precop*p_quantidade);

RETURN idvenda;
END
$

DELIMITER $
CREATE PROCEDURE `p_inserirFatura`(in p_idservicos int, in p_Agendamento_id int)
BEGIN
	declare valortotal decimal (9,2);
set valortotal=  (select preco from servicos where idServicos=p_idservicos);
insert into fatura(valortotal, Agendamento_id) 
values
(p_valortotal,p_quantidade, p_Agendamento_id);
END
$

