<%@ page contentType="text/html;charset=utf-8" import="java.util.*"

%><%



// 캘린더 인스턴스 생성

Calendar day = Calendar.getInstance();



//

String setDate = request.getParameter("date");



// 파라메터로 넘어온 날자가 있을경우 해당 날자로 셋팅한다.

if ( setDate != null ) {

int nowYear = Integer.parseInt(setDate.substring(0,4));

int nowMonth = Integer.parseInt(setDate.substring(4,6)) - 1 ;

int nowDate = Integer.parseInt(setDate.substring(6,8));

day.set(nowYear, nowMonth, nowDate);

}



// 변수 선언및 오늘 날자

int thisYear = day.get(Calendar.YEAR); // 년;

int thisMonth = day.get(Calendar.MONTH); // 월 ( 0 ~ 11 );

int thisDate = day.get(Calendar.DATE); // 일

int thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )



// 오늘 날자 기억해 두기

String today = getDateString(day);



// 이달의 마지막 날자 구하기 ( 아래 for 문에서 이용

int lastDate = day.getActualMaximum(Calendar.DATE);



// 지난달 구하기

day.add(Calendar.MONTH, -1);

String yester = getDateString(day);



// 다음달 구하기

day.add(Calendar.MONTH, +2);

String after = getDateString(day);



// 원래 날자로 복귀

day.add(Calendar.MONTH, -1);



%>

<html>

<head>

<title><%=thisYear%>년 <%=getMonthNum(thisMonth)%>월 <%=thisDate%>일</title>

</head>

<body>



<B><a href="monthly.jsp?date=<%=yester%>">◀</a><%=thisYear%>년 <%=getMonthNum(thisMonth)%>월 <%=thisDate%>일 <%=getDayName(thisDay)%>요일<a href="monthly.jsp?date=<%=after%>">▶</a></b>

<BR>



<table border=1>

<tr>

<td>일</td>

<td>월</td>

<td>화</td>

<td>수</td>

<td>목</td>

<td>금</td>

<td>토</td>

</tr>



<%

for ( int i = 1 ; i <= lastDate ; i ++ ) {

// 날자 변경

day.set( Calendar.DATE, i ) ;



// 날자 다시 셋팅

thisDate = day.get(Calendar.DATE); // 일

thisDay = day.get(Calendar.DAY_OF_WEEK); // 요일 ( 일요일 : 1 ~ 토요일 : 7 )



if ( thisDate == 1 ) {

out.print("<TR> n ");

for ( int j = 1 ; j < thisDay ; j ++ ) {

out.print("<td>.</td> n ");

}

}





out.print("<td>" + thisDate + "</td> n " );





if ( thisDate == lastDate ) {

for ( int j = 0 ; j < 7 - thisDay ; j ++ ) {

out.print("<td>.</td> n ");

}

// 토요일인 경우에

} else if ( thisDay == 7 ) {

out.print("</tr>n <tr> n ");

}



}

%>

</table>

</body>

</html>







<%!



public String getDateString(Calendar day) {

String str = "" + day.get(Calendar.YEAR); // 년;



int thisMonth = day.get(Calendar.MONTH) + 1; // 월 ( 0 ~ 11 )= 0;



if ( thisMonth < 10 ) {

str += "0";

}



str += "" + thisMonth ;



int thisDate = day.get(Calendar.DATE) ; // 월 ( 0 ~ 11 )= 0;



if ( thisDate < 10 ) {

str += "0";

}



str += "" + thisDate ;



return str;

}





public String getDayName(int day){

String str = "";

if ( day == 1 ) {

str = "일";

} else if ( day == 2 ) {

str = "월";

} else if ( day == 3 ) {

str = "화";

} else if ( day == 4 ) {

str = "수";

} else if ( day == 5 ) {

str = "목";

} else if ( day == 6 ) {

str = "금";

} else if ( day == 7 ) {

str = "토";

}

return str;

}





public int getMonthNum(int month){

return month + 1 ;

}

%>
