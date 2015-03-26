<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="cal.Calen" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8");
	Calen cal=new Calen();
    cal.set(request.getParameter("year"),request.getParameter("month"),request.getParameter("day")); 
    request.setAttribute("cal", cal);//정해진 날짜를 속성으로 등록
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>달력</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
A:link    { color: #000000; }
A:visited { text-decoration: none;color: #000000; }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

   		<script type="text/javascript">
			function initMenu() {
				var block = $(".day");
				
				$('.open').hide(); 
				block.click(
					function() {
						$(this).parents('div:eq(0)').find('.open').slideToggle('fast');	
					}
				);}
			$(document).ready(function() {initMenu();});
   		</script>	 
<script type="text/javascript" src="js/jquery-1.11.2.js" ></script>
<script>
	$(document).ready(function() {
		selectData();
		//등록버튼을 눌렀을때
		$('#sj').submit(function() {
			//이름 유효성검사
			if ($('#name').val().trim().length < 1) {
				alert("이름을 입력하세요.");
				return false;
			}
            //일정내용 유효성검사
			if ($('#msg').val().trim().length < 1) {
				alert("내용을 입력하세요.");
				return false;
			}
			//새로운 일정을 DB에 넣기
			var data=$(this).serialize();
			//Ins.java(서블릿)으로 파라미터를 전달하고 selectData함수를 호출
			$.post('ins.do',data,selectData);
			//현재 등록된 이름과 일정을 테스트 필드에서 지운다.
			$('#name').val('');
			$('#msg').val('');
			//기본 이벤트 전달을 막는다.
			event.preventDefault();                
		});	
	});
	//DB로부터 등록된 일정을 가져오는 함수
	function selectData(){	
		
		$('#output').empty();//기존일정을 지운다.
		//해당날짜를 Infosv서블릿으로전달하고  json결과를 가져온다.
		$.getJSON('list.do?wdate=${cal.year}-${cal.month}-${cal.day}',function(data){
			var i=0;
			$.each(data,function(key,value){
				var aa=11;
				var output='';
				output +='<tr>';
				output +='<td style="border:solid 1px #006ffd">'+(++i)+'</td>';
				output +='<td style="border:solid 1px #006ffd">'+value.wdate+'</td>';
				output +='<td style="border:solid 1px #006ffd">'+value.name+'</td>';
				output +='<td style="border:solid 1px #006ffd">'+value.msg+'</td>';
				output +='<td style="border:solid 1px #006ffd">'+
				'<input type="button" value="삭제" onclick="del('+value.no+')">'+
				'</td>';
				output +='</tr>';
				$('#output').append(output);
			}); 
		});
	}
	function del(v){
		$.post('del.do?no='+v,selectData);
	}
	
</script> 
</head>
<body>
<center>
<div id="calendar">
<div id="calcontainer">
<table border="0" >
<tr><td width="30%">
<table border="0" cellpadding="2" cellspacing="1">
<tr>
<td>
<div id="calheader"><a href="/practice/koyomi.jsp?year=${cal.pryear}&month=${cal.prmonth}">☜</a>
<b>${cal.year}년 ${cal.month}월</b>
<a href="/practice/koyomi.jsp?year=${cal.nextyear}&month=${cal.nextmonth}">☞</a></div>
</td>
</tr>
</table>
<table border="1" cellpadding="2" cellspacing="1"width="500px" height="400px">
<tr>
<td align="center"><div class="dayweek"><p>Sunday</p></div></td>
<td align="center"><div class="dayweek"><p>Monday</p></div></td>
<td align="center"><div class="dayweek"><p>Tuesday</p></div></td>
<td align="center"><div class="dayweek"><p>Wednesday</p></div></td>
<td align="center"><div class="dayweek"><p>Thursday</p></div></td>
<td align="center"><div class="dayweek"><p>Friday</p></div></td>
<td align="center"><div class="dayweek"><p>Saturday</p></div></td>
</tr>
<%
int count=0;
out.print("<tr>");
for(int i=1;i<cal.getWeek();i++){
 out.print("<td>&nbsp;</td>");
 count++; 
}
String color;
String bgcol;
for(int i=1;i<=cal.getLast();i++){

 if(cal.getDay()==i)bgcol="#00ff00";
	else bgcol="#ffffff";
%>
 
 <td align='center' bgcolor="<%=bgcol%>"><font color="+color+">
 <a href='/practice/koyomi.jsp?year=${cal.year}&month=${cal.month}&day=<%=i%>' style="text-decoration:none;"><div class="day">
							<div class="daybar"><p><%=i%></p></div>
							<div class="dots">
								열기
							</div>	
							<!-- slide open -->
						<div class="open">
							
						</div>	</a>
 </font></td>
<%
 count++;
 if(count%7==0&&i!=cal.getLast()){
  out.print("</tr>");
  out.print("<tr>");
  count=0;
 }
}

while(count>0&&count<7){
 out.print("<td>&nbsp;</td>");
 count++;
}
out.print("<tr>");
%>
</table>
</td>
<td>
<b>선택한 날짜 : ${cal.year}년 ${cal.month}월 ${cal.day}일</b>
<form id="sj">
<fieldset>
<legend>일정등록</legend>
<label>이름 : </label><input type="text" name="name" id="name" size="5"><br>
<label>내용 : </label><input type="text" name="msg" id="msg" size="40"><br>
<input type="hidden" name="wdate" value="${cal.year}-${cal.month}-${cal.day}">
<input type="submit" value="등록">
<input type="reset" value="취소">
</fieldset>
<fieldset>
<legend>일정리스트</legend>
<table >
	<tr>
    <th style='border:solid 1px #006ffd'>번호</th>
    <th style='border:solid 1px #006ffd'>날짜</th>
    <th style='border:solid 1px #006ffd'>이름</th>
    <th style='border:solid 1px #006ffd'>일정</th>
    <th style='border:solid 1px #006ffd'>비고</th>
    </tr>
	<tbody id="output">	
	</tbody> 
    </table>
</fieldset>
</form>
</td>
</tr>
</table>

</div></div>
</center>
</body>
</html>



