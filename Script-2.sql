--Questão 01. Crie um SCHEMA chamado avaliacaocontinua no seu banco de dados para armazenar os objetos criados nas próximas questões.
CREATE SCHEMA avaliacaocontinua;

--Questão 02. Crie a tabela company com os atributos company_name e city,utilize a restrição not null para o atributo company_name
--O atributo company_name deverá ser uma chave primária.
CREATE TABLE avaliacaocontinua.company (
	company_name varchar(100) PRIMARY KEY NOT NULL,
	city varchar(100)
);

--Questão 03. Crie a tabela employee com os atributos person_name, street e city,Utilize a restrição not null para o atributo person_name.
--O atributo person_name deverá ser uma chave primária.
CREATE TABLE avaliacaocontinua.employee (
	person_name varchar(100) PRIMARY KEY NOT NULL,
	street varchar(100),
	city varchar(100)
);

--Questão 04. Crie a tabela manages com os atributos person_name e manager_name, Utilize a restrição not null para o atributo person_name.
--O atributo person_name deverá ser uma chave primária.
CREATE TABLE avaliacaocontinua.manages (
	person_name varchar(100) PRIMARY KEY NOT NULL,
	manager_name varchar(100)
);

--Questão 05. Crie a tabela works com os atributos person_name, company_name e salary,utilize a restrição not null para o atributo person_name e company_name.
--O atributo person_name deverá ser uma chave primária.
CREATE TABLE avaliacaocontinua.works (
	person_name varchar(100) PRIMARY KEY NOT NULL,
	company_name varchar(100) NOT NULL,
	salary decimal(10, 2)
);

--Questão 06. Crie a integridade referencial entre a relação works e a relação employee, O atributo person_name da relação works deverá existir na relação employee,Utilize as ações em cascata: update e delete. 
ALTER TABLE avaliacaocontinua.employee
ADD CONSTRAINT fk_personNameWorks FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.works(person_name)
ON UPDATE cascade
ON DELETE cascade;

--Questão 07. Crie a integridade referencial entre a relação works e a relação company,o atributo company_name da relação works deverá existir na relação company,utilize as ações em cascata: update e delete.
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_companyName FOREIGN KEY (company_name) REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE cascade
ON DELETE cascade;

--Questão 08. Crie a integridade referencial entre a relação manages e a relação employee,o atributo person_name da relação manages deverá existir na relação employee,utilize as ações em cascata: update e delete.
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT fk_personNameManages FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE cascade
ON DELETE cascade;