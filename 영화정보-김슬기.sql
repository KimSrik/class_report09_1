-- ------------------------------------------------------------------------------------------
-- 												데이터베이스 생성 및 초기화,
-- 														권한 초기화 및 생성
-- ------------------------------------------------------------------------------------------

drop database if exists 영화정보_DB;
drop user if exists movie_admin@localhost;
create database if not exists 영화정보_DB;
create user movie_admin@localhost identified with mysql_native_password by 'movie';
grant all privileges on 영화정보_DB.* to movie_admin@localhost with grant option;

use 영화정보_DB;