--원래 생성할때 기본키와 외래키를 지정해야한다. 
--테이블 생성할때 외래키 지정하는 법
-- constraint fk명 foreign key( 컬럼명)  references pk 가 위치한 테이블명(컬럼명)

create table book2(
bookid number not null primary key,
bookname varchar2(50),
publisher varchar2(50),
price number
);

create table customer2(
custid number not null primary key,
name varchar2(50),
address varchar2(100),
phone varchar2(50)
);

create table orders2(
orderid number not null primary key,
custid number,
bookid number,
saleprice number,
orderdate date,
constraint fk_custid foreign key(custid)  references customer2 (custid),
constraint fk_bookid foreign key(bookid)  references book2 (bookid)
);

insert into book2 (bookid, bookname, publisher, price) 
values(1,'축구의 역사','굿스포츠',7000);
insert into book2 (bookid, bookname, publisher, price) 
values(2,'축구 아는 여자','나무수',13000);
insert into book2 (bookid, bookname, publisher, price) 
values(3,'축구의 이해','대한미디어',22000);
insert into book2 (bookid, bookname, publisher, price) 
values(4,'골프 바이블','대한미디어',35000);
insert into book2 (bookid, bookname, publisher, price) 
values(5,'피겨 교본','굿스포츠',8000);
insert into book2 (bookid, bookname, publisher, price) 
values(6,'역도 단계별기술','굿스포츠',6000);
insert into book2 (bookid, bookname, publisher, price) 
values(7,'야구의 추억','이상미디어',20000);
insert into book2 (bookid, bookname, publisher, price) 
values(8,'야구를 부탁해','이상미디어',13000);
insert into book2 (bookid, bookname, publisher, price) 
values(9,'올림픽이야기','삼성당',7500);
insert into book2 (bookid, bookname, publisher, price) 
values(10,'Olympic Champions','Pearson',13000);

insert into customer2 (custid, name, address, phone) 
values(1,'박지성','영국 맨체스터','000-5000-0001');
insert into customer2 (custid, name, address, phone) 
values(2,'김연아','대한민국 서울','000-6000-0001');
insert into customer2 (custid, name, address, phone) 
values(3,'장미란','대한민국 강원도','000-7000-0001');
insert into customer2 (custid, name, address, phone) 
values(4,'추신수','미국 클리블랜드','000-8000-0001');
insert into customer2 (custid, name, address, phone) 
values(5,'박세리','대한민국 대전',null);

insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(1,1,1,6000,'2020/07/01');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(2,1,3,21000,'2020/07/03');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(3,2,5,8000,'2020/07/03');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(4,3,6,6000,'2020/07/04');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(5,4,7,20000,'2020/07/05');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(6,1,2,12000,'2020/07/07');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(7,4,8,13000,'2020/07/07');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(8,3,10,12000,'2020/07/08');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(9,2,10,7000,'2020/07/09');
insert into orders2 (orderid, custid, bookid, saleprice,orderdate) 
values(10,3,8,13000,'2020/07/10');

*외래키 지정 후 삭제 (무결성 제약조건 조심)
** 자식테이블은 마음대로 삭제 가능하나,
부모테이블은 마음대로 삭제할수 없다
**자식테이블에서 참조하지 않으면 삭제 가능.

 ===  연습문제 ===
(1) 새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고되었다. 
     삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
     -- 기본키 지정된 상태에서 삽입 
     insert into book2 values(null,'스포츠 세계', '대한미디어', 10000);

(2) ‘삼성당’에서 출판한 도서를 삭제해야 한다.
delete from book2 where publisher='삼성당';

(3) ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
delete from book2 where publisher='이상미디어';

(4) 출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
update book2 set publisher='대한출판사' where publisher='대한미디어';

*외래키 지정후 삽입 - 무결성제약 조건 조심
- 자식테이블(외래키갖고있는 테이블) 에서 삽입할때 참조하는 부모테이블의 컬럼데이터 중에서 삽입해야된다

orders2 테이블에 데이터 삽입
1) orderid = 11 에 박지성 *custid=1 이 골프 바이블 책을 35000원 주고 7/12 구매 (삽입가능)
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(11,1,4,35000,'2020/07/12');

2) 오류 - 부모키 없어서 안됨 (bookid= 11 이 존재하지 않음_)
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(12,5,11,25000,'2020/07/12');

테이블 들을 만들어 놓은 상태에서 기본키와 외래키를 넣어보자
-기본의 테이블들을 데이터와 함께 복사
create table book3 as select * from book;
create table customer3 as select * from customer;
create table orders3 as select * from orders;

--기본키를 먼저 넣어보자  ( alter table name add primary key(컬럼명))
alter table book3 add primary key(bookid);
alter table customer3 add primary key(custid);
alter table orders3 add primary key(orderid);

--외래키를 넣어보자
alter table orders3 add constraint fk_custid3 foreign key(custid)  references customer3 (custid);
alter table orders3 add constraint fk_bookid3 foreign key(bookid)  references book3 (bookid);