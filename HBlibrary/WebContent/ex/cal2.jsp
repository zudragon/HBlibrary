<%@ page contentType = "text/html; charset=UTF-8"%>
 <HTML>
 <HEAD>
  <TITLE>cal</TITLE>
 </HEAD>
 <BODY>
 <%
 java.util.Calendar cal = java.util.Calendar.getInstance();

String strYear  = request.getParameter("year");
 String strMonth = request.getParameter("month");

System.out.println("strYear:"+strYear);
 System.out.println("strMonth:"+strMonth);

int year = cal.get(java.util.Calendar.YEAR);
 int month = cal.get(java.util.Calendar.MONTH);
 int date = cal.get(java.util.Calendar.DATE);


 if(strYear != null)
 {
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);

if(month==12)
 {
  year++;
  month = 0;
 }
 else if(month<0)
 {
  year--;
  month = 11;
 }

System.out.println("year:"+year);
 System.out.println("month:"+month);
 }


 cal.set(year, month, 1);
 int startDay = cal.getMinimum(java.util.Calendar.DATE);


 int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);


 int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
 int newLine = 0;
 %>
  <TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
   <TR>
    <TD>
     <%--표시하고자 하는 날짜의 년, 월 정보를 전달--%>
     <a href="./cal.jsp?year=<%=year-1%>&month=<%=month%>">◀</a>
     <STRONG><%=year%>년 </STRONG> <a href="./cal.jsp?year=<%=year+1%>&month=<%=month%>">▶</a>
    </TD>
    <TD>
     <DIV align="center">
     <a href="./cal.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a>
     <STRONG><%=month + 1%>월 </STRONG><a href="./cal.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a>
     </DIV>
    </TD>
    <TD>
     <DIV align="right">
     <a href='./cal.jsp'></a><STRONG><%=year + "-" + (month+1) + "-" + date%></STRONG>
     </DIV>
    </TD>
   </TR>
  </TABLE>
  <BR>
  <TABLE width="100%" border="1" cellspacing="0" cellpadding="0">
   <TR>
    <TD>
     <DIV align="center"><font color="red">일</font></DIV>
    </TD>
    <TD>
     <DIV align="center">월</DIV>
    </TD>
    <TD>
     <DIV align="center">화</DIV>
    </TD>
    <TD>
     <DIV align="center">수</DIV>
    </TD>
    <TD>
     <DIV align="center">목</DIV>
    </TD>
    <TD>
     <DIV align="center">금</DIV>
    </TD>
    <TD>
     <DIV align="center">토</DIV>
    </TD>
   </TR>
 <%
 for(int index = 1; index < start ; index++ )
 {
  out.print("<TD>&nbsp;</TD>");
  newLine++;
 }


 for(int index = 1; index <= endDay; index++)
 {
  String color = (newLine == 0)?"RED":"BLACK";


  out.print("<TD align=center width=100 height=40><font color="+color+">"+index+"</font></TD>");
  newLine++;


  if(newLine == 7)
  {
   out.print("</TR>");
   if(index <= endDay)
   {
    out.print("<TR>");
   }
   newLine=0;
  }
 }


 while(newLine > 0 && newLine < 7)
 {
  out.print("<TD>&nbsp;</TD>");
  newLine++;
 }
 %>
  </TABLE>
 </BODY>
 </HTML>
