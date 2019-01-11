package com.mnet.exam.user.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mnet.exam.user.vo.User;

public interface UserDAO {

	User userLogin(SqlSessionTemplate session, Map userInfo);
	int checkId(SqlSessionTemplate session, String userId);
	int userJoinEnd(SqlSessionTemplate session, User user);
	int userDetailEnd(SqlSessionTemplate session, Map details);
}
