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

	<div class="row container">
		<div>
		<h3>전체리스트</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>코드번호</th>
					<th>코드레벨</th>
					<th>상위코드</th>
					<th>코드이름</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody id="target">
				<c:forEach items="${codes }" var="list">
					<tr onclick="fn_click('${list.CDNO }','${list.CDLVL }','${list.UPCD }','${list.CDNAME }','${list.USEYN}')">
						<td>${list.CDNO }</td>
						<td>${list.CDLVL }</td>
						<td>${list.UPCD }</td>
						<td>${list.CDNAME }</td>
						<td><input type="checkbox" ${list.USEYN=="Y"?"checked":"" } onclick="return false;"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div class="m-5">
			<form id="codeForm" method="post">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th colspan="2">코드내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>코드번호 : </b></td>
							<td><input type="text" name="cdno" id="cdno" disabled></td>
						</tr>
						<tr>
							<td><b>코드레벨 : </b></td>
							<td><input type="number" name="cdlvl" id="cdlvl" disabled></td>
						</tr>
						<tr>
							<td><b>상위코드 : </b></td>
							<td><input type="text" name="upcd" id="upcd" disabled></td>
						</tr>
						<tr>
							<td><b>코드이름 : </b></td>
							<td><input type="text" name="cdname" id="cdname" disabled></td>
						</tr>
						<tr>
							<td><b>사용여부 : </b></td>
							<td><input type="checkbox" name="useyn" id="useyn" checked value="Y" onclick="return false;"><label for="useYn">사용</label></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-primary ml-2 mr-4" onclick="fn_add()">추가</button> 
								<button type="button" class="btn btn-primary ml-2 mr-4" onclick="fn_modify()">수정</button> 
								<button type="submit" class="btn btn-primary ml-2" >저장</button> 
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	
	function fn_click(cdno,cdlvl,upcd,cdname,useyn)
	{
		$("#cdno").val(cdno);
		$("#cdlvl").val(cdlvl);
		$("#upcd").val(upcd);
		$("#cdname").val(cdname);
		$("#cdlvl").attr("disabled","disabled");
		$("#upcd").attr("disabled","disabled");
		$("#cdname").attr("disabled","disabled");
		if(useyn=="Y")
		{
			$("#useyn").attr("checked","checked");
			$("#useyn").attr("value","Y");
		}
		else
		{
			$("#useyn").removeAttr("checked");
			$("#useyn").attr("value","N");
			
		}
	}
	
	function fn_add()
	{
		$("#cdno").val("");
		$("#cdlvl").val("");
		$("#upcd").val("");
		$("#cdname").val("");
		$("#cdlvl").removeAttr("disabled");
		$("#upcd").removeAttr("disabled");
		$("#cdname").removeAttr("disabled");
		$("#useyn").removeAttr("onclick");
	}
	function fn_modify()
	{
		var cdno=$("#cdno").val().trim();
		if(cdno.length<1)
		{
			alert("코드를 선택해주세요");
		}
		else
		{
			$("#cdlvl").removeAttr("disabled");
			$("#upcd").removeAttr("disabled");
			$("#cdname").removeAttr("disabled");
			$("#useyn").removeAttr("onclick");
		}
		
	}
	
	$("#codeForm").submit(function(event){
		
		var cdno=$("#cdno").val().trim();
		if(cdno.length<1)
		{
			$("#codeForm").attr("action","${path}/code/insertCode");	
		}
		else
		{
			$("#cdno").removeAttr("disabled");
			console.log($("#cdno").val());
			$("#codeForm").attr("action","${path}/code/updateCode");
		}
	})

</script>
</html>