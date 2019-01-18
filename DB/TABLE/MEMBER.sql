--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:46 KST 2019
--Tool version     :3.3.0.1



DROP TABLE EXAM_MANAGER."MEMBER" CASCADE CONSTRAINTS PURGE;


--
--MEMBER   (TABLE)
--
CREATE TABLE EXAM_MANAGER."MEMBER"(
  NICKNAME VARCHAR2(20 BYTE),
  STATUS VARCHAR2(1 BYTE),
  PASSWORD VARCHAR2(30 BYTE),
  ENROLL_DATE DATE,
  MODIFY_DATE DATE,
  MID NUMBER,
  EMAIL VARCHAR2(30 BYTE),
  POINT NUMBER
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
