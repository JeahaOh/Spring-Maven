<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

		<%-- 
<table>
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

		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.ENAME}</td>
 				<td>${item.COMM}</td>
				<td>${item.HIREDATE}</td>
				<td>${item.EMPNO}</td>
				<td>${item.MGR}</td>
				<td>${item.JOB}</td>
				<td>${item.DEPTNO}</td>
				<td>${item.SAL}</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
		 --%> 
</body>
</html>
