--�������� ���

create user c##bomv identified by 1111;

--���Ѻο� :grant connect, resource, dba to c##bomv;

grant connect, resource, dba to c##bomv;

1.SQL (Structured Query Language) ����ȭ�Ⱦ��
: �����ͺ��̽����� �����͸� �����ϰ� �����ϴµ� ���Ǵ� ������ó�����

1-1. ������ ���Ǿ� (DDL) : �����ͺ��̽� ��ü���� �����ϴ°� 
 (�����ͺ��̽� ��ü: ���̺�, ��, �ε���, ������ ��)
 create : ���ο� �����ͺ��̽� ��ü����
 ex) create table (create ��ü)
 drop :������ �����ͺ��̽� ��ü ����
 alter: ������ �����ͺ��̽� ��ü ������
 
 1-2. ������ ���۾� (DML) : ������ ��ü�� ����, ����, ����, �˻��Ҷ� ���
 insert : ������ (��=Ʃ��=���ڵ�) ����(����)
 delete:  ������ (��=Ʃ��=���ڵ�) ����
 update : ������(��=Ʃ��=���ڵ�) ����/����
 select: ������(��=Ʃ��=���ڵ�) �˻�
 
 1-3. ����������� (DCL) : db�� �����ϰ� ��ü���� ����ϵ��� ������ �ο�, �����ϴ� ��ɾ�
 grant : ���� �ο�
 revoke : ��������
 commit: ���� DB ���� ����
 rollback: ������� ���� ����� ������ ����ϰ� ������·� �ǵ���
 �������(commit ����)  -1����, -2���� => rollback �ϸ� ������·� �ǵ��ư���(commit����)
 
 1.create table
 1-1. �⺻Ű �ϳ��� ����
 create table ���̺��̸� ( 
 �Ӽ��̸� ������Ÿ��, not null primary key,
 �Ӽ��̸� ������Ÿ��,
  �Ӽ��̸� ������Ÿ��,
 );
 
1- 2. �⺻Ű ������ ��������
create table ���̺��̸�(
�Ӽ��̸� ������Ÿ��,
 �Ӽ��̸� ������Ÿ��,
  �Ӽ��̸� ������Ÿ��,
  primary key (�Ӽ��̸� = ���ο� ���� �ƴ϶� ���� �����ϴ� �Ӽ��̸�)
 );
 create table ���̺��̸�(
�Ӽ��̸� ������Ÿ��,
 �Ӽ��̸� ������Ÿ��,
  �Ӽ��̸� ������Ÿ��,
  primary key (�Ӽ��̸�,�Ӽ��̸�)
 );
 
2. ����Ŭ ������Ÿ��
2- 1.���ڿ� : ���� ��ҹ���,���� => 1byte, ���������� ������ ���� =>3byte
  varchar2(ũ��); ��������, 4000byte���� ����
 char (ũ��) ; ��������. 2000 byte ���� ����
  clob (ũ��) ; ��뷮 �׽�Ʈ �ִ� 4GB
  long (ũ��) ; 2GB
  
 2- 2.����
  number() :
   number(4) :  ���� 4�ڸ�
   number(4, 2) : ��ü 4�ڸ� ���� �ڿ� �Ҽ��� 2�� (~99.99 )
   
2-3.��¥ : ���ڿ��� ��¥�� ������ ������ '' ���
���ڿ� ��¥�� ���갡�� (+, -)
 date ; ������ ������ ��ȿ�� ��¥-�ð� ������ �����ϴµ� ���
 date('2024/01/30')
 timestamp : �⺻ �������� Ȯ���� �ڷ���,
 ** sysdate ���� �ý��۳�¥�� �Է�
 
 2-4.�׷���, �̹���, �������� �����ʹ� BLOB(������뷮 ��ü) �ַλ��(���ǻ�����)
 
 3. ����Ŭ ���̺� ���� �� ���� ����
 -not null : �ش� �Ӽ��� �����͸� �����Ҷ� �ݵ�� ä���� �ȴ�.
 -unique : �ش� �÷� �Ǵ� �÷� ���հ��� �����ϵ��� �Ѵ� (�ߺ�x)
 -primary key ; �⺻Ű(�� ���� �ĺ��� �� �ִ� Ű)
 -default ; �⺻���� �����ϴ� Ű����
        ex)  ������ number default 0=> ���� �Է����� ������ 0
