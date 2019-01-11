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
			
			<select name="catename" id="catename" class="mr-3">
				<option value="defaultcate" selected>카테고리선택</option>
				<c:forEach items="${cateCodes }" var="ctList">
					<option class="catename_" value="${ctList.CDNO } ">${ctList.CDNAME }</option>
				</c:forEach>
			</select>
			
			1차분류 : 
				
			<select name="groupname" id="groupname">
				<c:if test="${groupList!=null }">
				<c:forEach items="${groupList }" var="gList">
					<option class="groupname_" value="${gList.CDNO } ">${gList.CDNAME }</option>
				</c:forEach>
				</c:if>
			</select>
			<button class="btn btn-primary float-right" id="search" onclick="fn_search()">조회</button>
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
			<tbody id="target2">
				<c:forEach items="${items }" var="list">
					<tr onclick="fn_click('${list.ITEMCD }','${list.ITEMNAME }','${list.MADENMCD }','${list.MADENAME }','${list.ITEMUNITCD}','${list.UNITNAME}','${list.USEYN }')">
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
			<form id="itemForm" method="post">
			<input type="hidden" name="catecode" id="catecode">
			<input type="hidden" name="groupcode" id="groupcode">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th colspan="2">코드내용</th>
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
							<td>
								<input type="hidden" name="madenmcd" id="madenmcd">	
								<select name="madename" id="madename" disabled>
									<c:forEach items="${madeCodes }" var="mList">
										<option class="madename_" value="${mList.CDNO } ">${mList.CDNAME }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><b>단위명 : </b></td>
							<td>	
								<input type="hidden" name="itemunitcd" id="itemunitcd">	
								<select name="unitname" id="unitname" disabled>
									<c:forEach items="${unitCodes }" var="uList">
										<option class="unitname_" value="${uList.CDNO } " >${uList.CDNAME }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><b>사용여부 : </b></td>
							<td><input type="checkbox" name="useyn" id="useyn" checked value="Y" onclick="return false;"><label for="useyn">사용</label></td>
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
		$(".catename_").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==usedCate.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
		$(".groupname_").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==usedGroup.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
	}
});
function fn_click(itemcd,itemname,madenmcd,madename,itemunitcd,unitname,useyn)
	{
		$("#itemcd").val(itemcd);
		$("#itemname").val(itemname);
		$("#madenmcd").val(madenmcd);
		
		$(".madename_").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==madenmcd.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
		
		$(".unitname_").each(function(){
			$(this).removeAttr("selected");
			if($(this).val().trim()==itemunitcd.trim())
            {
            	$(this).attr("selected","selected");	
            }
        });
		$("#itemunitcd").val(itemunitcd);
		
		$("#itemcd").attr("disabled","disabled");
		$("#itemname").attr("disabled","disabled");
		$("#madenmcd").attr("disabled","disabled");
		$("#madename").attr("disabled","disabled");
		$("#unitname").attr("disabled","disabled");
		$("#itemunitcd").attr("disabled","disabled");
	
		
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
		$("#itemcd").val("");
		$("#itemname").val("");
		$("#madenmcd").val("");
		$("#itemunitcd").val("");
		
		
		$("#itemname").removeAttr("disabled");
		$("#madename").removeAttr("disabled");
		$("#unitname").removeAttr("disabled");
		$("#useyn").removeAttr("onclick");
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
			$("#itemname").removeAttr("disabled");
			$("#madename").removeAttr("disabled");
			$("#unitname").removeAttr("disabled");
			$("#useyn").removeAttr("onclick");
		}
		
	}
	
	$("#itemForm").submit(function(event){
		$("#itemForm").removeAttr("action");
		if($("#groupname").val()==null)
		{
			alert("1차분류를 선택해주세요");
		}
		else
		{
			var itemcd=$("#itemcd").val().trim();
			var groupcode=$("#groupname").val().trim();
			var madenmcd=$("#madename").val().trim();
			var itemunitcd=$("#unitname").val().trim();
			var catecode=$("#catename").val().trim();
			
			$("#catecode").val(catecode);
			$("#groupcode").val(groupcode);
			$("#madenmcd").val(madenmcd);
			$("#itemunitcd").val(itemunitcd);
			
			if(itemcd.length<1)
			{
				
				console.log("1차분류: "+$("#groupcode").val());
				
				console.log("제조사코드: "+$("#madenmcd").val());
				console.log("단위코드: "+$("#itemunitcd").val());
				console.log("아이템이름: "+$("#itemname").val());
				
				$("#itemForm").attr("action","${path}/item/insertItem");	
			}
			else
			{
			
				$("#itemcd").removeAttr("disabled");
				$("#itemForm").attr("action","${path}/item/updateItem");
			}
		}
		
	})
	
	$("#catename").change(function(){
		var catecode=$("#catename").val().trim();
		
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
					$("#groupname").empty();
					
					for(var i=0; i<data.length;i++)
					{
						var options = $("<option></option>");
						options.append(data[i].CDNAME);
						options.attr("value",data[i].CDNO);
						$("#groupname").append(options);
					}
					
				}
			});
		}
		else
		{
			$("#groupname").empty();
		}
	});
	function fn_search()
	{
		var groupcode=$("#groupname").val().trim();
		$.ajax({
			url:"${path}/item/itemSearch",
			type:"POST",
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{groupcode:groupcode},
			success:function(data)
			{
				$("#target2").empty();
				for(var i=0; i<data.length; i++)
				{
					var tr = $("<tr></tr>");
					tr.attr("onclick","fn_click('"+data[i].ITEMCD+"','"+data[i].ITEMNAME+"','"+data[i].MADENMCD+"','"+data[i].MADENAME+"','"+data[i].ITEMUNITCD+"','"+data[i].UNITNAME+"','"+data[i].USEYN+"')")
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
					
					
					$("#target2").append(tr);
				}
			}
		});
	}
</script>
</html>
