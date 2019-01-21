package com.study.spring.db.domain;

public class Item {
  String ITEMCD;        // 상품코드
  String ITEMNAME;      // 상품명
  String MADEMCD;       // 제조사코드
  String ITEMUNITCD;    // 상품단위코드
  int STOCKAMT;         // 재고수량
  String STOCKYN;       // 재고여부
  String INSUSER;
  String INSDATE;
  String USEYN;         // 사용여부
  String ITEMCLSCD;
  
  public Item() {  }
  
  public String getITEMCD() {
    return ITEMCD;
  }
  public void setITEMCD(String iTEMCD) {
    ITEMCD = iTEMCD;
  }
  public String getITEMNAME() {
    return ITEMNAME;
  }
  public void setITEMNAME(String iTEMNAME) {
    ITEMNAME = iTEMNAME;
  }
  public String getMADEMCD() {
    return MADEMCD;
  }
  public void setMADEMCD(String mADEMCD) {
    MADEMCD = mADEMCD;
  }
  public String getITEMUNITCD() {
    return ITEMUNITCD;
  }
  public void setITEMUNITCD(String iTEMUNITCD) {
    ITEMUNITCD = iTEMUNITCD;
  }
  public int getSTOCKAMT() {
    return STOCKAMT;
  }
  public void setSTOCKAMT(int sTOCKAMT) {
    STOCKAMT = sTOCKAMT;
  }
  public String getSTOCKYN() {
    return STOCKYN;
  }
  public void setSTOCKYN(String sTOCKYN) {
    STOCKYN = sTOCKYN;
  }
  public String getINSUSER() {
    return INSUSER;
  }
  public void setINSUSER(String iNSUSER) {
    INSUSER = iNSUSER;
  }
  public String getINSDATE() {
    return INSDATE;
  }
  public void setINSDATE(String iNSDATE) {
    INSDATE = iNSDATE;
  }
  public String getUSEYN() {
    return USEYN;
  }
  public void setUSEYN(String uSEYN) {
    USEYN = uSEYN;
  }
  public String getITEMCLSCD() {
    return ITEMCLSCD;
  }
  public void setITEMCLSCD(String iTEMCLSCD) {
    ITEMCLSCD = iTEMCLSCD;
  }
}
