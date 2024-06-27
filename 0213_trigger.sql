Ʈ���� ; �ڵ����� ���
ȣ���ؼ� ���Ǵ� ���� �ƴ�
Ư�� �̺�Ʈ�� �߻��ϸ� �ڵ����� �����
Ư�� �̺�Ʈ�� insert update delete
�ڵ����࿡�� before after �� �ϳ� ���
����_) 
  create trigger (name) before/after 
  (trigger event) on (target tabel name)
  [for each row] - ��������
  [when condition] - ��������
  begin
  end;
  
  ** for each row : ������ �޴� �� �࿡ ���ؼ� Ʈ���Ÿ� �����ų�� ���
  ����) insert  ��� �ԷµǴ� �����Ͱ� :new �� ����
        delete ��� �����Ǵ� �����͸� :old �� ����
        update ��� ������ ������ :old, ���� ��  :new������
        begin ~ end �����  old, new �� ��� (:X)
        
        
   select * from customer;     
 
 set serveroutput on;  
   -- ����Ʈ ���Խ� ���� ���� �̶�� ���ڰ� ������ ����
   create trigger trigger_test1 after
   insert on customer 
   for each row
   begin 
    dbms_output.put_line(:new.name || '�� ���Լ���');
   end;
   
   --1)����
   insert into customer (custid, name, address, phone)
   values(customer_seq.nextval, 'V', 'Seoul', '010-000-0001');
   
   --2) ����
   drop trigger name;
     -- activate: alter trigger name enable;
     -- deactivate:  alter trigger name disable;

drop trigger trigger_test1;

--customer table insert =>> ���Գ����� customer 2 ���� �����ϰ�
create trigger trigger_test2 after
insert on customer
for each row
begin
 insert into customer2(custid, name, address, phone) values(:new.custid, :new.name, :new.address, :new.phone);
 dbms_output.put_line('customer 2 table insert complete');
end;

insert into customer(custid, name, address, phone) 
values(customer_seq.nextval, 'JK', 'Busan', '010-000-0002');
   
   //table structure copy
create table cbook as select * from book where 1=0;

// book table ���� �����ϸ� ���� ���̺� ������ ������ ���Եǰ� ����
create trigger trigger_test3 after
delete on book
for each row
begin
   insert into cbook(bookid, bookname, publisher, price)
   values(:old.bookid, :old.bookname, :old.publisher, :old.price);
end;

delete from book where bookid = 4;
select * from book;
select * from cbook;