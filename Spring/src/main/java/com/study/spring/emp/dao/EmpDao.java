package com.study.spring.emp.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

public interface EmpDao {
  List<Object> empList(SqlSessionTemplate session);
}
