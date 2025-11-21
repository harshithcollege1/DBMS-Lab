create table borrower(customer_name varchar(50),loan_number real);
insert into borrower values
		("Avinash",1),
		("Dinesh",2),
        ("Mohan",3),
        ("Nikil",4),
        ("Ravi",5);
insert into branch values ("SBI_Mantrimarg","Delhi",200000);
insert into bankaccount values (12,"SBI_Mantrimarg",2000);
insert into depositer values ("nikil",12);
SELECT d.customer_name
FROM depositer d
JOIN bankaccount a ON d.accno = a.accno
JOIN branch b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'Delhi'
GROUP BY d.customer_name
HAVING COUNT(DISTINCT b.branch_name) = (
    SELECT COUNT(*) FROM branch WHERE branch_city = 'Delhi'
);
select b.customer_name from borrower b join bankcustomer c on b.customer_name = c.customer_name where c.customer_name not in (select customer_name from depositer);
select branch_name from branch where assets = (select max(assets) from branch);
SELECT DISTINCT d.customer_name
FROM depositer d
JOIN bankaccount a ON d.accno = a.accno
JOIN branch b1 ON a.branch_name = b1.branch_name
JOIN borrower br ON d.customer_name = br.customer_name
JOIN loan l ON br.loan_no = l.loan_no
JOIN branch b2 ON l.branch_name = b2.branch_name
WHERE b1.branch_city = 'Bangalore'
  AND b2.branch_city = 'Bangalore';
delete from bankaccount where branch_name in (select branch_name from branch where branch_city = "Bombay");
update bankaccount set balance = balance * 1.05;
