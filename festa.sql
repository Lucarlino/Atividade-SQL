create database festa;
use festa;

create table cliente(
    idCliente int auto_increment primary key,
    NomeCliente varchar(50) not null,
    EmailCliente varchar(30) not null,
);

create table endereco(
    idEnd int auto_increment primary key;
    Lograndouro varchar (30) not null,
    CEP varchar (15) not null,
    Bairro varchar (30)
);

create table residencia (
    idRes int auto_increment primary key,
    idCliente int not null,
    idEnd int not null,
    NomeRes varchar(50) not null, 
    foreign key (idCliente) reference (idCliente)
    foreign key (idEnd) reference (idEnd)
);