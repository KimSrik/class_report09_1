-- ------------------------------------------------------------------------------------------
-- 												데이터베이스 생성 및 초기화,
-- 														권한 초기화 및 생성
-- ------------------------------------------------------------------------------------------

drop database if exists 영화정보DB;
drop user if exists movie_admin@localhost;
create database if not exists 영화정보DB;
create user movie_admin@localhost identified with mysql_native_password by 'movie';
grant all privileges on 영화정보DB.* to movie_admin@localhost with grant option;

use 영화정보DB;

-- ------------------------------------------------------------------------------------------
-- 												테이블 생성 
-- ------------------------------------------------------------------------------------------
-- 2. 요구사항대로 영화정보를 구축하기.

create table 장르(
	장르코드 varchar(10),
    장르명 varchar(20) not null,
    primary key(장르코드)
);
 
create table 영화(
	영화코드 varchar(10),
    제목 varchar(45) not null,
    제작년도 int not null,
    상영시간 varchar(10) not null,
    개봉일자 date not null,
    제작사 varchar(20) not null,
    배급사 varchar(20) not null,
    장르코드 varchar(10) not null, 
    primary key(영화코드),
    foreign key(장르코드) references 장르(장르코드) on update cascade
 );
 
 -- desc 영화;

create table 배우(
	주민번호 varchar(14),
    이름 varchar(20) not null,
    성별 enum('남','여') not null,
    출생일 date not null,
    출생지 varchar(45) not null,
    키 varchar(10) not null,
    몸무게 varchar(10) not null,
    혈액형 enum('A', 'B', 'AB', 'O') not null,
    primary key(주민번호)
 );
 
 -- desc 배우;
 
 create table 감독(
	등록번호 varchar(10),
    이름 varchar(20) not null,
    성별 enum('남', '여') not null,
    출생일 date not null,
    출생지 varchar(40) not null,
    학력사항 varchar(20) not null,
    primary key(등록번호)
 );
 
-- desc 감독;
 
 create table 디렉팅(
	감독등록번호 varchar(10),
    영화코드 varchar(10),
    primary key(감독등록번호, 영화코드),
    foreign key(감독등록번호) references 감독(등록번호) on update cascade,
    foreign key(영화코드) references 영화(영화코드) on update cascade
 );
 
-- desc 디렉팅;

create table 배역(
	배우주민번호 varchar(14),
    영화코드 varchar(10),
    배역 varchar(20) not null,
    primary key(배우주민번호, 영화코드),
    foreign key(배우주민번호) references 배우(주민번호) on update cascade,
    foreign key(영화코드) references 영화(영화코드) on update cascade
);

-- desc 배역;

-- ------------------------------------------------------------------------------------------
-- 												테이블 삽입
-- ------------------------------------------------------------------------------------------
-- 3. 구현된 데이터베이스에 관련 자료를 입력하기.


insert into 장르 values('101','액션');
insert into 장르 values('102','범죄');
insert into 장르 values('103','SF');
insert into 장르 values('104','코미디');
insert into 장르 values('105','로맨틱 코미디');
insert into 장르 values('106','포르노');
insert into 장르 values('107','공포');
insert into 장르 values('108','전쟁');
insert into 장르 values('109','스포츠');
insert into 장르 values('110','Fantasy');
insert into 장르 values('111','드라마');
insert into 장르 values('112','멜로');

-- select * from 장르;

insert into 영화 values('20200001', '돌아온 용가리', '2020', '02:19:24', '2020-12-24', '영구픽처스', '좋은친구들', '110');
insert into 영화 values('20140001', '명량', '2014', '01:08:30', '2014-07-30', '빅스톤픽쳐스', 'CJ엔터테인먼트', '108');
insert into 영화 values('20190001', '극한직업', '2019', '01:11:23', '2019-01-23', '어바웃필름', 'CJ엔터테인먼트', '104');
insert into 영화 values('20170001', '신과함께-죄와 벌', '2017', '02:19:34', '2017-12-20', '빅스톤픽쳐스', 'CJ엔터테인먼트', '110');
insert into 영화 values('20170002', '택시운전사', '2017', '02:17:41', '2017-08-02', '더 램프', '쇼박스', '111');
insert into 영화 values('20200002', '방자전', '2020', '02:05:17', '2020-11-12', '어바웃필름', '쇼박스', '106');

-- select * from 영화;

insert into 감독 values('2010101',  '봉준호', '남', '1969-09-14', '경상북도 대구시', '연세대학교');
insert into 감독 values('2010102',  '김기덕', '남', '1960-12-20', '경상북도 봉화군', '총신대학교');
insert into 감독 values('2011101',  '홍상수', '남', '1960-10-25', '서울특별시', '중앙대학교');
insert into 감독 values('2011102',  '이창동', '남', '1954-04-01', '경상북도 대구시', '경북대학교');
insert into 감독 values('2011103',  '박찬욱', '남', '1963-08-23', '서울특별시 종로구', '서강대학교');

