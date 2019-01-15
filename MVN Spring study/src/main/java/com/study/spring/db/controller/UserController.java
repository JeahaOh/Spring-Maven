package com.study.spring.db.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.study.spring.db.domain.User;
import com.study.spring.db.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

  @Autowired UserService userService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session) {
    if(session.getAttribute("loginUser") != null) {
      return "redirect:/err/logon";
    }
    return "user";
  }

  @RequestMapping(value="/login", method=RequestMethod.POST)
  public String login(String userId, String userPwd, HttpSession session) {
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
    System.out.println("logout?");
    session.removeAttribute("loginUser");
    session.invalidate();
    return "redirect:/";
  }
  
  @RequestMapping(value="signIn", method=RequestMethod.POST)
  public String signIn(String userId, String userPwd, HttpSession session) {
    System.out.printf("userId: %s\nuserPwd: %s", userId, userPwd);
    
    
    return "join";
  }
  
  @RequestMapping(value="idCheck", method=RequestMethod.POST)
  public Boolean idCheck(
      @RequestParam(value="userId", required=true) /*Map<String, String>*/ String userId
      ) {
    System.out.println("controller Get : " + userId);
    //userService.checkId(userId);
    return userService.checkId(userId);
  }
}
