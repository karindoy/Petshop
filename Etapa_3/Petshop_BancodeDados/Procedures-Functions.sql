use petshop;

-- -----------------------------------------------------
-- 				PROCEDURE `p_inserirDono`
-- Inseri em dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento)  e retorna o id do dono para CADASTRO de PET
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirDono`(in p_nome varchar(100),in p_telefone1 varchar(15), in p_telefone2 varchar(15), 
in p_bairro varchar(100), in p_logradouro varchar(100), in p_num varchar(10), in p_complemento varchar(45), out p_iddono int)
BEGIN
insert into dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento) 
values
(p_nome,p_telefone1, p_telefone2, p_bairro, p_logradouro, p_num, p_complemento);

set p_iddono = (select idDono from Dono 
order by iddono 
desc limit 1);
END
$

-- call p_inserirDono ("nome","tel1","tel2","bairro","log","num","compt", @p_iddono);
-- select @p_iddono;

-- -----------------------------------------------------
-- 				consultar dono por nome 
-- consulta de dono por nome, ordena pelos 10 ultimos cadastrados
-- -----------------------------------------------------
SELECT * FROM dono 
WHERE nome LIKE '%karin%' 
order by iddono 
desc limit 10;

-- -----------------------------------------------------
-- 				Deletar dono pelo id 
--  
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_deletarDono`(in p_iddono int)
BEGIN
	delete from dono where iddono = p_iddono;
END
$

-- -----------------------------------------------------
-- 		[Dono] atualizar Dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_atualizaDono`(in p_iddono int, in p_nome varchar(100),in p_telefone1 varchar(15), in p_telefone2 varchar(15), 
in p_bairro varchar(100), in p_logradouro varchar(100), in p_num varchar(10), in p_complemento varchar(45))
BEGIN
update dono
set nome = p_nome,telefone1 = p_telefone1, 
telefone2 = p_telefone2,bairro = p_bairro,
logradouro = p_logradouro, num = p_num,
complemento = p_complemento
where iddono = p_iddono;
END
$

-- call p_deletarDono(1);
-- -----------------------------------------------------
-- 				PROCEDURE `p_inserirPet`
-- 		Inseri em Pet(nome,animal, raca, sexo, peso, tamanho, dono_id, nascimento) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirPet`(in p_nome varchar(100),in p_animal varchar(100), in p_raca varchar(100),
				in p_sexo varchar(100), in p_peso decimal(5,2), in p_tamanho int, in p_dono_id int, in p_nasc varchar(10))
BEGIN
 set  p_nasc = (select converte(p_nasc));
insert into Pet(nome,animal, raca, sexo, peso, tamanho, dono_id, nascimento) 
values
(p_nome, p_animal, p_raca, p_sexo, p_peso, p_tamanho, p_dono_id, p_nasc);
END
$

-- call p_inserirPet("n","asd","asd","asda",1,1,1,"22/11/1952")
-- -----------------------------------------------------
-- 		[Pet] consultar ultimos pets cadastrados
-- -----------------------------------------------------
SELECT pet.nome as nome_pet , pet.animal, dono.nome as nome_dono
FROM pet
inner join dono
where Dono_id= idDono and dono.nome LIKE '%%'
order by idpet desc;

-- -----------------------------------------------------
-- 				Deletar pet pelo id 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_deletarPet`(in p_idpet int)
BEGIN
SET foreign_key_checks = 0;
	delete from pet where idpet = p_idpet;
SET foreign_key_checks = 1;
END
$
-- call p_deletarPet(5)

-- -----------------------------------------------------
-- 		[Pet] atualizar Pet(nome,animal, raca, sexo, peso, tamanho, dono_id, nascimento) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_atualizaPet`(in p_nome varchar(100),in p_animal varchar(100), in p_raca varchar(100),
in p_sexo varchar(100), in p_peso decimal(5,2), in p_tamanho int, in p_dono_id int, in p_nasc varchar(10))
BEGIN
 set  p_nasc = (select converte(p_nasc));
