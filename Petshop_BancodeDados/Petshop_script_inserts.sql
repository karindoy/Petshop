USE `petshop` ;

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
("Karin", "(11) 2789-4123",null,"bairro2","rua log 2", "15", "csa2"),
("Andre", "cachorro","husk siberiano","bairro2","rua log 3", "100", "apt 2 blc C"),
("Zezinho", "toupeira","toupeira careca","bairro3","rua log 1", "8", null);

select * from pet;
insert into Pet(nome,animal, raca, sexo, peso, tamanho, dono_id) 
values
("Pituka", "cachorro","SRD","femea","5.48", 0.20,1),
("Fuinha", "gato","SRD","femea","2.65", 0.15,2),
("ghost", "cachorro","husk siberiano","macho","30.5", 1.00,3),
("rufus", "toupeira","toupeira careca","macho","1.2", 0.8,4);


select * from servicos;
insert into servicos(nome,preco) 
values
("banho", "30.50"),
("tosa", "20.50"),
("unhas", "10");

select * from agendamento;
insert into agendamento(dia,hora, pet_id, servicos_id) 
values
("2019/06/22", "16:30", 1, 1),
("2019/05/22", "14:30", 3, 2),
("2019/05/22", "18:00", 2, 1),
("2019/05/22", "16:15", 4, 1);

select * from produto;
insert into produto(nome,preco, categoria, descricao) 
values
("Racao carne golden",15.25, "alimento", "descricao1") ,
("Racao frango golden",16.25, "alimento", "descricao2") ,
("shampoo",10.99, "higiene", null) ,
("vestido rosa cachorro P",30.99, "roupas", "com patinhas pretas");


select *from estoque;
insert into estoque(quantidade, produto_id) 
values
(60, 1) ,
(13, 2) ,
(0, 3) ,
(5, 4) ;
