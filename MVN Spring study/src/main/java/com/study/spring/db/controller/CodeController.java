package com.study.spring.db.controller;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.study.spring.db.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
  
  private static final Logger logger = LoggerFactory.getLogger(CodeController.class);

  @Autowired CodeService codeService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session) {
    logger.debug("/code/manage -->", session);
    
    
    return "codeManage";
  }
}
