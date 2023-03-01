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
<jsp:useBean id="aDao" class="PatientDB.patientDao" scope="application"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	patientDo aDo = aDao.getPatientOne(num);

%>

<center>
<h2 class="mainfont"> 선택한 환자 차트 </h2>
<hr>

<table border = "1" class="menufont">
	<tr height="60" align="center"> 
		<td width="300"> 이름 </td>
		<td width="300"> <%= aDo.getName() %> </td>
	</tr>
	
	<tr height="60" align="center"> 
			<td width="300"> 성별 </td>
			<td width="300"> <%= aDo.getGender() %> </td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 일시 </td>
		<td width="300"> <%= aDo.getDate() %></td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 체온 </td>
		<td width="300"> <%= aDo.getTemper() %> </td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 호흡기 증상 </td>
		<td width="300">
		<%= aDo.getSymptom() %> <br>
		</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 감염관리수칙 준수여부 </td>
		<td width="300"> 
			<%= aDo.getRule() %>
		</td>
	</tr>
	
	<tr height="200" align="center"> 
		<td width="300"> 특이사항 </td>
		<td width="400"><%= aDo.getNote() %></td>
	</tr>
	
		<tr height="60" align="center"> 
			<td colspan="2">
				<input type="button" value="수정하기" 
				onclick="location.href='patientModify.jsp?num=<%=aDo.getNum()%>'">
			
				<input type="button" value="삭제하기" 
				onclick="location.href='patientDelete.jsp?num=<%=aDo.getNum()%>'">
			
				<input type="button" value="목록보기" 
				onclick="location.href='patientChart.jsp'">
			</td>
		</tr>
</table>
</center>
</body>
</html>