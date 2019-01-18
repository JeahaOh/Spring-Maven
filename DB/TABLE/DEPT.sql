--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:46 KST 2019
--Tool version     :3.3.0.1



DROP TABLE EXAM_MANAGER.DEPT CASCADE CONSTRAINTS PURGE;


--
--DEPT   (TABLE)
--
CREATE TABLE EXAM_MANAGER.DEPT(
  LOC VARCHAR2(13 BYTE),
  DEPTNO NUMBER(2,0),
  DNAME VARCHAR2(14 BYTE)
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

COMMENT ON TABLE EXAM_MANAGER.DEPT IS '�μ�';
COMMENT ON COLUMN EXAM_MANAGER.DEPT.LOC IS '��ġ';