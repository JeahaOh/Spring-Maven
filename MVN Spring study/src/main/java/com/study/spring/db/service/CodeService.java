package com.study.spring.db.service;

import java.util.List;
import com.study.spring.db.domain.Code;

public interface CodeService {
  List<Code> showAll();
  
  public Boolean update(Code code);
}
