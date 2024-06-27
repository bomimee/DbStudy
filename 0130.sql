--계정생성 명령

create user c##bomv identified by 1111;

--권한부여 :grant connect, resource, dba to c##bomv;

grant connect, resource, dba to c##bomv;

1.SQL (Structured Query Language) 구조화된언어
: 데이터베이스에서 데이터를 추출하고 조작하는데 사용되는 데이터처리언어

1-1. 데이터 정의어 (DDL) : 데이터베이스 객체들을 정의하는것 
 (데이터베이스 객체: 테이블, 뷰, 인덱스, 시퀀스 등)
 create : 새로운 데이터베이스 객체생성
 ex) create table (create 객체)
 drop :기존의 데이터베이스 객체 삭제
 alter: 기존의 데이터베이스 객체 변ㄱㅇ
 
 1-2. 데이터 조작어 (DML) : 데이터 자체를 삽입, 삭제, 변경, 검색할때 사용
 insert : 데이터 (행=튜플=레코드) 삽입(생성)
 delete:  데이터 (행=튜플=레코드) 삭제
 update : 데이터(행=튜플=레코드) 변경/수정
 select: 데이터(행=튜플=레코드) 검색
 
 1-3. 데이터제어어 (DCL) : db에 접근하고 객체들을 사용하도록 권한을 부여, 해제하는 명령어
 grant : 권한 부여
 revoke : 권한해제
 commit: 현재 DB 상태 저장
 rollback: 현재상태 이후 변경된 사항을 취소하고 현재상태로 되돌림
 현재상태(commit 저장)  -1진행, -2진행 => rollback 하면 현재상태로 되돌아간다(commit상태)
 
 1.create table
 1-1. 기본키 하나만 지정
 create table 테이블이름 ( 
 속성이름 데이터타입, not null primary key,
 속성이름 데이터타입,
  속성이름 데이터타입,
 );
 
1- 2. 기본키 여러개 지정가능
create table 테이블이름(
속성이름 데이터타입,
 속성이름 데이터타입,
  속성이름 데이터타입,
  primary key (속성이름 = 새로운 것이 아니라 위에 존재하는 속성이름)
 );
 create table 테이블이름(
속성이름 데이터타입,
 속성이름 데이터타입,
  속성이름 데이터타입,
  primary key (속성이름,속성이름)
 );
 
2. 오라클 데이터타입
2- 1.문자열 : 영어 대소문자,숫자 => 1byte, 영어제외한 나머지 문자 =>3byte
  varchar2(크기); 가변길이, 4000byte까지 저장
 char (크기) ; 고정길이. 2000 byte 까지 저장
  clob (크기) ; 대용량 테스트 최대 4GB
  long (크기) ; 2GB
  
 2- 2.숫자
  number() :
   number(4) :  정수 4자리
   number(4, 2) : 전체 4자리 에서 뒤에 소숫점 2개 (~99.99 )
   
2-3.날짜 : 문자열과 날짜는 데이터 넣을때 '' 사용
숫자와 날짜는 연산가능 (+, -)
 date ; 고정된 길이의 유효한 날짜-시간 형식을 저장하는데 사용
 date('2024/01/30')
 timestamp : 기본 날자형을 확장한 자료형,
 ** sysdate 현재 시스템날짜를 입력
 
 2-4.그래픽, 이미지, 동영상의 데이터는 BLOB(이진대용량 객체) 주로사용(거의사용안함)
 
 3. 오라클 테이블 생성 시 제약 조건
 -not null : 해당 속성은 데이터를 삽입할때 반드시 채워야 된다.
 -unique : 해당 컬럼 또는 컬럼 조합값이 유일하도록 한다 (중복x)
 -primary key ; 기본키(각 행을 식별할 수 있는 키)
 -default ; 기본값을 지정하는 키워드
        ex)  적립금 number default 0=> 값을 입력하지 않으면 0
