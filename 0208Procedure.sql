   
   pl/sql ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ sql �� Ȯ��
          SQL ������+ ������ , ������ ���α׷��� �����ϰ��� ����Ŭ���� ���
          
          1.���ν��� ; �Ϸ��� ������ ��ġ�ϳ��� �Լ�ó�� �����ϱ� ���� ������ ����
          1) �͸����ν��� - ��ȸ��, ����ȵ�
          2) ���� ���ν���- �����, ���߿� ȣ�Ⱑ��
          
          -�͸����ν��� ����) 
          declare �������� ;
          begin SQL�����
          end;
          
          1.i int := 0
          2.dbms_output.put_line(����) ; set serveroutput on �����ؾߵ�
             ex) dbms_output.put_line(i || '�� i�̴�');  => || �� plus (+ X)
             
        **if condition then sql��ɹ�;
             end if;
             
             
             declare
             i number :=   10;
             hak varchar2(1) := 'A';
             begin
             if(i=10) then dbms_output.put_line('hak' || hak || '.');
             end if;
             end;
             
          *** if condition then sql��ɹ�;
            else;
             end if;
             
             declare
             i number := 9;
             begin if mod(i, 2) = 0 then dbms_output.put_line('even');
             else dbms_output.put_line('odd');
             end if;
             end;
             
            declare
             i number := 9;
             res varchar2(50) := '';
             begin if mod(i, 2) = 0 then res := 'even';
             else res :='odd';
             end if;
             dbms_output.put_line('res='||res||'.');
             end;
             
          *** if condition sql��ɹ�;
             elsif condition sql��ɹ�;
              elsif condition sql��ɹ�;
               elsif condition sql��ɹ�;
     SET SERVEROUTPUT ON;
   
   //ex  
     declare
     i number :=75;
     res char(1);
     begin if i >= 90 then res:='A';
     elsif i>= 80  then res:='B';
      elsif i>= 70  then res:='C';
     else res:='D';
     end if;
      dbms_output.put_line('res='||res);
      end;
      
      ***�ݺ��� (for, while, loop)
      1)for
      for ���� in �ʱⰪ..������ loop ��ɹ�;
      end loop;
      
      // 1~ 10 
      declare 
      begin
      for cnt in 1..10 loop
      dbms_output.put_line('cnt =' || cnt);
      end loop;
      end;
      
      // 1 ~ 10  even
      declare
      begin for num in 1..10 loop
      if mod(num, 2)=0 then dbms_output.put_line('num =' || num);
      end if;
      end loop;
      end;
      
      // 1-10 sum even
    declare
     res number :=0 ;
      begin
    for num in 1..10 loop
      if mod(num, 2)=0 then res := res + num;
      end if;
      end loop;
      dbms_output.put_line('res =' || res ) ;
      end;
      
  
  *** while
  declare
  �ʱ��;
  begin
  while condition loop
  ��ɹ�;
  ������;
  end loop;
  end;
    
    declare 
    num number :=1;
    begin 
     while num <= 10 loop
     dbms_output.put_line('num =' || num);
     num :=num+1;
     end loop;
     end;
     
     declare 
     num number :=1;
     begin 
     while num<=10 loop
     if mod(num,2)=0 then  dbms_output.put_line('num =' || num);
     end if;
     num :=num+1;
     end loop;
     end;
     
     declare
         num number :=1;
         res number :=0;
     begin 
     while num<=10 loop
     if mod(num,2)=0 then res := res+num;
     end if;
     num :=num+1;
     end loop;
      dbms_output.put_line('res =' || res);
     end; 
     
     
     ** loop
     declare �ʱ��;
     begin 
     loop ��ɹ�; ������;
     exit when ���ǽ�; 
     end loop;
     end;
     
     declare
     num number :=1;
     begin
     loop dbms_output.put_line('num =' || num);
          num := num +1;
     exit when num =11;
     end loop;
     end;
     
     declare 
     num number :=1;
     begin
     loop 
     if mod(num,2)=0 then dbms_output.put_line('num =' || num);
     end if;
     num:= num+1;
     exit when num = 11;
     end loop;
     end;
     
          
     declare 
     num number :=1;
     res number :=0;
     begin
     loop 
     if mod(num,2)=0 then res := res+num;
     end if;
     num:= num+1;
     exit when num = 11;
     end loop;
      dbms_output.put_line('res =' ||  res);
     end;
     
     
     
=============================================================================

�迭
type name is varray(length) of type
ex) type arr is varray(5) of varchar2(50);
ex) type arr is varray(5) of number;

declare
type name_arr is varray(5) of varchar2(50);
type avg_arr is varray(5) of number;

names name_arr;
avgs avg_arr;
total number;

