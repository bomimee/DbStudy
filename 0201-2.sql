 ���� : 2�� �̻��� ���̺��� ����ؼ� SQL�� �ۼ��ϴ� ��
       2�� �̻��� ���̺��� ��� �ϳ��� ����� ����� ���� ���
       
  1. ���� ���� (inner join) : �ܷ�Ű(FK)�� �̿��ϴ� ���
     select A���̺�.�÷���, A���̺�.�÷���, B���̺�.�÷���, B���̺�.�÷���
     from A���̺�, B���̺�
     where A���̺�.�÷��� = B���̺�.�÷���
     ** �� ���̺��� ��� ���� �÷��� ������ �ְ� �ش� �÷����� ���ǽ��� ���
     ** ������ ���̺��̸� ��Ī ���
       
      -- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
        select *
        from  customer, orders
        where customer.custid = orders.custid ;
        
      -- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
        select c.name , o.saleprice
        from  customer c, orders o
        where c.custid = o.custid ;

      -- ** ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
        select  c.name , count(*), sum(o.saleprice)
        from  customer c, orders o
        where c.custid = o.custid 
        group by c.name 
        order by c.name;
        
      -- ** ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
        select c.name,  b.bookname
        from customer c, orders o, book b
        where c.custid = o.custid and o.bookid = b.bookid ;

      -- ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
        select c.name,  b.bookname
        from customer c, orders o, book b
        where c.custid = o.custid and o.bookid = b.bookid and o.saleprice = 20000;

   2. �ܺ����� : left join, right join
      ����Ŭ���� LEFT OUTER JOIN�� �ƿ��� ����(�ܺ�����)���� ���� ���� ����ϴ� ��� �� �ϳ��̴�. 
      LEFT OUTER JOIN�� OUTER Ű���带 �����ϰ� LEFT JOIN���� ����ϱ⵵ �Ѵ�. 
      �ƿ��� ������ ������ ���̺� �����Ͱ� ��� ���� ���̺��� �����ʹ� ��� ��µǴ� ���� ����̴�.
      
      ����) select 
           from  �⺻���̺�
           left join �������̺�
             on �⺻���̺�.�÷� = �������̺�.�÷�
           where ����   
           
  -- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.    
    select c.name, o.saleprice
    from customer c
    left join orders o on c.custid = o.custid ;
    
        select c.name, o.saleprice
    from customer c, orders o
    where c.custid = o.custid ;  =>  ���� ������ ���� ���ݸ� ���� 
 =============================================================================   
create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'��');
insert into BBB values(2,'��');
insert into BBB values(4,'��');
insert into BBB values(5,'��');
commit;  

select *
from AAA a 
left join BBB b on a.id = b.id ;
      
select *
from BBB a 
left join AAA b on a.id = b.id ;      

-- �ش� ���̺���� ��� �����ϰ� �ִ� �� ( �����÷��� �ƴϸ�  null ä������.)       
select *
from AAA a full join BBB b on a.id = b.id ;

-- �ش� ���̺���� �����÷��� ������        
select *
from AAA a full join BBB b on a.id = b.id 
where a.id is null or b.id is null ;

=========================================================
�������� : ���������ȿ� ������ ���Ѵ�.
 - ������ ������ : ����� �� �� => ���� ���������� �񱳿����ڸ� ���
 - ������ ������ : ����� ���� �� => in, any, all, exists ; 

