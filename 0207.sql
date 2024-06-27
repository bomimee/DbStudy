�����Լ� : ��� ����� �������� ����Ŭ���� �����ϴ� ���� ���̺�
1. ���� ���� �����Լ�
 1) ���밪 - ABS(num)
 select abs(-75), abs(75), abs(-3.14), abs(3.14) from dual;
 
 2) �ø� ceil(num) �ڸ��� ���� ����, �Ҽ�������
 select ceil(-75.41),ceil(75.41),ceil(-75.61),ceil(75.61) from dual;
 
 3) ���� floor(num) �ڸ��� ���� ����, �Ҽ�������
 select floor (-75.41),floor(75.41),floor(-75.61),floor(75.61) from dual;
 
 4) ���� : trunc(num, �ڸ���) =>  �Ҽ��� ���� �߸�, 
 select trunc (-75.41),trunc(75.41),trunc(-75.61),trunc(75.61) from dual; 
 select trunc (-75.41,0),trunc(75.41,0),trunc(-75.61,0),trunc(75.61,0) from dual;
  select trunc (-75.41,1),trunc(75.41,1),trunc(-75.61,1),trunc(75.61,1) from dual; 
  select trunc (-75.41,-1),trunc(75.41,-1),trunc(-75.61,-1),trunc(75.61,-1) from dual; 
  
  5)�ݿø� : round(num, �ڸ���)
  select round(-13.4441),round(13.4441),round(-13.5441),round(13.5441)from dual; 
   select round(-13.4441,1),round(13.4441,1),round(-13.5441,1),round(13.5441,1)from dual; 
   select round(-144.4441,-1),round(144.4441,-1),round(-145.5441,-1),round(145.5441,-1)from dual; 
   
6)power(����, ����) : ������
select power(2,3),power(3,2) from dual;

7) sign(num) ������ -1 ����� 1
select sign(24),sign(-24),sign(24.12),sign(-24.56) from dual;
8) mod 
select mod(27,2), mod(27,3), mod(27,4), mod(27,5) from dual;

���� ��� �ֹ� �ݾ��� ��������� �ݿø��� ���� ���Ͻÿ�

select custid, round(avg(saleprice),-2)
from orders
group by custid;

�����Լ�
1.chr(�ƽ�Ű�ڵ� ����) ; �ƽ�Ű�ڵ� ���ڸ� �޾Ƽ� ���ڷ� ǥ��
select chr(65),chr(97),chr(48) from dual;

2.concat(���ڿ�, ���ڿ�)
select concat('ict','���߿�')from dual;

3.initcap(���ڿ�); ù���� �빮��, ������ �ҹ���
4. lower(���ڿ�) ; ��� ���� �ҹ���
5.upper(���ڿ�) ; ������ �빮��
select initcap('koRea'), lower('KOREA'), upper('korea') from dual;

6.trim(���ڿ�); ��������
ltrim(���ڿ�) ;���ʰ������� 
rtrim(���ڿ�) ;�����ʰ�������
length(���ڿ�) ; ���� 
select trim('   oracle xe 18  '), ltrim('   oracle xe 18  '), rtrim('   oracle xe 18  '), length('   oracle xe 18  ') from dual;

7.lpad(���ڿ�, �ڸ���, ���ʰ��� �޿﹮��) ;  �ڸ��� ������ ä���, ���ڸ��� �߸���
rpad(���ڿ�, �ڸ���, �����ʰ��� �޿﹮��)
select lpad('oracle xe 18',5,'@'), rpad('oracle xe 18',5,'@') from dual;
select lpad('oracle xe 18',30,'@'), rpad('oracle xe 18',30,'@') from dual;

8.substr(���ڿ�, ������ġ, ����) ; 1 ���� ����, -�� ������ ���
select substr('abcdefgh',2,4) from dual;  --bcde
select substr('abcdefgh',-5,4) from dual; --defg
select substr('abcdefgh',-2,4) from dual; --gh

9.replace(���ڿ�, �����ҹ��ڿ�, ���湮��)
select replace('ict ���� �α� ���簳�߿�', '����', '����') from dual;

10.ASCIT(�ƽ�Ű����) ; �ƽ�Ű ���ڷ� ��Ÿ��
select ASCIT('A') from dual;

11. instr(���ڿ�, ã�¹��ڿ�,[������ġ]); ���ڿ��ȿ��� ã�¹����� ��ġ ǥ��, 1����
select instr('773938-3847573', '3') from dual ;
select instr('773938-3847573', '0',4) from dual ;
select instr('773938-3847573', '0', (instr('773938-3847573', '0')+1)) from dual ;
select instr('773938-3847573', '0', 1,1) ù��° from dual ;
select instr('773938-3847573', '0', 1,2) �ι�° from dual ;
select instr('773938-3847573', '0', 1,3) ����° from dual ;

���� ���� �߱��� ���Ե� ������ �󱸷� ������ �� ��������� �������
select bookid, bookname, publisher, price, replace(bookname, '�߱�', '��') from book;

�½��������� ������ ������ ����� ������ ���ڼ��� Ȯ���Ͻÿ� 
select bookname, length(bookname)
from book
where publisher = '�½�����';

���߿��� ���� ���� ���� ����� ����̳� �Ǵ��� �����ο����� ���Ͻÿ�
select substr(name, 1,1), count(*)
from customer
group by substr(name, 1,1)

