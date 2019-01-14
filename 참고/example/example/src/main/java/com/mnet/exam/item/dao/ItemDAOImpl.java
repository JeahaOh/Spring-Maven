package com.mnet.exam.item.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Override
	public List<Map> itemListAll(SqlSessionTemplate session) {
		return session.selectList("item.itemListAll");
	}

	@Override
	public List<Map> itemSearch(SqlSessionTemplate session, String groupcode) {
		return session.selectList("item.itemSearch",groupcode);
	}

	@Override
	public int insertItem(SqlSessionTemplate session, Map item) {
		return session.insert("item.insertItem",item);
	}

	@Override
	public int updateItem(SqlSessionTemplate session, Map item) {
		return  session.update("item.updateItem",item);
	}

	@Override
	public List<Map> inItemList(SqlSessionTemplate session) {
		return session.selectList("item.inItemList");
	}

	@Override
	public int insertAmt(SqlSessionTemplate session, Map insert) {
		return session.insert("item.insertAmt",insert);
	}

	@Override
	public int updateItemAmt(SqlSessionTemplate session, Map insert) {
		return session.update("item.updateItemAmt",insert);
	}

	@Override
	public int updateInItemAmt(SqlSessionTemplate session, Map update) {
		return session.update("item.updateInItemAmt",update);
	}

	@Override
	public int updateAmt(SqlSessionTemplate session, Map update) {
		return session.update("item.updateAmt",update);
	}

	@Override
	public List<Map> outItemList(SqlSessionTemplate session) {
		return session.selectList("item.outItemList");
	}

	@Override
	public List<Map> delivCo(SqlSessionTemplate session) {
		return session.selectList("item.delivCo");
	}

	@Override
	public int outItemSave(SqlSessionTemplate session, Map param) {
		return session.update("item.outItemSave",param);
	}

	@Override
	public int itemStockUpdate(SqlSessionTemplate session, Map param) {
		return session.update("item.itemStockUpdate",param);
	}



	

	
}
