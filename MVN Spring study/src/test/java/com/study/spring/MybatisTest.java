package com.study.spring;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@Configuration(value="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MybatisTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MybatisTest.class);
	
	//	의존관계 주입
	@Inject private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		logger.info("sqlFactory: " + sqlFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession sqlSession = sqlFactory.openSession()) {
			logger.info("sqlSession: " + sqlSession);
			logger.info("mybatis 연결 ㅇㅇ");
		}	catch (Exception e) {
			e.printStackTrace();
		}
	}
}