====================================================
��¥ / �ð� �Լ�
1.sysdate ; �ý��ۻ��� ���� ���� ��ȯ�ϴ� ���� ���� �Լ�
select sysdate, sysdate +10 from dual;
select substr(sysdate,0,10), sysdate +10 from dual;

2. to_date(���ڿ�); ���ڿ� �����͸� ������ �����ͷ� ����
select trunc(sysdate - to_date('2024-02-01')) from dual;

3. to_char(����,������); ������ �����͸� ������ �����ͷ� ����
select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_date('2024-02-01', 'yyyy-mm-dd')
from dual;

4. add months(date, num) �������� ��¥���� ������ �޸�ŭ ����(1: next month, -1; last month)
select sysdate, add_months(sysdate, 4), add_months(sysdate, -4) from dual;

5.last_day(date) ; �ش�޿� ���� ������ ��
select sysdate, last_day(sysdate) from dual;

6.next_day(date, day)
select sysdate, next_day(sysdate, 'ȭ����') from dual;

7.�Ⱓ���ϱ� ;months_between(enddate, startdate) ; ������
select months_between(sysdate, '2024-01-01') from dual;

�ֹ����ڷ� ���� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ������
select orderid, orderdate, orderdate+10 from orders;

===============================================================

null 
1. is null
2. is not null
3. NVL(columnname, value) ;

select * from customer where phone is not null;

rownum ; ����Ŭ ���ο��� ����Ǵ� ���� �÷�, sql ��ȸ ����� ������ ��Ÿ��
select rownum, c.*
from (select * from customer) c;

 select * from ( 
            select rownum r_num, a.* 
            from (select * from bbs_t order by b_idx desc) a
        )  where r_num between #{begin} and #{end}  
    
    
    
    =================================================================
    
    View �������̺�, ���� �޸𸮿� �������� �ʴ´�
    ���������� ����Ǿ��ִ� ���̺��� �ƴϴ� �Ϲ����� ����ڴ� �並 ����� ����
    ��� "select"�� �����̴�
    ���� ���̺��� �ϳ��� ���ļ� �ϳ��� ��� ������ְ� �ϳ��� ���̺��� �̿��ؼ� �������並 ������ִ�
    
    ����� 
   1) create view name  => ���� �̸��� �䰡 �����ϸ� �����߻�
    as select
    
    2) create or replace view name => �����̸� �䰡 �����ϸ� �����
    as select from tablename where
    
    �����
    drop view name
    
    1.�ּҿ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�
    select * from customer where address like '%���ѹα�%';
    create view v_test01
    as select * from customer where address like '%���ѹα�%';
    
    select * from v_test01;
    
    2.order ���̺��� ����ȣ�� ���̸�, ������ȣ�� ���������� �����ؼ��丸���
    select o.orderid, c.name, b.bookname, o.saleprice, substr(o.orderdate,0,10) 
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid
    order by o.orderid 
    
    create view v_order
    as select  o.orderid id, c.name name, b.bookname book, o.saleprice price, substr(o.orderdate,0,10) orderdate 
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid
    order by o.orderid 
    
    �������� 
    1) �Ǹ� ������ 2�� �̻��� ������ ������ȣ �����̸� ���̸� ���ǻ� �ǸŰ����� �����ִ� ���̿����� �� ����
    select b.bookid num, b.bookname book, c.name name, b.publisher pub., o.saleprice price
    from book b, customer c, orders o
    where c.saleprice >= 20000;
    
    create view highorders
    as   select b.bookid num, b.bookname book, c.name name, b.publisher pub, o.saleprice price
    from book b, customer c, orders o
    where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000;
    
    2) ������ �並 �̿��ؼ� �Ǹŵ� ���� �̸��� ���̸��� ����ϴ� sql 
    select book, name from highorders
    3) �� ���� -  �ǸŰ��� �Ӽ��� �����ϴ� ��� ���� �� 2 �� �ٽ� ���� => ������ �ٽø����� 
    drop view highorders;
     
     create view highorders
    as   select b.bookid num, b.bookname book, c.name name, b.publisher pub
    from book b, customer c, orders o
    where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000;
    
    4) order table ���� �迬�ư� ������ �������� ������ ������ (��������)
    update orders set saleprice = saleprice+ 10000 where custid=2;
    select * from v_order;
    
    �ε��� : �˻��� �����ϱ� ���ؼ� ���Ǵ� ���
    
    ==========================================================================
    
    ������ : ����Ŭ���� �ڵ����� ���� ���ڰ��� �������ָ�, �ַ� �⺻Ű�� �̿�ȴ�
   ������ ����
   create sequence name(=tablename_seq)
   increment by 1 
   start with 1
   minvalue 1
   maxvalue 9999
   nocycle  => max ���޽� ���۰����� �ٽùݺ�
   nocache  => cache ��뿩��
   noorder  => ��û ������� �� ���� ���� ���� 
   
   create sequence customer_seq
   increment by 1
   start with 6
   nocycle;
   
  ���� pk �� �����϶� ��������.nextval �ڵ����� ���ںο�
   insert into customer(custid, name, address, phone)
   values(customer_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001')
   
    insert into customer(custid, name, address, phone)
   values(customer_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001')
   
   //book table sequence
   
   create sequence book_seq
   increment by 1
   start with 11
   nocycle;
   
   insert into book(bookid, bookname, publisher, price)
   values(book_seq.nextval, 'new philosophy', 'myphil', 15000)

   