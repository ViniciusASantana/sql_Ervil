DROP DATABASE db_erbil;
CREATE DATABASE if not exists db_Erbil;

USE db_Erbil;

CREATE TABLE Usuario(
		idUsuario INT auto_increment,
		apelido VARCHAR(20) NOT NULL,
    	email VARCHAR(100) NOT NULL unique,
    	senha VARCHAR(30) NOT NULL,
    	PRIMARY KEY(idUsuario)
);

CREATE TABLE Comunidade(
		idComunidade INT NOT NULL auto_increment,
        categoria INT NOT NULL,
    	nome VARCHAR(60) NOT NULL unique,
    	descricao VARCHAR(80) NULL,
    	topico VARCHAR(15) NULL,
		num_partic INT NOT NULL default 1,
    	PRIMARY KEY(idComunidade)
);

CREATE TABLE Usuario_has_Comunidade(
		usuario_idUsuario INT ,
    	comunidade_idComunidade INT,
		cargo INT default 0,
    	FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(idUsuario),
    	FOREIGN KEY (comunidade_idComunidade) REFERENCES Comunidade(idComunidade)
);

CREATE TABLE Postagem(
		usuario_has_comunidade_usuario INT,
    	usuario_has_comunidade_idComunidade INT,
    	conteudo VARCHAR(400) NOT NULL,
        dataa DATETIME NOT NULL,
        feedback INT NOT NULL default 0,
    	FOREIGN KEY(usuario_has_comunidade_usuario) REFERENCES Usuario_has_Comunidade(usuario_idUsuario),
    	FOREIGN KEY(usuario_has_comunidade_idComunidade) REFERENCES Usuario_has_Comunidade(comunidade_idComunidade)
);

CREATE TABLE Reporte(
		idReport INT,
    	comunidade INT,
    	usuario INT,
    	motivo VARCHAR(120) NOT NULL,
    	PRIMARY KEY(idReport),
    	FOREIGN KEY(comunidade) REFERENCES Comunidade(idComunidade),
    	FOREIGN KEY(usuario) REFERENCES Usuario(idUsuario)
);


INSERT INTO usuario(apelido,email,senha)VALUES
('Tester1','tester1@gmail.com','12345678'),
('Tester2','tester2@gmail.com','12345678'),
('Tester3','tester3@gmail.com','12345678'),
('Tester4','tester4@gmail.com','12345678'),
('Tester5','tester5@gmail.com','12345678'),
('Tester6','tester6@gmail.com','12345678'),
('Tester7','tester7@gmail.com','12345678'),
('Tester8','tester8@gmail.com','12345678'),
('Tester9','tester9@gmail.com','12345678'),
('Tester10','tester10@gmail.com','12345678');

INSERT INTO Comunidade(nome,categoria,descricao,topico) VALUES
('Comunidade de Testes',1,'Comunidade para testes','Diversos');


INSERT INTO Usuario_has_Comunidade(usuario_idUsuario,comunidade_idComunidade,cargo) VALUES
(1,1,3),
(2,1,2),
(3,1,1),
(4,1,1);
INSERT INTO Comunidade(nome,categoria) VALUES
('BRAraw1',1),
('BRAraw2',1),
('BRAraw3',1),
('BRAraw4',1),
('BRAraw5',1),
('BRAraw6',1),
('BRAraw7',1),
('BRAraw8',1),
('BRAraw9',1),
('BRAraw0',1);
INSERT INTO Comunidade(nome,categoria) VALUES
('BRArawLivre',0);
SELECT * FROM usuario;
SELECT * FROM Comunidade;
SELECT * FROM Usuario_has_Comunidade;

SELECT categoria FROM Comunidade where idComunidade=1;
SELECT DISTINCT * FROM Usuario_has_Comunidade,Usuario where cargo=0 and idUsuario=1 ;
SELECT * FROM Comunidade,Usuario_has_Comunidade WHERE usuario_idUsuario=1 and Cargo>0 and comunidade_idComunidade=idComunidade;
SELECT idComunidade FROM Comunidade ORDER BY idComunidade DESC;
SELECT * FROM usuario_has_comunidade WHERE cargo>0 and comunidade_idComunidade= 2;

SELECT comunidade_idComunidade FROM Usuario_has_Comunidade where usuario_idUsuario=1 and cargo>0;
select * FROM usuario;
SELECT * from Usuario_has_Comunidade where comunidade_idComunidade=1;
show tables;
SELECT * FROM Usuario_has_Comunidade;
UPDATE Usuario_has_Comunidade SET cargo=1 WHERE usuario_idUsuario=1;
DELETE FROM Usuario_has_Comunidade WHERE usuario_idUsuario=1 and comunidade_idComunidade=2;
UPDATE Comunidade SET num_partic=num_partic+1 WHERE idComunidade=1;
SELECT DISTINCT * FROM comunidade,Usuario_has_Comunidade where usuario_idUsuario!=1;
SELECT * FROM comunidade,Usuario_has_Comunidade where comunidade_idComunidade=idComunidade and usuario_idUsuario=1;
SELECT * FROM Usuario_has_Comunidade where usuario_idUsuario=1 and comunidade_idComunidade=1;
SELECT DISTINCT * FROM Usuario_has_Comunidade where usuario_idUsuario=1 and comunidade_idComunidade=1;
SELECT * FROM Usuario_has_Comunidade where usuario_idUsuario=1 and comunidade_idComunidade=2;