update pet
set nome = p_nome,animal = p_animal, 
raca = p_raca,sexo = p_sexo,
peso = p_peso, tamanho = p_tamanho,
dono_id = p_dono_id, nasc = p_nasc
where iddono = p_iddono;
END
$
-- -----------------------------------------------------
-- 		[Agendamento] inserir agendamento(dia,hora,estado, pet_id, servicos_id) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirAgenda`(in p_dia varchar(10),in p_hora varchar(5), in p_pet_id int, in p_servicos_id int)
BEGIN
 set  p_dia = (select converte(p_dia));
insert into agendamento(dia,hora,estado, pet_id, servicos_id) 
values
(p_dia, p_hora,"agendado", p_pet_id, p_servicos_id);
END
$

-- call p_inserirAgenda ("2019/06/23", "15:00", 1, 3);
-- -----------------------------------------------------
-- 		[ver Agenda] consultar agendamento pelo dia retorna dia, hora nome do pet e o serviço
-- -----------------------------------------------------
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
-- 		[Agenda] atualizar agendamento(dia,hora,estado, pet_id, servicos_id) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_atualizaAgenda`(in p_dia varchar(10),in p_hora varchar(5), in p_pet_id int, in p_servicos_id int)
BEGIN
 set  p_dia = (select converte(p_dia));
update agendamento
set p_dia = dia,hora = p_hora, 
pet_id = p_pet_id,servicos_id = p_servicos_id
where iddono = p_iddono;
END
$

-- call p_consultaAgenda ("2019/06/23");
-- -----------------------------------------------------
-- 		[Produto] inserir produto(nome,preco, categoria,quantidade, descricao, validade) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirProduto`(in p_nome varchar(45),in p_preco DECIMAL(8,2),
 in p_categoria VARCHAR(45),in p_quantidade int, in p_descricao VARCHAR(255), in p_validade varchar(10))
BEGIN
 set  p_validade = (select converte(p_validade));
insert into produto(nome,preco, categoria,quantidade, descricao, validade) 
values
(p_nome, p_preco, p_categoria,p_quantidade, p_descricao, p_validade);
END
$

-- call p_inserirProduto("nomep", 80.20, "alimento", 90, null, "2019/09/09");
-- -----------------------------------------------------
-- 		[Produto] consultar produto
		/* p_categoria = nome da categoria ou null
		se null mostrar tudo
		else
		mostrar pela categoria

		detalhes = simples ou detalhada
		se         simples select nome, preco, quantidade 
		else       mostra tudo
		*/
-- -----------------------------------------------------

DELIMITER $
CREATE PROCEDURE `consultaProdutoCategoria`( in p_categoria VARCHAR(45), in detalhes VARCHAR(20))
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
-- call `consultaProdutoCategoria` ("alimento", "detalhada");
-- call `consultaProdutoCategoria` ("alimento", "simples");
-- call `consultaProdutoCategoria` (null, "detalhada");
-- call `consultaProdutoCategoria` (null, "simples");
-- -----------------------------------------------------
-- 				Deletar produto pelo id 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_deletarProduto`(in p_idproduto int)
BEGIN
	delete from produto where idproduto = p_idproduto;
