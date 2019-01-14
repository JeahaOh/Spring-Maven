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
		<h3 class="mb-3">전체리스트</h3>	
			카테고리 : 
			<select name="catename2" id="catename2" class="mr-3">
				<option value="defaultcate" selected>카테고리선택</option>
				<c:forEach items="${cateCodes }" var="ctList">
					<option class="catename_2" value="${ctList.CDNO } ">${ctList.CDNAME }</option>
				</c:forEach>
			</select>
			
			1차분류 : 
				
			<select name="groupname2" id="groupname2">
				<c:if test="${groupList!=null }">
				<c:forEach items="${groupList }" var="gList">
					<option class="groupname_2" value="${gList.CDNO } ">${gList.CDNAME }</option>
				</c:forEach>
				</c:if>
			</select>
			<button class="btn btn-primary float-right" id="search2" onclick="fn_search2()">조회</button>
		<table class="table table-hover mt-3">
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>제조사코드</th>
					<th>제조사명</th>
					<th>단위코드</th>
					<th>단위명</th>
					<th>재고수량</th>
					<th>재고여부</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody id="itemListTbody">
				<c:forEach items="${items }" var="list">
					<tr onclick="fn_click_1('${list.ITEMCD }','${list.ITEMNAME }','${list.MADENMCD }','${list.MADENAME }','${list.ITEMUNITCD}','${list.UNITNAME}')">
						<td>${list.ITEMCD }</td>
						<td>${list.ITEMNAME }</td>
						<td>${list.MADENMCD }</td>
						<td>${list.MADENAME }</td>
						<td>${list.ITEMUNITCD }</td>
						<td>${list.UNITNAME }</td>
						<td>${list.STOCKAMT }</td>
						<td><input type="checkbox" ${list.STOCKYN=="Y"?"checked":"" } onclick="return false;"></td>
						<td><input type="checkbox" ${list.USEYN=="Y"?"checked":"" } onclick="return false;"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div class="m-5">
		<table class="table table-hover mt-3">
				<thead>
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>제조사코드</th>
						<th>제조사명</th>
						<th>단위코드</th>
						<th>단위명</th>
						<th>입고수량</th>
					</tr>
				</thead>
				<tbody>
					<tbody id="inItemListTbody">
						<c:forEach items="${inItems }" var="iList">
							<tr onclick="fn_click_2('${iList.ITEMCD }','${iList.ITEMNAME }','${iList.MADENMCD }','${iList.MADENAME }','${iList.ITEMUNITCD}','${iList.UNITNAME}','${iList.INSAMT }','${iList.INSITEMLISTCD}')">
								<td>${iList.ITEMCD }</td>
								<td>${iList.ITEMNAME }</td>
								<td>${iList.MADENMCD }</td>
								<td>${iList.MADENAME }</td>
								<td>${iList.ITEMUNITCD }</td>
								<td>${iList.UNITNAME }</td>
								<td>${iList.INSAMT }</td>
							</tr>
						</c:forEach>
					</tbody>
				</tbody>
			</table>
			<form id="inItemForm" method="post">
			<input type="hidden" name="catecode2" id="catecode2">
			<input type="hidden" name="groupcode2" id="groupcode2">
			
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th colspan="2">입고내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>상품코드 : </b></td>
							<td><input type="text" name="itemcd2" id="itemcd2" disabled></td>
						</tr>
						<tr>
							<td><b>상품명 : </b></td>
							<td><input type="text" name="itemname2" id="itemname2" disabled></td>
						</tr>
						<tr>
							<td><b>제조사 : </b></td>
							<td>
								<input type="hidden" name="madenmcd2" id="madenmcd2">	
								<input type="text" name="madename2" id="madename2" disabled>
							</td>
						</tr>
						<tr>
							<td><b>단위명 : </b></td>
							<td>	
								<input type="hidden" name="itemunitcd2" id="itemunitcd2">	
								<input type="text" name="unitname2" id="unitname2" disabled>
							</td>
						</tr>
						<tr>
							<td><b>입고수량 : </b></td>
							<td>
								<input type="hidden" name="beforeamt" id="beforeamt">	
								<input type="number" name="insamt" id="insamt" disabled>
								<input type="hidden" name="initemcd" id="initemcd">
							</td>
						</tr>
						<tr>
							<td colspan="2"> 
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
var msg="${msg}";
if(msg!=null&&msg!="")
{
	alert(msg);
}
$(function(){
	var usedCate="${usedCate}";
	var usedGroup="${usedGroup}";
	
	if(usedCate!=null&&usedCate!="")
	{
		$(".catename_2").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==usedCate.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
		$(".groupname_2").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==usedGroup.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
	}
});
function fn_click_1(itemcd,itemname,madenmcd,madename,itemunitcd,unitname)
{
	$("#itemcd2").val(itemcd);
	$("#itemname2").val(itemname);
	$("#madenmcd2").val(madenmcd);
	$("#madename2").val(madename);
	$("#itemunitcd2").val(itemunitcd);
	$("#unitname2").val(unitname);
	$("#beforeamt").val("");
	
	$("#itemcd2").attr("disabled","disabled");
	$("#itemname2").attr("disabled","disabled");
	$("#madename2").attr("disabled","disabled");
	$("#unitname2").attr("disabled","disabled");
	$("#insamt").attr("disabled","disabled");

}
function fn_click_2(itemcd,itemname,madenmcd,madename,itemunitcd,unitname,insamt,initemcd)
{
	$("#itemcd2").val(itemcd);
	$("#itemname2").val(itemname);
	$("#madenmcd2").val(madenmcd);
	$("#madename2").val(madename);
	$("#itemunitcd2").val(itemunitcd);
	$("#unitname2").val(unitname);
	$("#insamt").val(insamt);
	$("#beforeamt").val(insamt);
	$("#initemcd").val(initemcd);
	$("#itemcd2").attr("disabled","disabled");
	$("#itemname2").attr("disabled","disabled");
	$("#madename2").attr("disabled","disabled");
	$("#unitname2").attr("disabled","disabled");
	$("#insamt").attr("disabled","disabled");
	console.log($("#beforeamt").val());
	console.log($("#initemcd").val());
}

