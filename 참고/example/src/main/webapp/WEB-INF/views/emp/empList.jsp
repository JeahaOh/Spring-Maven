<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath }" var="path"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>example</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>

<table class="table">
	<tr>
		<th>사원명</th>
		<th>comm</th>
		<th>고용일</th>
		<th>사원번호</th>
		<th>매니저번호</th>
		<th>JOB</th>
		<th>부서번호</th>
		<th>급여</th>
	</tr>
	<c:forEach items="${empList }" var="list">
		<tr>
			<td>${list.ENAME}</td>
			<td>${list.COMM }</td>
			<td>${list.HIREDATE }</td>
			<td>${list.EMPNO }</td>
			<td>${list.MGR }</td>
			<td>${ list.JOB}</td>
			<td>${ list.DEPTNO}</td>
			<td>${list.SAL }</td>
		</tr>
	</c:forEach>
</table>
	
</body>
</html>