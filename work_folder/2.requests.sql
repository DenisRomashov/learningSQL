USE BANK;

select fname, lname from employee;

/* Следующий запрос демонстрирует использование столбца таблицы, литерала, выражения и вызова встроенной функции в одном запросе к таблице employee*/
SELECT emp_id, 'ACTIVE', emp_id * 3.14159, UPPER(lname) FROM employee;

SELECT VERSION(), USER(), DATABASE(); /* Вызов 3 встроенных функций, блок FROM не нужен*/
