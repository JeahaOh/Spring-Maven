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
                <label for="userId">아  이  디 : 
                    <input type="text" id="idCheck" name="idCheck" placeholder="아이디를 입력하세요." />
                    <input type="hidden" id="userId" name="userId"/>
                </label>
                <input type="button" id="check" value="중복체크">
                <br>
                <p># 비밀번호는 5자리 이상 10자리 이하여야 합니다.</p>
                <label for="userPwd">비  밀  번  호 : 
                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요." />
                </label>
                <br>
                <label for="pwdCheck">비밀번호 확인: 
                    <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 확인하세요." />
                </label>
                <br>
                <label for="name">성     명 : 
                    <input type="text" id="name" name="name" placeholder="성명을 입력해 주세요." />
                </label>
                <br>
                <input type="button" id="signIn" value="저장">
            </form>
        </div>
    </div>
</body>
<script>
    $('#check').on('click', function() {
        var idVal = $('#idCheck').val();

        if (idVal.length <= 1 || idVal == "") {
            alert("아이디를 입력하세요.");
            $('#idCheck').focus();
        } else if (idVal.length > 1 && idVal != "") {
            checkId(idVal);
        } else {
            alert('알 수 없는 오류 발생!');
        }
    });

    function checkId() {
        var idVal = $('#idCheck').val();
        $.ajax('/spring/user/idCheck', {
            method : "POST",
            data : {
                "userId" : idVal
            },
            success : function(data) {
                if (data) {
                    $('#idCheck').focus();
                    alert('사용할 수 없는 아이디 입니다.');
                    return;
                } else {
                	alert('아이디는 ' + idVal + '입니다.');
                	$('#userPwd').focus();
                	$('#userId').val(idVal);
                }
            }
        });
    };
    
    $('#signIn').on('click', function() {
        var pwdVal = $('#userPwd').val();
        var pwdChck = $('#pwdCheck').val();
        var idChck = $('#idCheck').val();
        var id = $('#userId').val();
        
        if(id !== idChck){
        	alert("아이디 중복 확인을 해 주세요.");
        }
        
        if(pwdVal.length < 5 || pwdVal.length >= 10) {
        	$('#userPwd').focus();
        	alert('비밀번호는 5자리 이상 10자리 이하여야 합니다.');
        	return;
        }
        if(pwdVal !== pwdChck) {
        	$('#userPwd').focus();
          alert('비밀번호가 맞지 앖습니다.');
          return;
        }
        
        /*
        console.log(id);
        console.log(pwdVal + "\n" + pwdChck);
        console.log($('#name').val());
        */
        $('#userForm').attr('action', '/spring/user/signUp')
        $('#userForm').submit();
    });
    
    
</script>
</html>