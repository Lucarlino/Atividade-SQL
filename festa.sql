drop database if exists festa1;
create database festa1;
use festa1;

CREATE TABLE cliente(
    idCliente int auto_increment primary key,
    NomeCliente varchar(50) not null,
    EmailCliente varchar(30) not null
);
INSERT INTO Cliente (NomeCliente, EmailCliente)
VALUES ('Lucas', 'Lucas@gmail.com'),('Carlos', 'Carlos@gmail.com');

select * from Cliente;

select * from Cliente where idCliente = 1;

update Cliente set NomeCliente = "Nilson", 
				   EmailCliente="Nilson@gmail.com" 	
				   where idCliente = 1;
                   
delete from Cliente where idCliente = 1;


create table Endereco(
    idEnd int auto_increment primary key,
    Logradouro varchar (30) not null,
    CEP varchar (15) not null,
    Bairro varchar (30)
);

Insert into Endereco (Logradouro, Bairro, CEP)
values("Rua 15", "Centro", "058751-120");

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
			values(2, 1,'APTO 45, Bloco B');
select * from residencia;

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

create table Tema (
	idTema int primary key auto_increment,
    NomeTema varchar (50) not null
);

create table Itens_Tema(
	idItem int primary key auto_increment,
    idTema int not null,
    NomeItem varchar(30) not null,
    foreign key (idTema) references Tema (idTema)
);

create table Festa(
	idFesta int primary key auto_increment,
    idCliente int not null,
    idTema int not null, 
    idEnd int not null, 
    dtFesta date not null,
    valorFesta decimal(10,2) not null
);