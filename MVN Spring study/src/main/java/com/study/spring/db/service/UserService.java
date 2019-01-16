package com.study.spring.db.service;

import java.util.Map;
import com.study.spring.db.domain.User;

public interface UserService {
  User login(String userId, String userPwd);
  Boolean checkId(String userId);
  Boolean signUp(User user);
  Boolean init(Map<String, Object> info);
}
