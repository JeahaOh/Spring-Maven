package com.study.spring.emp.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

public class EmpDaoImpl implements EmpDao {
  
  @Override
  public List<Object> empList(SqlSessionTemplate session) {
    return session.selectList("empList");
  }
}