package com.study.spring.my.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.study.spring.my.dao.MyDao;
import com.study.spring.my.service.MyService;

//@Service
public class MyServiceImpl implements MyService {
  
  private MyDao myDao;
  SqlSessionTemplate session;
  
  @Override
  public List<Map> myList() {
    
    return myDao.myList(session);
  }
}
