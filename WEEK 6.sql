select * from employee;
select * from dept;
select * from project;
select * from incentives;
select * from assigned_to;
SELECT ename
FROM employee
WHERE emp_id IN (
      SELECT mgr_no
      FROM employee
      GROUP BY mgr_no
      HAVING COUNT(*) = (
            SELECT MAX(cnt)
            FROM (
                  SELECT COUNT(*) AS cnt
                  FROM employee
                  GROUP BY mgr_no
            )
      )
);
select m.emp_id, m.ename, m.salary from employee m where m.emp_id in (select distinct(mgr_no) from employee)
and m.salary > (select avg(e.salary) from employee e where e.mgr_no = m.emp_id);

select e.ename, d.dename, d.deptno from employee e join dept d on e.deptno = d.deptno where e.mgr_no in (select emp_id from employee where mgr_no is NULL);

select * from employee e join incentives i on e.emp_id = i.emp_id where incentive_amount = 
(select max(incentive_amount) from incentives where incentive_amount < (select max(incentive_amount) from incentives where incentive_date like "2019-01%") and incentive_date like "2019-01%");

select e.emp_id, e.ename from employee e join employee m on e.mgr_no = m.emp_id where e.deptno = m.deptno;
