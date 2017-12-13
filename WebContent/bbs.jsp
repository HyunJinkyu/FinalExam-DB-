<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bbs.css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판</title>
<style type="text/css">
a, a:hover{
	color: #000000;
	text-decoration: none
}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		
	%>
		
	<%} else{
			int pageNumber = 1;
			if(request.getParameter("pageNunber") != null){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		
	%>
	

	
		<div class ="container">
			<div class="row">
				<input type = "button" name="btn" value = "로그아웃" class="btn btn-primary from-control" onclick = "location.href='logoutAction.jsp'"/>
				<table class="table table-striped" style="text-align: center; border: 1px solid #3498db ">
				 <thead>
				 	<tr>
				 		<th style="backgorund-color: #d1f0ee" text-align: center;">번호</th>
				 		<th style="backgorund-color: #d1f0ee" text-align: center;">제목</th>
				 		<th style="backgorund-color: #d1f0ee" text-align: center;">작성자</th>
				 		<th style="backgorund-color: #d1f0ee" text-align: center;">작성일</th>
				 	</tr>
				 </thead>
				 <tbody>
				 	<%
				 		BbsDAO bbsDAO = new BbsDAO();
				 		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
				 		for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13)+ "시"+ list.get(i).getBbsDate().substring(14, 16)+"분" %></td>
					</tr>
					<%} %>
				 </tbody>
				</table>
				<%
					if(pageNumber != 1){
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arrow-left">이전</a>
				<%
					}if(bbsDAO.nextPage(pageNumber + 1)){
				%>	
					<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
				<a href="write.jsp" class="btn btn-primary pull-right">등록</a>
			</div>
		</div>
		
	<%} %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>