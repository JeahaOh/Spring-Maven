package com.mnet.exam.item.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ItemDAO {

	List<Map> itemListAll(SqlSessionTemplate session);
	List<Map> itemSearch(SqlSessionTemplate session, String groupcode);
	int insertItem(SqlSessionTemplate session, Map item);
	int updateItem(SqlSessionTemplate session, Map item);
	List<Map> inItemList(SqlSessionTemplate session);
	int insertAmt(SqlSessionTemplate session, Map insert);
	int updateItemAmt(SqlSessionTemplate session, Map insert);
	int updateInItemAmt(SqlSessionTemplate session, Map update);
	int updateAmt(SqlSessionTemplate session, Map update);
	List<Map> outItemList(SqlSessionTemplate session);
	List<Map> delivCo(SqlSessionTemplate session);
	int outItemSave(SqlSessionTemplate session, Map param);
	int itemStockUpdate(SqlSessionTemplate session, Map param);
}