-- book ���̺��� ���� ��� ������ �̸� �˻�����.
  -- ���� ��� �ݾ� : 35000
   select max(price) from book ;
   select bookname from book where price = 35000 ;
   
   select bookname from book where price = (select max(price) from book) ;
   
   -- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ� 
    -- ���Ÿ� �� ���� ã�� (�ߺ�����)
      select distinct custid from orders ; -- 1,2,3,4
      
      select name from customer where custid = 1 ;
      select name from customer where custid = 2 ;
      select name from customer where custid = 3 ;
      select name from customer where custid = 4 ;
      
      select name from customer where custid in (1,2,3,4);
      
      -- subQuery
      select name from customer where custid in (select distinct custid from orders);
 
       -- join
      select distinct c.name
      from customer c, orders o
      where c.custid = o.custid;

     -- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�. 
       - ���� �̵�� ������ å ; 3,4
        select bookid from book where publisher = '���ѹ̵��' ;
       
       - orders ���̺��� bookid= 3, 4�� �ֹ��� custid�� ã�� : 1
        select custid  from orders where bookid in (3,4);
      
       - custid = 1�� ����� �̸� 
        select name from customer where custid = 1 ;
     
        -- subQuery
        select name from customer 
        where custid = (select custid  from orders 
                        where bookid in (select bookid from book where publisher = '���ѹ̵��')) ;
                        
        -- join
        select distinct c.name
        from orders o, customer c, book b
        where o.custid = c.custid  and b.bookid = o.bookid and b.publisher = '�̻�̵��';
     
     -- _���� ������ å�� ������ ���
         _���� ������ å : 1,2,3,7,8
          select * from book where bookname like '_��%'
          
         - bookid �� 1,2,3,7,8 �� custid�� ã�� (orders ���̺� ����)
          select distinct custid from orders where bookid in (1,2,3,7,8);
          
          - customer ���̺���  custid�� 1,3,4 �� ����̸�
          select name from customer where custid in ( 1,3,4);
          
     -- ��� ���� ���ݺ��� ��� �����̸� �� ���Ͻÿ�.
       - ��յ��� ���� : 14450
        select avg(price) from book;
        select bookname from book where price > 14450 ;

        select bookname from book where price > (select avg(price) from book);
        
       -- ������ UNION, ������ MINUS, ������ INTERSECT
       -- ��������: Oracle�� �������� MINUS�� ������ SQL ǥ�ؿ����� EXCEPT �� ���

           ��ü �� - �ֹ��� ��  = �ֹ����� ���� ��
       -- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�. (������)
         - ��ü ��
           select name, custid from customer ; 
           
         - �ֹ��� ��
           select distinct custid from orders ;
        
         - ��� 1    
          select name from customer
          minus
          select name from customer where custid in( select distinct custid from orders) ;
         
         - ��� 2  
         select name from customer
         minus
         select distinct name from customer c, orders o  where c.custid = o.custid ;

    === �������� ====
    -- join --
    (5) �������� ������ ������ ���ǻ� ��
       select count(distinct publisher)
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name = '������';
       
    (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
       select b.bookname, b.price, o.saleprice, b.price - o.saleprice as ���ι����ݾ�
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name = '������';
    
     (7) �������� �������� ���� ������ �̸�
       select bookname from book  -- ��ü ������
       minus                            -
       select b.bookname          -- �������� �� ������ 
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name like '������';
       
    -- subquery --
    (8) �ֹ����� ���� ���� �̸�(�μ����� ���)
       select name from customer
       where name NOT in (select name from customer c, orders o where c.custid = o.custid);
       
    (9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
        select sum(saleprice), avg(saleprice) from orders; 
    
    (10) ���� �̸��� ���� ���ž�
        select c.name, sum(saleprice)
        from customer c, orders o
        where c.custid = o.custid
        group by c.name;
        
    (11) ���� �̸��� ���� ������ ���� ���
       select c.name, b.bookname
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid ;
    
    (12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
         select b.bookname, b.publisher, b.price, o.saleprice
         from book b, orders o
         where  b.bookid = o.bookid and (b.price - o.saleprice) = (select  max(b.price - o.saleprice)
                                           from book b, orders o
                                            where b.bookid = o.bookid) ;
                                            
     (13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
        -- ������ �Ǹž� ���
            select avg(saleprice) from orders; -- 11800
       
        -- ���� ���� ���
         select c.name, avg(o.saleprice)
         from orders o, customer c
         where o.custid = c.custid
         group by c.name
         
         -- ���
         select c.name, avg(o.saleprice)
         from orders o, customer c
         where o.custid = c.custid
         group by c.name
         having avg(o.saleprice) > (select avg(saleprice) from orders) ; 





