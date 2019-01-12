package com.study.spring.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.core.env.Environment;

public class DBConnectionTest {
	
	static final String JDBC_DRIVER = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";  
	static final String DB_URL = "jdbc:log4jdbc:mysql://localhost:3306/studydb";
	static final String USERNAME = "study";
	static final String PASSWORD = "1111";

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
			System.out.println("\n- MySQL Connection");
			stmt = conn.createStatement();
			
			String sql;
			sql = "SELECT mno FROM p1_memb";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				String mno = rs.getString("mno");

				System.out.print("\n** mno : " + mno );
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se1){
			se1.printStackTrace();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		System.out.println("\n\n- MySQL Connection Close");
	}
}
