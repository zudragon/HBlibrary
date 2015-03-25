<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table cellpadding="0" cellspacing="5">
	<tr><td colspan="5"><h2>${seat.id}</h2></td></tr>
		<tr>
			<td align="center">열람실명</td>
			<td align="center">사용</td>
			<td align="center">/</td>
			<td align="center">총좌석</td>
			<td align="center">잔여좌석</td>
		</tr>
		<tr>
			<td align="center"><a href="seat.do?id=${seat.id}">자유열람실</a></td>
			<td align="center">${seat.seatnum}</td>
			<td align="center">/</td>
			<td align="center">30</td>
			<td align="center">${30-seat.seatnum}</td>
		</tr>
	</table>
</body>
</html>