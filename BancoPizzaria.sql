create database pizzaria;

use pizzaria;

create table tblMassa(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50) NOT NULL,
	preco FLOAT(3,2) NOT NULL
);

create table tblSabor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50) not null,
	preco FLOAT(3,2) NOT NULL
);

create table tblBorda (
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50) not null,
	preco FLOAT(3,2) NOT NULL
);

create table tblPizza(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fk_idMassa INT NOT NULL,
	fk_idSabor INT NOT NULL,
	fk_idBorda INT NOT NULL,
	
	FOREIGN KEY(fk_idMassa) REFERENCES tblMassa (id),
	FOREIGN KEY(fk_idSabor) REFERENCES tblSabor (id),
	FOREIGN KEY(fk_idBorda) REFERENCES tblBorda (id)
);

create table tblBebida(
		id INT PRIMARY KEY AUTO_INCREMENT,
		descricao VARCHAR(50) NOT NULL,
		preco FLOAT(3,2) NOT NULL
);

create table tblClientes(
			id INT PRIMARY KEY AUTO_INCREMENT,
			nome VARCHAR(50) NOT NULL,
			telefone BIGINT(9) NOT NULL,
			endereco VARCHAR(50) NOT NULL
);

create table tblPedidos(
		id INT PRIMARY KEY AUTO_INCREMENT,
		data DATE NOT NULL,
		fk_idPizza INT NOT NULL,
		qtdePizza INT NOT NULL,
		fk_idBebida INT NOT NULL,
		qtdeBebidas INT NOT NULL,
		fk_idCliente INT NOT NULL,
		preco INT NOT NULL,
		
		FOREIGN KEY(fk_idPizza) REFERENCES tblPizza(id),
		FOREIGN KEY(fk_idBebida) REFERENCES tblBebida(id),
		FOREIGN KEY(fk_idCliente) REFERENCES tblClientes(id)
);

create table tblFormadas(
		hora DATETIME PRIMARY KEY,
		data DATE NOT NULL,
		fk_idPizza INT NOT NULL,
		fk_idPedido INT NOT NULL,
		
		FOREIGN KEY(fk_idPizza) REFERENCES tblPizza(id),
		FOREIGN KEY(fk_idPedido) REFERENCES tblPedidos(id)
);