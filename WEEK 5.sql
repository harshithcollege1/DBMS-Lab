CREATE TABLE dept (
    dept_no INT PRIMARY KEY,
    d_name VARCHAR(50) NOT NULL,
    dloc VARCHAR(50)
);
CREATE TABLE employee (
    emp_no INT PRIMARY KEY,
    e_name VARCHAR(35) NOT NULL,
    mgr_no INT,
    hiredate DATE,
    sal INT,
    dept_no INT,
    FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);
CREATE TABLE project (
    p_no INT PRIMARY KEY,
    ploc VARCHAR(50),
    p_name VARCHAR(100) NOT NULL
);
CREATE TABLE incentives (
    emp_no INT,
    incentive_date DATE,
    incentive_amount INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
CREATE TABLE assigned_to (
    p_no INT,
    emp_no INT,
    job_role VARCHAR(50),
    PRIMARY KEY (p_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    FOREIGN KEY (p_no) REFERENCES project(p_no)
);

INSERT INTO dept VALUES
(10, 'HR', 'Vizag'),
(20, 'Finance', 'Chennai'),
(30, 'IT', 'Mysore'),
(40, 'Sales', 'Banglore'),
(50, 'Marketing', 'Hyderabad');

iNSERT INTO employee VALUES
(10, 'Alice', 101,  '2020-01-15',60000 , 10),
(20, 'Bob', 102,'2019-03-22', 75000, 20),
(30, 'Charlie', 103, '2018-07-10', 90000 , 30),
(40, 'Diana', 104, '2021-09-05' ,55000 , 40),
(50, 'Evan', 105,'2022-11-12',60000 , 50);

INSERT INTO incentives VALUES
(10, '2023-01-10', 2000),
(20, '2023-02-15', 2500),
(30, '2023-03-20', 3000),
(40, '2023-04-25', 1500),
(50, '2023-05-30', 1800);

INSERT INTO project VALUES
(201, 'Vizag', 'Onboarding'),
(202, 'Chennai', 'BudgetApp'),
(203, 'Mysore', 'CloudInfra'),
(204, 'Banglore', 'SalesPortal'),
(205, 'Hyderabad', 'AdCampaign');


INSERT INTO assigned_to VALUES
( 201,10, 'HR Specialist'),
( 202,20, 'Financial Analyst'),
( 203,30, 'System Engineer'),
(204,40,  'Sales Associate'),
( 205, 50,'Marketing Coordinator');


insert into dept values (60, 'Marketing', 'Hyderabad');
insert into employee values (60, 'Eva', 106,'2022-12-12',60500 , 60);
insert into incentives values (60,"2023-05-04",null);



select emp_no from employee where emp_no in (select emp_no from assigned_to where p_no in (select p_no from project where ploc in ("Mysore","Banglore","Hyderabad")));

select * from employee where emp_no in (select emp_no from incentives where incentive_amount is null);

select e.e_name,e.emp_no,d.d_name,a.job_role,d.dloc,p.ploc from employee as e join dept as d on e.dept_no = d.dept_no 
join assigned_to as a on e.emp_no = a.emp_no join project as p on a.p_no = p.p_no where p.ploc = d.dloc;













