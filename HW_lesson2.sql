/* 2) �������� ���� ������ example, ���������� � ��� ������� users, ��������� �� ���� ��������, ��������� id � ���������� name */

create database if not exists example; -- ������� ��
show databases; -- ��������� � �������
 
use example; -- ������� ��������� �� ��� ������ �  ���
create table users (id int unsigned not null, name varchar(255)); -- ������� �������
show tables; -- ��������� ������� ��������� �������
describe users; -- ��������� ���������� �������

insert into users values (1, 'Anna');
insert into users values (2, 'Ivan'); -- �������� ���� ������� � �������
select * from users; -- ��������� �������

/* 3) �������� ���� ���� ������ example �� ����������� �������, ���������� ���������� ����� � ����� ���� ������ sample */

create database sample; -- ������� �� ��� ������������� �����
\q -- ����� �� mysql
mysqldump example > example.sql -- ������� ����
mysql sample < example.sql -- ���������� ���� � ��

mysql -- ��������� � �������
use sample; -- ������� ����, � ��� ���������� ����
show tables; 
select * from users; -- ���������, ��� �� ������������� �����

/* 4) �������� ���� ������������ ������� help_keyword ���� ������ mysql. ������ ��������� ����, ����� ���� �������� ������ ������ 100 ����� ������� */

create database keydump; -- ������� ������ �� ��� �������� �����
\q -- ����� �� �����, ����� ������ ����
mysqldump --where="true limit 100" mysql help_keyword > qwerty.sql -- ����������� 
mysql keydump < qwerty.sql
-- ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved tablespace 'mysql'
-- � �����������. �� ���������� (((