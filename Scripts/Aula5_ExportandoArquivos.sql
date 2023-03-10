/*EXPORT FORMATO COLUNAR
 *EXISTE UMA FORMA DE EXPORTAR ARQUIVOS DE BANCO DE DADOS,
 *PARA ISSO É PRECISO CRIAR UM BANCO DE UM TIPO DE BACKUP
 *DE UM SELECT DE TABELA COLUNAR. 
 *É POSSIVEL CRIAR UMA TABELA COM O RESULTADO DE UMA QUERIE,
 *ESSA É A FORMA DE SE REALIZAR UMA MODELAGEM COLUNAR.
 */

/*CRIANDO TABELA*/
CREATE TABLE genero(
	idgenero int PRIMARY KEY,
	nome varchar(30)
);


/*INSERINDO DADOS*/
INSERT INTO genero VALUES(1, 'FANTASIA');
INSERT INTO genero VALUES(2, 'AVENTURA');
INSERT INTO genero VALUES(3, 'SUSPENSE');
INSERT INTO genero VALUES(4, 'AÇÃO');
INSERT INTO genero VALUES(5, 'DRAMA');


/*CRIANDO TABELA*/
CREATE TABLE filme(
	idfilme int PRIMARY KEY,
	nome varchar(50),
	ano int,
	id_genero int,
	FOREIGN KEY(id_genero)
	REFERENCES genero(idgenero)
);


/*INSERINDO DADOS*/
INSERT INTO filme VALUES(100, 'KILLL BILL I', 2007, 2);
INSERT INTO filme VALUES(200, 'DRACULA', 1998, 3);
INSERT INTO filme VALUES(300, 'SENHOR DOS ANEIS', 2008, 1);
INSERT INTO filme VALUES(400, 'UM SONHO DE LIBERDADE', 2008, 1);
INSERT INTO filme VALUES(500, 'OS BAD BOYS', 2008, 4);
INSERT INTO filme VALUES(600, 'GUERRA CIVIL', 2016, 2);
INSERT INTO filme VALUES(700, 'CADILLAC RECORDS', 2009, 5);
INSERT INTO filme VALUES(800, 'O HOBBIT', 2008, 1);
INSERT INTO filme VALUES(900, 'TOMATES VERDES FRITOS', 2008, 5);
INSERT INTO filme VALUES(1000, 'CORRIDA MORTAL', 2008, 4);


/*CRIANDO TABELA*/
CREATE TABLE locacao(
	idlocacao int PRIMARY KEY,
	DATA date,
	midia int,
	dias int,
	id_filme int,
	FOREIGN KEY(id_filme)
	REFERENCES filme(idfilme)
);


/*INSERINDO DADOS*/
INSERT INTO locacao VALUES(1,'01/08/2019',23,3,100);
INSERT INTO locacao VALUES(2,'01/02/2019',56,1,400);
INSERT INTO locacao VALUES(3,'02/07/2019',23,3,400);
INSERT INTO locacao VALUES(4,'02/02/2019',43,1,500);
INSERT INTO locacao VALUES(5,'02/02/2019',23,2,100);
INSERT INTO locacao VALUES(6,'03/07/2019',76,3,700);
INSERT INTO locacao VALUES(7,'03/02/2019',45,1,700);
INSERT INTO locacao VALUES(8,'04/08/2019',89,3,100);
INSERT INTO locacao VALUES(9,'04/02/2019',23,3,800);
INSERT INTO locacao VALUES(10,'05/07/2019',23,3,500);
INSERT INTO locacao VALUES(11,'05/02/2019',38,3,800);
INSERT INTO locacao VALUES(12,'01/10/2019',56,1,100);
INSERT INTO locacao VALUES(13,'06/12/2019',23,3,400);
INSERT INTO locacao VALUES(14,'01/02/2019',56,2,300);
INSERT INTO locacao VALUES(15,'04/10/2019',76,3,300);
INSERT INTO locacao VALUES(16,'01/09/2019',32,2,400);
INSERT INTO locacao VALUES(17,'08/02/2019',89,3,100);
INSERT INTO locacao VALUES(18,'01/02/2019',23,1,200);
INSERT INTO locacao VALUES(19,'08/09/2019',45,3,300);
INSERT INTO locacao VALUES(20,'01/12/2019',89,1,400);
INSERT INTO locacao VALUES(21,'09/07/2019',23,3,1000);
INSERT INTO locacao VALUES(22,'01/12/2019',21,3,1000);
INSERT INTO locacao VALUES(23,'01/02/2019',34,2,100);
INSERT INTO locacao VALUES(24,'09/08/2019',67,1,1000);
INSERT INTO locacao VALUES(25,'01/02/2019',76,3,1000);
INSERT INTO locacao VALUES(26,'01/02/2019',66,3,200);
INSERT INTO locacao VALUES(27,'09/12/2019',90,1,400);
INSERT INTO locacao VALUES(28,'03/02/2019',23,3,100);
INSERT INTO locacao VALUES(29,'01/12/2019',65,5,1000);
INSERT INTO locacao VALUES(30,'03/08/2019',43,1,1000);
INSERT INTO locacao VALUES(31,'01/02/2019',27,31,200);


/*CONSULTA GERAL*/
select f.nome, g.nome, l.data, l.dias, l.midia
from genero g 
inner join filme f 
on g.idgenero = f.id_genero
inner join locacao l 
on l.id_filme = f.idfilme;

/*CRIANDO UMA TABELA DE UMA QUERY - CREATE TABLE AS SELECT*/
CREATE TABLE rel_locadora as  
select f.nome as filme, g.nome as genero, l.data as data, l.dias as dias, l.midia as midia 
from genero g 
inner join filme f 
on g.idgenero = f.id_genero
inner join locacao l 
on l.id_filme = f.idfilme;


/*EXPORTANDO A TABELA COM A QUERY CRIADA NO FORMATO CSV*/
COPY rel_locadora TO '/tmp/rel_locador.csv' DELIMITER ';' CSV HEADER;













