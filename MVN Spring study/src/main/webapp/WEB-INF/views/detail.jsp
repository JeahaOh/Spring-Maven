<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
table {
	border: 1px solid black;
}
</style>
</head>
<body>
    <form id="detail" action="" method="post">
		<table>
			<tr>
				<th>상세정보</th>
			</tr>
			<tr>
				<td><b>성 명 </b>:</td>
				<td><input type="text" id="DELIVNAME" name="DELIVNAME" placeholder="성명을 입력하세요."></td>
			</tr>
			<tr>
				<td><b>관 계 </b>:</td>
				<td>
					<select id="RECD" name="RECD" >
					    <option value="C0021">본인</option>
					    <option value="C0022">부모</option>
					    <option value="C0023">형제</option>
					    <option value="C0024">지인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>우편번호 </b>:</td>
				<td><input type="text" id="ADDRCD" name="ADDRCD" placeholder="우편번호"></td>
			</tr>
			<tr>
				<td><b>주 소 </b>:</td>
				<td><input type="text" id="ADDRNAME" name="ADDRNAME" placeholder="주소를 입력하세요"></td>
			</tr>
			<tr>
				<td>휴대전화 :</td>
				<td><input type="text" id="MOBILETELNO" name="MOBILETELNO" placeholder="휴대전화"></td>
			</tr>
			<tr>
				<td>집 전 화 :</td>
				<td><input type="text" id="HOMETELNO" name="HOMETELNO" placeholder="집전화"></td>
			</tr>
			<tr>
				<td>사용 여부 :</td>
				<td><input type="checkbox" id="USEYN" name="USEYN" checked>사용</td>
			</tr>
		</table>
		<button type="button" onClick="save()">저장</button>
	</form>



</body>
<script>
    function save(){
    	var $DELIVNAME = $('#DELIVNAME').val();
    	var $RECD = $('#RECD').val();
    	var $ADDRCD = $('#ADDRCD').val();
    	var $ADDRNAME = $('#ADDRNAME').val();
    	var $MOBILETELNO = $('#MOBILETELNO').val();
    	var $HOMETELNO = $('#HOMETELNO').val();
    	var $USEYN = $('#USEYN').val();
    	console.log($DELIVNAME + ', ' + $RECD + ', ' + $ADDRCD + ', ' + $ADDRNAME + ', ' + $MOBILETELNO + ', ' + $HOMETELNO + ', ' + $USEYN);
    	
    	if($DELIVNAME === null || $DELIVNAME === ''){
    		$('#DELIVNAME').focus();
    		alert('성명은 필수 요소 입니다.');
    		return;
    	}
    	if($ADDRCD === null || $ADDRCD === ''){
    		$('#ADDRCD').focus();
            alert('우편번호는 필수 요소 입니다.');
            return;
        }
    	if($ADDRNAME === null || $ADDRNAME === ''){
            $('#ADDRNAME').focus();
            alert('주소는 필수 요소 입니다.');
            return;
        }
    	// 전화번호 둘중 하나는 필수
    	
    	
    	
    }
</script>
</html>