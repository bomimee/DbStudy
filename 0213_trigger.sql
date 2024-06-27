트리거 ; 자동실행 기능
호출해서 사용되는 것이 아님
특정 이벤트가 발생하면 자동으로 실행됨
특정 이벤트란 insert update delete
자동실행에는 before after 중 하나 사용
형식_) 
  create trigger (name) before/after 
  (trigger event) on (target tabel name)
  [for each row] - 생략가능
  [when condition] - 생략가능
  begin
  end;
  
  ** for each row : 영향을 받는 각 행에 대해서 트리거를 실행시킬때 사용
  주의) insert  경우 입력되는 데이터가 :new 에 저장
        delete 경우 삭제되는 데이터를 :old 에 저장
        update 경우 변경전 데이터 :old, 변경 후  :new에저장
        begin ~ end 벗어나면  old, new 로 사용 (:X)
        
        
   select * from customer;     
 
 set serveroutput on;  
   -- 데이트 삽입시 삽입 성공 이라는 글자가 나오게 하자
   create trigger trigger_test1 after
   insert on customer 
   for each row
   begin 
    dbms_output.put_line(:new.name || '님 삽입성공');
   end;
   
   --1)실행
   insert into customer (custid, name, address, phone)
   values(customer_seq.nextval, 'V', 'Seoul', '010-000-0001');
   
   --2) 삭제
   drop trigger name;
     -- activate: alter trigger name enable;
     -- deactivate:  alter trigger name disable;

drop trigger trigger_test1;

--customer table insert =>> 삽입내용을 customer 2 에도 삽입하게
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

// book table 에서 삭제하면 씨북 테이블에 삭제된 내용이 삽입되게 하자
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