package com.study.spring.db.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.study.spring.db.dao.MembDao;
import com.study.spring.db.domain.Memb;
import com.study.spring.db.service.MembService;

@Service("membService")
@Component
public class MembServiceImpl implements MembService{

	@Autowired MembDao membDao;
	
	@Override
	public List<Memb> membList() {
		
		return membDao.membList();
	}
	
}
