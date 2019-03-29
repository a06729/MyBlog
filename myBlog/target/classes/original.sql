show databases;

use employees;

show tables;

desc departments;

desc departments;

desc dept_emp;

desc dept_manager;

desc employees;

desc salaries;

select 20+10;

select 20-10;
select 20*10;
select 20/10;

select salary,salary+1000,salary-1000,salary*1000,salary/1000
from salaries;

-- 각 사원의 사원번호,금여액,10% 인상된 금여액 가져온다. --

select emp_no ,salary,salary*1.1
from salaries;

select emp_no,salary,salary*0.9
from salaries;

-- 문자열 컬럼 연산 --

select first_name +1000,first_name*100,first_name+last_name
from employees;

-- 근무 부서 테이블에서 부서 번호를 가져온다.--

select distinct dept_no
from dept_emp;

-- 각 사원의 직함을 중복되지 않게 가져오기 --

select distinct title
from titles;

-- 부서번호가 d005인 부서의 매니저의 사원의 사원번호와 부서번호를 가져온다. --

select emp_no,dept_no
from dept_manager
where dept_no='d005';

-- 부서가 d003이 아닌 매니저 사원들의 사원번호와 부서 번호를 가져온다. --
select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';

-- 급여액이 150000 이산인 사원의 사원번호, 급여액을 가져온다. --
select emp_no,salary
from salaries
where salary >= 150000;

-- 급여액이 40000 이하인 사원번호,급여액을 가져온다. --
select emp_no,salary
from salaries
where salary <= 40000;

-- 1986년 이후에 입사한 사원들의 사원번호, 입사일, 성과 이름을 가져온다. --
select emp_no,hire_date,last_name,first_name
from employees
where hire_date >='1986-01-01';

-- 1990년 이후에 매니저가 된 사원번호,부서번호,매니저 시작 날짜를 가져온다. --
select emp_no,dept_no,from_date
from dept_manager
where from_date >= '1990-01-01';

-- 1990년 이전에 입사한 사원들의 사원번호,입사일을 가져온다. --
select emp_no,hire_date
from employees
where hire_date < '1990-01-01';

-- d001 부서의 매니저 중에서 1990년 이후 부터 매니저인 사원의 사원번호, 부서번호, 매니저 시작 날짜를 가져온다.--
select emp_no,dept_no,from_date
from dept_manager
where dept_no='d001' and from_date >= '1990-01-01';

-- 1990년 이후에 입사한 남자 사원의 사원번호, 성별,입사일를 가져온다 --

select emp_no,gender,hire_date
from employees
where hire_date >= '1990-01-01' and gender='M';

-- 1990년 이흐부터 60000 이상의 급여를 받는 사원의 사원번호,급여,급여수령 시작 날짜를 가져온다. --

select emp_no,salary,from_date
from salaries
where from_date >= '1990-01-01' and salary >= 60000;

-- d001 부서와 d002 부서 매니저의 사원번호,부서번호 를 가져온다. --

select emp_no,dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

-- 직함이 Staff인 사원과 Enginner 사원의 사원번호, 직함을 가져온다.  --
select emp_no,title
from titles
where title = 'Staff' or title='Engineer';

-- 부서 번호가 d003이 아닌 매니저의 사원번호와 부서 번호를 가져온다. --

select emp_no,dept_no
from dept_manager
where dept_no <> 'd003';

select emp_no,dept_no
from dept_manager
where not dept_no= 'd003';

-- 급여가 60000이상 70000미만 사원들의 사원번호 급여를 가져온다 --
select emp_no,salary
from salaries
where salary >=60000 and salary < 70000;

select emp_no,salary
from salaries
where salary between 60000 and 69999;

-- d001 부서와 d002 부서 매니저의 사원번호,부서번호를 가져온다 --
select emp_no,dept_no
from dept_manager
where dept_no = 'd001' or dept_no='d002';

select emp_no,dept_no
from dept_manager
where dept_no in('d001','d002');

-- 이름이 Tommaso 사원의 사원번호, 이름을 가져온다. --

select emp_no,first_name
from employees
where first_name='Tommaso';

-- 이름이 A로 시작하는 사원의 사원번호,이름을 가져온다. --
select emp_no,first_name
from employees
where first_name like 'A%';

-- 이름의 마미작 글자가 s로 끝나는 사원의 사원번호,이름을 가져온다 --
select emp_no,first_name
from employees
where first_name like '%s';

