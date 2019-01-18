--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:47 KST 2019
--Tool version     :3.3.0.1



DROP INDEX EXAM_MANAGER.SYS_C0016233;


--
--SYS_C0016233   (INDEX)
--
CREATE  UNIQUE INDEX EXAM_MANAGER.SYS_C0016233
 ON EXAM_MANAGER.EMPLIST ("EMPNO" ASC)
  TABLESPACE TS_EXAM_MANAGER
  NOPARALLEL  
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
  BUFFER_POOL DEFAULT
  );
