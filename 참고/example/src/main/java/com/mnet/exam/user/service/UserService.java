package com.mnet.exam.user.service;

import java.util.Map;

import com.mnet.exam.user.vo.User;

public interface UserService {
	User userLogin(Map userInfo);
	int checkId(String userId);
	int userJoinEnd(User user);
	int userDetailEnd(Map details);
}
