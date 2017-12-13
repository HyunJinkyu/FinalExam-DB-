<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" centent="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>글 쓰기</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				 <thead>
				 	<tr>
				 		<th colspan="2" style="backgorund-color: #eeeeee; text-align: center;">게시판 글 등록</th>
				 	</tr>
				 </thead>
				 <tbody>
				 	<tr>
					 	<td><input type="text" class="form-control" name="bbsTitle" placeholder="제목" maxlength ="50"></td>
					</tr>
					<tr>
					 	<td><textarea name="bbsContent" class="form-control" placeholder="내용" maxlength ="2048" style="height:350px; width:400px;"></textarea></td>
				 	</tr>
				 </tbody>
				</table>
				<center>
				 <input type="submit" name="write" class="write" value="등록">
				 </center>
			</form>
		</div>
	</div>
</body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</html>