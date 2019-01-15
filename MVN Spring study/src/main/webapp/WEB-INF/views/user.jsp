<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<div class="container">
			<form id="userForm" action="" method="post">
				<label for="userId">아 이 디 : 
				    <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요." />
				</label>
				<br>
				<label for="userPwd">비밀번호: 
				    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요." />
				</label>
				<br>
				<input type="button" id="logIn" value="로그인">
				<input type="button" id="signIn" onClick="location.href='/spring/user/signIn'" value="회원가입">
			</form>
		</div>
	</div>
</body>
<script>
	$('#logIn').on('click', function() {
		var idVal = $('#userId').val();
		var pwdVal = $('#userPwd').val();

		if (idVal.length <= 1 || idVal == "") {
			alert("아이디를 입력하세요.");
			$('#userId').focus();
		} else if (pwdVal.length <= 1 || pwdVal == "") {
			alert("비밀번호를 입력하세요.");
			$('#userPwd').focus();
		} else {
			$('#userForm').attr('action', '${path}/spring/user/login')
			$('#userForm').submit();
		}
	});
</script>
</html>