package com.study.spring.db.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.study.spring.db.domain.Code;
import com.study.spring.db.domain.User;
import com.study.spring.db.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
  
  private static final Logger logger = LoggerFactory.getLogger(CodeController.class);

  @Autowired CodeService codeService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session, Model model) {
    logger.debug("/code/manage -->", session);
    
    model.addAttribute("codeList", codeService.showAll());
    return "/Code/codeManage";
  }
  
  @PostMapping("/add")
  public String add(
      HttpServletRequest req,
      HttpSession session,
      @RequestParam Integer CDLVL,
      @RequestParam String UPCD,
      @RequestParam String CDNAME,
      String USEYN) {
    logger.debug("/code/insert -->", req);
    User loginUser = (User) session.getAttribute("loginUser");
    if(loginUser == null) {
      loginUser = new User();
    }

    Code code = new Code();
    code.setCDLVL(CDLVL);
    code.setUPCD(UPCD);
    code.setCDNAME(CDNAME);
    code.setINSUSER(loginUser.getId());
    if(USEYN == null) {
      USEYN = "N";
    }
    code.setUSEYN(USEYN);
    
    System.out.println(code);
    if(!codeService.insert(code)) {
      return "redirect:/err/codeErr";
    }
    return "redirect:/code/manage";
  }
  
  @PostMapping("/update")
  public String update(
      HttpServletRequest req,
      @RequestParam String CDNO,
      @RequestParam Integer CDLVL,
      @RequestParam String UPCD,
      @RequestParam String CDNAME,
      String USEYN
      ) {
    logger.debug("/code/update -->", req);
    Code code = new Code();
    code.setCDNO(CDNO);
    code.setCDLVL(CDLVL);
    code.setUPCD(UPCD);
    code.setCDNAME(CDNAME);
    if(USEYN == null) {
      USEYN = "N";
    }
    code.setUSEYN(USEYN);
    
    System.out.println(code);
    if(!codeService.update(code)) {
      return "redirect:/spring/err/codeErr";
    }
    return "redirect:/code/manage";
  }
}
