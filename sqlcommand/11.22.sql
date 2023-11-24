insert into dept VALUES (1, '総務部');
insert into dept VALUES (2, '営業部');
insert into dept VALUES (3, '経理部');
insert into dept VALUES (4, '資材部');

insert into employee VALUES (1, '1111', '山田太郎', 1, '千葉県', '2009/09/09', 1);
insert into employee VALUES (2, '2222', '高橋健一', 1, '埼玉県', '2009/09/10', 1);
insert into employee VALUES (3, '3333', '鈴木花子', 2, '東京都', '2009/09/10', 2);
insert into employee VALUES (4, '4444', '佐々木良子', 2, '埼玉県', '2009/09/14', 3);

select * from dept;
select emp_name, address, dept_id from employee where address = '埼玉県';
select DISTINCT * from employee;

update employee set emp_pass = '1111' where dept_id = 1;

delete from employee where emp_id = 4;

alter table employee add delete_flag number;

CREATE TABLE item 
(item_id CHAR(4) PRIMARY KEY, 
 item_name VARCHAR2(100) NOT NULL, 
 category_id NUMBER NOT NULL, 
 sel_price NUMBER, 
 pur_price NUMBER, 
 reg_date DATE); 
 
INSERT INTO item VALUES ('0001','シャツ',1,1000,500,'2009-09-20'); 
INSERT INTO item VALUES ('0002','ホッチキス',2,500,320,'2009-09-11'); 
INSERT INTO item VALUES ('0003','セーター',1,4000,2800,NULL); 
INSERT INTO item VALUES ('0004','包丁',3,3000,2800,'2009-09-20'); 
INSERT INTO item VALUES ('0005','フライパン',3,5000,2800,'2009-01-15'); 
INSERT INTO item VALUES ('0006','フォーク',3,NULL,2800,'2009-09-20'); 
INSERT INTO item VALUES ('0007','スプーン',3,790,2800,'2008-04-28'); 
INSERT INTO item VALUES ('0008','ボールペン',2,NULL,2800,'2009-11-11'); 
COMMIT;

select * from item;
select * from item where category_id = 3 and sel_price >= 3000;
select * from item where category_id = 3 or sel_price >= 3000;
select * from item where not sel_price >= 1000;
select * from item where item_name like '%ー%';
select * from item where item_name like '____';
select * from item where sel_price between 500 and 3000;
select * from item where reg_date between '2008/04/28' and '2009/09/11';
select * from item where sel_price in (500, 790, 1000);

select count (*) from item;
select sum (sel_price) from item;

select pur_price, count (*)
from item 
where category_id = 1
group by pur_price;

select pur_price, sum(sel_price)
from item
group by pur_price;

select pur_price, sel_price, count(*)
from item
group by pur_price, sel_price;

select category_id, count(*) from item
group by category_id
having count(*) = 2;

select * from item order by sel_price desc;
select * from item order by reg_date;

CREATE TABLE shop_item 
(shop_id CHAR(4) NOT NULL, 
 shop_name VARCHAR2(200) NOT NULL, 
 item_id CHAR(4) NOT NULL, 
 quantity NUMBER NOT NULL, 
 PRIMARY KEY (shop_id, item_id)); 

 INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000A','東京','0001',30); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000A','東京','0002',50); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000B','仙台','0002',30); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000B','仙台','0006',10); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000C','大阪','0003',20); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000C','大阪','0007',70); 
INSERT INTO shop_item (shop_id,shop_name,item_id,quantity) VALUES  
('000D','福岡','0001',50); 

COMMIT; 

SELECT * FROM shop_item;

select * from shop_item si inner join item it on si.item_id = it.item_id;

