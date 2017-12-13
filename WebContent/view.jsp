<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" centent="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>글</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 글 입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				 <thead>
				 	<tr>
				 		<th colspan="3" style="backgorund-color: #eeeeee; text-align: center;">게시판 글 </th>
				 	</tr>
				 </thead>
				 <tbody>
				 	<tr>
				 		<td style="width:20%;">글 제목</td>
				 		<td colspan="2"><%= bbs.getBbsTitle() %></td>
				 	</tr>
				 	<tr>
				 		<td>글 제목</td>
				 		<td colspan="2"><%= bbs.getUserID() %></td>
				 	</tr>
				 	<tr>
				 		<td>작성일</td>
				 		<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13)+ "시"+ bbs.getBbsDate().substring(14, 16)+"분" %></td>
				 	</tr>
				 	<tr>
				 		<td>내용</td>
				 		<td colspan="2" style="min-height:200px; text-align:left;" ><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
				 	</tr>
				 </tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary" style="margin-left : 1px">삭제</a>
				<%
					}
				%>
		</div>
	</div>
</body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</html>