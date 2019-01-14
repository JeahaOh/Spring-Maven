package com.mnet.exam.item.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mnet.exam.code.service.CodeService;
import com.mnet.exam.item.service.ItemService;

@Controller
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	@Autowired
	private  ItemService service;
	@Autowired
	private CodeService cdService;
	
	@RequestMapping("item/itemList")
	public ModelAndView itemListAll(ModelAndView mv)
	{
		List<Map> items=service.itemListAll();
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		mv.addObject("items",items);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.setViewName("item/itemList");
		return mv;
	}
	
	@RequestMapping("item/uiInItemList")
	public ModelAndView uiInItemListAll(ModelAndView mv)
	{
		List<Map> items=service.itemListAll();
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		for(int i=0;i<items.size(); i++)
		{
			items.get(i).put("recid", i+1);
		}
		Gson gson=new Gson();
		String item=gson.toJson(items);
		String madeco=gson.toJson(madeCodes);
		String unitco=gson.toJson(unitCodes);
		String cateco=gson.toJson(cateCodes);
		mv.addObject("items",item);
		mv.addObject("madeCodes",madeco);
		mv.addObject("unitCodes",unitco);
		mv.addObject("cateCodes",cateco);
		mv.setViewName("item/uiInItemList");
		return mv;
	}
	
	@RequestMapping("item/groupList")
	public void groupList(String catecode, HttpServletResponse response) throws Exception
	{
		List<Map> groupList=cdService.groupList(catecode);
		Gson gson=new Gson();
		String json=gson.toJson(groupList);
		response.getWriter().print(json);
		
	}
	
	@RequestMapping("item/itemSearch")
	public void itemSearch(String groupcode, HttpServletResponse response) throws Exception
	{
		List<Map> searchList=service.itemSearch(groupcode);
		Gson gson=new Gson();
		
		String json=gson.toJson(searchList);
		response.getWriter().print(json);
	}
	
	@RequestMapping("item/insertItem")
	public ModelAndView insertItem(String catecode, String groupcode, String itemcd, String itemname, String madename, String unitname, String useyn, ModelAndView mv)
	{
		Map item=new HashMap();
		item.put("groupcode", groupcode);
		item.put("itemcd", itemcd);
		item.put("itemname", itemname);
		item.put("madenmcd", madename.trim());
		item.put("itemunitcd", unitname.trim());
		if(useyn==null)
		{
			useyn="N";
		}
		item.put("useyn", useyn);
		
		int result=service.insertItem(item);
		List<Map> searchList=service.itemSearch(groupcode);
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		List<Map> groupList=cdService.groupList(catecode);
		if(result>0)
		{
			
			mv.addObject("usedCate",catecode);
			mv.addObject("usedGroup",groupcode);
			mv.addObject("groupList",groupList);
			mv.addObject("msg","추가 저장 성공");
		}
		else
		{
			mv.addObject("msg","추가 저장 실패");
		}
		mv.addObject("items",searchList);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.setViewName("item/itemList");
		
		return mv;
	}
	@RequestMapping("item/updateItem")
	public ModelAndView updateItem(String catecode, String groupcode, String itemcd, String itemname, String madename, String unitname, String useyn, ModelAndView mv)
	{
		Map item=new HashMap();
		item.put("groupcode", groupcode);
		item.put("itemcd", itemcd);
		item.put("itemname", itemname);
		item.put("madenmcd", madename.trim());
		item.put("itemunitcd", unitname.trim());
		if(useyn==null)
		{
			useyn="N";
		}
		item.put("useyn", useyn);
		
		int result=service.updateItem(item);
		List<Map> searchList=service.itemSearch(groupcode);
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		List<Map> groupList=cdService.groupList(catecode);
		if(result>0)
		{
			
			mv.addObject("usedCate",catecode);
			mv.addObject("usedGroup",groupcode);
			mv.addObject("groupList",groupList);
			mv.addObject("msg","수정 성공");
		}
		else
		{
			mv.addObject("msg","수정 실패");
		}
		mv.addObject("items",searchList);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.setViewName("item/itemList");
	
		
		return mv;
	}
	
	@RequestMapping("item/inItemList")
	public ModelAndView inItemList(ModelAndView mv)
	{
		List<Map> items=service.itemListAll();
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		List<Map> inItems=service.inItemList();
		mv.addObject("items",items);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.addObject("inItems",inItems);
		mv.setViewName("item/inItemList");
		return mv;
	}
	
	@RequestMapping("item/insertAmt")
	public ModelAndView insertAmt(String itemcd2, int insamt, String catecode2, String groupcode2, ModelAndView mv)
	{
		Map insert=new HashMap();
		insert.put("itemcd", itemcd2);
		insert.put("insamt", insamt);
		
		int result=service.insertAmt(insert);
		List<Map> searchList=service.itemSearch(groupcode2);
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		List<Map> groupList=cdService.groupList(catecode2);
		List<Map> inItems=service.inItemList();
		if(result>0)
		{
			searchList=service.itemSearch(groupcode2);
			inItems=service.inItemList();
			mv.addObject("usedCate",catecode2);
			mv.addObject("usedGroup",groupcode2);
			mv.addObject("groupList",groupList);
			mv.addObject("msg","입고 성공");
		}
		else
		{
			mv.addObject("msg","입고 실패");
		}
		mv.addObject("items",searchList);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.addObject("inItems",inItems);
		mv.setViewName("item/inItemList");
	
		
		return mv;
	}
	@RequestMapping("item/uiItemInsert")
	public void uiItemInsert(String itemcd, int insamt,HttpServletResponse response) throws Exception
	{
		Map insert=new HashMap();
		insert.put("itemcd", itemcd);
		insert.put("insamt", insamt);
		
		int result=service.insertAmt(insert);
		
		String item="";
		List<Map> items=service.itemListAll();
		for(int i=0; i<items.size();i++)
		{
			items.get(i).put("recid", i+1);
		}
		if(result>0)
		{
			Gson gson=new Gson();
			item=gson.toJson(items);
		}
		else
		{
			item="입력실패";
		}
		response.getWriter().println(item);
	}
	@RequestMapping("item/updateAmt")
	public ModelAndView updateAmt(String initemcd,String itemcd2, int insamt, int beforeamt, String catecode2, String groupcode2, ModelAndView mv)
	{
		Map update=new HashMap();
		update.put("itemcd", itemcd2);
		update.put("beforeamt",beforeamt);
		update.put("insamt", insamt);
		update.put("initemcd", initemcd);
		
		int result=service.updateAmt(update);
		List<Map> searchList=service.itemSearch(groupcode2);
		List<Map> madeCodes=cdService.madeCodeList();
		List<Map> unitCodes=cdService.unitCodeList();
		List<Map> cateCodes=cdService.cateCodeList();
		List<Map> groupList=cdService.groupList(catecode2);
		List<Map> inItems=service.inItemList();
		if(result>0)
		{
			searchList=service.itemSearch(groupcode2);
			inItems=service.inItemList();
			mv.addObject("usedCate",catecode2);
			mv.addObject("usedGroup",groupcode2);
			mv.addObject("groupList",groupList);
			mv.addObject("msg","수정 성공");
		}
		else
		{
			mv.addObject("msg","수정 실패");
		}
		mv.addObject("items",searchList);
		mv.addObject("madeCodes",madeCodes);
		mv.addObject("unitCodes",unitCodes);
		mv.addObject("cateCodes",cateCodes);
		mv.addObject("inItems",inItems);
		mv.setViewName("item/inItemList");
		return mv;
	}
	
	@RequestMapping("item/outItemList")
	public ModelAndView outItemList(ModelAndView mv)
	{
		List<Map> outItems=service.outItemList();
		List<Map> delivCo=service.delivCo();
		mv.addObject("outItems",outItems);
		mv.addObject("delivCo",delivCo);
		mv.setViewName("item/outItemList");
		return mv;
	}
	
	@RequestMapping("item/outItemSave")
	public ModelAndView outItemSave(ModelAndView mv, String outitemlistcd, String itemcd, String checkyn, String delivyn, String delivcorpcd, String delivno, int delivamt )
	{
		Map param=new HashMap();
		param.put("outitemlistcd", outitemlistcd);
		param.put("itemcd", itemcd);
		if(checkyn==null) checkyn="N";
		if(delivyn==null) delivyn="N";
		param.put("checkyn", checkyn);
		param.put("delivyn", delivyn);
		param.put("delivcorpcd", delivcorpcd);
		param.put("delivno", delivno);
		param.put("delivamt", delivamt);
		int result=service.outItemSave(param);
		String msg="";
		String loc="/item/outItemList";
		if(result>0)
		{
			msg="수정성공";
		}
		else
		{
			msg="수정실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
