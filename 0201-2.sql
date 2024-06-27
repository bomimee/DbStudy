 조인 : 2개 이상의 테이블을 사용해서 SQL를 작성하는 것
       2개 이상의 테이블을 묶어서 하나의 결과를 만들어 위한 방법
       
  1. 내부 조인 (inner join) : 외래키(FK)를 이용하는 방법
     select A테이블.컬럼명, A테이블.컬럼명, B테이블.컬럼명, B테이블.컬럼명
     from A테이블, B테이블
     where A테이블.컬럼명 = B테이블.컬럼명
     ** 두 테이블이 모두 같은 컬럼을 가지고 있고 해당 컬럼으로 조건식을 사용
     ** 보통은 테이블이름 별칭 사용
       
      -- 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
        select *
        from  customer, orders
        where customer.custid = orders.custid ;
        
      -- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
        select c.name , o.saleprice
        from  customer c, orders o
        where c.custid = o.custid ;

      -- ** 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
        select  c.name , count(*), sum(o.saleprice)
        from  customer c, orders o
        where c.custid = o.custid 
        group by c.name 
        order by c.name;
        
      -- ** 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
        select c.name,  b.bookname
        from customer c, orders o, book b
        where c.custid = o.custid and o.bookid = b.bookid ;

      -- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
        select c.name,  b.bookname
        from customer c, orders o, book b
        where c.custid = o.custid and o.bookid = b.bookid and o.saleprice = 20000;

   2. 외부조인 : left join, right join
      오라클에서 LEFT OUTER JOIN은 아우터 조인(외부조인)에서 가장 많이 사용하는 방법 중 하나이다. 
      LEFT OUTER JOIN은 OUTER 키워드를 생략하고 LEFT JOIN으로 사용하기도 한다. 
      아우터 조인은 조인할 테이블에 데이터가 없어도 기준 테이블의 데이터는 모두 출력되는 조인 방법이다.
      
      형식) select 
           from  기본테이블
           left join 조인테이블
             on 기본테이블.컬럼 = 조인테이블.컬럼
           where 조건   
           
  -- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.    
    select c.name, o.saleprice
    from customer c
    left join orders o on c.custid = o.custid ;
    
        select c.name, o.saleprice
    from customer c, orders o
    where c.custid = o.custid ;  =>  도서 구매한 고객과 가격만 나옴 
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

insert into BBB values(1,'가');
insert into BBB values(2,'나');
insert into BBB values(4,'라');
insert into BBB values(5,'마');
commit;  

select *
from AAA a 
left join BBB b on a.id = b.id ;
      
select *
from BBB a 
left join AAA b on a.id = b.id ;      

-- 해당 테이블들을 모두 포함하고 있는 것 ( 공통컬럼이 아니면  null 채워진다.)       
select *
from AAA a full join BBB b on a.id = b.id ;

-- 해당 테이블들을 공통컬럼을 제외한        
select *
from AAA a full join BBB b on a.id = b.id 
where a.id is null or b.id is null ;

=========================================================
서브쿼리 : 메인쿼리안에 쿼리를 말한다.
 - 단일행 연산자 : 결과가 한 줄 => 보통 메인쿼리는 비교연산자를 사용
 - 다중행 연산자 : 결과가 여러 줄 => in, any, all, exists ; 

