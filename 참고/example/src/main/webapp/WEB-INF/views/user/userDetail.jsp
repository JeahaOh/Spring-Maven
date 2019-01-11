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
	<div class="container col-md-6 mt-5">
	<form id="detailForm" action="${path }/user/userDetailEnd" method="post">
	
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th class="text-center" colspan="2">상세정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><b>성명 : </b></td>
				<td><input type="text" name="name" placeholder="성명을 입력하세요" required></td>
			</tr>
			<tr>
				<td><b>관계 : </b></td>
				<td>
					<select name="relCd">
						<option value="C0021">본인</option>
						<option value="C0022">부모님</option>
						<option value="C0023">동생</option>
						<option value="C0024">지인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>우편번호 : </b></td>
				<td><input type="text" name="addrCd" placeholder="우편번호" required></td>
			</tr>
			<tr>
				<td><b>주소 : </b></td>
				<td><input type="text" name="addrName" placeholder="주소를 입력하세요" required></td>
			</tr>
			<tr>
				<td>휴대전화번호 : </td>
				<td><input type="text" name="mobileTelNo" placeholder="휴대전화" id="mobile"></td>
			</tr>
			<tr>
				<td>집전화번호 : </td>
				<td><input type="text" name="homeTelNo" placeholder="집번호" id="home"></td>
			</tr>
			<tr>
				<td><b>사용여부 : </b></td>
				<td><input type="checkbox" name="useYn" id="useYn" checked value="Y"><label for="useYn">사용</label></td>
			</tr>
			<tr>
				<td><input type="hidden" value="${userId }" name="userId"></td>
				<td><button type="submit" class="btn btn-primary">저장</button> </td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</body>
<script>

	$("#detailForm").submit(function(event){
		var mobile=$("#mobile").val().trim();
		var home=$("#home").val().trim();
		
		if(mobile.length<1&&home.length<1)
		{
			event.preventDefault();
			console.log("${userId}");
			alert("휴대전화와  집전화번호 둘 중 하나는 필수 입력");
			$("#mobile").focus();
			return;
		}
		
	});
</script>
</html>