-check: Ư�� �Ӽ��� ���� �������� �����ϴ� ��
 ex) ���� number(3) check>=19 => 19 �̻��� ���ڸ� ����
    ��� number check (��� >= 0 and ��� <=1000) => ��� ���ڸ� 0~1000����
    
    4.���̺����
    drop ���̺�(��ü) �̸� => �����Ͱ� �־ �����Ǵϱ� �����Ұ�
    
    5.���̺� �������� - �÷� �߰�(add �÷��� �ڷ���(ũ��)[��������])
                   - ����(drop column �÷���) -> ������ �վ ������, 
                   ������ �Ӽ��� �����ϴ� �ٸ��Ӽ��� ������ �����ȵ�
                   - �÷����� (modify �÷��� �ڷ��� (ũ��) [��������])
                   ���̺� ���� ��ɾ� ���� desc ���̺��̸�
                   **�����Ͱ� ���� ��� �÷��� �ڷ����� ũ�� ���氡��
                   **�����Ͱ��ִ°�� ���� �ڷ������� ũ�⺯ȭ ���������� ������ ũ�⺸�� �� Ŀ���Ѵ�
                   **�ٸ��ڷ������� ������ ���) ����õ
    ���� ) alter table ���̺��̸� + 
    
    6.���̺� ���� (Ű�� ����ȵ�)
    -������ �����͸� ��� �����ϴ� ���
    create table �����̺��̸� as select * from �����ҿ������̺��̸�
    -������ ����
    create table �����̺��̸� as select * from �����ҿ������̺��̸� where 1=0;
    
    7. Ʃ��(���ڵ�=��)����
     ���1) insert into ���̺��̸�(�÷���1,�÷���2,�÷���3,�÷���4) values(��1,2,3,4)
     **�÷���� �����͸� 1:1��Ī
     **�÷��� �Է½� �ݵ�� �������� not null�� �����÷� �־�����Ѵ�
     ��) newbook �� 1,'�౸������','',  
     
     ���2) insert into ���̺��̸�  values(��1,2,3,4)
     ** �ش� ���̺��� ��� �÷��� ���� �����͸� �־�����Ѵ�
     
      ���3) �Ϻε����͸� �������մ�.( �ݵ�� not null �� �־���Ѵ�) 
      ** ���� ������� 1:1 ��Ī�� ���ϰ� not null�� ������ �ȴ�
      insert into newbook( bookname, publisher, bookid,) values('�౸������','���ѹ̵��',3);
      
      ���4) ������ ���� ��� null �� ��ü >>  insert into newbook values(4,'�������̺�',null,13000,null); 
      
      
create table newbook1(
bookid number not null primary key, 
bookname varchar2(50),
publisher varchar2(50),
price number
);
create table newbook2(
bookid number, 
bookname varchar2(50),
publisher varchar2(50),
price number,
primary key (bookid)
);

--����
create table newbook3(
idx number not null primary key,
bookid number not null primary key, 
bookname varchar2(50),
publisher varchar2(50),
price number
);

--����
create table newbook4(
idx number,
bookid number, 
bookname varchar2(50),
publisher varchar2(50),
price number,
primary key (idx, bookid)
);


�����̺��� ���ڷḦ ���� new table 5�����
��������- bookname null�� ����������. => not null
publisher�� ���� ���� ������ �ȵȴ�. => unique
price �� ���� �Էµ��� ������ �⺻�� 10000�Է� =>  default 10000
sal_price �ּҰ��� 1000�̻� => check(sal_price > 1000)

create table newbook5(
idx number not null,
bookid number not null, 
bookname varchar2(50) not null,
publisher varchar2(50)unique,
price number  default 10000,
sal_price number check(sal_price > 1000),
primary key (idx, bookid)
);

drop table newbook2;
drop table newbook4;

desc newbook;

alter table newbook add addr varchar2(50);
alter table newbook drop column addr;

alter table newbook modify addr number(7);

create table newnewbook as select * from newbook;
create table newnewnewbook as select * from newbook where 1=0;
insert into newbook (bookid, bookname, publisher, price,addr) 
values(1,'�౸�ǿ���','�½�����',7000,1);

insert into newbook values(2,'�౸�ƴ� ����','������', 13000,1);

insert into newbook(bookname, publisher, bookid) values('�౸������','���ѹ̵��',3);

insert into newbook values(4,'�������̺�',null,13000,null);

**���̺��� + �����ͺ���>> 
create table copybook as select * from newbook;
**���̺���
create table copybook2 as select * from newbook where 1 = 0;

** �÷����� ; ������ �ִ°�� �����ڷ������� ����
alter table copybook modify bookname varchar2(100);  // ����ũ�⺸�� ũ��
alter table copybook modify publisher varchar2(30);    // ����ũ�⺸�� �۰� -> ��������
alter table copybook modify publisher varchar2(10); // ���� ���� �ȿ��ִ� �����Ϳ뷮�� ��ŭ 
** �÷����� ; �����Ͱ� �ִ� ��� �ٸ� �ڷ������� ���� (���� -> ����)
alter table copybook modify addr varchar2(50);

8.commit ���� ���¸� db�� �״�� ����
9.rollback commit ���� ������ ������ ������ ������ commit �ѻ��·� ���ư� 

