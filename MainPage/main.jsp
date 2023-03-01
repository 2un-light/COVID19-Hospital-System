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
  String center = request.getParameter("center");
  
  if( center==null )
  {
	  center="center.jsp";
  }

%>

<center>
<!-- 주석 만들기 : ctrl+shift+/ -->
<table width="1000" border="1">
	<!-- top -->
	<tr height="150">
		<td align="center" colspan="2">
			<jsp:include page="sessionTop.jsp"/>
		</td>
	</tr>
	
	<!-- center -->
	<tr height="400">
		<td align="center" width="600" colspan="2">
			<jsp:include page="<%=center %>"/>
		</td>
	</tr>
	
	<!-- bottom -->
	<tr height="100">
		<td align="center" colspan="2">
			<jsp:include page="bottom.jsp"/>
		</td>
	</tr>
	
</table>

</center>

</body>
</html>