END
$
-- call `p_deletarProduto` (1);
-- -----------------------------------------------------
-- 		[Produto] atualizar produto(nome,preco, categoria,quantidade, descricao, validade) 
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_atualizaProduto`(in p_idproduto int, in p_nome varchar(45),in p_preco DECIMAL(8,2), in p_categoria VARCHAR(45),
										in p_quantidade int, in p_descricao VARCHAR(255), in p_validade varchar(10))
BEGIN
 set  p_validade = (select converte(p_validade));
update produto
set nome = p_nome,preco = p_preco, 
categoria = p_categoria,quantidade = p_quantidade,
descricao = p_descricao, validade = p_validade
where idproduto = p_idproduto;
END
$

-- call `p_atualizaProduto` (2, "attnome", 30.20, "attcat", 80, "att_desc", null);
-- -----------------------------------------------------
-- 			[Venda] Retorna o proximo id de venda 
-- -----------------------------------------------------

DELIMITER $
CREATE FUNCTION `F_idVenda` ()
RETURNS int
BEGIN
DECLARE pidvenda int;

set pidvenda =(select idvenda from venda 
order by pidvenda 
desc limit 1);
set pidvenda= pidvenda+1;
if(pidvenda is null) then
	set pidvenda = 1;
end if;

RETURN pidvenda;
END
$
-- select F_idvenda()
-- -----------------------------------------------------
-- 			[Venda] Retorna a quantidade * produto
-- -----------------------------------------------------

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

-- select calculaValorTotal(3, 3);
-- -----------------------------------------------------
-- 			[Venda] Inseri na venda(idvenda,dia, valortotal,quantidade, produto_id)  
-- -----------------------------------------------------

DELIMITER $
CREATE PROCEDURE `p_inserirVenda`(in p_idVenda int,in p_dia varchar(10),in p_quantidade int, in p_produto_id int)
BEGIN
	declare valortotal decimal (9,2);
    declare p_nome VARCHAR(45);
    declare p_preco DECIMAL(8,2);
    declare p_categoria VARCHAR(45);
    declare p_descricao VARCHAR(255);
    declare p_validade Date;
    declare novaqtdd int;
    declare qtddatual int;
	set  p_dia = (select converte(p_validade));
 
    set p_nome = (select nome from produto where idproduto = p_produto_id);
    set p_preco = (select preco from produto where idproduto = p_produto_id);
    set p_categoria = (select categoria from produto where idproduto = p_produto_id);
    set p_descricao = (select descricao from produto where idproduto = p_produto_id);
    set p_validade = (select converte(validade) from produto where idproduto = p_produto_id);
    
    set qtddatual =(select quantidade from produto where idproduto = p_produto_id);
    set novaqtdd= qtddatual- p_quantidade;
    call p_atualizaProduto(p_produto_id,p_nome, p_preco, p_categoria,novaqtdd, p_descricao, p_validade);
    
set valortotal=  (select calculaValorTotal (p_quantidade , p_Produto_id));
insert into venda(idvenda,dia, valortotal,quantidade, produto_id) 
values
(p_idVenda, p_dia, valortotal,p_quantidade, p_produto_id);
END
$

-- call `p_inserirVenda`(1, "2019/02/02", 3,3);
-- -----------------------------------------------------
-- 			[Venda] calcula a venda pelo id 
-- -----------------------------------------------------

DELIMITER $
CREATE FUNCTION `F_somaVenda` (p_idvenda int)
RETURNS decimal(9,2)
BEGIN
    declare p_valortotal decimal (9,2);
set p_valortotal =(select sum(valortotal) from venda where idvenda = p_idvenda);

RETURN p_valortotal;
END
$

-- select F_somaVenda(1);
-- -----------------------------------------------------
-- 			[Fatura] Inseri na fatura(valortotal, Agendamento_id)  
-- -----------------------------------------------------
DELIMITER $
CREATE PROCEDURE `p_inserirFatura`(in p_Agendamento_id int, in p_valorrecebido decimal(8,2))
BEGIN
	declare p_valortotal decimal (9,2);
	declare p_idservicos int;
    
    set p_idservicos =(select Servicos_id from agendamento where idAgendamento=p_Agendamento_id);
	set p_valortotal=  (select preco from servicos where idServicos=p_idservicos);
    
	insert into fatura(valortotal, Agendamento_id, ValorRecebido) 
	values
	(p_valortotal, p_Agendamento_id, p_valorrecebido);
END
$

-- call `p_inserirFatura`(2, 80.20);
-- select * from faturap_atualizaProdutop_atualizaProduto

-- -----------------------------------------------------
-- 			Recebe "31/12/2019" retorna "2019/12/31"
-- -----------------------------------------------------
DELIMITER $
CREATE FUNCTION `converte` (dia varchar(10))
RETURNS varchar(10)
BEGIN
	declare diac varchar(10);
	set diac= ( str_to_date(dia, '%d/%m/%Y'));
RETURN diac;
END
$
