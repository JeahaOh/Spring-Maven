package com.mnet.exam.emp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO {


	@Override
	public List<Map> empList(SqlSessionTemplate session) {
		return session.selectList("emp.empList");
	}

}
