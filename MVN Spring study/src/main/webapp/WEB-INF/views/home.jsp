<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<hr>
	<div class="subjectList">
		<div>
			<a href="memb/list">EMP List</a>
		</div>

		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<div>
					<a href="user/logout">Logout</a>
				</div>
				<div>
					<a href="code/manage">Code</a>
				</div>
				<div>
					<a href="item/manage">Item</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="user/manage">Login</a>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>