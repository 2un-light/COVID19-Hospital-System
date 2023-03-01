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
<h2 class="mainfont"> 주소록 수정 </h2>
<hr>
<form action = "patientModifyProc.jsp" method="post">
	<table border = "1" class="menufont">
	<tr height="60" align="center"> 
		<td width="300"> 이름 </td>
		<td width="300"> 
		<input type="text" name="name" value="<%=aDo.getName()%>"> 
		</td>
	</tr>
		
	<tr height="60" align="center"> 
			<td width="300"> 성별 </td>
			<td width="300"> 
			<input type="text" name="gender" value="<%=aDo.getGender()%>"> 
			</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 일시 </td>
		<td width="300">
		<input type="text" name="date" value="<%=aDo.getDate()%>"> 
		</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 체온 </td>
		<td width="300">
		<input type="text" name="temper" value="<%=aDo.getTemper()%>"> 
		</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 호흡기 증상 </td>
		<td width="300">
		<input type="text" name="symptom" value="<%=aDo.getSymptom()%>"> 
		</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 감염관리수칙준수여부 </td>
		<td width="300">
		<input type="text" name="rule" value="<%=aDo.getRule()%>"> 
		</td>
	</tr>
	
	<tr height="60" align="center"> 
		<td width="300"> 특이사항 </td>
		<td width="300">
		<input type="text" name="note" value="<%=aDo.getNote()%>" style="width:300px;height:200px;"> 
		</td>
	</tr>
		
		<tr height="60" align="center"> 
			<td colspan="2">
			<input type="hidden" name="num" value="<%= aDo.getNum() %>">	
			<input type="submit" value="수정하기">
			<input type="button" value="목록보기" 
			onclick="location.href='patientChart.jsp'">
			</td>
			
		</tr>
		
	</table>
</form>
</center>

</body>
</html>