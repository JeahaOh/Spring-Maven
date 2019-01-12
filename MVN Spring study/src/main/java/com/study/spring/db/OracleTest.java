package com.study.spring.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class OracleTest {
	public static void main(String args[]) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			String quary = "SELECT * FROM EMP";

			conn = OracleDBConnection.getConnection();
			pstm = conn.prepareStatement(quary);
			rs = pstm.executeQuery();

			System.out.println("EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO");
			System.out.println("============================================");

			while(rs.next()){
				int empno = rs.getInt(1);
				String ename = rs.getString(2);
				String job = rs.getString(3);
				int mgr = rs.getInt(4);
				java.sql.Date hiredate = rs.getDate(5); // Date 타입 처리
				int sal = rs.getInt(6);
				int comm = rs.getInt(7);
				int deptno = rs.getInt(8);

				String result = empno+" "+ename+" "+job+" "+mgr+" "+hiredate+" "+sal+" "+comm+" "+deptno;
				System.out.println(result);
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();

		}finally{
			// DB 연결을 종료한다.
			try{
				if ( rs != null ){rs.close();}   
				if ( pstm != null ){pstm.close();}   
				if ( conn != null ){conn.close(); }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}