<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
		<div>
			<a href="user/manage">Login</a>
		</div>
	</div>
</body>
</html>