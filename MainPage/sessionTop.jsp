<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');

.mainfont{font-family: 'Jeju Gothic', sans-serif;}
.menufont{font-family: 'Noto Sans KR', sans-serif;}


</style>
</head>
<body>
<%
	String logout = request.getParameter("logout");
	if(logout != null) //logout에 값이 들어 있으면...
	{
		//로그아웃을 했기 때문에, id = null 을 설정.
		session.setAttribute("id",null);
		session.setMaxInactiveInterval(0);
	}
	
	String id =(String)session.getAttribute("id");
	if( id == null )
	{
		id = "GUEST";
	}
%>
<center>
<table width="1000">
	<tr height="100" width="30">
		<td align="center">
			<img src="img/HIU.jpeg" width="100" height="100">
		</td>
		<td colspan="2" align="left">
			<font class="mainfont" size="5">HIU Medical Center</font> <br>
			<font class="mainfont">코로나19 환자 차트 관리 시스템</font>
		</td>
	</tr>
	
	<tr height="50" class="menufont">
	<td width="130" align="center"> <a href="../patientForm.jsp" style="text-decoration:none; color:black">임상 기록지 </a></td>
	<td width="130" align="center"> 비대면 진료 </td>
	<td width="130" align="center"> <a href="../patientChart.jsp" style="text-decoration:none; color:black"> 환자관리 </a></td>
	<td width="130" align="center"> 진료관리 </td>
	<td width="130" align="center"> 공지사항 </td>
	<td width="130" align="center"> 
	<%
	if(id.equals("GUEST")){
	%>
	
	<%=id %>님<input type="button" value="로그인" 
	onclick="location.href='main.jsp?center=sessionLogin.jsp'">
	
	<%	
	}
	else{
	%>
	
	<%=id %>님 <input type="button" value="로그아웃" 
	onclick="location.href='main.jsp?logout=1'">
	
	<%
	}
	%>
	</td>
	</tr>
</table>
</center>
</body>
</html>