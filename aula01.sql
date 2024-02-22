-- cria��o de banco de dados
-- comentar (a linha inteirea) ou /*ggg*/ (uma parte)
--primeira letra do nome do obj mai�scula
--CREATE DATABASE Aula01 /*criar banco*/
	USE Aula01 /*executar o banco - executar s� essa linha*/
--DROP DATABASE Aula01 /*apagar o banco*/
--USE Master /*n�o apagar o MASTER*/
-- cra��o de uma tabela
	create table tblTipo (
		Codigo int not null primary key,
		Nome varchar(30)
	)
-- cria��o de uma tabela com chave primaria composta de 2 campos
	create table tblTotalFaturado(
		mes int, 
		ano integer,
		valor decimal(10,2),
		primary key(mes,ano)
	)
-- cria��o de uma tabela com chave estrangeira
	create table tmbSecao(
		codigo int not null primary key,
		descricao varchar(20),
		--coddepto int foreign key references departamento (codigo)
	)
	--s� � necess�rio colocar 'not null' na primary key
-- cria��o de uma tabela com restri��o de preenchimento de campos
	create table tblAnimal(
		codigo int not null primary key, 
		nome varchar(40),
		sexo char(1) check(upper (sexo)='m' or upper(sexo)='f') /* transformar em mai�sculo e ver se � M ou F*/
	)
-- cria��o de tabela com algumas regras de integridade
	create table tblFuncionario (
		codfunc int identity, --s� em chave prim�ria
		nomefunc varchar(50),
		rgfunc char(15),
		sexofunc char default 'f', --se n�o tiver nada coloca f no campo sexo
		salfunc dec(10,2) default 240.00, --come�a com 10 e vai subindo de 2 em 2 
		constraint pk_func primary key(codfunc), --outra forma de criar chave prim�ria
		constraint uq_func unique(rgfunc), --valores iguais nesse campo
		constraint ck_func1 check(sexofunc in ('f','m')), --s� pode colocar f ou m
		constraint ck_funk2 check (salfunc > 0) -- o sal�rio tem que ter maior que 0
		)
		create index xtotalfaturado on tblTotalFaturado (mes, ano) --criar indice para as tabelas: create index "nome_index" on "nome_tabela" (pk e fk)
		create index xFuncionario on tblFuncionario (codfunc)
--insert + insere valor em uma tabela 
--declarativo - declara quais compos receber�o valores
		insert tblAluno(cod,nome,salario) values (1,'luiz',240.00), (3,'rafael',501.00)
--posicional n�o declara os campos, s� os valores - em ordem da cria��o dos dados na tabela
	insert tblFuncionario values (2,'ricardo', 500.00), (4,'lucas',300.00) --coloca virgula e pode add mais valores na mesma sintaxe
