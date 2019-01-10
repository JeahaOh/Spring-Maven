package com.study.spring.emp.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public interface EmpDao {
  List<Map> empList(SqlSessionTemplate session);
}
