package com.mnet.exam.code.controller;

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

import com.mnet.exam.HomeController;
import com.mnet.exam.code.service.CodeService;

@Controller
public class CodeController {

	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Autowired
	private CodeService service;
	
	@RequestMapping("code/codeMng")
	public ModelAndView codeMng(ModelAndView mv)
	{
		List<Map> codes=service.codeListAll();
		mv.addObject("codes",codes);
		mv.setViewName("code/codeMng");
		return mv;
	}
	
	@RequestMapping("code/insertCode")
	public ModelAndView insertCode(int cdlvl, String upcd, String cdname, String useyn,ModelAndView mv )
	{
		Map code=new HashMap();
		code.put("cdlvl", cdlvl);
		code.put("upcd", upcd);
		code.put("cdname", cdname);
		code.put("useyn", useyn);
		int result=service.insertCode(code);
		
		String msg="";
		if(result>0)
		{
			msg="코드가  추가 되었습니다.";
			mv.addObject("msg",msg);
		}
		else
		{
			msg="코드 추가 실패";
			mv.addObject("msg",msg);
		}
		mv.addObject("loc","/code/codeMng");
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	@RequestMapping("code/updateCode")
	public ModelAndView insertCode(String cdno,int cdlvl, String upcd, String cdname, String useyn,ModelAndView mv )
	{
		Map code=new HashMap();
		code.put("cdno", cdno);
		code.put("cdlvl", cdlvl);
		code.put("upcd", upcd);
		code.put("cdname", cdname);
		if(useyn==null)
		{
			useyn="N";
		}
		code.put("useyn", useyn);
		int result=service.updateCode(code);
		
		String msg="";
		if(result>0)
		{
			msg="코드가  수정 되었습니다.";
		}
		else
		{
			msg="코드 수정 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/code/codeMng");
		mv.setViewName("common/msg");
		return mv;
		
	}
}
