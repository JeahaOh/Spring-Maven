package com.mnet.exam.item.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface ItemService {

	List<Map> itemListAll();
	List<Map> itemSearch(String groupcode);
	int insertItem(Map item);
	int updateItem(Map item);
	List<Map> inItemList();
	int insertAmt(Map insert);
	int updateAmt(Map update);
	List<Map> outItemList();
	List<Map> delivCo();
	int outItemSave(Map param);
}
