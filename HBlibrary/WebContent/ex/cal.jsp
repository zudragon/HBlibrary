<%@ page import ="java.text.*,java.util.*" contentType="text/html;charset=utf-8" %>
 <%  
 /***
  * 아래는 데이터베이스를 조회하여 나온 결과라고 생각하세요
 * SELECT START_DATE, END_DATE, CONTENT
  * FROM DATE_TABLE
  * WHERE CONTENT IS NOT NULL
  * AND START_DATE = TO_DATE('201003','YYYY/MM')    <- 2010년 03월 데이터만가져오기
 * ORDER BY START_DATE ASC //정렬
 * CONTENT가 널이 아닐경우는 무언가 등록되었다는 예기이므로.. 이조건으로 가져오면 다 가져올거같네요.
  */
  ArrayList list = new ArrayList(); //DB에서 가져온 목록이라고 생각하세요.
  HashMap map = new HashMap();  //DB에서 가져온 목록중 1개의 로우 (모델) 이라고 생각하세요. 
  map.put("START_DATE",20100305);  //첫번째 로우값에 시작일 대입
 map.put("END_DATE",20100306);  //첫번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //첫번째 로우값에 내용 추가
 list.add(map);   //목록에 추가
 map = new HashMap();
  map.put("START_DATE",20100315);  //두번째 로우값에 시작일 대입
 map.put("END_DATE",20100316);  //두번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //두번째 로우값에 내용 추가
 list.add(map); 
  map = new HashMap();
  map.put("START_DATE",20100318);  //세번째 로우값에 시작일 대입
 map.put("END_DATE",20100319);  //세번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //세번째 로우값에 내용 추가
 list.add(map); 
  map = new HashMap();
  map.put("START_DATE",20100325);  //네번째 로우값에 시작일 대입
 map.put("END_DATE",20100326);  //네번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //네번째 로우값에 내용 추가
 list.add(map);   
  map = new HashMap();
  map.put("START_DATE",20100329);  //네번째 로우값에 시작일 대입
 map.put("END_DATE",20100330);  //네번째 로우값에 종료일 대입
 map.put("CONTENT","청소");  //네번째 로우값에 내용 추가
 list.add(map);  

 //여기서부터는 jsp달력 출력 문 네이버 검색엔진 참조하였습니다. 예제를 위한
 int year;
  int month;
  Calendar today=Calendar.getInstance();
  Calendar cal = new GregorianCalendar();
  year = (request.getParameter("year")==null) ?  today.get(Calendar.YEAR) :      Integer.parseInt(request.getParameter("year").trim()) ;
  month = (request.getParameter("month")==null) ?   today.get(Calendar.MONTH)+1:      Integer.parseInt(request.getParameter("month").trim()) ;
  if (month <= 0){
   month = 12;
    year  = ( year - 1 );
  } else if (month >= 13) {
  
    month = 1;
    year = ( year + 1 );
  }
  cal.set(Calendar.YEAR,year);
  cal.set(Calendar.MONTH,(month-1));
  cal.set(Calendar.DATE,1);
 %>
 <style type="text/css">
 table {width:100%;}
 table thead th {background-color:#D3D3D3;border-bottom:1px solid black;text-align:center;font-size:12px;height:30px;}
 table tbody td {background-color:#F4F4F4;border-bottom:1px solid black;text-align:center;font-size:12px;height:30px;}
 div.content {color:red;font-weight:bold;}
 </style>
 <table cellpadding="0" cellspacing="0">
 <colgroup>
  <col />
  <col />
  <col />
  <col />
  <col />
  <col />
  <col />
 </colgroup>
 <thead>
 <tr>
  <th scope="col" colspan="7">
      <a href="calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)-1)%>">◀</a>
      <%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH)+1)%>
      <a href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)+1)%>'>▶ </a>
   </th>
 </tr>
 <tr>
  <th scope="col">일</th>
  <th scope="col">월</th>
  <th scope="col">화</th>
  <th scope="col">수</th>
  <th scope="col">목</th>
  <th scope="col">금</th>
  <th scope="col">토</th>
 </tr>
 </thead>
 <tbody>
 <%  
  cal.set(year, month-1, 1);
  int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
 %>
 <tr>
 <%
  for (int i=1;i<dayOfWeek;i++) {
 %>
  <td>&nbsp;</td>
 <%
  }
  String nowYear = Integer.toString(cal.get(Calendar.YEAR));
  String nowMonth = Integer.toString(cal.get(Calendar.MONTH)+1).length() == 1 ? "0" + Integer.toString(cal.get(Calendar.MONTH)+1): Integer.toString(cal.get(Calendar.MONTH)+1);
  String printStr  = "";
  a : for (int i=1; i<= cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++) {
   list : for (int g=0; g < list.size(); g++) {
    HashMap tempMap = (HashMap)list.get(g);
    printStr = Integer.toString(i);
    int dataBaseNowDate = Integer.parseInt(tempMap.get("START_DATE").toString());
    int dataBaseNextDate = Integer.parseInt(tempMap.get("END_DATE").toString());
    String content = tempMap.get("CONTENT").toString();
    
    String nowDay = Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);
    String nextDay = Integer.toString(i + 1).length() == 1 ? "0" + Integer.toString(i + 1) : Integer.toString(i + 1);
    
    String nowDate = nowYear + nowMonth + nowDay; //for문을 돌고 있는 지금 날짜
   String nextDate = nowYear + nowMonth + nextDay; //for문을 돌고 있는 지금 날짜의 다음날짜 즉 + 1 day   
    if (content != null  && Integer.parseInt(nowDate) == dataBaseNowDate ) { //내용이 널이아닌경우는 있다는 증거
    if (Integer.parseInt(nowDate) == dataBaseNowDate && Integer.parseInt(nextDate) == dataBaseNextDate) {
       //출력하는 날짜들과 데이터베이스에 조회해서 나온날짜들을 비교하여 일치한다면// 아래와같은 형식을 만들어서 뿌려줌~
      printStr = printStr + "<div class=\"content\">" + content + "</div>";
      break  list; //for문의 list를 빠져나옴.
     }
    } else if (content != null  && Integer.parseInt(nowDate) != dataBaseNowDate) { //현재날짜와 데이터베이스의 날짜가 같지않을때
    //즉 위의 시작날짜에는 청소를 찍었으나 다음날짜도 찍어여하므로 아래 조건문이 맞아야 청소가 찍힌다.
     String preDate = nowYear + nowMonth +  (Integer.toString((i - 1)).length() == 1 ? "0" + Integer.toString((i - 1)) : Integer.toString((i - 1))); //현재날짜의 이전날짜
    if (Integer.parseInt(preDate) == dataBaseNowDate && Integer.parseInt(nowDate) == dataBaseNextDate) { 
      printStr = printStr + "<div class=\"content\">" + content + "</div>";
      break list;
     }
    }
   }
 %>
  <td>
     <a href="day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1))%>&day=<%=i %>"><%=printStr %></a>
   </td>
 <%
      if ((dayOfWeek-1+i)%7==0) {
 %>
 </tr>
 <tr>
 <%
   }
    }
 %>
 </tr>
 </tbody>
 </table>
