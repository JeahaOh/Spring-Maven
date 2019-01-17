package com.study.spring.db.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.study.spring.db.dao.CodeDao;
import com.study.spring.db.domain.Code;
import com.study.spring.db.service.CodeService;

@Service("codeService")
@Component
public class CodeServiceImpl implements CodeService {
  
  private static final Logger logger = LoggerFactory.getLogger(CodeServiceImpl.class);
  @Autowired CodeDao codeDao;
  
  @Override
  public List<Code> showAll() {
    return codeDao.showAll();
  }
  
  
  @Override
  public Boolean update(Code code) {
    System.out.println("Service Recieve:\n" + code.toString());
    return codeDao.update(code);
  }
}
