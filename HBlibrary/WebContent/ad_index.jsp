<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
	div.adtop{ text-align: center; margin: 0 auto;}
	div.adindex{ text-align: center; margin : 0 auto;}
	table.section{ width: 1200px; }
	table.sidebar2{ text-align: left;}
	table.sidebar2 tr:hover{ cursor: pointer;}
	
</style>
<script type="text/javascript" src="js/jquery-1.11.2.js" ></script>
<script type="text/javascript">
		$(function() {
		
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
			</td></c:when><c:otherwise><td rowspan="2">
				<jsp:include page="/admin/${adpage}" />
			</td><td width="250px" valign="top">
				<jsp:include page="/admin/ad_side.jsp" />
			</td><tr height="400px"><td valign="top" style="padding: 20px" >
				<c:choose>
					<c:when test="${adpage.substring(0,6)=='ad_mem'||adpage.substring(0,6)=='ad_rea' }">
						<table class="sidebar2">
							<tr><td onclick="location.href='member.ad'">회원 관리</td></tr>
							<tr><td onclick="location.href='readroom.ad'">열람실 사용 정보</td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_cla' }">
						<table class="sidebar2">
							<tr><td  onclick="location.href='class.ad'">강의실 사용 신청</td></tr>
							<tr><td onclick="location.href='class_sch.ad'">강의실 사용 스케줄</td></tr>
							<tr><td onclick="location.href='class_ins.ad'">강의실 개설</td></tr>
							<tr><td onclick="location.href='class_del.ad'">강의실 폐쇄</td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_lib' }">
						<table class="sidebar2">
							<tr><td  onclick="location.href='library.ad'">도서 대여/반납 내역</td></tr>
							<tr><td onclick="location.href='library_sch.ad'">도서 대여 스케줄</td></tr>
							<tr><td onclick="location.href='library_req.ad'">도서 구매 요청</td></tr>
							<tr><td onclick="location.href='library_ins.ad'">도서 정보 입력</td></tr>
						</table>
					</c:when>
					<c:when test="${adpage.substring(0,6)=='ad_boa'}">
						<table  class="sidebar2">
							<tr><td onclick="location.href='board.ad'">공지사항 관리</td></tr>
							<tr><td onclick="location.href='board_qna.ad'">Q&A 게시판 관리</td></tr>
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