-check: 특정 속성에 대한 제약조건 지정하는 것
 ex) 나이 number(3) check>=19 => 19 이상인 숙자만 받자
    재고량 number check (재고량 >= 0 and 재고량 <=1000) => 재고량 숫자를 0~1000까지
    
    4.테이블삭제
    drop 테이블(객체) 이름 => 데이터가 있어도 삭제되니까 조심할것
    
    5.테이블 구조변경 - 컬럼 추가(add 컬럼명 자료형(크기)[제약조건])
                   - 삭제(drop column 컬럼명) -> 데이터 잇어도 삭제됨, 
                   삭제할 속성의 참조하는 다른속성이 있으면 삭제안됨
                   - 컬럼변경 (modify 컬럼명 자료형 (크기) [제약조건])
                   테이블 구조 명령어 보는 desc 테이블이름
                   **데이터가 없을 경우 컬럼의 자료형과 크기 변경가능
                   **데이터가있는경우 같은 자료형으로 크기변화 가능하지만 데이터 크기보다 더 커야한다
                   **다른자료형으로 변경할 경우) 비추천
    형식 ) alter table 테이블이름 + 
    
    6.테이블 복사 (키는 복사안됨)
    -구조와 데이터를 모두 복사하는 경우
    create table 새테이블이름 as select * from 복사할원본테이블이름
    -구조만 복사
    create table 새테이블이름 as select * from 복사할원본테이블이름 where 1=0;
    
    7. 튜플(레코드=행)삽입
     방법1) insert into 테이블이름(컬럼명1,컬럼명2,컬럼명3,컬럼명4) values(값1,2,3,4)
     **컬럼명과 데이터명 1:1매칭
     **컬럼명 입력시 반드시 제약조건 not null을 가진컬럼 넣어줘야한다
     예) newbook 에 1,'축구의이해','',  
     
     방법2) insert into 테이블이름  values(값1,2,3,4)
     ** 해당 테이블의 모든 컬럼에 맞춰 데이터를 넣어줘야한다
     
      방법3) 일부데이터만 넣을수잇다.( 반드시 not null 을 넣어야한다) 
      ** 순서 상관없이 1:1 매칭을 잘하고 not null을 넣으면 된다
      insert into newbook( bookname, publisher, bookid,) values('축구의이해','대한미디어',3);
      
      방법4) 정보가 없는 경우 null 로 대체 >>  insert into newbook values(4,'골프바이블',null,13000,null); 
      
      
create table newbook1(
bookid number not null primary key, 
bookname varchar2(50),
publisher varchar2(50),
price number
);
create table newbook2(
bookid number, 
bookname varchar2(50),
publisher varchar2(50),
price number,
primary key (bookid)
);

--오류
create table newbook3(
idx number not null primary key,
bookid number not null primary key, 
bookname varchar2(50),
publisher varchar2(50),
price number
);

--가능
create table newbook4(
idx number,
bookid number, 
bookname varchar2(50),
publisher varchar2(50),
price number,
primary key (idx, bookid)
);


위테이블에서 위자료를 보고 new table 5만들고
제약조건- bookname null값 가질수없다. => not null
publisher는 같은 값이 있으면 안된다. => unique
price 의 값이 입력되지 않으면 기본값 10000입력 =>  default 10000
sal_price 최소값은 1000이상 => check(sal_price > 1000)

create table newbook5(
idx number not null,
bookid number not null, 
bookname varchar2(50) not null,
publisher varchar2(50)unique,
price number  default 10000,
sal_price number check(sal_price > 1000),
primary key (idx, bookid)
);

drop table newbook2;
drop table newbook4;

desc newbook;

alter table newbook add addr varchar2(50);
alter table newbook drop column addr;

alter table newbook modify addr number(7);

create table newnewbook as select * from newbook;
create table newnewnewbook as select * from newbook where 1=0;
insert into newbook (bookid, bookname, publisher, price,addr) 
values(1,'축구의역사','굿스포츠',7000,1);

insert into newbook values(2,'축구아는 여자','나무수', 13000,1);

insert into newbook(bookname, publisher, bookid) values('축구의이해','대한미디어',3);

insert into newbook values(4,'골프바이블',null,13000,null);

**테이블복사 + 데이터복사>> 
create table copybook as select * from newbook;
**테이블복사
create table copybook2 as select * from newbook where 1 = 0;

** 컬럼변경 ; 데이터 있는경우 같은자료형으로 변경
alter table copybook modify bookname varchar2(100);  // 기존크기보다 크게
alter table copybook modify publisher varchar2(30);    // 기존크기보다 작게 -> 문제없음
alter table copybook modify publisher varchar2(10); // 문제 있음 안에있는 데이터용량이 더큼 
** 컬럼변경 ; 데이터가 있는 경우 다른 자료형으로 변경 (숫자 -> 문자)
alter table copybook modify addr varchar2(50);

8.commit 현재 상태를 db에 그대로 저장
9.rollback commit 이후 수정을 여러번 했을때 마지막 commit 한상태로 돌아감 

