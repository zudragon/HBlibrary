<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ad_table.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
 	body{	font-family:"맑은 고딕", "고딕", "굴림";
		background-image: url("img/lib_back.png"); 	no-repeat; background-size:100% 100%
		
 	}
	table.ad_table{	 border-bottom: 3px solid #b30808; border-left: 3px solid #b30808;  border-right: 3px solid #b30808; 	}
	table.ad_table_title{	width: 800px; height:30px; border: 3px solid #b30808;  	}
	table.ad_table_title tr{ background: #f57272; color : white; }
	div.adtop{ text-align: center; margin: 0 auto;}
	div.adindex{ text-align: center; margin : 0 auto;}
	table.section{ width: 1200px; }
	table.sidebar2{ text-align: left;}
	table.sidebar2 tr:hover{ cursor: pointer;}
	
</style>
<script type="text/javascript" src="js/jquery-1.11.2.js" ></script>
<script type="text/javascript">
		$(function() {
			$("table.sidebar2 tr img").hover(function() {
				$(this).attr("src",$(this).attr("src").replace("_on","_over"));
			},function(){
				$(this).attr("src",$(this).attr("src").replace("_over","_on"));
			})
		})
</script>
</head>
<body>
<div class="adtop"><jsp:include page="/admin/ad_top.jsp" /></div>
<div class="adindex">
	<table class="section" align="center">
		<tr height="400px" class="section">
			<c:choose><c:when test="${adpage==null || adpage=='ad_main.jsp'}"><td colspan="2">
				<jsp:include page="/admin/ad_main.jsp" />
			</td></c:when><c:otherwise><td rowspan="2" valign="top">
				<jsp:include page="/admin/${adpage}" />
			</td><td width="250px" valign="top">
				<jsp:include page="/admin/ad_side.jsp" />
			</td><tr height="400px"><td valign="top" style="padding: 20px" >
				<c:choose>
					<c:when test="${adpage.substring(0,6)=='ad_mem'||adpage.substring(0,6)=='ad_rea' }">
						<table class="sidebar2">
							<tr><td onclick="location.href='member.ad'"><img alt="회원관리" title="회원관리" src="img/button_member_on.png" width="160px" /></td></tr>
							<tr><td onclick="location.href='readroom.ad'"><img alt="열람실관리" title="열람실관리" src="img/button_member_read_on.png"  width="160px" /></td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_cla' }">
						<table class="sidebar2">
							<tr><td  onclick="location.href='class.ad'"><img alt="강의실관리" title="강의실관리" src="img/button_class_on.png"  width="160px" /></td></tr>
							<tr><td onclick="location.href='class_sch.ad'"><img alt="강의실스케줄" title="강의실스케줄" src="img/button_class_sch_on.png"  width="160px" /></td></tr>
							<tr><td onclick="location.href='class_ins.ad'"><img alt="강의실개설" title="강의실개설" src="img/button_class_ins_on.png"  width="160px"  /></td></tr>
							<tr><td onclick="location.href='class_del.ad'"><img alt="강의실폐쇄" title="강의실폐쇄" src="img/button_class_del_on.png" width="160px"  /></td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_lib' }">
						<table class="sidebar2">
							<tr><td  onclick="location.href='library.ad'"><img alt="도서대여관리"  title="도서대여관리" src="img/button_library_on.png"  width="160px" /></td></tr>
							<tr><td onclick="location.href='library_sch.ad'"><img alt="도서대여스케줄"  title="도서대여스케줄" src="img/button_library_sch_on.png" width="160px"  /></td></tr>
							<tr><td onclick="location.href='library_req.ad'"><img alt="도서요청"  title="도서요청" src="img/button_library_req_on.png" width="160px"  /></td></tr>
							<tr><td onclick="location.href='library_ins.ad'"><img alt="도서입력"  title="도서입력" src="img/button_library_ins_on.png"  width="160px" /></td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_boa'}">
						<table  class="sidebar2">
							<tr><td onclick="location.href='board.ad'"><img alt="공지사항"  title="공지사항"  src="img/button_board_on.png"  width="160px" /></td></tr>
							<tr><td onclick="location.href='board_qna.ad'"><img alt=Q&A"  title="Q&A"  src="img/button_board_qna_on.png"  width="160px" /></td></tr>
						</table>
					</c:when>
				</c:choose>
			</td></tr>
			</c:otherwise></c:choose>
		</tr><tr height="100px" class="footer" ><td colspan="2">
			footer..........
		</td></tr>	
	</table>
</div>
</body>
</html>