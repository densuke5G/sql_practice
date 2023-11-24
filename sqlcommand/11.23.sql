--3.(1)
insert into dept values (01, '�V�X�e�����{��', '�����s�]����L�F3-3-3');
insert into dept values (02, '�\�����[�V�������ƕ�', '�_�ސ쌧���s������㏬�c�� 4-1-1');
insert into dept values (03, '�c�ƕ�', '���{���s������錩 1-4-24');
insert into dept values (04, '������', NULL );

--3.(2)
insert into emp values (001, '��� �m', NULL, '2000/01/01', 600000, 'PL', 01 ) ;
insert into emp values (002, '���� �K��', '��� �m', '2000/03/22', 350000, '�u���b�W SE', 01);
insert into emp values (003, '���� �ЂƂ�', NULL, '2000/01/01', 500000, 'PL', 02 );
insert into emp values (004, '��O �v', '��� �m', '2000/04/01', 320000, 'SE', 01);
insert into emp values (005, '�^�c ���V', '��� �m', '2001/04/01', 300000, 'SE', 01 );
insert into emp values (006, '��� ��', '��� �m', '2001/04/01', 300000, 'SE', 01 );
insert into emp values (007, '�_�� �w', '���� �ЂƂ�', '2001/04/01', 280000, 'PG', 02 );
insert into emp values (008, '���� ��', '���� �ЂƂ�', '2002/04/01', 280000, 'PG', 02 );
insert into emp values (009, '���� ��', '���� �ЂƂ�', '2003/04/01', 260000, 'PG', 02 );
insert into emp values (010, '���R �_', '���� �ЂƂ�', '2006/04/01', 180000, '�f�U�C�i�[', 02 );

commit;
--4.(1)
select * from dept;
select * from emp;
--4.(2)
select ename, superior, hiredate from emp;
--4.(3)
select ename as �Ј���, superior as ��i, hiredate as ���^ from emp;
--4.(4)
select DISTINCT job from emp order by job desc;
--4.(5)
select * from dept where deptno = 2;
--4.(6)
select empno,ename, hiredate, job from emp where job = 'PG'

--5.(1)
update dept set dname = '�l����' where deptno = 4;
--5.(2)
update emp set superior = '��� �m', sal = 290000, job = 'SE', deptno = 01 where empno = 008;

--6.(1)
delete from emp where empno = 006;

--7.(1)
insert into dept values (20, '�o����', 'Redmond, WA 98052-7329 USA');
insert into dept values (21, '���Y�H�i�J����', NULL );
insert into dept values (22, '�H�i����������', NULL);
rollback;
--7.(2)
insert into dept values (20, '�o����', 'Redmond, WA 98052-7329 USA');
savepoint point1;
insert into dept values (21, '���Y�H�i�J����', NULL );
insert into dept values (22, '�H�i����������', NULL);
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
select empno, ename from emp where ename like '%��%';
--8(6)
select ename, hiredate from emp where hiredate between '2000/01/01' and '2001/12/31'; 

--9(1)
select count(*) as �s�� from emp;
--9(2)
select max(sal) as �ő�l, min(sal) as �ŏ��l, sum(sal) as ���v�l from emp;
--9(3)
select max(hiredate) as ���Г� from emp;

--10(1)
select job, count(*) as �s�� from emp group by job order by job desc;
--10(2)
select superior, count(*) as �s�� from emp where superior is not null group by superior;
--10(3)
select job, avg(sal) as ���ϋ��^ from emp group by job order by job desc;