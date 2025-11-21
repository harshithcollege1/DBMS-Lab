use bhautik;

create table suppliers (sid int, sname varchar(30), city varchar(30), primary key(sid));
create table parts (pid int, pname varchar(30), color varchar(30), primary key(pid));
create table catalog (sid int, pid int, cost int, foreign key(sid) references suppliers(sid), foreign key(pid) references parts(pid));

insert into suppliers values (10001, "Acme Widget", "Bangalore"),
							 (10002, "Johns", "Kolkata"),
                             (10003, "Vimal", "Mumbai"),
                             (10004, "Reliance", "Delhi");

insert into parts values (20001, "Book", "Red"),
						 (20002, "Pen", "Red"),
                         (20003, "Pencil", "Green"),
                         (20004, "Mobile", "Green"),
                         (20005, "Charger", "Black");
                         
insert into catalog values (10001, 20001, 10),
						   (10001, 20002, 10),
                           (10001, 20003, 30),
                           (10001, 20004, 10),
                           (10001, 20005, 10),
                           (10002, 20001, 10),
                           (10002, 20002, 20),
                           (10003, 20003, 30),
                           (10004, 20003, 40);
                           
select pname from parts where pid in (select pid from catalog group by pid);

select sname from suppliers where sid in (select sid from catalog c group by c.sid having count(distinct c.pid) = (select count(*) from parts));

select sname from suppliers where sid in (select sid from catalog where pid in (select pid from parts where color = "Red"));

select p.pname from parts p where p.pid in (select c.pid from catalog c where c.sid = (select sid from suppliers where sname = "Acme Widget"))
and p.pid not in (select c2.pid from catalog c2 where c2.sid not in (select sid from suppliers where sname = "Acme Widget"));

select sid from catalog c where c.cost > (select avg(cost) from catalog c2 where c2.pid = c.pid);

select p.pid, s.sname from parts p join catalog c on p.pid = c.pid join suppliers s on s.sid = c.sid where c.cost = (select max(cost) from catalog c2 where c2.pid = p.pid);


