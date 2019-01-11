package com.mnet.exam.emp.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mnet.exam.emp.service.EmpService;

@Controller
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	@Autowired
	private EmpService service;
	
	@RequestMapping("emp/empList")
	public ModelAndView empList(ModelAndView mv)
	{
		List<Map> empList=service.empList();
		
		mv.addObject("empList",empList);
		mv.setViewName("emp/empList");
		return mv;
	}
	@RequestMapping("emp/uiEmpList")
	public ModelAndView uiEmpList(ModelAndView mv)
	{
		List<Map> empList=service.empList();
		for(int i=0;i<empList.size();i++)
		{
			empList.get(i).put("recid", i+1);
		}
		Gson gson=new Gson();
		String json=gson.toJson(empList);
		mv.addObject("empList",json);
		mv.setViewName("emp/ui-empList");
		return mv;
	}
	
	
}
