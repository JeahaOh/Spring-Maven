package com.study.spring.db.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleDBConnection {
	public static Connection dbConn;

	public static Connection getConnection() {
		Connection conn = null;
		try {
			String user = "exam_manager"; 
			String pw = "exam_manager!";
			String url = "jdbc:log4jdbc:oracle:thin:@192.168.0.11:1521:orcl";

			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");        
			conn = DriverManager.getConnection(url, user, pw);

			System.out.println("Database에 연결되었습니다.\n");

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : "+sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		return conn;     
	}
}