/*---------------------------------------------
-- 오브젝트명: EXAM_MANAGER.OUTITEMLIST
-- 생성일자 : 2018-08-13 10:56:42.0
-- 상태: VALID
---------------------------------------------*/
CREATE TABLE EXAM_MANAGER.OUTITEMLIST(
  ITEMCD VARCHAR2(5 BYTE) NOT NULL,
  USERINFODETAILCD VARCHAR2(10 BYTE) NOT NULL,
  OUTITEMLISTCD VARCHAR2(10 BYTE) NOT NULL,
  DELIVAMT NUMBER(5,0) NOT NULL,
  CHECKUSER VARCHAR2(20 BYTE),
  CHECKDATE VARCHAR2(8 BYTE),
  CHECKYN VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL,
  DELIVYN VARCHAR2(1 BYTE) DEFAULT 'N',
  DELIVCORPCD VARCHAR2(5 BYTE),
  DELIVNO VARCHAR2(10 BYTE),
  INSUSER VARCHAR2(20 BYTE),
  INSDATE VARCHAR2(8 BYTE)
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

COMMENT ON TABLE EXAM_MANAGER.OUTITEMLIST IS '출고상품리스트';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.ITEMCD IS '상품코드(i)';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.USERINFODETAILCD IS '회원상세정보코드(u)';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.OUTITEMLISTCD IS '출고상품리스트코드(oi)';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.DELIVAMT IS '출고수량';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.CHECKUSER IS '검수자';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.CHECKDATE IS '검수일';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.CHECKYN IS '검수여부';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.DELIVYN IS '배송여부';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.DELIVCORPCD IS '배송회사코드';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.DELIVNO IS '송장번호';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.INSUSER IS '등록자';

COMMENT ON COLUMN EXAM_MANAGER.OUTITEMLIST.INSDATE IS '등록일';

ALTER TABLE EXAM_MANAGER.OUTITEMLIST ADD CONSTRAINT SYS_C0013099 PRIMARY KEY (OUTITEMLISTCD);

ALTER TABLE EXAM_MANAGER.OUTITEMLIST ADD CONSTRAINT SYS_C0013102 FOREIGN KEY (USERINFODETAILCD) REFERENCES "EXAM_MANAGER"."USERINFODETAIL"(USERINFODETAILCD);

ALTER TABLE EXAM_MANAGER.OUTITEMLIST ADD CONSTRAINT SYS_C0013101 FOREIGN KEY (ITEMCD) REFERENCES "EXAM_MANAGER"."ITEMLIST"(ITEMCD);
