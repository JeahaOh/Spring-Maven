package com.study.spring;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import oracle.jdbc.driver.OracleConnection;

public class mysql_DB_test {
	//	로깅을 위한 변수 선언
    private static final Logger logger=
            LoggerFactory.getLogger(OracleConnection.class);
    private static final String DRIVER
    ="oracle.jdbc.driver.OracleDriver";
    //	연결문자열 jdbc:oracle:thin:@호스트:포트:sid
    private static final String URL
//    ="jdbc:oracle:thin:@192.168.0.11:1521:orcl";
    ="jdbc:log4jdbc:mysql://localhost:3306:studydb";
    private static final String USER="study";
    private static final String PW="1111";
    
    @Test//Junit이 테스트하는 메소드
    public void test() throws ClassNotFoundException {
        Class.forName(DRIVER);//jdbc 드라이버 로딩
        
      //괄호안에 리소스 자동 삭제 
        try(Connection conn=DriverManager.getConnection(URL, USER, PW)){
        	logger.info("DB 연결 ㅇㅇ");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
