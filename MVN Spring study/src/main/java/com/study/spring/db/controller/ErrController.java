package com.study.spring.db.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/err")
public class ErrController {
  
  private static final Logger logger = LoggerFactory.getLogger(ErrController.class);
  
  @RequestMapping("/login")
  public String loginErr(HttpServletResponse res) {
    logger.debug("---->>>>>>" + res);
    res.setHeader("Refresh", "2;url=/spring/user/manage");
    return "loginErr";
  }
  
  @RequestMapping("/logon")
  public String logon(HttpServletResponse res) {
    logger.debug("---->>>>>>" + res);
    res.setHeader("Refresh", "2;url=/spring/");
    return "logon";
  }
  
  @RequestMapping("/signUp")
  public String signUpErr(HttpServletResponse res) {
    logger.debug("---->>>>>>" + res);
    res.setHeader("Refresh", "2;url=/spring/user/signIn");
    return "signUpErr";
  }
  
  @RequestMapping("/codeErr")
  public String codeErr(HttpServletResponse res, HttpServlet servlet) {
    logger.debug("---->>>>>>" + res);
    res.setHeader("Refresh", "2;url=/spring/code/manage");
    return "codeErr";
  }
  
}
