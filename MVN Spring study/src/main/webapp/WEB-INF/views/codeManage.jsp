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

table tbody tr {
  background-color: beige;
}

table tbody  tr {
  cursor: pointer;
}

td {
    min-width: 100px;
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
	
	input[type=button]{
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
  <div>
    <div class="container">
      <h2>Code List</h2>
      <table class="codeList">
        <thead>
          <tr>
            <th>코드번호</th>
            <th>코드레벨</th>
            <th>상위코드</th>
            <th>코드이름</th>
            <th>사용여부</th>
          </tr>
        </thead>
        <tbody id="lowList">
          <c:forEach items="${codeList}" var="Code">
            <tr class="${Code.CDNO}"
                onclick="select(`${Code.CDNO}`, `${Code.CDLVL}`, `${Code.UPCD}`, `${Code.CDNAME}`, `${Code.USEYN}`)">
              <td class="CDNO">${Code.CDNO}</td>
              <td class="CDLVL">${Code.CDLVL}</td>
              <td class="UPCD">${Code.UPCD}</td>
              <td class="CDNAME">${Code.CDNAME}</td>
              <td class="checkbox"><c:choose>
                  <c:when test="${Code.USEYN eq 'Y'}">
                    <input type="checkbox" name="${Code.CDNO}" value="Y" checked disabled>
                  </c:when>
                  <c:otherwise>
                    <input type="checkbox" name="${Code.CDNO}" value="N" disabled>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <!-- The Modal -->
  <div id="modal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <span class="close">&times;</span>
      <p>코드 상세</p>
      <div class="codeDetail">
        <form id="code" method="post">
          <table class="table">
            <thead>
              <tr>
                <th colspan="3">코드내용</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>코드번호:</td>
                <td colspan="2"><input type="text" id="CDNO" name="CDNO" disabled></td>
              </tr>
              <tr>
                <td>코드레벨</td>
                <td colspan="2"><input type="number" id="CDLVL" name="CDLVL" min="0" max="10" disabled></td>
              </tr>
              <tr>
                <td>상위코드:</td>
                <td colspan="2"><input type="text" id="UPCD" name="UPCD" pattern="C[0-9]{4}" disabled></td>
              </tr>
              <tr>
                <td>코드이름</td>
                <td colspan="2"><input type="text" id="CDNAME" name="CDNAME" disabled></td>
              </tr>
              <tr>
                <td>사용여부</td>
                <td colspan="2"><input type="checkbox" id="USEYN" name="USEYN" disabled></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td>
                  <input type="button" id="add" name="add" value="추가" />
                </td>
                <td>
                  <input type="button" id="update" name="update" value="수정" />
                </td>
                <td>
                  <input type="button" id="save" name="save" value="저장" />
                </td>
              </tr>
          </table>
        </form>
      </div>
    </div>

  </div>

</body>
<script>
  function select(cdno, cdlvl, upcd, cdname, useyn) {
    console.log(cdno, cdlvl, upcd, cdname, useyn);
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
    $('#CDNO').attr('disabled');
    $('#CDLVL').val('');
    $('#CDLVL').removeAttr('disabled');
    $('#UPCD').val('');
    $('#UPCD').removeAttr('disabled');
    $('#CDNAME').val('');
    $('#CDNAME').removeAttr('disabled');
    $('#USEYN').removeAttr('checked');
    $('#USEYN').removeAttr('disabled');
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
  });
  
  $('#save').on("click", function() {
	  alert(
			  $('#CDNO').val(),$('#CDLVL').val(),$('#UPCD').val(),
			  $('#CDNAME').val(),$('#USEYN').val());
    
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