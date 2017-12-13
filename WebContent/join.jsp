<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login_ds.css"/>
<title>회원가입</title>
</head>
<body>
<section>
  
<form name="form_login" action="joinAction.jsp" method="post">
	<table border="0">		
		<tr>
			<lable>
			<td>아이디</td>
            <div class ="inputBox">
	        	<td><input type="text" name="userID" placeholder="아이디" maxlength="20"/></td>
            </div>
            </lable>
          </tr>
          <tr>
            <td>비밀번호</td>
            <div class ="inputBox">
	            <td><input type="password" name="userPassword" placeholder="비밀번호" maxlength="20"/></td>
            </div>
          </tr>
          <tr>
          	<td>이름</td>
          	<div clas = "inputBox">
          		<td><input type="text" name="userName" placeholder="이름" maxlength="20"/></td>
          	</div>
	</table>
	<br>
    <span style="rgba(0, 0, 0, 0.8);"><input type="submit" name="Register" class="register" value="회원가입"></span>
</form>
</section>

</body>
</html>