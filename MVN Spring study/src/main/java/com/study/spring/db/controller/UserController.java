package com.study.spring.db.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
  
  @RequestMapping(value="signIn", method=RequestMethod.POST)
  public String signIn(String userId, String userPwd, HttpSession session) {
    logger.debug("/user/manage -->", session);
    System.out.printf("userId: %s\nuserPwd: %s", userId, userPwd);
    
    
    return "join";
  }
  
  
  @RequestMapping(value="idCheck", method=RequestMethod.POST)
  public @ResponseBody boolean idCheck(
        @RequestParam(value="userId", required=true) String userId,
        HttpServletResponse res) {

    logger.debug("/user/idCheck -->", userId, res);
    res.setContentType("application/json");
    
    return userService.checkId(userId);
  }
}
