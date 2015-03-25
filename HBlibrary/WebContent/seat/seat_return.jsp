<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${ret.yes_no == 'yes'}">
			<form action="return_ok.do?id=${ret.id}" method="post">
				<table>
					<tr>
						<td colspan="2">${ret.id}님좌석예약정보</td>
					</tr>
					<tr>
						<td>좌석번호</td>
						<td>${ret.chairnum}</td>
					</tr>
					<tr>
						<td>시작시간</td>
						<td>${ret.time}</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<input type="hidden" name="chairnum" value="${ret.chairnum}"/>
						<input type="hidden" name="yes_no" value="no"/>
						<input type="submit" value="반납하기" /></td>
					</tr>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<h2>
				<font color="red">현재 <%=request.getParameter("id")%>로 예약된
					좌석이 없습니다
				</font>
			</h2>
			<a href="../seat.do?id=<%=request.getParameter("id")%>">예약하러가기</a>
		</c:otherwise>
	</c:choose>

</body>
</html>