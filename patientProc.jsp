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
<center>
<h2 class="mainfont"> 환자 등록 정보 </h2>
<hr>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="aDo" class="PatientDB.patientDo">
	<jsp:setProperty name="aDo" property="*"/>
</jsp:useBean>

<jsp:useBean id="aDao" class="PatientDB.patientDao" scope="application" />
<%

	//체크박스는 여러 개의 데이터가 선택될 수 있기때문에, 텍스트를 하나로 묶어서, 처리가(저장) 필요
	String[] symptom = request.getParameterValues("symptom");
	String[] date = request.getParameterValues("date");

	String symptomText = "";
	String dateText = "";
	
	for (int i=0; i<symptom.length; i++){
		symptomText += symptom[i] + "  ";
	}
	
	for (int j=0; j<date.length; j++)
		dateText += date[j] + "  ";
	
	aDo.setSymptom(symptomText);
	aDo.setDate(dateText);
	aDao.InsertPatient(aDo);//jspdb 데이터베이스의 patient 데이블에 입력값 저장.
%>

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
</table>
<br>
<br>
<a href="patientChart.jsp"> 전체환자목록 </a>
</center>
</body>
</html>