$("#catename2").change(function(){
	var catecode=$("#catename2").val().trim();
	
	if(catecode!="defaultcate")
	{
		$.ajax({
			url:"${path}/item/groupList",
			type:"POST",
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{catecode:catecode},
			success:function(data)
			{
				$("#groupname2").empty();
				
				for(var i=0; i<data.length;i++)
				{
					var options = $("<option></option>");
					options.append(data[i].CDNAME);
					options.attr("value",data[i].CDNO);
					$("#groupname2").append(options);
				}
			}
		});
	}
	else
	{
		$("#groupname2").empty();
	}
	
});
	function fn_search2()
	{
		var groupcode=$("#groupname2").val().trim();
		$.ajax({
			url:"${path}/item/itemSearch",
			type:"POST",
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{groupcode:groupcode},
			success:function(data)
			{
				$("#itemListTbody").empty();
				for(var i=0; i<data.length; i++)
				{
					var tr = $("<tr></tr>");
					tr.attr("onclick","fn_click_1('"+data[i].ITEMCD+"','"+data[i].ITEMNAME+"','"+data[i].MADENMCD+"','"+data[i].MADENAME+"','"+data[i].ITEMUNITCD+"','"+data[i].UNITNAME+"')")
					tr.append("<td>"+data[i].ITEMCD+"</td>");
					tr.append("<td>"+data[i].ITEMNAME+"</td>");
					tr.append("<td>"+data[i].MADENMCD+"</td>");
					tr.append("<td>"+data[i].MADENAME+"</td>");
					tr.append("<td>"+data[i].ITEMUNITCD+"</td>");
					tr.append("<td>"+data[i].UNITNAME+"</td>");
					tr.append("<td>"+data[i].STOCKAMT+"</td>");
					if(data[i].STOCKYN=="Y")
					{
						tr.append("<td><input type='checkbox' checked onclick='return false;'></td>");
					}
					else
					{
						tr.append("<td><input type='checkbox' onclick='return false;'></td>");
					}
					if(data[i].USEYN=="Y")
					{
						tr.append("<td><input type='checkbox' checked onclick='return false;'></td>");
					}
					else
					{
						tr.append("<td><input type='checkbox' onclick='return false;'></td>");
					}
					
					
					$("#itemListTbody").append(tr);
				}
			}
		});
	}
	
	function fn_modify()
	{
		var itemcd=$("#itemcd2").val().trim();
		if(itemcd.length<1)
		{
			alert("코드를 선택해주세요");
		}
		else
		{
			$("#insamt").removeAttr("disabled");
		}
		
	}
	
	$("#inItemForm").submit(function(event){

		var groupcode=$("#groupname2").val().trim();
		var catecode=$("#catename2").val().trim();
		
		var beforeamt=$("#beforeamt").val().trim();
		
		$("#catecode2").val(catecode);
		$("#groupcode2").val(groupcode);

		
		if(beforeamt.length<1)
		{
			$("#itemcd2").removeAttr("disabled");
			$("#inItemForm").attr("action","${path}/item/insertAmt");	
		}
		else
		{
			$("#itemcd2").removeAttr("disabled");
			$("#inItemForm").attr("action","${path}/item/updateAmt");
		}
	});
</script>
</html>