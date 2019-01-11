package com.mnet.exam.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mnet.exam.user.service.UserService;
import com.mnet.exam.user.vo.User;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	@RequestMapping("user/login")
	public ModelAndView userLogin(ModelAndView mv, String userId, String pwd)
	{
		Map<String,String> userInfo=new HashMap<String,String>();
		userInfo.put("userId", userId);
		userInfo.put("pwd", pwd);
		User user=service.userLogin(userInfo);
		
		String msg="아이디 또는 비밀번호가 잘못 되었습니다.";
		String loc="/";		
		if(user!=null)
		{
			mv.setViewName("main");
		}
		else
		{
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		return mv;
	}
	@RequestMapping("user/join")
	public String userJoin()
	{
		return "user/join";
	}
	
	@RequestMapping("user/checkId")
	public void checkId(String userId, HttpServletResponse response) throws Exception
	{
		int result=service.checkId(userId);
		response.getWriter().print(result);
	}
	
	@RequestMapping("user/joinEnd")
	public ModelAndView userJoinEnd(String userId, String pwd_2, String name, ModelAndView mv)
	{
		User user=new User();
		user.setId(userId);
		user.setPw(pwd_2);
		user.setName(name);
		int result=service.userJoinEnd(user);
		
		String msg="";
		String loc="";
		
		if(result>0)
		{
			msg="user정보가 저장되었습니다. 상세정보 작성 페이지로  이동합니다.";
			loc="/user/userDetail?userId="+userId;
		}
		else
		{
			msg="user정보 저장에 실패했습니다. 최초페이지로 이동합니다.";
			loc="/";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("user/userDetail")
	public ModelAndView userDetail(String userId, ModelAndView mv)
	{
		mv.addObject("userId",userId);
		mv.setViewName("user/userDetail");
		return mv;
	}
	
	@RequestMapping("user/userDetailEnd")
	public ModelAndView userDetailEnd(String userId,String name,String relCd,String addrCd, String addrName, String mobileTelNo, String homeTelNo, String useYn, ModelAndView mv)
	{
		logger.debug("아이디- "+userId);
		logger.debug("이름- "+name);
		logger.debug("관계코드- "+relCd);
		logger.debug("우편번호- "+addrCd);
		logger.debug("주소- "+addrName);
		logger.debug("폰번호- "+mobileTelNo);
		logger.debug("집번호- "+homeTelNo);
		logger.debug("사용여부- "+useYn);
		if(useYn==null)
		{
			useYn="N";
		}
		
		Map details=new HashMap();
		details.put("userId", userId);
		details.put("name", name);
		details.put("relCd", relCd);
		details.put("addrCd", Integer.parseInt(addrCd));
		details.put("addrName", addrName);
		details.put("mobileTelNo", mobileTelNo);
		details.put("homeTelNo", homeTelNo);
		details.put("useYn", useYn);
		
		int result=service.userDetailEnd(details);
		
		String msg="";
		String loc="";
		
		if(result>0)
		{
			msg="상세정보가 저장 되었습니다.";
			loc="/";
		}
		else
		{
			msg="상세정보가 저장에 실패 했습니다.";
			loc="/user/userDetail?userId="+userId;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
