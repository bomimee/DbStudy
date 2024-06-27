--���� �����Ҷ� �⺻Ű�� �ܷ�Ű�� �����ؾ��Ѵ�. 
--���̺� �����Ҷ� �ܷ�Ű �����ϴ� ��
-- constraint fk�� foreign key( �÷���)  references pk �� ��ġ�� ���̺��(�÷���)

create table book2(
bookid number not null primary key,
bookname varchar2(50),
publisher varchar2(50),
price number
);

create table customer2(
custid number not null primary key,
name varchar2(50),
address varchar2(100),
phone varchar2(50)
);

create table orders2(
orderid number not null primary key,
custid number,
bookid number,
saleprice number,
orderdate date,
constraint fk_custid foreign key(custid)  references customer2 (custid),
constraint fk_bookid foreign key(bookid)  references book2 (bookid)
);

insert into book2 (bookid, bookname, publisher, price) 
values(1,'�౸�� ����','�½�����',7000);
insert into book2 (bookid, bookname, publisher, price) 
values(2,'�౸ �ƴ� ����','������',13000);
insert into book2 (bookid, bookname, publisher, price) 
values(3,'�౸�� ����','���ѹ̵��',22000);
insert into book2 (bookid, bookname, publisher, price) 
values(4,'���� ���̺�','���ѹ̵��',35000);
insert into book2 (bookid, bookname, publisher, price) 
values(5,'�ǰ� ����','�½�����',8000);
insert into book2 (bookid, bookname, publisher, price) 
values(6,'���� �ܰ躰���','�½�����',6000);
insert into book2 (bookid, bookname, publisher, price) 
values(7,'�߱��� �߾�','�̻�̵��',20000);
insert into book2 (bookid, bookname, publisher, price) 
values(8,'�߱��� ��Ź��','�̻�̵��',13000);
insert into book2 (bookid, bookname, publisher, price) 
values(9,'�ø����̾߱�','�Ｚ��',7500);
insert into book2 (bookid, bookname, publisher, price) 
values(10,'Olympic Champions','Pearson',13000);

insert into customer2 (custid, name, address, phone) 
values(1,'������','���� ��ü����','000-5000-0001');
insert into customer2 (custid, name, address, phone) 
values(2,'�迬��','���ѹα� ����','000-6000-0001');
insert into customer2 (custid, name, address, phone) 
values(3,'��̶�','���ѹα� ������','000-7000-0001');
insert into customer2 (custid, name, address, phone) 
values(4,'�߽ż�','�̱� Ŭ������','000-8000-0001');
insert into customer2 (custid, name, address, phone) 
values(5,'�ڼ���','���ѹα� ����',null);

insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(1,1,1,6000,'2020/07/01');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(2,1,3,21000,'2020/07/03');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(3,2,5,8000,'2020/07/03');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(4,3,6,6000,'2020/07/04');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(5,4,7,20000,'2020/07/05');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(6,1,2,12000,'2020/07/07');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(7,4,8,13000,'2020/07/07');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(8,3,10,12000,'2020/07/08');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(9,2,10,7000,'2020/07/09');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(10,3,8,13000,'2020/07/10');

*�ܷ�Ű ���� �� ���� (���Ἲ �������� ����)
** �ڽ����̺��� ������� ���� �����ϳ�,
�θ����̺��� ������� �����Ҽ� ����
**�ڽ����̺��� �������� ������ ���� ����.

 ===  �������� ===
(1) ���ο� ���� (�������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �԰�Ǿ���. 
     ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
     -- �⺻Ű ������ ���¿��� ���� 
     insert into book2 values(null,'������ ����', '���ѹ̵��', 10000);

(2) ���Ｚ�硯���� ������ ������ �����ؾ� �Ѵ�.
delete from book2 where publisher='�Ｚ��';

(3) ���̻�̵����� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
delete from book2 where publisher='�̻�̵��';

(4) ���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲپ���.
update book2 set publisher='�������ǻ�' where publisher='���ѹ̵��';

*�ܷ�Ű ������ ���� - ���Ἲ���� ���� ����
- �ڽ����̺�(�ܷ�Ű�����ִ� ���̺�) ���� �����Ҷ� �����ϴ� �θ����̺��� �÷������� �߿��� �����ؾߵȴ�

orders2 ���̺� ������ ����
1) orderid = 11 �� ������ *custid=1 �� ���� ���̺� å�� 35000�� �ְ� 7/12 ���� (���԰���)
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(11,1,4,35000,'2020/07/12');

2) ���� - �θ�Ű ��� �ȵ� (bookid= 11 �� �������� ����_)
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(12,5,11,25000,'2020/07/12');

���̺� ���� ����� ���� ���¿��� �⺻Ű�� �ܷ�Ű�� �־��
-�⺻�� ���̺���� �����Ϳ� �Բ� ����
create table book3 as select * from book;
create table customer3 as select * from customer;
create table orders3 as select * from orders;

--�⺻Ű�� ���� �־��  ( alter table name add primary key(�÷���))
alter table book3 add primary key(bookid);
alter table customer3 add primary key(custid);
alter table orders3 add primary key(orderid);

--�ܷ�Ű�� �־��
alter table orders3 add constraint fk_custid3 foreign key(custid)  references customer3 (custid);
alter table orders3 add constraint fk_bookid3 foreign key(bookid)  references book3 (bookid);