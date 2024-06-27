CREATE TABLE ����2 (
    �����ȣ number,
    �����̸� VARCHAR2(50),
    ��ġ VARCHAR2(50),
    primary key(�����ȣ)
);


CREATE TABLE ��2 (
    ����ȣ number,
    �̸� VARCHAR2(50),
    �ּ� VARCHAR2(50),
    primary key(����ȣ)
);


CREATE TABLE �󿵰� (
    �����ȣ number ,
    �󿵰���ȣ number CHECK (�󿵰���ȣ between 1 and 10),
    ��ȭ���� VARCHAR2(50),
    ���� number CHECK (���� <= 20000),
    �¼��� number,
    primary key (�����ȣ,�󿵰���ȣ)
);

-- ���̺� ���� : ���� (reservation)

CREATE TABLE ����2 (
    �����ȣ NUMBER NOT NULL,
    �󿵰���ȣ NUMBER NOT NULL,
    ����ȣ NUMBER NOT NULL,
    �¼���ȣ NUMBER,
    ��¥ DATE,
    primary key (�����ȣ,�󿵰���ȣ,����ȣ)
);

insert into ����2(�����ȣ,�����̸�,��ġ) values(1,'�Ե�','���');
insert into ����2(�����ȣ,�����̸�,��ġ) values(2,'�ް�','����');
insert into ����2(�����ȣ,�����̸�,��ġ) values(3,'����','���');

insert into �󿵰�(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(1,1,'����� ��ȭ',15000, 48);
insert into �󿵰�(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(3,1,'���� ��ȭ',7500, 120);
insert into �󿵰�(�����ȣ,�󿵰���ȣ,��ȭ����,����,�¼���) values(3,2,'��մ� ��ȭ',8000, 110);

insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(3,2,3,15, '2020-09-01');
insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(3,1,4,16, '2020-09-01');
insert into ����2(�����ȣ,�󿵰���ȣ,����ȣ,�¼���ȣ,��¥) values(1,1,9,48, '2020-09-01');

insert into ��2(����ȣ,�̸�,�ּ�) values(3,'ȫ�浿','����');
insert into ��2(����ȣ,�̸�,�ּ�) values(4,'��ö��','���');
insert into ��2(����ȣ,�̸�,�ּ�) values(9,'�ڿ���','����');

1. ��� ������ �̸��� ��ġ
select *
from ����2;

2.��ǿ� �ִ� ����
select *
from ����2
where ��ġ like '���';

3.��ǿ� ��� ���̸� ��������
select *
from ��2
where �ּ� = '���'
order by �̸�;

4.������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ����
select �����ȣ, �󿵰���ȣ,��ȭ���� 
from �󿵰�
where ���� <= 8000;

5.���� ��ġ�� ���ּҰ� ���� ��
select ��2.�̸�
from ����2, ��2
where ����2.��ġ like ��2.�ּ�;

6.�����
select count(*)
from ����2;

7.�󿵿�ȭ ��հ���
select avg(����)
from �󿵰�;

8. 2020/9/1 ��ȭ ������ ����
select count(*)
from ����2
where ��¥ like '2020-09-01%';

9.���� ���忡�� �󿵵� ��ȭ����
select �󿵰�.��ȭ����
from �󿵰�, ����2
where ����2.�����ȣ = �󿵰�.�����ȣ and ����2.�����̸� like '����';

10.���ѱ��忡�� ��ȭ �� ���̸�
select ��2.�̸�
from ��2, ����2, ����2
where ����2.�����ȣ = ����2.�����ȣ and ����2.����ȣ = ��2.����ȣ and ����2.�����̸� like '����';

11.���ѱ��� ��ü ����
select sum(����)
from �󿵰�, ����2, ����2
where �󿵰�.�����ȣ = ����2.�����ȣ and �󿵰�.�����ȣ = ����2.�����ȣ 
and ����2.�󿵰���ȣ = �󿵰�.�󿵰���ȣ and ����2.�����̸� like '����';

12.���庰 �󿵰� ��
select �����ȣ, count(*)
from �󿵰�
group by �����ȣ;

13.��ǿ� �ִ� ������ �󿵰�
select *
from ����2, �󿵰�
where ����2.�����ȣ = �󿵰�.�����ȣ and ����2.��ġ like '���'; 

14.9/1 ���庰 ��� ���� ����
select �����ȣ, count(*)
from ����2
where ��¥ like '2020-09-01%'
group by �����ȣ;
