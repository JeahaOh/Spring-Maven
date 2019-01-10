package com.study.spring.emp.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public class EmpDaoImpl implements EmpDao {

  @Override
  public List<Map> empList(SqlSessionTemplate session) {
    return session.selectList("emp.empList");
  }
}