-- 학생 및 직원 테이블 생성 (생성 완료)
CREATE TABLE member (
    id         int                NOT NULL AUTO_INCREMENT,
	userid     varchar(20)        NULL,
    pw         varchar(20)        NULL,
	name       varchar(20)        NOT NULL,
    gender     enum('남자', '여자')  NOT NULL,
    birth      date,
    post       varchar(7)		  NULL,
    addr       varchar(100)		  NULL,
    email      varchar(50)		  NULL,
    phone      varchar(20)        NOT NULL,
	status     varchar(20)		  NOT NULL,
	employ     varchar(1)         DEFAULT 'N',
    admini     varchar(1)         DEFAULT 'N',
	regisdate  datetime			  NOT NULL DEFAULT now(),
	lastdate   datetime,
	PRIMARY KEY(id))
	DEFAULT CHARSET=utf8
;



-- 공지 테이블 생성
CREATE TABLE notice(
    id          int           NOT NULL AUTO_INCREMENT,
    title       varchar(300)  NOT NULL,
    content     varchar(4000) NOT NULL,
    writer      varchar(20)   NOT NULL,
    writedate   datetime      NOT NULL,
    readcnt     int           DEFAULT 0,
    filename    varchar(300),
    filepath    varchar(300),
	root        int,
    step        int           DEFAULT 0,
    indent      int           DEFAULT 0,
	PRIMARY KEY(id))
	DEFAULT CHARSET=utf8
;


-- 강좌 테이블 생성 (생성 완료)
CREATE TABLE course (
    id          int           NOT NULL AUTO_INCREMENT,
    title       varchar(300)  NOT NULL,
    content     varchar(4000) NOT NULL,
	lecturer    varchar(20)	  NOT NULL,
	startdate   date		  NOT NULL,
	enddate     date		  NOT NULL,
	fixednum    int           DEFAULT 0,
	regiscnt    int           DEFAULT 0,
	room        varchar (20)  NOT NULL,
	classify    varchar (20)  NOT NULL,
    writer      varchar(20)   NOT NULL,
    writedate   datetime      NOT NULL DEFAULT now(),
	status      varchar(100),
	PRIMARY KEY(id))
	DEFAULT CHARSET=utf8
;


-- 수강 신청 테이블 생성 (생성 완료)
CREATE TABLE regis_course (
	id			int          NOT NULL AUTO_INCREMENT,
	student_id  int,
	course_id   int,
	PRIMARY KEY(id),
	CONSTRAINT course_id_fk FOREIGN KEY (course_id)  REFERENCES course (id)
	ON DELETE CASECADE ON UPDATE CASCADE)
	DEFAULT CHARSET=utf8
;


-- 수강료 테이블 생성 (생성 완료)
CREATE TABLE tuition (
	id			int 		  NOT NULL AUTO_INCREMENT,
	depositor   varchar(20),
	memo		varchar(100),
	status      varchar(50)   NOT NULL,
	amount		int			  NOT NULL,
	name  int,
	yearmonth   date		  NOT NULL,
	depositdate date,
	PRIMARY KEY(id))
	DEFAULT CHARSET=utf8
;


-- 출석체크 테이블
CREATE TABLE attend (

);




