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
<h2 class="mainfont"> 코로나 일일 임상증상 기록지 </h2>
<hr>

<form action = "patientProc.jsp" method="post">
	<table border = "1" class="menufont">
		<tr height="60" align="center"> 
			<td width="250"> 이름 </td>
			<td width="300" colspan="2"> <input type="text" name="name"> </td>
		</tr>
		
		<tr height="60" align="center"> 
			<td width="250"> 성별 </td>
			<td width="300" colspan="2"> 
			<select name="gender">
				<option value="남자"> 남자 </option>
				<option value="여자"> 여자 </option>
			</select>
			</td>
		</tr>
		
		<tr height="60" align="center"> 
			<td width="250"> 일시 </td>
			<td width="300" colspan="2">
			<input type ="text" name="date" style="width:120px">
			<select name="date">
				<option value="오전"> 오전 </option>
				<option value="오후"> 오후 </option>
			</select>
			
			</td>
		</tr>
		
		<tr height="60" align="center"> 
			<td width="250"> 체온 </td>
			<td width="300" colspan="2"> <input type="text" name="temper"> </td>
		</tr>
		
		<tr height="100" align="center" colspan="2"> 
			<td width="250"> 호흡기 증상 </td>
			<td width="200">
			<input type ="checkbox" name="symptom" value="없음">없음
			</td>
			
			<td width="350">
			<input type ="checkbox" name="symptom" value="기침 ">기침 
			<input type ="checkbox" name="symptom" value="권태감 ">권태감 
			<input type ="checkbox" name="symptom" value="호흡곤란 ">호흡곤란 
			<input type ="checkbox" name="symptom" value="인후통 ">인후통
			<br>
			<br>
			기타증상 <input type ="text" name="symptom">
			</td>
			
		</tr>
		
		<tr height="60" align="center"> 
			<td width="250"> 감염관리수칙 준수여부 </td>
			<td width="300" colspan="2"> 
				<input type ="radio" name="rule" value="예">예
				<input type ="radio" name="rule" value="아니오">아니오
			</td>
		</tr>
		
		<tr height="200" align="center"> 
			<td width="250"> 특이사항 </td>
			<td width="400" colspan="2"><textarea rows="15" cols="65" name="note"></textarea></td>
		</tr>
		
		<tr height="60" align="center"> 
			<td colspan="4" >	
			<input type="submit" value="확인">
			<input type="reset" value="취소">		
			</td>
			
		</tr>
		
	</table>
</form>

</center>

</body>
</html>