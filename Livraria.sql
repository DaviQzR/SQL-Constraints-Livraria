/*
	Ter o privilegio para fazer alteração
*/
USE master
 GO	

/*
 Botão de Emergência
 */
 DROP DATABASE livraria
 GO

 /*
	Criação do Banco de Dados
 */
 CREATE DATABASE Livraria
 GO
 
 /*
   Usar o Banco de Dados
 */
 USE livraria
 GO

/*
  Criação da Tabela
*/
CREATE TABLE livro (

Codigo		INT					NOT NULL	IDENTITY (100001, 100),
Nome        VARCHAR(200)		NOT NULL,
Lingua      VARCHAR(10)         NOT NULL	DEFAULT 'PT-BR',
Ano         INT                 NOT NULL	 CHECK(Ano < '1990')
PRIMARY KEY (Codigo)
)
GO
 
CREATE TABLE  editora (
Id_Editora				INT					NOT NULL	IDENTITY (491, 16),
Nome					VARCHAR(70)			NOT NULL	UNIQUE,
Telefone				VARCHAR(11)			NOT NULL	CHECK(LEN(Telefone) = 10) ,
Logradouro_Endereco		VARCHAR(200)		NOT NULL,
Numero_Endereco			INT					NOT NULL	    CHECK(Numero_Endereco < 0),
CEP_Endereco			CHAR(8)				NOT NULL	    CHECK(CEP_Endereco = 8),	
Complemento_Endereco	VARCHAR(255)		NOT NULL
PRIMARY KEY (Id_Editora)
)
GO

CREATE TABLE autor (
Id_Autor				INT					NOT NULL	IDENTITY (2351, 1),
Nome					VARCHAR(100)		NOT NULL	UNIQUE,
Data_Nasc				Date				NOT NULL,
Pais_Nasc				VARCHAR(50)			NOT NULL	CHECK(Pais_Nasc = 'Brasil' OR 
Pais_Nasc = 'Estados Unidos' OR Pais_Nasc = 'Inglaterra' OR Pais_Nasc = 'Alemanha'),
Biografia				VARCHAR(255)		NOT NULL
PRIMARY KEY (Id_Autor)
)
GO

CREATE TABLE edicao (
Isbn					CHAR(13)			NOT NULL		UNIQUE CHECK(LEN(Isbn) = 13),
Preco					DECIMAL(4, 2)		NOT NULL	CHECK(Preco < '0'),
Ano						INT					NOT NULL	CHECK(Ano < '1990'),
Numero_Paginas			INT					NOT NULL	CHECK(Numero_Paginas < '15'),
Qtd_Estoque				INT					NOT NULL
PRIMARY KEY (Isbn)
)
GO

CREATE TABLE livro_autor (
Codigo			INT				NOT NULL,
Id_Autor		INT				NOT NULL
PRIMARY KEY (Codigo, Id_Autor)	
FOREIGN KEY (Codigo) REFERENCES livro(Codigo), 
FOREIGN KEY (Id_Autor) REFERENCES autor(Id_Autor)
)
GO

CREATE TABLE editora_edicao_livro (
Id_Editora		INT			NOT NULL,
ISBN			CHAR(13)	NOT NULL,
Codigo			INT			NOT NULL
PRIMARY KEY (Id_Editora, ISBN, Codigo)
FOREIGN KEY (Id_Editora) REFERENCES editora(Id_Editora),
FOREIGN KEY (ISBN) REFERENCES edicao(ISBN),
FOREIGN KEY (Codigo) REFERENCES livro(Codigo)
)
GO



 