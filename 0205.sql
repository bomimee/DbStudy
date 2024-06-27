
CREATE TABLE Members (
    idk NUMBER PRIMARY KEY,
    id VARCHAR2(50) UNIQUE,
    pw VARCHAR2(50),
    name VARCHAR2(50),
    age NUMBER,
    regdate date
);
insert into members values(1, 'aaaa', 'a1111', 'Alice', 5, '2024-01-01');
insert into members values(2, 'bbbb', 'b2222', 'Bob', 20, '2024-02-02');
insert into members values(3, 'cccc', 'c3333', 'Cream', 15, '2024-03-03');
insert into members values(4, 'dddd', 'd4444', 'Diana', 30, '2024-04-04');