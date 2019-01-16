package com.study.spring.db.domain;

public class User {
    private String id;
    private String pw;
    private String name;
    private String insdate;
    private String useyn;
    
    public User() { }
    public User(String id, String pw, String name, String insdate, String useyn) {
        super();
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.insdate = insdate;
        this.useyn = useyn;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInsdate() {
        return insdate;
    }

    public void setInsdate(String insdate) {
        this.insdate = insdate;
    }

    public String getUseyn() {
        return useyn;
    }

    public void setUseyn(String useyn) {
        this.useyn = useyn;
    }
    @Override
    public String toString() {
      return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", insdate=" + insdate
          + ", useyn=" + useyn + "]";
    }
    
    
}
