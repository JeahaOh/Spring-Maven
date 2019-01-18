--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:47 KST 2019
--Tool version     :3.3.0.1



DROP INDEX EXAM_MANAGER.SYS_C0016280;


--
--SYS_C0016280   (INDEX)
--
CREATE  UNIQUE INDEX EXAM_MANAGER.SYS_C0016280
 ON EXAM_MANAGER.BOARD1 ("SEQ" ASC)
  TABLESPACE TS_EXAM_MANAGER
  NOPARALLEL  
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
  INITIAL 64KB
  NEXT 1MB
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
  );
