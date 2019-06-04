USE `petshop` ;
-- -----------------------------------------------------
-- 				deleta dados das tabelas
-- -----------------------------------------------------
delete from agendamento where idagendamento>0;
delete from pet where idpet>0;
delete from dono where iddono>0;
delete from produto where idproduto>0;
-- -----------------------------------------------------
-- 				inseri dados das tabelas
-- -----------------------------------------------------
select * from usuarios;
insert into usuarios(login,email, senha) 
values
("illuna", "illuna@gmail.com","illuna"),
("bilu", "bilu@gmail.com","bilu"),
("dezaum", "dezaum@gmail.com","dezaum");


select * from dono;
insert into dono(nome,telefone1, telefone2, bairro, logradouro, num, complemento) 
values
("Joao", "(11) 98765-4321","(11) 91234-5678","bairro1","rua log 4", "20", null),
("Karin", "(11) 2789-4123","(11) 3333-3333","bairro2","rua log 2", "15", "csa2"),
("Andre", "(11) 1111-1111","(11) 2222-2222","bairro2","rua log 3", "100", "apt 2 blc C"),
("Zezinho", "(11) 1111-1111",null,null,null, null, null);

select * from pet;
insert into Pet(nome,animal, raca, sexo, peso, tamanho, dono_id) 
values
("Pituka", "cachorro","SRD","femea","5.48", 0.20,1),
("Fuinha", "gato","SRD","femea","2.65", 0.15,2),
("ghost", "cachorro","husk siberiano","macho","30.5", 1.00,3),
("rufus", "toupeira","toupeira careca","macho","1.2", 0.8,4),
("rufus2", "toupeira","toupeira careca","macho","1.2", 0.8,1);

select * from servicos;


select * from agendamento;
insert into agendamento(dia,hora,estado, pet_id, servicos_id) 
values
("2019/06/22", "16:30","agendado", 1, 1),
("2019/05/22", "14:30","agendado", 3, 2),
("2019/05/22", "18:00","cancelado", 2, 1),
("2019/05/22", "16:15","agendado", 4, 1);

select * from produto;
insert into produto(nome,preco, categoria,quantidade, descricao, validade) 
values
("Racao carne golden",15.25, "alimento", 60,"descricao1", "2019/05/22") ,
("Racao frango golden",16.25, "alimento",20, "descricao2", "2019/05/22") ,
("shampoo",10.99, "higiene",10, null, null) ,
("vestido rosa cachorro P",30.99, "roupas",2, "com patinhas pretas", null);

select * from venda