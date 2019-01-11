package com.study.spring.emp.service.impl;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.study.spring.emp.dao.EmpDao;
import com.study.spring.emp.service.EmpService;

@Service
public class EmpServiceImpl implements EmpService {
  
  @Autowired
  private EmpDao empDao;
  
  @Autowired
  SqlSessionTemplate session;
  
  @Override
  public List<Object> empList() {
    System.out.println("What is the trouble??");
    return empDao.empList(session);
  }

}
