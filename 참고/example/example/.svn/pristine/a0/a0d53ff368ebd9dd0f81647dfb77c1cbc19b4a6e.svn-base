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
	<div class="row container col-md-12 ml-5">
		<div>
			<table class="table table-hover mt-3">
				<thead>
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>제조사코드</th>
						<th>제조사명</th>
						<th>단위명</th>
						<th>출고수량</th>
						<th>회원아이디</th>
						<th>이름</th>
						<th>관계</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>휴대전화</th>
						<th>집전화</th>
						<th>검수여부</th>
						<th>배송여부</th>
						<th>송장번호</th>
					</tr>
				</thead>
				<tbody id="outItems">
					<c:forEach items="${outItems }" var="list">
						<tr onclick="fn_click('${list.ITEMCD}','${list.ITEMNAME}','${list.MADENMCD}','${list.MADENAME}','${list.UNITNAME}','${list.DELIVAMT}','${list.RELNAME}','${list.ADDRCD}','${list.ADDRNAME}','${list.MOBILETELNO}','${list.HOMETELNO}','${list.CHECKYN}','${list.DELIVYN}','${list.DELIVCORPCD }','${list.DELIVNO }','${list.ID}','${list.DELIVNAME }','${list.OUTITEMLISTCD}')">
							<td>${list.ITEMCD }</td>
							<td>${list.ITEMNAME }</td>
							<td>${list.MADENMCD }</td>
							<td>${list.MADENAME }</td>
							<td>${list.UNITNAME }</td>
							<td>${list.DELIVAMT }</td>
							<td>${list.ID }</td>
							<td>${list.DELIVNAME }</td>
							<td>${list.RELNAME }</td>
							<td>${list.ADDRCD }</td>
							<td>${list.ADDRNAME }</td>
							<td>${list.MOBILETELNO }</td>
							<td>${list.HOMETELNO }</td>
							<td><input type="checkbox" ${list.CHECKYN=="Y"?"checked":"" } onclick="return false;"></td>
							<td><input type="checkbox" ${list.DELIVYN=="Y"?"checked":"" } onclick="return false;"></td>
							<td>${list.DELIVNO }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
		<form action="${path }/item/outItemSave" method="post" id="outItemForm">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th colspan="2">출고내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><b>상품코드 : </b></td>
						<td><input type="text" name="itemcd" id="itemcd" disabled></td>
					</tr>
					<tr>
						<td><b>상품명 : </b></td>
						<td><input type="text" name="itemname" id="itemname" disabled></td>
					</tr>
					<tr>
						<td><b>제조사 : </b></td>
						<td><input type="text" name="madename" id="madename" disabled></td>
					</tr>
					<tr>
						<td><b>단위 : </b></td>
						<td><input type="text" name="unitname" id="unitname" disabled></td>
					</tr>
					<tr>
						<td><b>출고수량 : </b></td>
						<td><input type="number" name="delivamt" id="delivamt" disabled></td>
					</tr>
					<tr>
						<td><b>회원아이디 : </b></td>
						<td><input type="text" name="id" id="id" disabled></td>
					</tr>
					<tr>
						<td><b>회원이름 : </b></td>
						<td><input type="text" name="delivname" id="delivname" disabled></td>
					</tr>
					<tr>
						<td><b>관계 : </b></td>
						<td><input type="text" name="relname" id="relname" disabled></td>
					</tr>
					<tr>
						<td><b>우편번호 : </b></td>
						<td><input type="text" name="addrcd" id="addrcd" disabled></td>
					</tr>
					<tr>
						<td><b>주소 : </b></td>
						<td><input type="text" name="addrname" id="addrname" disabled></td>
					</tr>
					<tr>
						<td><b>휴대전화 : </b></td>
						<td><input type="text" name="mobiletelno" id="mobiletelno" disabled></td>
					</tr>
					<tr>
						<td><b>집전화 : </b></td>
						<td><input type="text" name="hometelno" id="hometelno" disabled></td>
					</tr>
					<tr>
						<td><b>검수여부 : </b></td>
						<td><input type="checkbox" name="checkyn" id="checkyn" checked value="Y" onclick="return false;"><label for="checkyn">사용</label></td>
					</tr>
					<tr>
						<td><b>배송여부 : </b></td>
						<td><input type="checkbox" name="delivyn" id="delivyn" checked value="Y" onclick="return false;"><label for="delivyn">사용</label></td>
					</tr>
					<tr>
						<td><b>배송회사 : </b></td>
						<td>	
							<input type="hidden" name="delivcorpcd" id="delivcorpcd">	
							<select name="delivCo" id="delivCo" disabled>
								<c:forEach items="${delivCo }" var="dList">
									<option class="delivCo_" value="${dList.CDNO } " >${dList.CDNAME }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td><b>송장번호 : </b></td>
						<td><input type="text" name="delivno" id="delivno" disabled></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" id="outitemlistcd" name="outitemlistcd">
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

	function fn_click(itemcd,itemname,mandenmcd,madename,unitname,delivamt,relname,addrcd,addrname,mobiletelno,hometelno,checkyn,delivyn,delivcorpcd,delivno,id,delivname,outitemlistcd)
	{
		$("#itemcd").val(itemcd);
		$("#itemname").val(itemname);
		$("#madename").val(madename);
		$("#unitname").val(unitname);
		$("#delivamt").val(delivamt);
		$("#id").val(id);
		$("#delivname").val(delivname);
		$("#addrcd").val(addrcd);
		$("#addrname").val(addrname);
		$("#relname").val(relname);
		$("#mobiletelno").val(mobiletelno);
		$("#hometelno").val(hometelno);
		$("#outitemlistcd").val(outitemlistcd);
		$("#delivcorpcd").val(delivcorpcd);
		if(checkyn=="Y")
		{
			$("#checkyn").attr("checked","checked");
		}
		else
		{
			$("#checkyn").removeAttr("checked");
		}
		
		if(delivyn=="Y")
		{
			$("#delivyn").attr("checked","checked");
		}
		else
		{
			$("#delivyn").removeAttr("checked");
		}
		$(".delivCo_").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==delivcorpcd.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
		$("#delivno").val(delivno);
		
		$("#delivno").attr("disabled","disabled");
		$("#delivCo").attr("disabled","disabled");
		$("#delivyn").attr("onclick","return false;");
		$("#checkyn").attr("onclick","return false;");
	}
	function fn_modify()
	{
		var itemcd=$("#itemcd").val().trim();
		if(itemcd.length<1)
		{
			alert("코드를 선택해주세요");
		}
		else
		{
			$("#delivno").removeAttr("disabled");
			$("#delivCo").removeAttr("disabled");
			$("#checkyn").removeAttr("onclick");
			$("#delivyn").removeAttr("onclick");
		}
	}
	
	$("#outItemForm").submit(function(event){
		
		$("#delivamt").removeAttr("disabled");
		$("#itemcd").removeAttr("disabled");
		
		
	});
</script>
</html>