-- select * from 감독;

insert into 배우 values('870901-1143623', '강동원', '남', '1987-09-01', '인천시 서구', '183',  '72', 'B');
insert into 배우 values('720321-2111321', '김혜수', '여', '1972-03-21', '경상남도 대구', '165',  '45', 'A');
insert into 배우 values('810702-1324659', '권상우', '남', '1981-07-02', '경상남도 부산', '187',  '84', 'A');
insert into 배우 values('791221-1978465', '류승범', '남', '1979-12-21', '서울시 강서구', '175',  '68', 'O');
insert into 배우 values('840101-2798465', '전지현', '여', '1984-01-01', '제주도 제주시', '165',  '45', 'B');

insert into 배우 values('680103-1345154', '송강호', '남', '1968-01-03', '인천시 부평구', '174',  '68', 'O');
insert into 배우 values('860323-1134526', '원빈', '남', '1986-03-23', '전라남도 광주', '185',  '74', 'AB');
insert into 배우 values('790915-1349156', '장동건', '남', '1979-09-15', '전라북도 전주', '185',  '76', 'AB');
insert into 배우 values('790131-2623464', '하지원', '여', '1979-01-31', '경기도 김포', '163',  '49', 'A');
insert into 배우 values('860505-2561322', '한가인', '여', '1986-05-05', '서울시 강북구', '159',  '47', 'O');


-- select * from 배우;

insert into 디렉팅 values('2010101', '20200001');
insert into 디렉팅 values('2010101', '20190001');
insert into 디렉팅 values('2010101', '20200002');
insert into 디렉팅 values('2010102', '20140001');
insert into 디렉팅 values('2010102', '20190001');
insert into 디렉팅 values('2011101', '20190001');
insert into 디렉팅 values('2011101', '20200002');
insert into 디렉팅 values('2011102', '20170001');
insert into 디렉팅 values('2011102', '20200002');
insert into 디렉팅 values('2011103', '20140001');


-- select 감독등록번호, count(*) as '감독 횟수' from 디렉팅 group by 감독등록번호;

-- select 영화코드, count(*) as '참여 감독수' from 디렉팅 group by 영화코드; 

insert into 배역 values('680103-1345154',  '20200001', '주연'); 
insert into 배역 values('720321-2111321',  '20140001', '주연');
insert into 배역 values('790131-2623464',  '20190001', '주연');
insert into 배역 values('790915-1349156',  '20170001', '주연');
insert into 배역 values('720321-2111321',  '20170002', '주연');

insert into 배역 values('810702-1324659',  '20200002', '주역');
insert into 배역 values('840101-2798465',  '20200002', '주연');
insert into 배역 values('860323-1134526',  '20200001', '조연');
insert into 배역 values('860505-2561322',  '20140001', '조연');
insert into 배역 values('870901-1143623',  '20190001', '조연');

insert into 배역 values('810702-1324659',  '20170001', '조연');
insert into 배역 values('840101-2798465',  '20170002', '주연');
insert into 배역 values('860323-1134526',  '20170002', '단역');
insert into 배역 values('860505-2561322',  '20200001', '단역');
insert into 배역 values('680103-1345154',  '20140001', '단역');

-- select * from 배역;

-- select 배우주민번호, count(*) as 출연횟수 
-- from 배역
-- group by 배우주민번호;

-- select 영화코드, count(*) as '출연배우 수'
-- from 배역
-- group by 영화코드;


-- ------------------------------------------------------------------------------------------
-- 												테이블 검색
-- ------------------------------------------------------------------------------------------
-- * 제 자료에서는 Romantic comedy대신 Fantasy로 대체해서 출력하였습니다!!


-- 4. 2020년에 제작된 장르별 영화의 편수를 구하시오.

-- select 장르.장르명 as 장르명, count(장르.장르코드) as 제작편수
-- from 영화 join 장르 on 영화.장르코드 = 장르.장르코드
-- group by 장르명;

-- 5. Romantic comedy에 출연하지 않은 배우목록을 출력하시오.
* 제 자료에서는 Romantic comedy대신 Fantasy로 대체해서 출력하였습니다!!

select distinct 배우.이름 as 이름
from 배우 join 배역 
on 배우.주민번호 = 배역.배우주민번호 join 영화
on 배역.영화코드 = 영화.영화코드  join 장르
on 영화.장르코드 = 장르.장르코드
where 장르.장르명 = 'Fantasy';

 
 