package com.study.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class mysql_DB_test {
	//	로깅을 위한 변수 선언
	private static final Logger logger = LoggerFactory.getLogger(Connection.class);
	
	private static final String DRIVER
//    ="org.mariadb.jdbc.Driver";
	="net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	
	private static final String URL
//    ="jdbc:mysql://localhost:3306:studydb";
	="jdbc:log4jdbc:mysql://localhost:3306:studydb";
	
	private static final String USER="study";
	private static final String PW="1111";

	@Test	//	Junit이 테스트하는 메소드
	public void test() throws ClassNotFoundException {
		Class.forName(DRIVER);	//	jdbc 드라이버 로딩

		//	괄호안에 리소스 자동 삭제 
		try(Connection conn=DriverManager.getConnection(URL, USER, PW)){
			logger.info("DB 연결 ㅇㅇ");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
