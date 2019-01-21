package com.study.spring.db.dao;

import java.util.List;
import com.study.spring.db.domain.Code;

public interface CodeDao {
  List<Code> showAll();
  Boolean insert(Code code);
  Boolean update(Code code);
  List<Code> getCatagoList();
  List<Code> getDetailList(String cdno);
}
