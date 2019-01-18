package com.study.spring.db.domain;

public class Code {
  String CDNO;      //  코드번호 NN
  int    CDLVL;     //  코드레벨 NN
  String UPCD;      //  상위코드 NN
  String CDNAME;    //  코드이름 NN
  String INSUSER;   //  등록자 NN
  String INSDATE;   //  등록일 NN
  String USEYN;     //  사용여부 Default 'Y'
  
  public Code() {   }
  public Code(String cDNO, int cDLVL, String uPCD, String cDNAME, String iNSUSER, String iNSDATE,
      String uSEYN) {
    super();
    CDNO = cDNO;
    CDLVL = cDLVL;
    UPCD = uPCD;
    CDNAME = cDNAME;
    INSUSER = iNSUSER;
    INSDATE = iNSDATE;
    USEYN = uSEYN;
  }
  
  public String getCDNO() {
    return CDNO;
  }
  public void setCDNO(String cDNO) {
    CDNO = cDNO;
  }
  public int getCDLVL() {
    return CDLVL;
  }
  public void setCDLVL(int cDLVL) {
    CDLVL = cDLVL;
  }
  public String getUPCD() {
    return UPCD;
  }
  public void setUPCD(String uPCD) {
    UPCD = uPCD;
  }
  public String getCDNAME() {
    return CDNAME;
  }
  public void setCDNAME(String cDNAME) {
    CDNAME = cDNAME;
  }
  public String getINSUSER() {
      if(INSUSER == null) { return "visitor"; }
    return INSUSER;
  }
  public void setINSUSER(String iNSUSER) {
    INSUSER = iNSUSER;
  }
  public String getINSDATE() {
    if(INSDATE == null) { return ""; }
    return INSDATE;
  }
  public void setINSDATE(String iNSDATE) {
    if(INSDATE == null) { return; }
    INSDATE = iNSDATE;
  }
  public String getUSEYN() {
    return USEYN;
  }
  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
  }
  @Override
  public String toString() {
    return "Code [CDNO=" + CDNO + ", CDLVL=" + CDLVL + ", UPCD=" + UPCD + ", CDNAME=" + CDNAME
        + ", INSUSER=" + INSUSER + ", INSDATE=" + INSDATE + ", USEYN=" + USEYN + "]";
  }
  
  
  
}
