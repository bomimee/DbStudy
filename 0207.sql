내장함수 : 출력 결과를 보기위해 오르클에서 제공하는 가상 테이블
1. 숫자 관련 내장함수
 1) 절대값 - ABS(num)
 select abs(-75), abs(75), abs(-3.14), abs(3.14) from dual;
 
 2) 올림 ceil(num) 자릿수 지정 없음, 소수점기준
 select ceil(-75.41),ceil(75.41),ceil(-75.61),ceil(75.61) from dual;
 
 3) 버림 floor(num) 자릿수 지정 없음, 소수점기준
 select floor (-75.41),floor(75.41),floor(-75.61),floor(75.61) from dual;
 
 4) 버림 : trunc(num, 자릿수) =>  소숫점 이하 잘림, 
 select trunc (-75.41),trunc(75.41),trunc(-75.61),trunc(75.61) from dual; 
 select trunc (-75.41,0),trunc(75.41,0),trunc(-75.61,0),trunc(75.61,0) from dual;
  select trunc (-75.41,1),trunc(75.41,1),trunc(-75.61,1),trunc(75.61,1) from dual; 
  select trunc (-75.41,-1),trunc(75.41,-1),trunc(-75.61,-1),trunc(75.61,-1) from dual; 
  
  5)반올림 : round(num, 자릿수)
  select round(-13.4441),round(13.4441),round(-13.5441),round(13.5441)from dual; 
   select round(-13.4441,1),round(13.4441,1),round(-13.5441,1),round(13.5441,1)from dual; 
   select round(-144.4441,-1),round(144.4441,-1),round(-145.5441,-1),round(145.5441,-1)from dual; 
   
6)power(숫자, 숫자) : 제곱근
select power(2,3),power(3,2) from dual;

7) sign(num) 음수면 -1 양수면 1
select sign(24),sign(-24),sign(24.12),sign(-24.56) from dual;
8) mod 
select mod(27,2), mod(27,3), mod(27,4), mod(27,5) from dual;

고객별 평균 주문 금액을 백원단위로 반올림한 값을 구하시오

select custid, round(avg(saleprice),-2)
from orders
group by custid;

문자함수
1.chr(아스키코드 숫자) ; 아스키코드 숫자를 받아서 문자로 표시
select chr(65),chr(97),chr(48) from dual;

2.concat(문자열, 문자열)
select concat('ict','개발원')from dual;

3.initcap(문자열); 첫글자 대문자, 나머지 소문자
4. lower(문자열) ; 모든 글자 소문자
5.upper(문자열) ; 모든글자 대문자
select initcap('koRea'), lower('KOREA'), upper('korea') from dual;

6.trim(문자열); 공백제거
ltrim(문자열) ;왼쪽공백제거 
rtrim(문자열) ;오른쪽공백제거
length(문자열) ; 길이 
select trim('   oracle xe 18  '), ltrim('   oracle xe 18  '), rtrim('   oracle xe 18  '), length('   oracle xe 18  ') from dual;

7.lpad(문자열, 자릿수, 왼쪽공백 메울문자) ;  자리가 남으면 채운다, 모자르면 잘린다
rpad(문자열, 자릿수, 오른쪽공백 메울문자)
select lpad('oracle xe 18',5,'@'), rpad('oracle xe 18',5,'@') from dual;
select lpad('oracle xe 18',30,'@'), rpad('oracle xe 18',30,'@') from dual;

8.substr(문자열, 시작위치, 갯수) ; 1 부터 시작, -는 오른쪽 출발
select substr('abcdefgh',2,4) from dual;  --bcde
select substr('abcdefgh',-5,4) from dual; --defg
select substr('abcdefgh',-2,4) from dual; --gh

9.replace(문자열, 변경할문자열, 변경문자)
select replace('ict 대한 민국 인재개발원', '대한', '大한') from dual;

10.ASCIT(아스키문자) ; 아스키 숫자로 나타냄
select ASCIT('A') from dual;

11. instr(문자열, 찾는문자열,[시작위치]); 문자열안에서 찾는문자의 위치 표시, 1부터
select instr('773938-3847573', '3') from dual ;
select instr('773938-3847573', '0',4) from dual ;
select instr('773938-3847573', '0', (instr('773938-3847573', '0')+1)) from dual ;
select instr('773938-3847573', '0', 1,1) 첫번째 from dual ;
select instr('773938-3847573', '0', 1,2) 두번째 from dual ;
select instr('773938-3847573', '0', 1,3) 세번째 from dual ;

도서 제목에 야구가 포함된 도서를 농구로 변경한 후 도서목록을 출력하자
select bookid, bookname, publisher, price, replace(bookname, '야구', '농구') from book;

굿스포츠에서 출판한 도서의 제목과 제목의 글자수를 확인하시오 
select bookname, length(bookname)
from book
where publisher = '굿스포츠';

고객중에서 같은 성을 가진 사람이 몇명이나 되는지 성별인원수를 구하시오
select substr(name, 1,1), count(*)
from customer
group by substr(name, 1,1)

