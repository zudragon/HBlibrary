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
<c:if test="${chair.vo.yes_no =='no'}">
			<%
				response.sendRedirect("reserve.do?chairnum="+request.getParameter("chairnum")+"&id="+request.getParameter("id"));
			%>
</c:if>
<c:if test="${chair.vo.yes_no =='yes'}">
<h2><font color="red">예약 불가능한 자리입니다.</font></h2>
</c:if>
<c:if test="${!empty idInfo}">
<h2><font color="red">${idInfo.chairnum}좌석에 예약을 하셨습니다.</font></h2>
<table align="center">
		<tr>
			<td class="desk"><a href="yes.do?chairnum=1&id=${idInfo.id}">1</a></td>
			<td class="desk"><a href="yes.do?chairnum=2&id=${idInfo.id}">2</a></td>
			<td class="desk"><a href="yes.do?chairnum=3&id=${idInfo.id}">3</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=4&id=${idInfo.id}">4</a></td>
			<td class="desk"><a href="yes.do?chairnum=5&id=${idInfo.id}">5</a></td>
			<td class="desk"><a href="yes.do?chairnum=6&id=${idInfo.id}">6</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=7&id=${idInfo.id}">7</a></td>
			<td class="desk"><a href="yes.do?chairnum=8&id=${idInfo.id}">8</a></td>
			<td class="desk"><a href="yes.do?chairnum=9&id=${idInfo.id}">9</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=10&id=${idInfo.id}">10</a></td>
			<td class="desk"><a href="yes.do?chairnum=11&id=${idInfo.id}">11</a></td>
			<td class="desk"><a href="yes.do?chairnum=12&id=${idInfo.id}">12</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=13&id=${idInfo.id}">13</a></td>
			<td class="desk"><a href="yes.do?chairnum=14&id=${idInfo.id}">14</a></td>
			<td class="desk"><a href="yes.do?chairnum=15&id=${idInfo.id}">15</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=16&id=${idInfo.id}">16</a></td>
			<td class="desk"><a href="yes.do?chairnum=17&id=${idInfo.id}">17</a></td>
			<td class="desk"><a href="yes.do?chairnum=18&id=${idInfo.id}">18</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=19&id=${idInfo.id}">19</a></td>
			<td class="desk"><a href="yes.do?chairnum=20&id=${idInfo.id}">20</a></td>
			<td class="desk"><a href="yes.do?chairnum=21&id=${idInfo.id}">21</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=22&id=${idInfo.id}">22</a></td>
			<td class="desk"><a href="yes.do?chairnum=23&id=${idInfo.id}">23</a></td>
			<td class="desk"><a href="yes.do?chairnum=24&id=${idInfo.id}">24</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=25&id=${idInfo.id}">25</a></td>
			<td class="desk"><a href="yes.do?chairnum=26&id=${idInfo.id}">26</a></td>
			<td class="desk"><a href="yes.do?chairnum=27&id=${idInfo.id}">27</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=28&id=${idInfo.id}">28</a></td>
			<td class="desk"><a href="yes.do?chairnum=29&id=${idInfo.id}">29</a></td>
			<td class="desk"><a href="yes.do?chairnum=30&id=${idInfo.id}">30</a></td>
		</tr>
		<tr>
		<td><a href="return.do?id=${idInfo.id}">좌석반납하기</a></td>
		</tr>
	</table>
</c:if>
<c:if test="${empty idInfo}">
	<table align="center">
		<tr>
			<td class="desk"><a href="yes.do?chairnum=1&id=${seat.id}">1</a></td>
			<td class="desk"><a href="yes.do?chairnum=2&id=${seat.id}">2</a></td>
			<td class="desk"><a href="yes.do?chairnum=3&id=${seat.id}">3</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=4&id=${seat.id}">4</a></td>
			<td class="desk"><a href="yes.do?chairnum=5&id=${seat.id}">5</a></td>
			<td class="desk"><a href="yes.do?chairnum=6&id=${seat.id}">6</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=7&id=${seat.id}">7</a></td>
			<td class="desk"><a href="yes.do?chairnum=8&id=${seat.id}">8</a></td>
			<td class="desk"><a href="yes.do?chairnum=9&id=${seat.id}">9</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=10&id=${seat.id}">10</a></td>
			<td class="desk"><a href="yes.do?chairnum=11&id=${seat.id}">11</a></td>
			<td class="desk"><a href="yes.do?chairnum=12&id=${seat.id}">12</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=13&id=${seat.id}">13</a></td>
			<td class="desk"><a href="yes.do?chairnum=14&id=${seat.id}">14</a></td>
			<td class="desk"><a href="yes.do?chairnum=15&id=${seat.id}">15</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=16&id=${seat.id}">16</a></td>
			<td class="desk"><a href="yes.do?chairnum=17&id=${seat.id}">17</a></td>
			<td class="desk"><a href="yes.do?chairnum=18&id=${seat.id}">18</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=19&id=${seat.id}">19</a></td>
			<td class="desk"><a href="yes.do?chairnum=20&id=${seat.id}">20</a></td>
			<td class="desk"><a href="yes.do?chairnum=21&id=${seat.id}">21</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=22&id=${seat.id}">22</a></td>
			<td class="desk"><a href="yes.do?chairnum=23&id=${seat.id}">23</a></td>
			<td class="desk"><a href="yes.do?chairnum=24&id=${seat.id}">24</a></td>
		</tr>
		<tr>
			<td class="desk"><a href="yes.do?chairnum=25&id=${seat.id}">25</a></td>
			<td class="desk"><a href="yes.do?chairnum=26&id=${seat.id}">26</a></td>
			<td class="desk"><a href="yes.do?chairnum=27&id=${seat.id}">27</a></td>
			<td width="10"></td>
			<td class="desk"><a href="yes.do?chairnum=28&id=${seat.id}">28</a></td>
			<td class="desk"><a href="yes.do?chairnum=29&id=${seat.id}">29</a></td>
			<td class="desk"><a href="yes.do?chairnum=30&id=${seat.id}">30</a></td>
		</tr>
		<tr>
		<td><a href="return.do?id=${seat.id}">좌석반납하기</a></td>
		</tr>
	</table>
	</c:if>
</body>
</html>