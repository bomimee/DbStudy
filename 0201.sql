
select - 검색 => 결과 테이블로 나온다 
형식) select [* | distinct ] columnnames ...
     from tablenames
    where condition
    group by columnnames
    having condition (group by 된 사이에서의 조건절) 
    order by columnnames [ASC=생략 |DESC]
    **ASC = 생략 = 오름차순, DESC = 내림차순
    
    select bookname, price from book3;
    
    select * from book3;
    
    select distinct publisher from book3; 
    
     **별칭사용 : 속성명 as 별칭 || 속성명 별칭 -> 원본속성명 안바뀜
     select bookname as 도서명, price as 정가 from book;
     
     --book table 에 책이름, 가격, customer 이름과 주소 검색하는 코딩
     select book.bookname, book.price, customer.name, customer.address from book, customer;
     
     ** 별칭 사용 --   테이블에 as 사용하면 오류발생 
        select b.bookname, b.price, c.name, c.address from book  b, customer c;
        
        --숫자 속성은 계산도 가능 
    -북에서 가격 10%할인 가격 구하자
    select bookid, bookname, publisher, price * 0.9 as 할인가격 from book;
    - 날짜계산도가능
    select custid, bookid, saleprice, orderdate, orderdate+10 반납일 from orders;
    
    -- 조건절이 있을때 
    1. 비교연산 : = 같다 <> 다르다  != 다르다 
     select * from book where price <= 20000;
    select * from book where price between 10000 and 20000;
    select * from book where publisher in('굿스포츠','대한미디어');
    select * from book where publisher not in('굿스포츠','대한미디어');
    
    2. pattern ; like, %--% 여러문자대신 // _ 한글자대신
    축구의 역사를  출판한 출판사, 축구가 들어간 책을 낸 출판사 검색
    select bookname, publisher from book where bookname like '축구의 역사';
    select bookname, publisher from book where bookname like '%축구%';  --축구% // %축구 축구로 시작하는, 끝나는 
    
    --도서이름의 왼쪽 두번째 위치에 구 라는 문자열을 갖는 도서
    select bookname from book where bookname like '_구%';  
    select bookname from book where bookname like '%축구%' and price>=20000;
    
    update orders set orderdate='2020/08/15' where orderid in(1,3,5,7,9);
    7월인 자료만 검색
    select * from orders where orderdate like '2020-07%';

   --정렬; order by
    select * from book order by bookname;  
    select * from book order by price, bookname;
    select * from book order by price DESC, publisher ASC; 
    
    
>> 함수  
  sum avg, max, min, count + (columnname), count(*)
--고객이 주문한 도서의 총 판매액
    select sum(saleprice) from orders ;
    select sum(saleprice) as 총매출 from orders ;
--2번김연아 고객이 주문한 도서의 판매액
select sum(saleprice) from orders where custid=2;
--고객이 주문한 도서의 총 판매액, 평균 최저 최고값 
select sum(saleprice),avg(saleprice), max(saleprice), min(saleprice) from orders; 
--도서 판매 건수 
select count(*) from orders;
--2번김연아 고객이 주문한 도서판매 건수
select count(*) from orders where custid=2;

>> group by; 속성값이 같은 것끼리 모아서 그룹을 만든다, 집합함수도 사용가능
--고객별로 주문한 도서의 총 수량과 총 판매액
select custid, count(*) as 도서수량, sum(saleprice) as 총액 from orders group by custid;
--고객별 주문한 도서의 총수량? 단 세권이상 구매한 고객만
select custid, count(*) as 도서수량 from orders group by custid having count(*)>=3;
--8000원 이상 도서를 구매한 고객
select custid, count(*) as 도서수량 from orders where saleprice>=8000 group by custid;
--8000원 이상 도서구매한 고객에서 도서 총 수량 2권이상 구매한 고객
select custid, count(*) as 도서수량 from orders where saleprice>=8000 group by custid having count(*)>=2;
  

  
  --연습문제 
  도서번호가 1인 도서의 이름
  select bookname from book where bookid=1;
  가격이 20,000원 이상인 도서의 이름
   select bookname from book where price>=20000;
  모든 고객의 이름, 주소
  select name, address from customer ;
  2014년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
  select orderid from orders where orderdate between '2020-07-04' and '2020-07-07';
  
  2014년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호 
   select orderid from orders where orderdate not between '2020-07-04' and '2020-07-07';
  성이 ‘김’ 씨인 고객의 이름과 주소
  select name, address from customer where name like '김%';
  성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
   select name, address from customer where name like '김%아';
  박지성이 구매한 총가격
  select sum(saleprice) from orders where custid=1;
  박지성이 구매한 총 갯수
   select count(*) from orders where custid=1;
도서의 총개수 
select count(*) from book;
select count(distinct publisher) from book;
    select sum(saleprice), avg(saleprice) from orders;

=============================================================