-- 이름의 두번쨰 글자가 i인 사원의 사원번호,이름을 가져온다 --
select emp_no,first_name
from employees
where first_name like '_i%';

-- 이름에 o가 포함되어 있는 사원의 사원번호 이름을 가져온다. --
select emp_no,first_name
from employees
where first_name like '%o%';

-- 이름에 o가  포함되어 있는 사원의 사원번호, 이름을 가져온다. --
  -- 단 마지막 글자가 o가 아닌 사원만 가져온다. --
select emp_no,first_name
from employees
where first_name like '%o%' and not first_name like '%o';

-- 이름의 글자가 5개인 사원의 사원번호, 이름을 가져온다 --
select emp_no,first_name
from employees
where first_name like '_____';

-- 사원의 번호와 금여를 가져온다. 급여를 기준으로 오름차순 정렬 --
select emp_no,salary
from salaries
order by salary asc;

select emp_no,salary
from salaries
order by salary;

-- 사원의 번호와 금여를 가져온다. 급여를 기준으로 내림차순 정렬 --
select emp_no,salary
from salaries
order by salary desc;

-- 사원의 번호와 이름을 가져온다. 이름을 기준으로 오름차순 정렬한다. --
select emp_no,first_name
from employees
order by first_name asc;

select emp_no,first_name
from employees
order by first_name;

-- 사원의 번호와 이름을 가져온다. 이름을 기준으로 내림차순 정렬한다. --

select emp_no,first_name
from employees
order by first_name desc;

-- 사원의 번호와 입사일을 가져온다. 입사일을 기준으로 오름차순 정렬한다. --
select emp_no,hire_date
from employees
order by hire_date asc;

-- 사원의 번호와 입사일을 가져온다. 입사일을 기준으로 내림차순 정렬한다. --
select emp_no,hire_date
from employees
order by hire_date desc;

-- 절대값 --
select abs(100),abs(-100);
-- 소수점 이하 올림 --
select ceil(10.1),ceil(10.4),ceil(10.5),ceil(10.8);

-- 소수점 이하 버림 --
select floor(10.1),floor(10.4),floor(10.5),floor(10.8);

-- 반올림 --
select round(10.0),round(10.4),round(10.5),round(10.8);
select round(166.555,0),round(166.555,1),round(166.555,-1);

-- 버림 --
select truncate(166.555,0),truncate(166.555,1),truncate(166.555,-1);

-- x의 y승 --
select pow(10,2);

-- 나머지 구하기 --
select mod(10,3);

-- 최대 숫자 구하기 --
select greatest(10,4,20,1);

-- 최소 숫자 구하기 --
select least(10,4,20,1);

-- 사원들의 사원번호와 급여를 가져온다 급여는 10% 인상된 급여를 소수점 이하는 올린값, 버린값 반올림한 값을 모두 가져온다. --
select emp_no,salary,salary * 1.1,ceil(salary * 1.1),
	   floor(salary *1.1),round(salary*1.1,0)
from salaries;

select concat('aaa','bbb','ccc');

select insert('aaaaa',2,2,'bbb');

select replace('aabbcc','bb','ff');

select instr('abcdefg','cde');

select instr('abcdefg','kkk');

select left('abcdefg',3);

select right('abcdefg',3);

select mid('abcdefg',3,3);

select substring('abcdefg',3,3);

select concat('[','          abc           ',']');

select concat('[',ltrim('          abc           '),']');

select concat('[',rtrim('          abc           '),']');

select concat('[',trim('          abc           '),']');

select lcase('abCDef');

select lower('abCDef');

select ucase('abCDef');

select upper('abCDef');

select reverse('abcdef');

-- 사원의 이름을 가져온다 성과 이름을 하나의 문자열로 가져온다. --
select lower(concat(first_name, ' ',last_name))
from employees;


-- 현재 받는 급여의 평균보다 많이 받는 사원들의 사원번호,급여액을 가져온다. --

select emp_no,salary
from salaries
where salary > (
select avg(salary)
from salaries 
where to_date='9999-01-01') and to_date='9999-01-01';

-- d001 부서에 근무하고 있는 사원들의 사원번호와 first_name를 가져온다. --
select a1.emp_no,a1.first_name
from employees a1 , dept_emp a2
where a1.emp_no=a2.emp_no and a2.dept_no='d001';

select emp_no
from dept_emp
where dept_no='d001';

select emp_no,first_name
from employees
where emp_no in(select emp_no
from dept_emp
where dept_no='d001');

