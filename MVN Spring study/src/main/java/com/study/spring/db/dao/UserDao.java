package com.study.spring.db.dao;

import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.study.spring.db.domain.User;

public interface UserDao {
  User login(@Param("userId") String userId, @Param("userPwd")String userPwd);
  String checkId(@Param("userId") String userId);
  Boolean signUp(/*@Param("User")*/ User user);
  Boolean init(Map<String, Object> info);
}
