/*---------------------------------------------
-- 오브젝트명: EXAM_MANAGER.CODEMNG
-- 생성일자 : 2018-08-09 10:37:53.0
-- 상태: VALID
---------------------------------------------*/
CREATE TABLE EXAM_MANAGER.CODEMNG(
  CDNO VARCHAR2(5 BYTE) NOT NULL,
  CDLVL NUMBER(1,0) NOT NULL,
  UPCD VARCHAR2(5 BYTE) NOT NULL,
  CDNAME VARCHAR2(20 BYTE) NOT NULL,
  INSUSER VARCHAR2(20 BYTE) NOT NULL,
  INSDATE VARCHAR2(8 BYTE) NOT NULL,
  USEYN VARCHAR2(1 BYTE) DEFAULT 'Y'
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

COMMENT ON TABLE EXAM_MANAGER.CODEMNG IS '코드관리';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.CDNO IS '코드번호';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.CDLVL IS '코드레벨';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.UPCD IS '상위코드';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.CDNAME IS '코드이름';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.INSUSER IS '등록자';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.INSDATE IS '등록일';

COMMENT ON COLUMN EXAM_MANAGER.CODEMNG.USEYN IS '사용여부';

ALTER TABLE EXAM_MANAGER.CODEMNG ADD CONSTRAINT SYS_C0012802 PRIMARY KEY (CDNO);
