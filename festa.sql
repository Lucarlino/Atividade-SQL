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

select * from Cliente where idCliente = 2;

create table Endereco(
    idEnd int auto_increment primary key,
    Logradouro varchar (30) not null,
    CEP varchar (15) not null,
    Bairro varchar (30)
);

create table residencia (
    idRes int auto_increment primary key,
    idCliente int not null,
    idEnd int not null,
    NomeRes varchar(50) not null, 
    foreign key (idCliente) references cliente(idCliente),
    foreign key (idEnd) references Endereco (idEnd)
);

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