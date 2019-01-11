package com.mnet.exam.user.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mnet.exam.user.vo.User;
@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public User userLogin(SqlSessionTemplate session, Map userInfo) {
		return session.selectOne("user.userLogin",userInfo);
	}

	@Override
	public int checkId(SqlSessionTemplate session, String userId) {
		return session.selectOne("user.checkId",userId);
	}

	@Override
	public int userJoinEnd(SqlSessionTemplate session, User user) {
		return session.insert("user.userJoinEnd",user);
	}

	@Override
	public int userDetailEnd(SqlSessionTemplate session, Map details) {
		return session.insert("user.userDetailEnd",details);
	}

}
