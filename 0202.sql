CREATE TABLE 극장2 (
    극장번호 number,
    극장이름 VARCHAR2(50),
    위치 VARCHAR2(50),
    primary key(극장번호)
);


CREATE TABLE 고객2 (
    고객번호 number,
    이름 VARCHAR2(50),
    주소 VARCHAR2(50),
    primary key(고객번호)
);


CREATE TABLE 상영관 (
    극장번호 number ,
    상영관번호 number CHECK (상영관번호 between 1 and 10),
    영화제목 VARCHAR2(50),
    가격 number CHECK (가격 <= 20000),
    좌석수 number,
    primary key (극장번호,상영관번호)
);

-- 테이블 생성 : 예약 (reservation)

CREATE TABLE 예약2 (
    극장번호 NUMBER NOT NULL,
    상영관번호 NUMBER NOT NULL,
    고객번호 NUMBER NOT NULL,
    좌석번호 NUMBER,
    날짜 DATE,
    primary key (극장번호,상영관번호,고객번호)
);

insert into 극장2(극장번호,극장이름,위치) values(1,'롯데','잠실');
insert into 극장2(극장번호,극장이름,위치) values(2,'메가','강남');
insert into 극장2(극장번호,극장이름,위치) values(3,'대한','잠실');

insert into 상영관(극장번호,상영관번호,영화제목,가격,좌석수) values(1,1,'어려운 영화',15000, 48);
insert into 상영관(극장번호,상영관번호,영화제목,가격,좌석수) values(3,1,'멋진 영화',7500, 120);
insert into 상영관(극장번호,상영관번호,영화제목,가격,좌석수) values(3,2,'재밌는 영화',8000, 110);

insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,2,3,15, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,1,4,16, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(1,1,9,48, '2020-09-01');

insert into 고객2(고객번호,이름,주소) values(3,'홍길동','강남');
insert into 고객2(고객번호,이름,주소) values(4,'김철수','잠실');
insert into 고객2(고객번호,이름,주소) values(9,'박영희','강남');

1. 모든 극장의 이름과 위치
select *
from 극장2;

2.잠실에 있는 그장
select *
from 극장2
where 위치 like '잠실';

3.잠실에 사는 고객이름 오름차순
select *
from 고객2
where 주소 = '잠실'
order by 이름;

4.가격이 8000원 이하인 여화의 극장번호, 상영관번호, 영화제목
select 극장번호, 상영관번호,영화제목 
from 상영관
where 가격 <= 8000;

5.극장 위치와 고객주소가 같은 고객
select 고객2.이름
from 극장2, 고객2
where 극장2.위치 like 고객2.주소;

6.극장수
select count(*)
from 극장2;

7.상영영화 평균가격
select avg(가격)
from 상영관;

8. 2020/9/1 영화 관람한 고객수
select count(*)
from 예약2
where 날짜 like '2020-09-01%';

9.대한 극장에서 상영된 영화제목
select 상영관.영화제목
from 상영관, 극장2
where 극장2.극장번호 = 상영관.극장번호 and 극장2.극장이름 like '대한';

10.대한극장에서 영화 본 고객이름
select 고객2.이름
from 고객2, 극장2, 예약2
where 극장2.극장번호 = 예약2.극장번호 and 예약2.고객번호 = 고객2.고객번호 and 극장2.극장이름 like '대한';

11.대한극장 전체 수입
select sum(가격)
from 상영관, 극장2, 예약2
where 상영관.극장번호 = 극장2.극장번호 and 상영관.극장번호 = 예약2.극장번호 
and 예약2.상영관번호 = 상영관.상영관번호 and 극장2.극장이름 like '대한';

12.극장별 상영관 수
select 극장번호, count(*)
from 상영관
group by 극장번호;

13.잠실에 있는 극장의 상영관
select *
from 극장2, 상영관
where 극장2.극장번호 = 상영관.극장번호 and 극장2.위치 like '잠실'; 

14.9/1 극장별 평균 관람 고객수
select 극장번호, count(*)
from 예약2
where 날짜 like '2020-09-01%'
group by 극장번호;
