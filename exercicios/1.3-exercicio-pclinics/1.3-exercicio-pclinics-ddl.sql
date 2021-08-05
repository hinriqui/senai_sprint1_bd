CREATE DATABASE PCLINICS;
GO

USE PCLINICS;
GO

CREATE TABLE Clinica(
	idClinica INT PRIMARY KEY IDENTITY(1,1),
	nomeClinica VARCHAR(30) NOT NULL UNIQUE,
	enderecoClina VARCHAR(100) NOT NULL UNIQUE,
);
GO

CREATE TABLE Veterinario(
	idVeterinario INT PRIMARY KEY IDENTITY(1,1),
	idClinica INT FOREIGN KEY REFERENCES Clinica(idClinica),
	nomeVeterinario VARCHAR(30) NOT NULL,
);
GO

CREATE TABLE TipoPet(
	idTipoPet INT PRIMARY KEY IDENTITY(1,1),
	TipoPet VARCHAR(15) NOT NULL UNIQUE,
);
GO

CREATE TABLE Raca(
	idRaca INT PRIMARY KEY IDENTITY(1,1),
	idTipoPet INT FOREIGN KEY REFERENCES TipoPet(idTipoPet),
	nomeRaca VARCHAR(30) NOT NULL UNIQUE,
);
GO

CREATE TABLE Dono(
	idDono INT PRIMARY KEY IDENTITY(1,1),
	nomeDono VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE Pet(
	idPet INT PRIMARY KEY IDENTITY(1,1),
	idDono INT FOREIGN KEY REFERENCES Dono(idDono),
	idRaca INT FOREIGN KEY REFERENCES Raca(idRaca),
	nomePet VARCHAR(15) NOT NULL,
	dataNasc DATE NOT NULL,
);
GO

CREATE TABLE Atendimento(
	idAtendimento INT PRIMARY KEY IDENTITY(1,1),
	idPet INT FOREIGN KEY REFERENCES Pet(idPet),
	idVeterinario INT FOREIGN KEY REFERENCES Veterinario(idVeterinario),
	descricao VARCHAR(200),
	dataAtendimento DATE NOT NULL,
);
GO