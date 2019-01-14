package com.mnet.exam.item.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnet.exam.item.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO  dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Map> itemListAll() {
		return dao.itemListAll(session);
	}

	@Override
	public List<Map> itemSearch(String groupcode) {
		return dao.itemSearch(session, groupcode);
	}

	@Override
	public int insertItem(Map item) {
		return dao.insertItem(session,item);
	}

	@Override
	public int updateItem(Map item) {
		return dao.updateItem(session,item);
	}

	@Override
	public List<Map> inItemList() {
		return dao.inItemList(session);
	}

	@Override
	public int insertAmt(Map insert) {
		int result=dao.insertAmt(session, insert);
		if(result>0)
		{
			result=dao.updateItemAmt(session,insert);
		}
		else
		{
			session.rollback();
		}
		
		
		return result;
	}

	@Override
	public int updateAmt(Map update) {
		int result=dao.updateInItemAmt(session,update);
		if(result>0)
		{
			result=dao.updateAmt(session,update);
			return result;
		}
		else
		{
			session.rollback();
		}
		return result;
	}

	@Override
	public List<Map> outItemList() {
		return dao.outItemList(session);
	}

	@Override
	public List<Map> delivCo() {
		return dao.delivCo(session);
	}

	@Override
	public int outItemSave(Map param) {
		int result=dao.outItemSave(session,param);
		if(result>0)
		{
			if(param.get("delivyn").equals("Y"))
			result=dao.itemStockUpdate(session,param);
		}
		else
		{
			
			session.rollback();
		}
		return result;
	}
	
}
