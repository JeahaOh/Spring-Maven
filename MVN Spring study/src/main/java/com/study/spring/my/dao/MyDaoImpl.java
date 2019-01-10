package com.study.spring.my.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public class MyDaoImpl implements MyDao {

  @Override
  public List<Map> myList(SqlSessionTemplate session) {
    return session.selectList("my.myList");
  }
}
//https://www.google.com/search?q=Servlet.service()+for+servlet+%5BappServlet%5D+in+context+with+path+%5B%2Fspring%5D+threw+exception&rlz=1C5CHFA_enKR819KR819&oq=Servlet.service()+for+servlet+%5BappServlet%5D+in+context+with+path+%5B%2Fspring%5D+threw+exception&aqs=chrome..69i57.1305j0j1&sourceid=chrome&ie=UTF-8