10.Update문 : 특정속성 값을 수정하는 명령어
기본형식 - update tablename
          set 속성이름1=값1 [,속성이름2=값2, 속성이름3=값3,...]
          [where 조건식 ;]
          **조건이 없으면 해당 컬럼의 모든 데이터가 변경됨 
          --ex)1.customer 테이블에서 고객번호가 5인 고객 주소를 대한민국 부산으로 변경
        --ex)2.customer 테이블에서 김연아 고객주소를 대한민국 대전으로 변경
        --ex)3. book 테이블에서 출판사가 대한미디어-> 대한출판사 변경
        --ex)4.customer 테이블에서 추신수의 주소를 '대한민국경기도' 그리고 폰번호를 '000-1111-9999'
        update customer set address='대한민국 부산' where custid=5;
           update customer set address='대한민국 대전' where name='김연아';
            update book set publisher='대한출판사' where publisher='대한미디어';
            update customer set address='대한민국 경기도', phone='000-1111-9999' where name='추신수';
11.delete 테이블에 있는 기존 튜플을 삭제하는 명령
기본형식; delete from tablename [where ;]
** 조건식 없으면 해당 컬럼의 해당 테이블의 모든 데이터 삭제됨 
 ex1) customer table delete all
 delete from customer;
 
 ex2) 모든 데이터 삭제 확인 후 rollback 
 rollback;
 ex3) customer table 고객번호 5 삭제
 delete from customer where custid=5;
 ex4) 삭제 확인 후 rollback
 
 ===  연습문제 ===
(1) 새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고되었다. 
     삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
     -- 현재 제약조건이 없는 상태에서 삽입가능--
     insert into book values(null,'스포츠 세계', '대한미디어', 10000);

(2) ‘삼성당’에서 출판한 도서를 삭제해야 한다.
delete from book where publisher='삼성당';

(3) ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
delete from book where publisher='이성미디어';

(4) 출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
update book set publisher='대한출판사' where publisher='대한미디어';

 

create table orders(
orderid number,
custid number,
bookid number,
saleprice number,
orderdate date
);
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(1,1,1,6000,'2020/07/01');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(2,1,3,21000,'2020/07/03');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(3,2,5,8000,'2020/07/03');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(4,3,6,6000,'2020/07/04');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(5,4,7,20000,'2020/07/05');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(6,1,2,12000,'2020/07/07');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(7,4,8,13000,'2020/07/07');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(8,3,10,12000,'2020/07/08');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(9,2,10,7000,'2020/07/09');
insert into orders (orderid, custid, bookid, saleprice,orderdate) 
values(10,3,8,13000,'2020/07/10');

create table book(
bookid number,
bookname varchar2(50),
publisher varchar2(50),
price number
);

insert into book (bookid, bookname, publisher, price) 
values(1,'축구의 역사','굿스포츠',7000);
insert into book (bookid, bookname, publisher, price) 
values(2,'축구 아는 여자','나무수',13000);
insert into book (bookid, bookname, publisher, price) 
values(3,'축구의 이해','대한미디어',22000);
insert into book (bookid, bookname, publisher, price) 
values(4,'골프 바이블','대한미디어',35000);
insert into book (bookid, bookname, publisher, price) 
values(5,'피겨 교본','굿스포츠',8000);
insert into book (bookid, bookname, publisher, price) 
values(6,'역도 단계별기술','굿스포츠',6000);
insert into book (bookid, bookname, publisher, price) 
values(7,'야구의 추억','이성미디어',20000);
insert into book (bookid, bookname, publisher, price) 
values(8,'야구를 부탁해','이성미디어',13000);
insert into book (bookid, bookname, publisher, price) 
values(9,'올림픽이야기','삼성당',7500);
insert into book (bookid, bookname, publisher, price) 
values(10,'Olympic Champions','Pearson',13000);

create table customer(
custid number,
name varchar2(50),
address varchar2(100),
phone varchar2(50)
);
insert into customer (custid, name, address, phone) 
values(1,'박지성','영국 맨체스터','000-5000-0001');
insert into customer (custid, name, address, phone) 
values(2,'김연아','대한민국 서울','000-6000-0001');
insert into customer (custid, name, address, phone) 
values(3,'장미란','대한민국 강원도','000-7000-0001');
insert into customer (custid, name, address, phone) 
values(4,'추신수','미국 클리블랜드','000-8000-0001');
insert into customer (custid, name, address, phone) 
values(5,'박세리','대한민국 대전',null);


