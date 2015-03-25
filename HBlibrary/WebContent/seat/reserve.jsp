<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
					Calendar cal = Calendar.getInstance();
				%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>열람실 좌석 예약</h2>
	<form action="reserve_ok.do?id=<%=request.getParameter("id") %>" method="post">
	<table border="1" >
		<tr>
			<td>좌석번호</td>
			<td><%=request.getParameter("chairnum")%></td>
		</tr>
		<tr>
			<td>시작시간</td>
			<td>
				<%=cal.HOUR_OF_DAY+1%>시 <%=cal.get(cal.MINUTE)%>분
			</td>
		</tr>
		<tr>
		<td>
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
			<input type="hidden" name="time" value="<%=cal.HOUR_OF_DAY+1%>시 <%=cal.get(cal.MINUTE)%>분"/>
			<input type="hidden" name="chairnum" value="<%=request.getParameter("chairnum")%>"/>
			<input type="hidden" name="yes_no" value="yes"/>
			<input type="submit" value="예약하기"/></td>
		</tr>
	</table>
	</form>
</body>
</html>