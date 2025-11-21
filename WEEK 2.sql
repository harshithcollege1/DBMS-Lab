UPDATE participated SET damage_amount = 25000 WHERE reg_num = "KA053408";

select * from car order by year; 

select count(*) from accident where report_num in (SELECT report_num from participated where reg_num in (select reg_num from car where model = "Lancer"));

select count(*) from accident where report_num in (SELECT report_num from participated where reg_num in (select reg_num from car where year = 2008));

select count(*) from accident where report_num in (SELECT report_num from participated where reg_num in (select reg_num from car where year = 2008 and model = "honda"));

-- ADDITIONAL --

select * from participated order by damage_amount desc;

select avg(damage_amount) from participated;

WITH avg_damage AS (SELECT AVG(damage_amount) AS avg_val FROM participated)
DELETE FROM participated WHERE damage_amount < (SELECT avg_val FROM avg_damage);

WITH avg_damage AS (SELECT AVG(damage_amount) AS avg_val FROM participated)
select * from participated WHERE damage_amount > (SELECT avg_val FROM avg_damage);

select max(damage_amount) from participated;

