create table guestbook2(
    idx number not null primary key,
    pwd varchar2(50),
    name varchar2(50),
    email varchar2(50),
    subject varchar2(50),
    content varchar2(4000),
    filename varchar2(50),
    regdate date
);

create sequence guestbook2_seq
increment by 1
start with 1
maxvalue 999999999
nocycle;

drop table guestbook2;