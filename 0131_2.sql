
select - �˻� => ��� ���̺�� ���´� 
����) select [* | distinct ] columnnames ...
     from tablenames
    where condition
    group by columnnames
    having condition (group by �� ���̿����� ������) 
    order by columnnames [ASC=���� |DESC]
    **ASC = ���� = ��������, DESC = ��������
    
    select bookname, price from book3;
    
    select * from book3;
    
    select distinct publisher from book3; 
    
     **��Ī��� : �Ӽ��� as ��Ī || �Ӽ��� ��Ī -> �����Ӽ��� �ȹٲ�
     select bookname as ������, price as ���� from book;
     
     --book table �� å�̸�, ����, customer �̸��� �ּ� �˻��ϴ� �ڵ�
     select book.bookname, book.price, customer.name, customer.address from book, customer;
     
     ** ��Ī ��� --   ���̺� as ����ϸ� �����߻� 
        select b.bookname, b.price, c.name, c.address from book  b, customer c;
        
        --���� �Ӽ��� ��굵 ���� 
    -�Ͽ��� ���� 10%���� ���� ������
    select bookid, bookname, publisher, price * 0.9 as ���ΰ��� from book;
    - ��¥��굵����
    select custid, bookid, saleprice, orderdate, orderdate+10 �ݳ��� from orders;
    
    -- �������� ������ 
    1. �񱳿��� : = ���� <> �ٸ���  != �ٸ��� 
     select * from book where price <= 20000;
    select * from book where price between 10000 and 20000;
    select * from book where publisher in('�½�����','���ѹ̵��');
    select * from book where publisher not in('�½�����','���ѹ̵��');
    
    2. pattern ; like, %--% �������ڴ�� // _ �ѱ��ڴ��
    �౸�� ���縦  ������ ���ǻ�, �౸�� �� å�� �� ���ǻ� �˻�
    select bookname, publisher from book where bookname like '�౸�� ����';
    select bookname, publisher from book where bookname like '%�౸%';  --�౸% // %�౸ �౸�� �����ϴ�, ������ 
    
    --�����̸��� ���� �ι�° ��ġ�� �� ��� ���ڿ��� ���� ����
    select bookname from book where bookname like '_��%';  
    select bookname from book where bookname like '%�౸%' and price>=20000;
    
    update orders set orderdate='2020/08/15' where orderid in(1,3,5,7,9);
    7���� �ڷḸ �˻�
    select * from orders where orderdate like '2020-07%';

   --����; order by
    select * from book order by bookname;  
    select * from book order by price, bookname;
    select * from book order by price DESC, publisher ASC; 
    
    
>> �Լ�  
  sum avg, max, min, count + (columnname), count(*)
--���� �ֹ��� ������ �� �Ǹž�
    select sum(saleprice) from orders ;
    select sum(saleprice) as �Ѹ��� from orders ;
--2���迬�� ���� �ֹ��� ������ �Ǹž�
select sum(saleprice) from orders where custid=2;
--���� �ֹ��� ������ �� �Ǹž�, ��� ���� �ְ� 
select sum(saleprice),avg(saleprice), max(saleprice), min(saleprice) from orders; 
--���� �Ǹ� �Ǽ� 
select count(*) from orders;
--2���迬�� ���� �ֹ��� �����Ǹ� �Ǽ�
select count(*) from orders where custid=2;

>> group by; �Ӽ����� ���� �ͳ��� ��Ƽ� �׷��� �����, �����Լ��� ��밡��
--������ �ֹ��� ������ �� ������ �� �Ǹž�
select custid, count(*) as ��������, sum(saleprice) as �Ѿ� from orders group by custid;
--���� �ֹ��� ������ �Ѽ���? �� �����̻� ������ ����
select custid, count(*) as �������� from orders group by custid having count(*)>=3;
--8000�� �̻� ������ ������ ��
select custid, count(*) as �������� from orders where saleprice>=8000 group by custid;
--8000�� �̻� ���������� ������ ���� �� ���� 2���̻� ������ ��
select custid, count(*) as �������� from orders where saleprice>=8000 group by custid having count(*)>=2;
  

  
  --�������� 
  ������ȣ�� 1�� ������ �̸�
  select bookname from book where bookid=1;
  ������ 20,000�� �̻��� ������ �̸�
   select bookname from book where price>=20000;
  ��� ���� �̸�, �ּ�
  select name, address from customer ;
  2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
  select orderid from orders where orderdate between '2020-07-04' and '2020-07-07';
  
  2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ 
   select orderid from orders where orderdate not between '2020-07-04' and '2020-07-07';
  ���� ���衯 ���� ���� �̸��� �ּ�
  select name, address from customer where name like '��%';
  ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
   select name, address from customer where name like '��%��';
  �������� ������ �Ѱ���
  select sum(saleprice) from orders where custid=1;
  �������� ������ �� ����
   select count(*) from orders where custid=1;
������ �Ѱ��� 
select count(*) from book;
select count(distinct publisher) from book;
    select sum(saleprice), avg(saleprice) from orders;

=============================================================


