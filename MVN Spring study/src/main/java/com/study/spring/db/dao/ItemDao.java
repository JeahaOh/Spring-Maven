package com.study.spring.db.dao;

import java.util.List;
import com.study.spring.db.domain.Item;

public interface ItemDao {
  public List<Item>getSearchItems(String cdno);
}
