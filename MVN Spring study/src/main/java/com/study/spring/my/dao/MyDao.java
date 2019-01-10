package com.study.spring.my.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public interface MyDao {
  List<Map> myList(SqlSessionTemplate session);
}
