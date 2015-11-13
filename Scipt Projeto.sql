drop database IF EXISTS ProjetoIntegrado;
create database ProjetoIntegrado;
use ProjetoIntegrado;


create table locadoras(
	idSede integer primary key auto_increment not null,
    nomeSede varchar(100),
    rua varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(50)
);
create table usuario(
	idLogin integer primary key auto_increment not null,
    login varchar(100),
    senha varchar(5000),
    typeUser varchar(1),
    idSede integer not null,
    foreign key (idSede) references locadoras(idSede)
);


create table cliente(
	idCliente integer primary key auto_increment not null,
	nome varchar (50) not null,
	cpf varchar (15) not null,
	rg varchar (9),
	fone varchar(15),
	email varchar(50),
	dtNasc varchar(20),
	sexo varchar(20),
	nCnh varchar(20),
	estadoEmissor char(2),
	dtValCNH varchar(20),
	dt1Cnh varchar(20),
	statusCliente varchar(50)
);

create table veiculo(
	idVeiculo integer primary key not null auto_increment,
	marca varchar(50),
	modelo varchar(50),
	ano varchar(30),
	placa varchar(30),
	chassi varchar(37),
	kilometragem varchar(50),
	cidade varchar(50),
	estado varchar(20),
	vlrTarifaLivre varchar(50),
	vlrTarifaControlado varchar(50),
	categoria char(50),
	statusVeiculo varchar(20),
    accGPS char(5),
    accBB char(4),
    accMotorista char (6),
	agencia varchar(30)
);
/*create table acessorios(
	idAcessorios integer primary key not null auto_increment,
	idVeiculo integer not null,
	descricao varchar(50),
	foreign key (idVeiculo) references veiculo(idVeiculo)
);*/

create table locacao(
	idLocacao integer primary key not null auto_increment,
	idCliente integer not null,
	idVeiculo integer not null,
	dataEmprestimo varchar(20) ,
	dataDevolucao varchar(20) ,
	localEmprestimo varchar(50) ,
	localDevolucao varchar(50),
	tipoKilometragem varchar(20),
	statusLoc varchar(30),
    foreign key (idCliente) references cliente(idCliente),
	foreign key (idVeiculo) references veiculo(idVeiculo)
);

create table pagamento(
	idPagamento integer primary key not null auto_increment,
	idLocacao integer not null,
	valor varchar(20),
	dataPagamento varchar(50),
	nome varchar(50),
	cpf varchar(15),
	telefone varchar(15),
	foreign key (idLocacao) references locacao(idLocacao)
);

create table devolucao(
	idDevolucao integer primary key not null auto_increment,
	idLocacao integer not null,
	dataDevolucao varchar(20),
	km varchar(10),
	localDevolucao varchar(50),
	foreign key (idLocacao) references locacao(idLocacao)
);

create table multa(
	idMulta integer primary key not null auto_increment,
	idDevolucao integer not null, 
	tipo varchar(50),
	descricao varchar(50),
	valor varchar(50),
	foreign key (idDevolucao) references devolucao(idDevolucao)
);
create table cartaoDebito(
	idCartaoDebito integer primary key not null auto_increment,
	nome varchar (50),
    cpf varchar(51),
    telefone varchar(50),
	banco varchar(50),
    agencia varchar(50),
    contaCorrente varchar(50)
);

create table cidadeMulta(
	idCidade integer primary key not null,
	nome varchar(50),
	distancia integer
);
insert into cidadeMulta values(1,'Rio de Janeiro', 429);
insert into cidadeMulta values(2,'Salvador', 1932);
insert into cliente values(0,'Rafael','321321321','6756756','88596521','e-mail','15/12/4515','m','slqéisso','SP','Ativo','12/12/1221','Ativo');
insert into cliente values(0,'Eric ','646233736','6756756','88596521','ericrosa@hotmail.com','15/12/4515','m','slqéisso','SP','Ativo','12/12/1221','Ativo');
insert into veiculo values(0,'Renault','Clio','2015','AMD-7007','uyrt231u4u1ty','120.00','Sao Paulo','SP','14.0','8.0','A - Carros Leves','Disponivel','OK','OK','NOK','S');
insert into veiculo values(0,'Chevrolet','cruze','2015','AMD-7007','uyrt231u4u1ty','120.00','Sao Paulo','SP','14.0','8.0','A - Carros Leves','Disponivel','OK','OK','NOK','S');
insert into locacao values(0,1,1,'18/10/2014','25/10/2014','São Paulo','Bahia','2','Ativo');
insert into locadoras(idSede,nomeSede,rua,bairro,cidade,uf)values(1,'São Paulo','teste','teste','teste','SP');
insert into usuario(idLogin,login,senha,typeUser,idSede) values(1,'felipe','03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4',1,1);
insert into usuario(idLogin,login,senha,typeUser,idSede) values(2,'eric','03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4',1,1);
insert into usuario(idLogin,login,senha,typeUser,idSede) values(3,'rafael','03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4',1,1);
insert into usuario(idLogin,login,senha,typeUser,idSede) values(4,'vaz','03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4',1,1);
select * from veiculo;
select * from cliente;
select * from locacao;
select * from devolucao;
select * from pagamento;
select * from multa;
select * from veiculo where agencia like 'São Paulo' order by marca, modelo asc;
/*select max(idLocacao) as idLoc from locacao*/


update veiculo set vlrTarifaLivre = '012000', vlrTarifaControlado = '008000' where idVeiculo = 1;