-- book 테이블에서 가장 비싼 도서의 이름 검색하자.
  -- 가장 비싼 금액 : 35000
   select max(price) from book ;
   select bookname from book where price = 35000 ;
   
   select bookname from book where price = (select max(price) from book) ;
   
   -- 도서를 구매한 적이 있는 고객의 이름을 검색하시오 
    -- 구매를 한 고객을 찾자 (중복제거)
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

     -- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오. 
       - 대한 미디어 출판한 책 ; 3,4
        select bookid from book where publisher = '대한미디어' ;
       
       - orders 테이블에서 bookid= 3, 4를 주문한 custid를 찾자 : 1
        select custid  from orders where bookid in (3,4);
      
       - custid = 1인 사람의 이름 
        select name from customer where custid = 1 ;
     
        -- subQuery
        select name from customer 
        where custid = (select custid  from orders 
                        where bookid in (select bookid from book where publisher = '대한미디어')) ;
                        
        -- join
        select distinct c.name
        from orders o, customer c, book b
        where o.custid = c.custid  and b.bookid = o.bookid and b.publisher = '이상미디어';
     
     -- _구로 시작한 책을 구입한 사람
         _구로 시작한 책 : 1,2,3,7,8
          select * from book where bookname like '_구%'
          
         - bookid 가 1,2,3,7,8 인 custid를 찾자 (orders 테이블 에서)
          select distinct custid from orders where bookid in (1,2,3,7,8);
          
          - customer 테이블에서  custid가 1,3,4 인 사람이름
          select name from customer where custid in ( 1,3,4);
          
     -- 평균 도서 가격보다 비싼 도서이름 를 구하시오.
       - 평균도서 가격 : 14450
        select avg(price) from book;
        select bookname from book where price > 14450 ;

        select bookname from book where price > (select avg(price) from book);
        
       -- 합집합 UNION, 차집합 MINUS, 교집합 INTERSECT
       -- 주의할점: Oracle은 차집합을 MINUS로 하지만 SQL 표준에서는 EXCEPT 를 사용

           전체 고객 - 주문한 고객  = 주문하지 않은 고객
       -- 도서를 주문하지 않은 고객의 이름을 보이시오. (차집합)
         - 전체 고객
           select name, custid from customer ; 
           
         - 주문한 고객
           select distinct custid from orders ;
        
         - 결론 1    
          select name from customer
          minus
          select name from customer where custid in( select distinct custid from orders) ;
         
         - 결론 2  
         select name from customer
         minus
         select distinct name from customer c, orders o  where c.custid = o.custid ;

    === 연습문제 ====
    -- join --
    (5) 박지성이 구매한 도서의 출판사 수
       select count(distinct publisher)
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';
       
    (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
       select b.bookname, b.price, o.saleprice, b.price - o.saleprice as 할인받은금액
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';
    
     (7) 박지성이 구매하지 않은 도서의 이름
       select bookname from book  -- 전체 도서명
       minus                            -
       select b.bookname          -- 박지성이 산 도서명 
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid and c.name like '박지성';
       
    -- subquery --
    (8) 주문하지 않은 고객의 이름(부속질의 사용)
       select name from customer
       where name NOT in (select name from customer c, orders o where c.custid = o.custid);
       
    (9) 주문 금액의 총액과 주문의 평균 금액
        select sum(saleprice), avg(saleprice) from orders; 
    
    (10) 고객의 이름과 고객별 구매액
        select c.name, sum(saleprice)
        from customer c, orders o
        where c.custid = o.custid
        group by c.name;
        
    (11) 고객의 이름과 고객이 구매한 도서 목록
       select c.name, b.bookname
       from customer c, orders o, book b
       where o.custid = c.custid and o.bookid = b.bookid ;
    
    (12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
         select b.bookname, b.publisher, b.price, o.saleprice
         from book b, orders o
         where  b.bookid = o.bookid and (b.price - o.saleprice) = (select  max(b.price - o.saleprice)
                                           from book b, orders o
                                            where b.bookid = o.bookid) ;
                                            
     (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
        -- 도서의 판매액 평균
            select avg(saleprice) from orders; -- 11800
       
        -- 고객별 묶음 평균
         select c.name, avg(o.saleprice)
         from orders o, customer c
         where o.custid = c.custid
         group by c.name
         
         -- 결과
         select c.name, avg(o.saleprice)
         from orders o, customer c
         where o.custid = c.custid
         group by c.name
         having avg(o.saleprice) > (select avg(saleprice) from orders) ; 





