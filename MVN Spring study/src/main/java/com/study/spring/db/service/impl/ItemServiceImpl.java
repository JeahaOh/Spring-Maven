package com.study.spring.db.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.study.spring.db.dao.CodeDao;
import com.study.spring.db.dao.ItemDao;
import com.study.spring.db.domain.Code;
import com.study.spring.db.domain.Item;
import com.study.spring.db.service.ItemService;

@Service("itemService")
@Component
public class ItemServiceImpl implements ItemService {
  
  @Autowired ItemDao itemDao;
  @Autowired CodeDao codeDao;
  
  
  @Override
  public List<Code> getCatagoList() {
    return codeDao.getCatagoList();
  }
  
  @Override
  public List<Code> getDetailList(String cdno) {
    return codeDao.getDetailList(cdno);
  }
  
  @Override
  public List<Item> getSearchItems(String cdno) {
    return itemDao.getSearchItems(cdno);
  }
  
}
