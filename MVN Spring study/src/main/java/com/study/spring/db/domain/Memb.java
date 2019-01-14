package com.study.spring.db.domain;

public class Memb {
/*	int mno;

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}*/
  
  String ENAME;
  int COMM;
  String HIREDATE;
  int EMPNO;
  int MGR;
  String JOB;
  int DEPTNO;
  int SAL;
  
  public String getENAME() {
    return ENAME;
  }
  public void setENAME(String eNAME) {
    ENAME = eNAME;
  }
  public int getCOMM() {
    return COMM;
  }
  public void setCOMM(int cOMM) {
    COMM = cOMM;
  }
  public String getHIREDATE() {
    return HIREDATE;
  }
  public void setHIREDATE(String hIREDATE) {
    HIREDATE = hIREDATE;
  }
  public int getEMPNO() {
    return EMPNO;
  }
  public void setEMPNO(int eMPNO) {
    EMPNO = eMPNO;
  }
  public int getMGR() {
    return MGR;
  }
  public void setMGR(int mGR) {
    MGR = mGR;
  }
  public String getJOB() {
    return JOB;
  }
  public void setJOB(String jOB) {
    JOB = jOB;
  }
  public int getDEPTNO() {
    return DEPTNO;
  }
  public void setDEPTNO(int dEPTNO) {
    DEPTNO = dEPTNO;
  }
  public int getSAL() {
    return SAL;
  }
  public void setSAL(int sAL) {
    SAL = sAL;
  }
}