-- 1960년 이후에 태어난 사원들이 근무하고 있는 사원들의 사원번호,근무 부서 번호를 가져온다. --

select rownum as rnum , emp_no from employees where birth_date >= '1960-01-01';

select emp_no,dept_no
from dept_emp
where emp_no in(select emp_no from employees where birth_date >= '1960-01-01');

set @rownum:=0;

select @rownum:=@rownum+1 as TMP,empsalaries_no
from dept_emp natural join employees,(select @rownum:=0)TMP limit 3,9;

create database blog
character set ='utf8'
collate ='utf8_general_ci';


create table board(
	BOARDNUM int auto_increment primary key,
    BOARDTITLE varchar(100),
    SIDETITLE varchar(250),
    BOARDCONTENT varchar(3000),
    BOARDDATE datetime default now(),
    USERID varchar(30),
    CATEGORY varchar(30)
);
alter table board modify BOARDDATE datetime default now();
alter table board add (SIDETITLE varchar(250));

create table board_file(
	FILENUM int auto_increment primary key,
    BOARDNUM int,
    ORIGINAL_FILE_NAME varchar(260),
    STORED_FILE_NAME varchar(200),
    FILE_SIZE int,
    FILEPATH varchar(200),
    URL varchar(1000),
    constraint bn_fk foreign key (BOARDNUM) references board(BOARDNUM) ON DELETE CASCADE
);

select *
from board_file;

create table users(
	USERID varchar(100) primary key,
    USERPW varchar(100),
    EMAIL varchar(100),
    AUTHORITY varchar(20),
    ENABLED int
);

insert into board (BOARDTITLE,BOARDCONTENT,USERID,CATEGORY)
value ('타이틀','컨텐츠6','아이디','카테고리');

select *
from board;

select BOARDTITLE,BOARDCONTENT
from board
group by BOARDTITLEboard_file
limit 0,10;

select *
from board
limit 0,10;

select last_insert_id();

update board
set BOARDCONTENT='컨텐츠3'
where BOARDNUM='3';

select count(*)
from board;

delete
from board
where userid='아이디';

alter table board modify boardnum int auto_increment;

alter table board auto_increment=1;

set SQL_SAFE_UboardboardPDATES =0;

select *
from board;

insert into board_file (BOARDNUM,ORIGINAL_FILE_NAME,STORED_FILE_NAME,FILE_SIZE,FILEPATH)
value(2,'abcdef','1111_abcdef','11111','경로');

select *
from board_file;




delete 
from board_file;

select *
from board natural join board_file bf;


select *
from board natural join board_file
group by BOARDNUM ;


/*중복제거*/
select BOARDNUM,BOARDTITLE,BOARDCONTENT,BOARDDATE,USERID,CATEGORY,URL
from board natural join board_file
group by BOARDNUM
order by BOARDNUM desc;

/* 중복제거 개선*/
select b.BOARDNUM,b.BOARDTITLE,b.BOARDCONTENT,b.BOARDDATE,b.USERID,b.CATEGORY,bfile.url
from board b left outer join board_file bfile on b.boardnum=bfile.boardnum
group by b.BOARDNUM
order by b.BOARDNUM desc
limit 0,10;



select count(*)
from board;

select *
from board_file;

alter table board_file
modify URL varchar(1000);

select *
from board_file;

create table users(
	username varchar(50) not null primary key,
    password varchar(50) not null,
    enabled char(1) default '1'
);

create table authorities(
	username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key(username) references users(username)
);

create table tbl_member(
	userid varchar(50) not null primary key,
    userpw varchar(100) not null,
    username varchar(100) not null,
    regdate datetime default now(),
    updatedate datetime default now(),
    enabled char(1) default '1'
);

create table tbl_member_auth(
	userid varchar(50) not null,
    auth varchar(50) not null,
    constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

create table member(
	userid varchar(50) not null primary key,
    userpw varchar(100) not null,
    username varchar(100) not null,
    regdate datetime default now(),
    updatedate datetime default now(),
    enabled char(1) default '1'
);

select *
from member;

delete 
from member
where userid='a06729@gmail.com';

select *
from member_auth;

create table member_auth(
	userid varchar(50) not null,
    auth varchar(50) not null,
    constraint fk_member_auth foreign key(userid) references member(userid)
);

select mem.userid,userpw,username,enabled,regdate,updatedate,auth.auth
from member mem LEFT OUTER JOIN member_auth auth on mem.userid=auth.userid
where mem.userid='a06729@gmail.com';
