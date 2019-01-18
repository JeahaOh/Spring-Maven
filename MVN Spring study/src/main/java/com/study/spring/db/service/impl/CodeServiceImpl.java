package com.study.spring.db.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.study.spring.db.dao.CodeDao;
import com.study.spring.db.domain.Code;
import com.study.spring.db.service.CodeService;

@Service("codeService")
@Component
public class CodeServiceImpl implements CodeService {
  
  @Autowired CodeDao codeDao;
  
  @Override
  public List<Code> showAll() {
    return codeDao.showAll();
  }
  @Override
  public Boolean insert(Code code) {
    return codeDao.insert(code);
  }
  
  @Override
  public Boolean update(Code code) {
    return codeDao.update(code);
  }
}
