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
<style>
	input{margin-top:10px}
	input[type="submit"]{margin-top:10px; margin-right:10px;}
</style>
</head>
<body>
	<button class="btn-primary" onclick="fn_empList()">사원정보보기</button>
	<button class="btn-primary" onclick="fn_uiEmpList()">w2ui-사원정보보기</button>
	<button class="btn-primary" onclick="fn_codeMng()">코드관리</button>
	
	<button class="btn-primary" onclick="fn_itemList()">상품관리</button>
	
	<button class="btn-primary" onclick="fn_inItemList()">입고관리</button>
	<button class="btn-primary" onclick="fn_uiInItemList()">w2ui-입고관리</button>
	<button class="btn-primary" onclick="fn_outItemList()">출고관리</button>
	
	<div class="container">
		<form id="loginForm" action="${path }/user/login" method="post">
		아 이 디 : <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요"> <br>
		비밀번호 : <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요"> <br>
		<button type="submit" class="btn-primary m-3">로그인</button> <button type="button" class="btn-primary m-3" id="userJoin">회원가입</button>
	    </form>
	</div>
</body>
<script>
	function fn_empList()
	{
		location.href="<%=request.getContextPath()%>/emp/empList";
	}
	function fn_uiEmpList()
	{
		location.href="<%=request.getContextPath()%>/emp/uiEmpList";
	}
	function fn_codeMng()
	{
		location.href="<%=request.getContextPath()%>/code/codeMng";
	}
	function fn_itemList()
	{
		location.href="<%=request.getContextPath()%>/item/itemList";
	}
	function fn_inItemList()
	{
		location.href="<%=request.getContextPath()%>/item/inItemList";
	}
	function fn_uiInItemList()
	{
		location.href="<%=request.getContextPath()%>/item/uiInItemList";
	}
	function fn_outItemList()
	{
		location.href="<%=request.getContextPath()%>/item/outItemList";
	}
	
	$("#loginForm").submit(function(event){
		var id=$("#userId").val().trim();
		var pw=$("#pwd").val().trim();
		
		if(id.length<1)
		{
			event.preventDefault();
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return;
		}
		
		if(pw.length<1)
		{
			event.preventDefault();
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return;
		}
		
	});
	$("#userJoin").on("click",function(){
		location.href="${path}/user/join";
	});
</script>
</html>