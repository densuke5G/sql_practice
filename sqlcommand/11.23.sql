--3.(1)
insert into dept values (01, 'システム企画本部', '東京都江東区豊洲3-3-3');
insert into dept values (02, 'ソリューション事業部', '神奈川県川崎市中原区上小田中 4-1-1');
insert into dept values (03, '営業部', '大阪府大阪市中央区城見 1-4-24');
insert into dept values (04, '総務部', NULL );

--3.(2)
insert into emp values (001, '鈴木 仁', NULL, '2000/01/01', 600000, 'PL', 01 ) ;
insert into emp values (002, '佐藤 幸助', '鈴木 仁', '2000/03/22', 350000, 'ブリッジ SE', 01);
insert into emp values (003, '高橋 ひとみ', NULL, '2000/01/01', 500000, 'PL', 02 );
insert into emp values (004, '大前 貢', '鈴木 仁', '2000/04/01', 320000, 'SE', 01);
insert into emp values (005, '真田 博之', '鈴木 仁', '2001/04/01', 300000, 'SE', 01 );
insert into emp values (006, '大城 勉', '鈴木 仁', '2001/04/01', 300000, 'SE', 01 );
insert into emp values (007, '神城 陣', '高橋 ひとみ', '2001/04/01', 280000, 'PG', 02 );
insert into emp values (008, '結城 瞳', '高橋 ひとみ', '2002/04/01', 280000, 'PG', 02 );
insert into emp values (009, '博多 弁', '高橋 ひとみ', '2003/04/01', 260000, 'PG', 02 );
insert into emp values (010, '小山 浩', '高橋 ひとみ', '2006/04/01', 180000, 'デザイナー', 02 );

commit;
--4.(1)
select * from dept;
select * from emp;
--4.(2)
select ename, superior, hiredate from emp;
--4.(3)
select ename as 社員名, superior as 上司, hiredate as 給与 from emp;
--4.(4)
select DISTINCT job from emp order by job desc;
--4.(5)
select * from dept where deptno = 2;
--4.(6)
select empno,ename, hiredate, job from emp where job = 'PG'

--5.(1)
update dept set dname = '人事部' where deptno = 4;
--5.(2)
update emp set superior = '鈴木 仁', sal = 290000, job = 'SE', deptno = 01 where empno = 008;

--6.(1)
delete from emp where empno = 006;

--7.(1)
insert into dept values (20, '経理部', 'Redmond, WA 98052-7329 USA');
insert into dept values (21, '水産食品開発部', NULL );
insert into dept values (22, '食品総合研究所', NULL);
rollback;
--7.(2)
insert into dept values (20, '経理部', 'Redmond, WA 98052-7329 USA');
savepoint point1;
insert into dept values (21, '水産食品開発部', NULL );
insert into dept values (22, '食品総合研究所', NULL);
rollback to point1;
commit;

--8(1)
select ename, superior from emp where superior is not null;
--8(2)
select ename, sal, job from emp where sal <= 300000;
--8(3)
select ename, job, deptno from emp where job = 'SE' and deptno = 01;
--8(4)
select ename, job, deptno from emp where job = 'PL' or deptno = 01;
--8(5)
select empno, ename from emp where ename like '%城%';
--8(6)
select ename, hiredate from emp where hiredate between '2000/01/01' and '2001/12/31'; 

--9(1)
select count(*) as 行数 from emp;
--9(2)
select max(sal) as 最大値, min(sal) as 最小値, sum(sal) as 合計値 from emp;
--9(3)
select max(hiredate) as 入社日 from emp;

--10(1)
select job, count(*) as 行数 from emp group by job order by job desc;
--10(2)
select superior, count(*) as 行数 from emp where superior is not null group by superior;
--10(3)
select job, avg(sal) as 平均給与 from emp group by job order by job desc;