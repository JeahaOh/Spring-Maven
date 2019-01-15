package com.study.spring.db.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.study.spring.db.dao.UserDao;
import com.study.spring.db.domain.User;
import com.study.spring.db.service.UserService;

@Service("userService")
@Component
public class UserServiceImpl implements UserService {
 
  @Autowired UserDao userDao;
  
  @Override
  public User login(String userId, String userPwd) {
    return userDao.login(userId, userPwd);
  }
  
  @Override
  public Boolean checkId(String userId) {
    if(userDao.checkId(userId) != null && userDao.checkId(userId) != "") {
      return true;
    }
    return false;
  }
}
