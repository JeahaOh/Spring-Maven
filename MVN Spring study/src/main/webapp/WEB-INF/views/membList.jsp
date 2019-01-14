<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>membList</title>
	
	<style type="text/css">
		table tr td {
			border: 1px solid dimgray;
		}
	</style>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>ENAME</th>
				<th>COMM</th>
				<th>HIREDATE</th>
				<th>EMPNO</th>
				<th>MGR</th>
				<th>JOB</th>
				<th>DEPTNO</th>
				<th>SAL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${membList}" var="memb">
				<tr>
					<td>${memb.ENAME}</td>
					<td>${memb.COMM}</td>
					<td>${memb.HIREDATE}</td>
					<td>${memb.EMPNO}</td>
					<td>${memb.MGR}</td>
					<td>${memb.JOB}</td>
					<td>${memb.DEPTNO}</td>
					<td>${memb.SAL}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>