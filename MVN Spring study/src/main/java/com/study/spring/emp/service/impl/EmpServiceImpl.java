package com.study.spring.emp.service.impl;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import com.study.spring.emp.dao.EmpDao;
import com.study.spring.emp.service.EmpService;

//@Service
public class EmpServiceImpl implements EmpService {
  
  private EmpDao empDao;
  SqlSessionTemplate session;
  
  @Override
  public List<Map> empList() {
    
    return empDao.empList(session);
  }

}
