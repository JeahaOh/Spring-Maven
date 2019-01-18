--Database Type    :Oracle
--Schema           :schema
--Create date      :Fri Jan 18 10:18:47 KST 2019
--Tool version     :3.3.0.1



ALTER TABLE EXAM_MANAGER.DEPT DROP CONSTRAINT PK_DEPT;


--
--PK_DEPT   (CONSTRAINT)
--
ALTER TABLE EXAM_MANAGER.DEPT ADD CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO);
