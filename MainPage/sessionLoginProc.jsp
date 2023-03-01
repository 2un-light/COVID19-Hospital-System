<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userid");
	String pass = request.getParameter("password");
	
	//세션에 아이디와 비번 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	session.setMaxInactiveInterval(60*2); //2분
	
	response.sendRedirect("main.jsp");
	
%>
	id : <%=id %>
	pass : <%=pass %>
</body>
</html>