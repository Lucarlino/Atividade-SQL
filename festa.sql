drop database if exists festa1;
create database festa1;
use festa1;

CREATE TABLE cliente(
    idCliente int auto_increment primary key,
    NomeCliente varchar(50) not null,
    EmailCliente varchar(30) not null
);
INSERT INTO Cliente (NomeCliente, EmailCliente)
VALUES ('Lucas', 'Lucas@gmail.com'),('Carlos', 'Carlos@gmail.com') ,
('Bia', 'Bia@gmail.com'), ('Augusto', 'Augusto@gamil.com'),
('Eric', 'Eric@gmail.com'), ('Guilherme', 'Guilherme@gmail.com');

select * from Cliente;

select * from Cliente where idCliente = 1;

update Cliente set NomeCliente = "Nilson", 
				   EmailCliente="Nilson@gmail.com" 	
				   where idCliente = 1;
                   



create table Endereco(
    idEnd int auto_increment primary key,
    Logradouro varchar (30) not null,
    CEP varchar (15) not null,
    Bairro varchar (30)
);

Insert into Endereco (Logradouro, Bairro, CEP)
values("Rua 78", "Morro Bento", "058751-145"),("Rua 50", "São Bento", "058751-120"),
("Rua 15", "Anhanguera", "058751-220"), ("Rua 05", "Centro", "058751-120");

select * from Endereco;
select Logradouro, Bairro from Endereco where idEnd = 1; 
select * from Endereco where idEnd = 1;

update Endereco set Logradouro ="AV.Brasil",
					Bairro = "Paulista", CEP = "98765-432"
                    where idEnd = 1;

delete from Endereco where idEnd = 2;

create table residencia (
    idRes int auto_increment primary key,
    idCliente int not null,
    idEnd int not null,
    NomeRes varchar(50) not null, 
    foreign key (idCliente) references cliente(idCliente),
    foreign key (idEnd) references Endereco (idEnd)
);

insert into residencia (idCliente, idEnd, NomeRes)
			values(1, 1,'Casa de Barro'),
            (2, 2,'Casa de Vidro'),
            (3, 3,'APTO 85, Torre 1');

select * from residencia;
select * from Endereco;

select
t1.idRes,
t2.NomeCliente,
t3.Logradouro,
t3.Bairro,
t3.CEP,
t1.NomeRes as Complemento, 
t2.EmailCliente
from residencia as t1
inner join Cliente as t2 on t1.idCliente = t2.idCliente
inner join Endereco as t3 on t1.idEnd = t3.idEnd;

select
t1.idRes,
t2.NomeCliente,
t3.Logradouro,
t3.Bairro,
t3.CEP,
t1.NomeRes as Complemento, 
t2.EmailCliente
from residencia as t1
inner join Cliente as t2 on t1.idCliente = t2.idCliente
inner join Endereco as t3 on t1.idEnd = t3.idEnd 
where t2.idCliente = 3;

update residencia set idCliente = 5,
					  idEnd = 3,
                      NomeRes = 'Casa III' where idRes = 1;
                      
select * from residencia;
                      
create table Tema (
	idTema int primary key auto_increment,
    NomeTema varchar (50) not null
);

insert into Tema(NomeTema)
			values ('Naruto'), ('Dragon Ball'), ('Homem Aranha'),
				   ('Batman'), ('One Piece'); 
                   
select * from Tema;

select * from Tema where idTema = 1;

update Tema set NomeTema = 'Boruto' where idTema = 2;

delete from Tema where idTema = 2;
                   
create table Itens_Tema(
	idItem int primary key auto_increment,
    idTema int not null,
    NomeItem varchar(30) not null,
    foreign key (idTema) references Tema (idTema)
);

insert into Itens_Tema(idTema, NomeItem)
				values(1,'Sharingan'), (1,'Byakugan'), 
                (1,'Kunai'), (1,'Rinnegan'), (1,'Jiraya'),
                (3,'Teia'), (3,'Mary Jane'), (3,'Duende Verde'),(3,'Venom'),
                (4,'Robin'), (4,'BatCaverna'), (4,'Batman'), (4,'Coringa');
                
select * from Itens_Tema;

select * from Itens_Tema as t1
inner join Tema as t2 on t1.idTema = t2.idTema;

select
t1.idItem, t2.NomeTema, t1.NomeItem 
from Itens_Tema as t1
inner join Tema as t2 on t1.idTema = t2.idTema;

/*Fazer sozinho*/
-- UPDATE
-- DELETE
create table Festa(
	idFesta int primary key auto_increment,
    idCliente int not null,
    idTema int not null, 
    idEnd int not null, 
    dtFesta date not null,
    valorFesta decimal(10,2) not null
);

-- INSERT
-- SELECT com INNER JOIN
-- UPDATE
-- DELETE