package com.mnet.exam.user.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnet.exam.user.dao.UserDAO;
import com.mnet.exam.user.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public User userLogin(Map userInfo) {
		return dao.userLogin(session,userInfo);
	}

	@Override
	public int checkId(String userId) {
		return dao.checkId(session,userId);
	}

	@Override
	public int userJoinEnd(User user) {
		return dao.userJoinEnd(session,user);
	}

	@Override
	public int userDetailEnd(Map details) {
		return dao.userDetailEnd(session, details);
	}

}
