/*---------------------------------------------
-- 오브젝트명: EXAM_MANAGER.USERINFO
-- 생성일자 : 2018-08-09 10:37:54.0
-- 상태: VALID
---------------------------------------------*/
CREATE TABLE EXAM_MANAGER.USERINFO(
  ID VARCHAR2(20 BYTE) NOT NULL,
  PASS VARCHAR2(10 BYTE) NOT NULL,
  NAME VARCHAR2(20 BYTE) NOT NULL,
  INSDATE VARCHAR2(8 BYTE) NOT NULL,
  USEYN VARCHAR2(1 BYTE) DEFAULT 'Y' NOT NULL
)
TABLESPACE TS_EXAM_MANAGER
 PCTFREE 10
 INITRANS 1
 MAXTRANS 255
 STORAGE
 (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS UNLIMITED
  BUFFER_POOL DEFAULT
 ) MONITORING;

COMMENT ON TABLE EXAM_MANAGER.USERINFO IS '회원정보';

COMMENT ON COLUMN EXAM_MANAGER.USERINFO.ID IS '아이디';

COMMENT ON COLUMN EXAM_MANAGER.USERINFO.PASS IS '패스워드';

COMMENT ON COLUMN EXAM_MANAGER.USERINFO.NAME IS '이름';

COMMENT ON COLUMN EXAM_MANAGER.USERINFO.INSDATE IS '가입일';

COMMENT ON COLUMN EXAM_MANAGER.USERINFO.USEYN IS '사용여부';

ALTER TABLE EXAM_MANAGER.USERINFO ADD CONSTRAINT SYS_C0012823 PRIMARY KEY (ID);
