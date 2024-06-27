   
   pl/sql 오라클에서 지원하는 프로그래밍 언어의 특성을 수용한 sql 의 확장
          SQL 쿼리문+ 제어문사용 , 절차적 프로그램이 가능하게한 오라클전용 언어
          
          1.프로시저 ; 일련의 쿼리를 마치하나의 함수처럼 실행하기 위한 쿼리의 집합
          1) 익명프로시져 - 일회용, 저장안됨
          2) 저장 프로시져- 저장됨, 나중에 호출가능
          
          -익명프로시져 형식) 
          declare 변수선언 ;
          begin SQL문장들
          end;
          
          1.i int := 0
          2.dbms_output.put_line(내용) ; set serveroutput on 실행해야됨
             ex) dbms_output.put_line(i || '는 i이다');  => || 는 plus (+ X)
             
        **if condition then sql명령문;
             end if;
             
             
             declare
             i number :=   10;
             hak varchar2(1) := 'A';
             begin
             if(i=10) then dbms_output.put_line('hak' || hak || '.');
             end if;
             end;
             
          *** if condition then sql명령문;
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
             
          *** if condition sql명령문;
             elsif condition sql명령문;
              elsif condition sql명령문;
               elsif condition sql명령문;
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
      
      ***반복문 (for, while, loop)
      1)for
      for 변수 in 초기값..최종값 loop 명령문;
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
  초기식;
  begin
  while condition loop
  명령문;
  증감식;
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
     declare 초기식;
     begin 
     loop 명령문; 증감식;
     exit when 조건식; 
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

배열
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

-저장프로시져 형식)
create [or replace] procedure name
as /or is
변수선언;
begin
명령문(update, insert, delete )
end;

//ex) 커스터머 테이블에서 아디가 2인 고객이름

create procedure c_name01 as 
begin 
update customer set name='손흥민' where custid =2;
end;

create procedure c_name02 as 
begin 
update customer set name='손흥민' where custid =2;
end;
drop procedure c_name02;

procedure 실행>> exec procedurename
exec c_name01;
select * from customer;


-- 외부에서 아이디와 이름을 받아서 테이블수정
--외부에서 정보를 받는것 => 인자, 매개변수 => in , out
--데이터 타입 모를때 => 테이블이름.컬럼명%type

create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type) as
begin
update customer set name =v_name where custid =v_custid;
end;
exec c_name02(1,'park');

--customer table '둘리' '대한민국방학동' '000-2000-0001'
create procedure p_cust01 as
begin 
insert into customer values(customer_seq.nextval,'둘리','대한민국방학동','000-2000-0001');
end;

exec p_cust01;

--customer table 외부 이름 주소 전화번호 받아 삽입 
create procedure p_cust02(p_name in customer.name%type,
p_address in customer.address%type,p_phone in customer.phone%type) as
begin 
insert into customer values(customer_seq.nextval,p_name,p_address,p_phone);
end;

exec p_cust02('둘리','대한민국방학동','000-2000-0001');

--custid 받고 삭제 프로시져 

create procedure p_cust03(p_custid in customer.custid%type) as
begin 
delete from customer where custid=p_custid;
end;
exec p_cust03(8);
exec p_cust03(9);
select * from customer;

-- begin~ end; 블록 안에서 사용되는 셀렉트문
select column
into variable
from tablename
where condition;
-> 결과가 하나 나오고 나온결과를 저장변수에 저장


   
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

exec p_book01('축구 바이블', '한빛아카데미',34000 );
exec p_book01('골프 바이블', '대한미디어', 44000);

>> 테이블 틀 복사 
create table book4 as select * from book where 1=0;

>> 시퀀스 만들기 
 create sequence book4_seq
   increment by 1
   start with 13
   nocycle;
   
>> 프로시져 생성
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
else dbms_output.put_line('id 존재안함');
end if;
end;

exec p_book02(45);
select * from book;
select * from book4;

--out이용해서 프로시져 결과 내보내기
-- book table 평균가격 반환하는 프로시져

 create procedure avg_price(avg_bookprice out number) as
 begin 
  select avg(price) into avg_bookprice
  from book where price is not null;
  end;
  
  --실행안됨
 -- exec avg_price();
 
 익명프로시저, 다른프로시져에서 호출
 declare
 aaa number;
 begin
 --미리만들어진 프로시져 호출
 avg_price(aaa);
  dbms_output.put_line('평균:'|| trunc(aaa));
 end;
 
 -책 이름 받아서 가격 출력
 create procedure bprice (bn in book.bookname%type) as
  bp book.price%type;
 begin
  select price into bp from book where bookname = bn;
  dbms_output.put_line('price:'|| bp);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found');
 end;
exec bprice('축구의 역사');

-- 프로시저 생성- 이름, 매개변수 설정  - 변수 선언
-- 프로시저 시작 매개변수에 맞는 이름을 찾아서 가격을 변수에 저장
-- 그 변수를 출력
-- 끝 


================================================================================