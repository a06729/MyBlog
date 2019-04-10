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
    CATEGORY varchar(30),
    VIEWCOUNT int default 0
);
alter table board modify BOARDDATE datetime default now();
alter table board add (SIDETITLE varchar(250));
alter table board add(ViewCount int default 0);
alter table board change ViewCount VIEWCOUNT int default 0;

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
    enabled char(1) default '1',
    uuidUrl varchar(200)
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
