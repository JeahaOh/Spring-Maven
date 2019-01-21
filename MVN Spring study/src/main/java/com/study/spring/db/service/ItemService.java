package com.study.spring.db.service;

import java.util.List;
import com.study.spring.db.domain.Code;
import com.study.spring.db.domain.Item;

public interface ItemService {
  List<Code> getCatagoList();
  List<Code> getDetailList(String cdno);
  List<Item> getSearchItems(String cdno);
}
