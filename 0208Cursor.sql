function ���ν����� ���������� ���� �� ����
- ���ν����� �ٸ����� �Ϲݹ����� ȣ�Ⱑ��
- �Լ��� �ݵ�� ���� ���� ����ؾ���

function                   VS        procedure
** ����
create function name(_)         create procedure name(_)
return datatype                 as
as                              begin
begin                           end;                     
 ���๮;
end; 

** ���� ���
�Ϲ�SQL ������ ȣ�Ⱑ��           exec procedure name 


--EX) �Ǹŵ� ������ ���� ������ ����ϴ� �Լ�
-- ������ 30000 �̻��̸� 10%, 30000 �̸��̸� 5% 
--�ܺο��� ������ ���� 

create function fnc_interest(out_p in orders.saleprice%type)
return number
as
bookp number;
begin
if out_p>=30000 then bookp := out_p * 0.1;
else bookp := out_p*0.05;
end if;
return bookp;
end;

select o.*, fnc_interest(o.saleprice) as profit from orders o;
select * from orders;


--��¥�� �޾Ƽ� ��¥ ������ �����ϴ� �Լ� ex) 2024�� 1�� 2�� ����;
create function fnc_orderdate(f_date in orders.orderdate%type)
return varchar2
as
 v_date varchar2(50);
begin
 v_date := to_char(f_date, 'yyyy"��"mm"��"dd"��" day');
return v_date;
end;

select o.*, fnc_orderdate(o.orderdate) from orders o;

============================================================

Cursor : ������ ���̺��� �ѹ��� ���྿ ó���ϱ� ���ؼ� ���̺��� ���� ������� ����Ű�µ� ���
-�Ͻ��� Ŀ��; �ڵ����� ������ ����, �׸��� ������ ó�����ȴ�
����� Ŀ��; �������� �����ڿ� ���ؼ� ����, ��ħ, ������ ó���� �ȴ�

-Ŀ���� ���õ� Ű����
 - cursor name is cursor definition => create cursor
 - open name   => Ŀ�� ������
 - close name  => Ŀ�� ��� ��
 
  rowcount; ���Ǽ�
  isopen ; �Ͻ����϶� �׻� Ʈ�� / ������϶� ������ ������ �˾ƺ��� �����
  found ; ����� �Ѱ� �̻��̸� Ʈ��
  notfound ; ����� �ϳ��������� Ʈ��
  
  create procedure cursor_test
  as
   cursor cur is select bookname from book;
   b_name book.bookname%type
  begin
   open cur;
   loop 
    fetch cur into b_name;
    dbms_output.put_line(b_name);
    exit when cur%notfound;
    end loop;
    close cur;
  end;
  
  exec cursor_test;
  
  
    create procedure cursor_test2
  as
   cursor cur is select bookname, price from book;
   b_name book.bookname%type;
   b_price book.price%type;
  begin
   open cur;
   loop 
    fetch cur into b_name, b_price;
    dbms_output.put_line(b_name ||':'|| b_price);
    exit when cur%notfound;
    end loop;
    close cur;
  end;
  
  exec cursor_test2;
  
  --orders table ; >=20000 10% : 5% profit
  
  create procedure cursor_test3
  as
  cursor cur is select saleprice from orders;
  b_price orders.saleprice%type;
  res number;
  begin
   open cur;
    loop 
     fetch cur into b_price;
     if b_price >= 20000 then res := b_price *0.1;
     else res:=b_price *0.05;
     end if;
     dbms_output.put_line('price:'|| res);
    exit when cur%notfound;
    end loop;
    close cur;
    end;

exec cursor_test3;                