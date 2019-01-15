package com.study.spring.db.service;

import com.study.spring.db.domain.User;

public interface UserService {
  User login(String userId, String userPwd);
  Boolean checkId(String userId);
  Boolean signUp(User user);
}
