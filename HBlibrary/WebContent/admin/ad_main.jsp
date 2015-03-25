<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.2.js" ></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$("table tr img").hover(function() {
			$(this).attr("src",$(this).attr("src").replace("_b","_over"));
		},function(){
			$(this).attr("src",$(this).attr("src").replace("_over","_b"));
		})
	})
</script>
</head>
<body>
<table width="1000px" align="center" style="margin: 30px;">
	<tr height="300px"><td>
			<a href="member.ad"><img alt="회원관리" src="img/ad_member_b.png"  title="회원관리"  width="298px" height="298px"  class="admem" /></a>
	</td><td>
			<a href="class.ad"><img alt="강의실관리" src="img/ad_classroom_b.png" title="강의실관리" width="298px" height="298px"  class="adclass"/></a>
	</td><td>
			<a href="library.ad"><img alt="도서관관리" src="img/ad_library_b.png" title="도서관관리" width="298px" height="298px" class="adlib"/></a>
	</td></tr><tr height="300px"><td>
			<a href="board.ad"><img alt="게시판관리" src="img/ad_aboard_b.png" title="게시판관리" width="298px" height="298px" class="adboard"/></a>
	</td><td>
			<a href="index"><img alt="인덱스" src="img/ad_mainpage_b.png" title="인덱스" width="298px" height="298px"  class="adindex"/></a>
	</td><td>
			<a href="logout"><img alt="로그아웃" src="img/ad_logout_b.png" title="로그아웃" width="298px" height="298px"  class="adlogout"/></a>
	</td></tr>
</table>
</body>
</html>