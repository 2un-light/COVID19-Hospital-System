<%@page import="java.util.ArrayList"%>
<%@page import="PatientDB.patientDo"%>
<%@page import="addressModel.addressBean"%>
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
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="aDao" class="PatientDB.patientDao" scope="application"/>

<%
	String name = request.getParameter("name");
	ArrayList<patientDo> v = aDao.searchPatientOne(name);

%>

<center>
<h2 class="mainfont"> <%=name %> 환자 차트 </h2>
<hr>
<form action = "patientSearch.jsp" method="post">
<input type="text" name="name" style="width:300px;height:20px;">
<input type="submit" value="확인">
</form>
<hr>

<table border="1" class="menufont">
	<tr height="60" align="center">
		<td width="200"> 이름 </td>
		<td width="200"> 성별 </td>
		<td width="200"> 일시 </td>
		<td width="200"> 체온 </td>
		<td width="200"> 호흡기 증상 </td>
		<td width="200"> 감염관라수칙 준수여부</td>
		<td width="200"> 특이사항</td>
	</tr>
	
<%
for(int i=0; i< v.size(); i++)
{
	patientDo aDo = v.get(i);
%>
	<tr height="60" align="center">
		<td width="150"> <a href="patientInfo.jsp?num=<%=aDo.getNum()%>"> <%= aDo.getName() %></a></td>
		<td width="150"> <%= aDo.getGender()%> </td>
		<td width="150"> <%= aDo.getDate()%> </td>
		<td width="150"> <%= aDo.getTemper()%> </td>
		<td width="150"> <%= aDo.getSymptom() %> </td>
		<td width="300"> <%= aDo.getRule()%> </td>
		<td width="300"> <%= aDo.getNote()%> </td>
	</tr>	
<%
}
%>
</table>
<br>
<a href="patientChart.jsp" class="menufont">이전</a>
</center>
</body>
</html>