10.Update�� : Ư���Ӽ� ���� �����ϴ� ��ɾ�
�⺻���� - update tablename
          set �Ӽ��̸�1=��1 [,�Ӽ��̸�2=��2, �Ӽ��̸�3=��3,...]
          [where ���ǽ� ;]
          **������ ������ �ش� �÷��� ��� �����Ͱ� ����� 
          --ex)1.customer ���̺��� ����ȣ�� 5�� �� �ּҸ� ���ѹα� �λ����� ����
        --ex)2.customer ���̺��� �迬�� ���ּҸ� ���ѹα� �������� ����
        --ex)3. book ���̺��� ���ǻ簡 ���ѹ̵��-> �������ǻ� ����
        --ex)4.customer ���̺��� �߽ż��� �ּҸ� '���ѹα���⵵' �׸��� ����ȣ�� '000-1111-9999'
        update customer set address='���ѹα� �λ�' where custid=5;
           update customer set address='���ѹα� ����' where name='�迬��';
            update book set publisher='�������ǻ�' where publisher='���ѹ̵��';
            update customer set address='���ѹα� ��⵵', phone='000-1111-9999' where name='�߽ż�';
11.delete ���̺� �ִ� ���� Ʃ���� �����ϴ� ���
�⺻����; delete from tablename [where ;]
** ���ǽ� ������ �ش� �÷��� �ش� ���̺��� ��� ������ ������ 
 ex1) customer table delete all
 delete from customer;
 
 ex2) ��� ������ ���� Ȯ�� �� rollback 
 rollback;
 ex3) customer table ����ȣ 5 ����
 delete from customer where custid=5;
 ex4) ���� Ȯ�� �� rollback
 
 ===  �������� ===
(1) ���ο� ���� (�������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �԰�Ǿ���. 
     ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
     -- ���� ���������� ���� ���¿��� ���԰���--
     insert into book values(null,'������ ����', '���ѹ̵��', 10000);

(2) ���Ｚ�硯���� ������ ������ �����ؾ� �Ѵ�.
delete from book where publisher='�Ｚ��';

(3) ���̻�̵����� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
delete from book where publisher='�̼��̵��';

(4) ���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲپ���.
update book set publisher='�������ǻ�' where publisher='���ѹ̵��';

 

create table orders(
orderid number,
custid number,
bookid number,
saleprice number,
orderdate date
);
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(1,1,1,6000,'2020/07/01');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(2,1,3,21000,'2020/07/03');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(3,2,5,8000,'2020/07/03');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(4,3,6,6000,'2020/07/04');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(5,4,7,20000,'2020/07/05');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(6,1,2,12000,'2020/07/07');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(7,4,8,13000,'2020/07/07');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(8,3,10,12000,'2020/07/08');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(9,2,10,7000,'2020/07/09');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(10,3,8,13000,'2020/07/10');

create table book(
bookid number,
bookname varchar2(50),
publisher varchar2(50),
price number
);

insert into book (bookid, bookname, publisher, price) 
values(1,'�౸�� ����','�½�����',7000);
insert into book (bookid, bookname, publisher, price) 
values(2,'�౸ �ƴ� ����','������',13000);
insert into book (bookid, bookname, publisher, price) 
values(3,'�౸�� ����','���ѹ̵��',22000);
insert into book (bookid, bookname, publisher, price) 
values(4,'���� ���̺�','���ѹ̵��',35000);
insert into book (bookid, bookname, publisher, price) 
values(5,'�ǰ� ����','�½�����',8000);
insert into book (bookid, bookname, publisher, price) 
values(6,'���� �ܰ躰���','�½�����',6000);
insert into book (bookid, bookname, publisher, price) 
values(7,'�߱��� �߾�','�̼��̵��',20000);
insert into book (bookid, bookname, publisher, price) 
values(8,'�߱��� ��Ź��','�̼��̵��',13000);
insert into book (bookid, bookname, publisher, price) 
values(9,'�ø����̾߱�','�Ｚ��',7500);
insert into book (bookid, bookname, publisher, price) 
values(10,'Olympic Champions','Pearson',13000);

create table customer(
custid number,
name varchar2(50),
address varchar2(100),
phone varchar2(50)
);
insert into customer (custid, name, address, phone) 
values(1,'������','���� ��ü����','000-5000-0001');
insert into customer (custid, name, address, phone) 
values(2,'�迬��','���ѹα� ����','000-6000-0001');
insert into customer (custid, name, address, phone) 
values(3,'��̶�','���ѹα� ������','000-7000-0001');
insert into customer (custid, name, address, phone) 
values(4,'�߽ż�','�̱� Ŭ������','000-8000-0001');
insert into customer (custid, name, address, phone) 
values(5,'�ڼ���','���ѹα� ����',null);


