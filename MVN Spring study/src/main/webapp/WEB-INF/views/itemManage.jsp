<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CodeManage</title>
<style>
table {
  border: 1px solid gray;
  width: 50%;
  text-align: center;
}

table thead th {
  min-width: 80px;
}

table tbody tr {
  background-color: beige;
  cursor: pointer;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover, .close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

input[type=button] {
  width: 80px;
}
</style>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
  language="javascript"></script>
<script>

</script>
</head>
<body>
  <%-- ========================================================================================== --%>
  <div>
    <div class="container">
      <h2>Item List</h2>
      <p>카테고리
        <select id="category1">
          <%-- 옵션 들어올 자리 --%>
          <option value="">선택하세요</option>
            <c:forEach items="${catagoList}" var="code">
              <option value="${code.CDNO}">"${code.CDNAME}"</option>
            </c:forEach>
        </select>
        1차분류
        <select id="category2">
          <%-- 옵션 들어올 자리 --%>
          <option value="">카테고리선택</option>
        </select>
        <input type="button" id="searchItems" name="searchItems" value="조회">
      </p>
      <table class="itemList">
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
        <tbody id="itemListBody">
        <%-- itemList 들어올 자리 --%>
        </tbody>
      </table>
    </div>
  </div>
  <%-- ========================================================================================== --%>
  <!-- The Modal -->
  <div id="modal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
      <span class="close">&times;</span>
      <p>코드 상세</p>
      <div class="container">
        <form id="item" method="post">
          <input type="hidden" id="loginUser" name="loginUser"
            value="${sessionScope.loginUser.id}">
          <table class="itemDetail">
            <thead>
              <tr>
                <th colspan="4">코드내용</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>코드번호:</td>
                <td colspan="2"><input type="text" id="CDNO" name="CDNO" disabled></td>
              </tr>
              <tr>
                <td>코드레벨</td>
                <td colspan="2"><input type="number" id="CDLVL" name="CDLVL" min="0" max="10" disabled required></td>
              </tr>
              <tr>
                <td>상위코드:</td>
                <td colspan="2"><input type="text" id="UPCD" name="UPCD"
                  pattern="C[0-9]{4}" disabled required></td>
              </tr>
              <tr>
                <td>코드이름</td>
                <td colspan="2"><input type="text" id="CDNAME"
                  name="CDNAME" disabled required></td>
              </tr>
              <tr>
                <td>사용여부</td>
                <td colspan="2"><input type="checkbox" id="USEYN"
                  name="USEYN" disabled required></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td><input type="button" id="add" name="add" value="추가" />
                </td>
                <td><input type="button" id="update" name="update"
                  value="수정" /></td>
                <td><input type="button" id="save" name="save" value="저장" />
                </td>
              </tr>
          </table>
        </form>
      </div>
    </div>

  </div>
  <%-- ========================================================================================== --%>
</body>
<script>
  $('#category1').on('change', function() {
    if(this.value === null || this.value == '') {
      $('#category2').empty();
      return;
    }
    
    $.ajax("/spring/item/detailList", {
        method: "POST",
        data:{
          "cdno": (this.value)
        },
        success: function(data) {
          $('#category2').empty();
          if(data === null || data == '' || data.length < 1) {
            return;
          }
          for (i = 0; i < data.length; i++) {
            var options = $("<option></option");
            options.append(data[i].CDNAME);
            options.attr('value', data[i].CDNO);
            $('#category2').append(options);
          }
        },
        error: function(xhr, status, msg) {
          alert('정보를 가져오는데 실패하였습니다.');
          console.log(status);
          console.log(msg);
        }
      });
  });
  
  $('#searchItems').on('click', function() {
     var $cdno = $('#category2 option:selected').val();
      if($cdno === null || $cdno == ''){
       alert('카테고리와 1차분류를 선택해 주세요.');
       return;
     }
     
     $.ajax("/spring/item/searchItems", {
         method: "POST",
         data:{
           "cdno": $cdno
         },
         success: function(data) {
           if(data === null || data == '' || data.length < 1){
             alert('가져온 정보가 없습니다.');
             return;
           }
           console.log(data);
           $.each(data, function (i, item) {
             $('#itemListBody').append(item.ITEMCD + '<br>');
           });
           var print = makeHtml(data);
           $('#itemListBody').html(print);
         },
         error: function(xhr, status, msg) {
           alert('정보를 가져오는데 실패하였습니다.');
           console.log(status);
           console.log(msg);
         }
       });
  });
  
<%--
ITEMCD , ITEMNAME, MADENMCD, MADENAME, ITEMUNITCD, UNITNAME, STOCKAMT, STOCKYN, USEYN, ITEMCLSCD
--%>
  
  function makeHtml(data) {
    var html = '';
    $.each(data, function(i, obj) {
      html += `<tr class="item" onclick="select()">`
      html += `<td>` + obj.ITEMCD + `</td>`
      html += `<td>` + obj.ITEMNAME + `</td>`
      html += `<td>` + obj.MADENMCD + `</td>`
      html += `<td>` + obj.MADENAME + `</td>`
      html += `<td>` + obj.ITEMUNITCD + `</td>`
      html += `<td>` + obj.UNITNAME + `</td>`
      html += `<td>` + obj.STOCKAMT + `</td>`
      html += `<td>` + obj.STOCKYN + `</td>`
      html += `<td>` + obj.USEYN + `</td>`
      html += `</tr>`
    });
    return html;
    console.log(html);
  }
  
  
  function select(cdno, cdlvl, upcd, cdname, useyn) {
    $('#CDNO').val(cdno);
    $('#CDLVL').val(cdlvl);
    $('#UPCD').val(upcd);
    $('#CDNAME').val(cdname);
    if(useyn=="Y"){
        $('#USEYN').attr('checked', 'checked');
        $('#USEYN').attr('value', 'Y');
    }   else {
        $('#USEYN').removeAttr('checked');
        $('#USEYN').attr('value', 'N');
    }
    openModal();
  }
  
  $('#add').on("click", function() {
    $('#code').attr('action', '/spring/code/add');
    $('#code').removeClass('update');
    $('#code').addClass('add');
    
    $('#UPCD').val($('#CDNO').val());
    $('#UPCD').removeAttr('disabled');
    
    $('#CDNO').val('');
    $('#CDNO').attr('disabled');
    
    $('#CDLVL').val(parseInt($('#CDLVL').val()) + 1);
    $('#CDLVL').removeAttr('disabled');
    $('#CDNAME').val('');
    $('#CDNAME').removeAttr('disabled');
    $('#USEYN').removeAttr('checked');
    $('#USEYN').removeAttr('disabled');
    $('#USEYN').removeAttr('value');
  });
  
  $('#update').on("click", function() {
    $('#code').attr('action', '/spring/code/update');
    $('#code').removeClass('add');
    $('#code').addClass('update');
    $('#CDNO').attr('readonly');
    $('#CDLVL').removeAttr('disabled');
    $('#UPCD').removeAttr('disabled');
    $('#CDNAME').removeAttr('disabled');
    $('#USEYN').removeAttr('disabled');
    $('#USEYN').removeAttr('value');
  });
  
  $('#save').on("click", function() {
    $('#CDNO').removeAttr('disabled');
    if($("input:checkbox[name='USEYN']").is(':checked')){
          $('#USEYN').attr('value', 'Y');
    }  else {
        $('#USEYN').attr('value', 'N');
    }
    $('#code').submit();
  });
  

  // 모달 열기.
  var modal = document.getElementById('modal');
  function openModal() {
    modal.style.display = "block";
  }
  // span의 X를 눌러 모달 닫기.
  var span = document.getElementsByClassName("close")[0];
  span.onclick = function() {
      exitModal();
  }

  // modal 밖 클릭시 닫기.
  window.onclick = function(event) {
    if (event.target == modal) {
      exitModal();
    }
  }
  function exitModal(){
    modal.style.display = "none";
    $('#code').attr('action', '#');
    $('#code').removeClass('add');
    $('#code').removeClass('update');
    $('#CDNO').attr('disabled','disabled');
    $('#CDLVL').attr('disabled','disabled');
    $('#UPCD').attr('disabled','disabled');
    $('#CDNAME').attr('disabled','disabled');
    $('#USEYN').attr('disabled','disabled');
  }
</script>
</html>