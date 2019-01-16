package com.study.spring.db.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.study.spring.db.domain.User;
import com.study.spring.db.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
  
  private static final Logger logger = LoggerFactory.getLogger(UserController.class);

  @Autowired UserService userService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session) {
    logger.debug("--/user/manage -->", session);
    
    if(session.getAttribute("loginUser") != null) {
      return "redirect:/err/logon";
    }
    return "user";
  }

  @RequestMapping(value="/login", method=RequestMethod.POST)
  public String login(String userId, String userPwd, HttpSession session) {
    logger.debug("--/user/manage -->", session);
    
    System.out.println(userId + ", " + userPwd);
    User user = null;
    try {
      user = userService.login(userId, userPwd);
      if(user == null) {
        return "redirect:/err/login";
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    session.setAttribute("loginUser", user);
    return "redirect:/";
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session) {
    logger.debug("--/user/manage -->", session);
    
    System.out.println("logout?");
    session.removeAttribute("loginUser");
    session.invalidate();
    return "redirect:/";
  }
  
  @RequestMapping(value="/signIn", method=RequestMethod.GET)
  public String signIn(HttpSession session) {
    logger.debug("/user/manage -->", session);
    return "join";
  }
  
  @RequestMapping(value="/idCheck", method=RequestMethod.POST)
  public @ResponseBody boolean idCheck(
        @RequestParam(value="userId", required=true) String userId,
        HttpServletResponse res,
        HttpServletRequest req) {

    logger.debug("/user/idCheck -->", userId, req);
    
    res.setContentType("application/json");
    
    return userService.checkId(userId);
  }
  
  @PostMapping(value="/signUp")
  public String signUp (
      @RequestParam String userId,
      @RequestParam String userPwd,
      @RequestParam String name,
      HttpServletRequest req,
      HttpSession session) throws UnsupportedEncodingException {
    logger.debug("/user/idCheck -->", req);
    
    User newbie = new User();
    newbie.setId(userId);
    newbie.setPw(userPwd);
    newbie.setName(name);
    
    userService.signUp(newbie);
    session.setAttribute("newbie", newbie);
    
    System.out.printf(newbie.toString());
    
    return "redirect:/user/detail";
  }
  
  @RequestMapping("/detail")
  public String detail(HttpSession session) {
    logger.debug("/user/detail -->", session);
    User user = (User)session.getAttribute("newbie");
    System.out.println("session newbie : " + user.toString());
    return "/init";
  }
  
  @PostMapping("/init")
  public String initDetail(
      HttpSession session, HttpServletRequest req, HttpServletResponse res,
      String id,
      String DELIVNAME,
      String RELCD,
      int ADDRCD,
      String ADDRNAME,
      String MOBILETELNO,
      String HOMETELNO,
      String USEYN) {
    Map<String, Object> info = new HashMap<>();
    logger.debug("/user/init.session -->", session);
    logger.debug("/user/init.res,req -->", res, req);
    logger.debug("/user/init.info -->", info);
    
    info.put("ID", id);
    info.put("DELIVNAME", DELIVNAME);
    info.put("RELCD", RELCD);
    info.put("ADDRCD", ADDRCD);
    info.put("ADDRNAME", ADDRNAME);
    info.put("MOBILETELNO", MOBILETELNO);
    info.put("HOMETELNO", HOMETELNO);
    if (USEYN == "on") {
      USEYN = "Y";
    }  else {
      USEYN = "N";
    }
    info.put("USEYN", USEYN);
    
    userService.init(info);
    
    return "redirect:/user/signIn";
  }
}
