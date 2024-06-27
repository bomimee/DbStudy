function 프로시저와 마찬가지로 저장 후 실행
- 프로시저와 다른점은 일반문에서 호출가능
- 함수는 반드시 리턴 예약어를 사용해야함

function                   VS        procedure
** 형식
create function name(_)         create procedure name(_)
return datatype                 as
as                              begin
begin                           end;                     
 실행문;
end; 

** 실행 방법
일반SQL 문에서 호출가능           exec procedure name 


--EX) 판매된 도서에 대한 이익을 계산하는 함수
-- 가격이 30000 이상이면 10%, 30000 미만이면 5% 
--외부에서 가격을 받자 

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


--날짜를 받아서 날짜 형식을 변경하는 함수 ex) 2024년 1월 2일 요일;
create function fnc_orderdate(f_date in orders.orderdate%type)
return varchar2
as
 v_date varchar2(50);
begin
 v_date := to_char(f_date, 'yyyy"년"mm"월"dd"일" day');
return v_date;
end;

select o.*, fnc_orderdate(o.orderdate) from orders o;

============================================================

Cursor : 실행결과 테이블을 한번에 한행씩 처리하기 위해서 테이블의 행을 순서대로 가리키는데 사용
-암시적 커서; 자동으로 열림과 닫힘, 그리고 데이터 처리가된다
명시적 커서; 수동으로 개발자에 의해서 열림, 닫침, 데이터 처리가 된다

-커서와 관련된 키워드
 - cursor name is cursor definition => create cursor
 - open name   => 커서 사용시작
 - close name  => 커서 사용 끝
 
  rowcount; 행의수
  isopen ; 암시적일때 항상 트루 / 명시적일때 열림과 닫힘을 알아보는 예약어
  found ; 결과가 한개 이상이면 트루
  notfound ; 결과가 하나도없으면 트루
  
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