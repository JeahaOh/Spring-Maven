package com.study.spring.db.dao;

import java.util.List;
import com.study.spring.db.domain.Code;

public interface CodeDao {
  List<Code> showAll();
  Boolean update(Code code);
}
