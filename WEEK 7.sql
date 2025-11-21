CREATE TABLE Suppliers (sid INT PRIMARY KEY,sname VARCHAR(50),city VARCHAR(50));
CREATE TABLE Parts (pid INT PRIMARY KEY,pname VARCHAR(50),color VARCHAR(20));
CREATE TABLE Catalog (sid INT,pid INT,cost INT,FOREIGN KEY (sid) REFERENCES Suppliers(sid),FOREIGN KEY (pid) REFERENCES Parts(pid));

INSERT INTO Suppliers VALUES
(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');

INSERT INTO Parts VALUES
(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

INSERT INTO Catalog VALUES
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 30),
(10001, 20004, 10),
(10001, 20005, 10),
(10002, 20001, 10),
(10002, 20002, 10),
(10003, 20003, 30),
(10004, 20003, 40);

select pname from parts where pid in (select pid from catalog);

select sname from suppliers where sid in (select sid from catalog where pid in (select pid from parts where color = "red"));

select c.pid, s.sname from Catalog c join Suppliers s on c.sid = s.sid where c.cost = (
select MAX(c2.cost) from Catalog c2 where c2.pid = c.pid) order by c.pid;

select p.pname from parts p join catalog c on p.pid = c.pid join suppliers s on s.sid = c.sid where s.sname = "Acme Widget" and p.pid not in
(select c2.pid from catalog c2 join suppliers s2 on s2.sid = c2.sid where s2.sname <> 'Acme Widget'); 

select s.sname from Suppliers s where (select count(distinct c.pid) from Catalog c where c.sid = s.sid) = 5;

SELECT DISTINCT c.sid
FROM Catalog c
JOIN (
    SELECT pid, AVG(cost) AS avg_cost
    FROM Catalog
    GROUP BY pid
) a ON c.pid = a.pid
WHERE c.cost > a.avg_cost;

select sid from catalog c where c.cost > (select avg(cost) from catalog c2 where c2.pid = c.pid);