create table if not exists elevi (
	id serial primary key,
	nume varchar(100) not null,
	prenume varchar(100) not null,
	clasa varchar(4),
	note varchar(50),
	data_adaugarii timestamp default current_timestamp
);

INSERT INTO elevi (nume, prenume, clasa, note) VALUES 
('Ionescu', 'Gigel', '9F', '10,8,5,7'),
('Popescu', 'Dorel', '9F', '10,8,10,10'),
('Bumbulescu', 'Monica', '9B', '10,9,10,7'),
('Escu', 'Costica', '9F', '10,4,5,7,5'),
('Tache', 'Ionel', '9A', '9,10,6,10,9'),
('Mache', 'Gigel', '9F', '10,10,10,10'),
('Ionescu', 'Ana', '9F', '10,9,9,9,9'),
('Gogu', 'Oana', '9F', '10,9,8,10'),
('Lache', 'Dana', '9A', '4,5,5,7'),
('Ionescu', 'Hana', '9F', '3,8,1,2,3'),
('Bubu', 'Leana', '9A', '9,10,10'),
('Popescu', 'Teodor', '9C', '1,2,3,4,5'),
('Ionescu', 'Tudorel', '9C', '6,7,8,9,10'),
('Costescu', 'Bob', '9D', '5,5,5'),
('Petrescu', 'Petre', '9F', '7,9,2,10,9,1,10'),
('Mihailescu', 'Gigel', '9D', '10');

create user fabian with encrypted password '123456';
grant all privileges on database model to fabian;
grant all privileges on all tables in schema public to fabian;
grant all privileges on all sequences in schema public to fabian;