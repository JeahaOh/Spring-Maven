package com.mnet.exam.emp.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnet.exam.emp.dao.EmpDAO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDAO dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map> empList() {
		return dao.empList(session);
	}
	
	

}