====================================================
날짜 / 시간 함수
1.sysdate ; 시스템상의 오늘 날자 반환하는 인자 없는 함수
select sysdate, sysdate +10 from dual;
select substr(sysdate,0,10), sysdate +10 from dual;

2. to_date(문자열); 문자열 데이터를 날자형 데이터로 변경
select trunc(sysdate - to_date('2024-02-01')) from dual;

3. to_char(날자,날자형); 날자형 데이터를 문자형 데이터로 변경
select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_date('2024-02-01', 'yyyy-mm-dd')
from dual;

4. add months(date, num) 날자형의 날짜에서 지정한 달만큼 연산(1: next month, -1; last month)
select sysdate, add_months(sysdate, 4), add_months(sysdate, -4) from dual;

5.last_day(date) ; 해당달에 가장 마지막 날
select sysdate, last_day(sysdate) from dual;

6.next_day(date, day)
select sysdate, next_day(sysdate, '화요일') from dual;

7.기간구하기 ;months_between(enddate, startdate) ; 월단위
select months_between(sysdate, '2024-01-01') from dual;

주문일자로 부터 10일 후 매출을 확정한다. 각 주문의 확정일자
select orderid, orderdate, orderdate+10 from orders;

===============================================================

null 
1. is null
2. is not null
3. NVL(columnname, value) ;

select * from customer where phone is not null;

rownum ; 오라클 내부에서 생상되는 가상 컬럼, sql 조회 결과의 순번을 나타냄
select rownum, c.*
from (select * from customer) c;

 select * from ( 
            select rownum r_num, a.* 
            from (select * from bbs_t order by b_idx desc) a
        )  where r_num between #{begin} and #{end}  
    
    
    
    =================================================================
    
    View 가상테이블, 실제 메모리에 존재하지 않는다
    물리적으로 저장되어있는 테이블이 아니다 일반적인 사용자는 뷰를 만들수 없다
    뷰는 "select"가 목적이다
    여러 테이블을 하나로 합쳐서 하나의 뷰로 만들수있고 하나의 테이블을 이용해서 여러개뷰를 만들수있다
    
    뷰생성 
   1) create view name  => 같은 이름의 뷰가 존재하면 오류발생
    as select
    
    2) create or replace view name => 같은이름 뷰가 존재하면 덮어쓴다
    as select from tablename where
    
    뷰삭제
    drop view name
    
    1.주소에 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
    select * from customer where address like '%대한민국%';
    create view v_test01
    as select * from customer where address like '%대한민국%';
    
    select * from v_test01;
    
    2.order 테이블에서 고객번호를 고객이름, 도서번호를 도서명으로 수정해서뷰만들기
    select o.orderid, c.name, b.bookname, o.saleprice, substr(o.orderdate,0,10) 
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid
    order by o.orderid 
    
    create view v_order
    as select  o.orderid id, c.name name, b.bookname book, o.saleprice price, substr(o.orderdate,0,10) orderdate 
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid
    order by o.orderid 
    
    연습문제 
    1) 판매 가격이 2만 이상인 도서의 도서번호 도서이름 고객이름 출판사 판매가격을 보여주는 하이오더스 뷰 생성
    select b.bookid num, b.bookname book, c.name name, b.publisher pub., o.saleprice price
    from book b, customer c, orders o
    where c.saleprice >= 20000;
    
    create view highorders
    as   select b.bookid num, b.bookname book, c.name name, b.publisher pub, o.saleprice price
    from book b, customer c, orders o
    where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000;
    
    2) 생성한 뷰를 이용해서 판매된 도서 이름과 고객이름을 출력하는 sql 
    select book, name from highorders
    3) 뷰 변경 -  판매가격 속성을 삭제하는 명령 수행 후 2 번 다시 수행 => 삭제후 다시만들자 
    drop view highorders;
     
     create view highorders
    as   select b.bookid num, b.bookname book, c.name name, b.publisher pub
    from book b, customer c, orders o
    where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000;
    
    4) order table 에서 김연아가 구매한 도서들을 만원씩 더하자 (원본수정)
    update orders set saleprice = saleprice+ 10000 where custid=2;
    select * from v_order;
    
    인덱스 : 검색을 빨리하기 위해서 사용되는 비법
    
    ==========================================================================
    
    시퀀스 : 오라클에서 자동으로 고유 숫자값을 생성해주며, 주로 기본키에 이용된다
   시퀀스 생성
   create sequence name(=tablename_seq)
   increment by 1 
   start with 1
   minvalue 1
   maxvalue 9999
   nocycle  => max 도달시 시작값부터 다시반복
   nocache  => cache 사용여부
   noorder  => 요청 순서대로 값 생성 할지 여부 
   
   create sequence customer_seq
   increment by 1
   start with 6
   nocycle;
   
  보통 pk 가 숫자일때 시퀀스명.nextval 자동으로 숫자부여
   insert into customer(custid, name, address, phone)
   values(customer_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001')
   
    insert into customer(custid, name, address, phone)
   values(customer_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001')
   
   //book table sequence
   
   create sequence book_seq
   increment by 1
   start with 11
   nocycle;
   
   insert into book(bookid, bookname, publisher, price)
   values(book_seq.nextval, 'new philosophy', 'myphil', 15000)

   