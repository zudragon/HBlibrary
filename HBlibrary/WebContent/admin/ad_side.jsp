<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sidebar</title>
<script type="text/javascript" src="js/jquery-1.11.2.js" ></script>
<script type="text/javascript">
	$(function() {
		var alt="";
		$("table tr img").hover(function() {
			$(this).attr("src",$(this).attr("src").replace("_b","_over"));
		},function(){
			$(this).attr("src",$(this).attr("src").replace("_over","_b"));
		})
	})
</script>
<style type="text/css">
	body.sidebar{ width: 250px; height: auto; border : solid green 1px;}
	div.sidebar{ vertical-align: top; margin-top: 50px;}
</style>
</head>
<body class="sidebar">
<div class="sidebar">
	<table width="220px"  align="center" >
	<tr height="110px"><td>
			<a href="member.ad"><img alt="회원관리" src="img/ad_member_b.png"  title="회원관리"  width="108px" height="108px"  class="admem" /></a>
	</td><td>
			<a href="class.ad"><img alt="강의실관리" src="img/ad_classroom_b.png" title="강의실관리" width="108px" height="108px"  class="adclass"/></a>
	</td></tr><tr height="110px"><td>
			<a href="library.ad"><img alt="도서관관리" src="img/ad_library_b.png" title="도서관관리" width="108px" height="108px" class="adlib"/></a>
	</td><td>
			<a href="board.ad"><img alt="게시판관리" src="img/ad_aboard_b.png" title="게시판관리" width="108px" height="108px" class="adboard"/></a>
	</td><tr height="110px"><td>
			<a href="index"><img alt="인덱스" src="img/ad_mainpage_b.png" title="인덱스" width="108px" height="108px"  class="adindex"/></a>
	</td><td>
			<a href="logout"><img alt="로그아웃" src="img/ad_logout_b.png" title="로그아웃" width="108px" height="108px"  class="adlogout"/></a>
	</td></tr>
</table>
</div>
</body>
</html>