begin
names := name_arr('hong', 'park', 'kim', 'lee');
avgs := avg_arr(85.2, 89.0, 95.9,79.4);
total := names.count;
for i in 1..total loop
dbms_output.put_line('name : '||names(i));
dbms_output.put_line('avg : '||avgs(i));
end loop;
dbms_output.put_line('total number : '||total);
end;

=============================================================================

-�������ν��� ����)
create [or replace] procedure name
as /or is
��������;
begin
��ɹ�(update, insert, delete )
end;

//ex) Ŀ���͸� ���̺��� �Ƶ� 2�� ���̸�

create procedure c_name01 as 
begin 
update customer set name='�����' where custid =2;
end;

create procedure c_name02 as 
begin 
update customer set name='�����' where custid =2;
end;
drop procedure c_name02;

procedure ����>> exec procedurename
exec c_name01;
select * from customer;


-- �ܺο��� ���̵�� �̸��� �޾Ƽ� ���̺����
--�ܺο��� ������ �޴°� => ����, �Ű����� => in , out
--������ Ÿ�� �𸦶� => ���̺��̸�.�÷���%type

create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type) as
begin
update customer set name =v_name where custid =v_custid;
end;
exec c_name02(1,'park');

--customer table '�Ѹ�' '���ѹα����е�' '000-2000-0001'
create procedure p_cust01 as
begin 
insert into customer values(customer_seq.nextval,'�Ѹ�','���ѹα����е�','000-2000-0001');
end;

exec p_cust01;

--customer table �ܺ� �̸� �ּ� ��ȭ��ȣ �޾� ���� 
create procedure p_cust02(p_name in customer.name%type,
p_address in customer.address%type,p_phone in customer.phone%type) as
begin 
insert into customer values(customer_seq.nextval,p_name,p_address,p_phone);
end;

exec p_cust02('�Ѹ�','���ѹα����е�','000-2000-0001');

--custid �ް� ���� ���ν��� 

create procedure p_cust03(p_custid in customer.custid%type) as
begin 
delete from customer where custid=p_custid;
end;
exec p_cust03(8);
exec p_cust03(9);
select * from customer;

-- begin~ end; ��� �ȿ��� ���Ǵ� ����Ʈ��
select column
into variable
from tablename
where condition;
-> ����� �ϳ� ������ ���°���� ���庯���� ����


   
select * from book;

create procedure p_book01(b_bookname in book.bookname%type,b_publisher in book.publisher%type,
b_price in book.price%type) as 
cnt number :=0;
begin 
select count(*) into cnt from book where bookname=b_bookname and publisher =b_publisher;
if(cnt=0)then insert into book values(book_seq.nextval, b_bookname,b_publisher, b_price) ;
else update book set price = b_price where bookname = b_bookname and publisher = b_publisher;
end if;
end;
drop procedure  p_book02;

exec p_book01('�౸ ���̺�', '�Ѻ���ī����',34000 );
exec p_book01('���� ���̺�', '���ѹ̵��', 44000);

>> ���̺� Ʋ ���� 
create table book4 as select * from book where 1=0;

>> ������ ����� 
 create sequence book4_seq
   increment by 1
   start with 13
   nocycle;
   
>> ���ν��� ����
create procedure p_book02(b_bookid in book.bookid%type) as 
i_bookname book.bookname%type; 
i_publisher book.publisher%type; 
i_price book.price%type;
cnt number;
begin 
select count(*) into cnt 
from book where bookid=b_bookid;

if(cnt=1)then 
 select bookname, publisher, price into i_bookname, i_publisher, i_price 
 from book where bookid = b_bookid;
 
delete book where bookid = b_bookid ;
insert into book4 values(book4_seq.nextval, i_bookname, i_publisher, i_price) 
else dbms_output.put_line('id �������');
end if;
end;

exec p_book02(45);
select * from book;
select * from book4;

--out�̿��ؼ� ���ν��� ��� ��������
-- book table ��հ��� ��ȯ�ϴ� ���ν���

 create procedure avg_price(avg_bookprice out number) as
 begin 
  select avg(price) into avg_bookprice
  from book where price is not null;
  end;
  
  --����ȵ�
 -- exec avg_price();
 
 �͸����ν���, �ٸ����ν������� ȣ��
 declare
 aaa number;
 begin
 --�̸�������� ���ν��� ȣ��
 avg_price(aaa);
  dbms_output.put_line('���:'|| trunc(aaa));
 end;
 
 -å �̸� �޾Ƽ� ���� ���
 create procedure bprice (bn in book.bookname%type) as
  bp book.price%type;
 begin
  select price into bp from book where bookname = bn;
  dbms_output.put_line('price:'|| bp);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found');
 end;
exec bprice('�౸�� ����');

-- ���ν��� ����- �̸�, �Ű����� ����  - ���� ����
-- ���ν��� ���� �Ű������� �´� �̸��� ã�Ƽ� ������ ������ ����
-- �� ������ ���
-- �� 


================================================================================