create table Branch (branch_name varchar(30), branch_city varchar(30), assets real, primary key(branch_name));
create table BankAccount (accno int, branch_name varchar(30), balance real, primary key(accno), foreign key(branch_name) references branch(branch_name));
create table BankCustomer (customer_name varchar(30), customer_street varchar(30),customer_city varchar(30), primary key(customer_name));
create table Depositer (customer_name varchar(30), accno int,foreign key(accno) references BankAccount(accno), foreign key(customer_name) references BankCustomer(customer_name));
create table Loan (loan_number int, branch_name varchar(30), amount real, primary key(loan_number), foreign key(branch_name) references branch(branch_name));

insert into branch values
	("SBI_Chamrajpet","Bangalore",50000),
	("SBI_ResidencyRoad","Bangalore",10000),
    ("SBI_ShivajiRoad","Bombay",20000),
    ("SBI_ParlimentRoad","Delhi",10000),
    ("SBI_Jantarmantar","Delhi",20000);
    
insert into bankaccount values 
	(1,"SBI_Chamrajpet",2000),
    (2,"SBI_ResidencyRoad",5000),
    (3,"SBI_ShivajiRoad",6000),
    (4,"SBI_ParlimentRoad",9000),
    (5,"SBI_Jantarmantar",8000),
    (6,"SBI_ShivajiRoad",4000),
    (8,"SBI_ResidencyRoad",4000),
    (9,"SBI_ParlimentRoad",3000),
    (10,"SBI_ResidencyRoad",5000),
    (11,"SBI_Jantarmantar",2000);
    
insert into bankcustomer values
	("Avinash","Bull_temple_road","Bangalore"),
    ("Dinesh","Bannergatta_road","Bangalore"),
    ("Mohan","NationalCollege_road","Bangalore"),
    ("Nikil","Akbar_Road","Delhi"),
    ("Ravi","Prithviraj_Road","Delhi");
    
insert into depositer values
	("Avinash",1),
    ("Dinesh",2),
    ("Nikil",4),
    ("Ravi",5),
    ("Avinash",8),
    ("nikil",9),
    ("dinesh",10),
    ("nikil",11);
    
insert into loan values
	(1,"SBI_Chamrajpet",1000),
    (2,"SBI_ResidencyRoad",2000),
    (3,"SBI_ShivajiRoad",3000),
    (4,"SBI_ParlimentRoad",4000),
    (5,"SBI_Jantarmantar");

select sum(amount) from loan;

select branch_name, assets / 100000 as "assets in lakhs" from Branch;

select d.customer_name from BankAccount b, Depositer d where b.accno = d.accno and b.branch_name = "SBI_ResidencyRoad" group by customer_name having count(*) >= 2;

create view branchloansummary as select branch_name, sum(amount) as total_loan_amount from loan group by branch_name;

select * from branchloansumary;