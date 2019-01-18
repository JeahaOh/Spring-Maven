--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:47 KST 2019
--Tool version     :3.3.0.1



ALTER TABLE EXAM_MANAGER.EMP DROP CONSTRAINT PK_EMP;


--
--PK_EMP   (CONSTRAINT)
--
ALTER TABLE EXAM_MANAGER.EMP ADD CONSTRAINT PK_EMP PRIMARY KEY (EMPNO);
