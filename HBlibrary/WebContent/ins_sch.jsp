<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{ text-align: center;}
	input{
		margin: 0 auto;
	}
</style>
</head>
<body>
<img src="c:/HBlibrary/img/한빛로고.png" />
	<form action="ins.ex">
		<table>
			<tr><td width="70px">이름</td><td><input type="text" name="name" /> </td></tr>
			<tr><td>사용날짜</td><td><input type="text" name="selday" /></td></tr>
			<tr><td>사용시간</td><td><input type="text" name="time" /></td></tr>
			<tr><td colspan="2"><input type="submit" value="입력" /><input type="button" value="리스트"  onclick="location.href='list.ex'"/></td></tr>
		</table>
	</form>
</body>
</html>