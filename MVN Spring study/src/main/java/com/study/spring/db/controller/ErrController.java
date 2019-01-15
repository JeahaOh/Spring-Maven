package com.study.spring.db.controller;

import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/err")
public class ErrController {
  
  @RequestMapping("/login")
  public String loginErr(HttpServletResponse res) {
    res.setHeader("Refresh", "2;url=/spring/user/manage");
    return "loginErr";
  }
  
  @RequestMapping("/logon")
  public String logon(HttpServletResponse res) {
    res.setHeader("Refresh", "2;url=/spring/");
    return "logon";
  }
}
