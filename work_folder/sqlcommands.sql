
/*---------------------------------------------------------------------------------------------------*/
SHOW DATABASES; /* - список баз данных */
SHOW TABLES [FROM db_name]; /* -  список таблиц в базе */
SHOW COLUMNS FROM таблица [FROM db_name]; /* - список столбцов в таблице */
SHOW CREATE TABLE table_name; /* - показать структуру таблицы в формате "CREATE TABLE" */
SHOW INDEX FROM tbl_name; /* - список индексов */
SHOW GRANTS FOR user [FROM db_name]; /* - привилегии для пользователя. */

select user,host,password from mysql.user;

SHOW VARIABLES; /* - значения системных переменных */
SHOW [FULL] PROCESSLIST; /* - статистика по mysqld процессам*/
SHOW STATUS; /* - общая статистика */
SHOW TABLE STATUS [FROM db_name]; /*- статистика по всем таблицам в базе */
/*---------------------------------------------------------------------------------------------------*/


create user 'testsql'@'localhost' identified by 'qwerty'; /* Создаем пользователя testsql с паролем qwerty */
select user,host,password from mysql.user; /* Пользователь создан. Для проверки посмотрим список пользователей:*/
create database testdb; /*Создадим базу данных testdb.*/
grant all on testq.* to 'testsql'@'localhost'; /* Дадим пользователю test полные права на базу testdb */
drop user 'testsqlsql'@'localhost'; 

/* ГЛАВА 2. Создание и заполнение базы данных */

grant all privileges on *.* to 'testsql'@'localhost' identified by 'qwerty' 

create database bank;
use bank;

source ~/Documents/GitHub/myProjects/LearningSQL/LearningSQLExample.sql /* Загрузите данные из закачанного файла*/

select now(); /* Узнать текущую дату и время*/

SHOW CHARACTER SET; /* Посмотреть поддерживаемые сервером наборы символов*/
/* VARCHAR(20) CHARACTER SET utf8 - при описании столбца выбрать набор символов отличный от применяемого по умолчанию*/

CREATE DATABASE bank CHARACTER SET utf8; /* Задать набор символов по умолчанию для все базы данных*/


/*------------------------Создание тестовой базы cо стр. 36 по стр. 49 LearningSQL ------------------------------*/

CREATE TABLE person
(person_id SMALLINT UNSIGNED,
	fname VARCHAR(20),
	lname VARCHAR(20),
	gender ENUM('M','F'),
	bith_date DATE,
	adress VARCHAR(30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
	CONSTRAINT pk_person PRIMARY KEY (person_id)
);


DESC person; /* Просмотр структуры таблице person*/

CREATE TABLE favorite_food
(person_id SMALLINT UNSIGNED,
	food VARCHAR(20),
	CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
	CONSTRAINT fk_person_id FOREIGN KEY (person_id)
	REFERENCES person (person_id)
);

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT; /*не дает совершить действие, так как внешний ключ запрещает*/

LOCK TABLES 
    favorite_food WRITE,
    person WRITE;

ALTER TABLE favorite_food
    DROP FOREIGN KEY fk_person_id,
    MODIFY person_id SMALLINT UNSIGNED;

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;

ALTER TABLE favorite_food
    ADD CONSTRAINT pk_favorite_food FOREIGN KEY (person_id)
          REFERENCES person (person_id);

UNLOCK TABLES;

INSERT INTO person
(person_id, fname, lname, gender, bith_date)
VALUES (null, 'William', 'Turner', 'M', '1972-05-27');

INSERT INTO favorite_food (person_id, food)
VALUES (1, 'pizza');

INSERT INTO favorite_food (person_id, food)
VALUES (1, 'cookies');

INSERT INTO favorite_food (person_id, food)
VALUES (1, 'nachos');

SELECT food FROM favorite_food WHERE person_id = 1 ORDER BY food; /* Запрос извлекающий любимые блюда Вильяма в алфавитном порядке с помощью блока ORDER BY*/

INSERT INTO person
(person_id, fname, lname, gender, bith_date, adress, city, state, country, postal_code)
VALUES(null, 'Susan', 'Smith', 'F', '1975-11-02', '23 Maple St.', 'Arligton', 'VA', 'USA', '20220');

UPDATE person
SET adress = '1225 Tremont St.', city = 'Boston', state = 'MA', country = 'USA', postal_code = '02138' WHERE person_id = 1;

SHOW WARNINGS; /* Команда просмотра предупреждений, если таковые имеются*/
