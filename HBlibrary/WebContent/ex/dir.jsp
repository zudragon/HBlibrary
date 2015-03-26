<%@page import="mybatis.SchExVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div.dir{ width: 100px; height: 25px; font-size: x-small; color:white; float: left; background-color:#3e9ae6; padding: 0; margin: 0 auto; text-align: center; margin-right: 15px;}
	table tr td.md{ font-size: small; background-color: #b3da49;}
</style>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
	List<SchExVo> list = (List<SchExVo>)request.getAttribute("list");
%>
<table border="1px maroon outset" style="padding:0">
<%for(int i = 0; i<14; i++){
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		String mon = null;
		if(m<10)	mon = "0"+m;
		else		mon = String.valueOf(m);
		String date = null;
		if(d<10)	date = "0"+d;
		else		date = String.valueOf(d);
		String md = mon+date;
		String md1 =md.substring(0,1);	String md2 =md.substring(1,2);	String md3 =md.substring(2,3);	String md4 =md.substring(3,4);
		out.print("<tr height='40px'><td width='3px' class='md'>"+md1+"<br>"+md2+"<br>"+"/<br>"+md3+"<br>"+md4+"<br>"+"</td><td width='700px' style='margin : 0 auto;'>");
		
		cal.add(Calendar.DATE, 1);
		
		for(SchExVo k : list){
			if(md.equals(k.getSelmd())){
				String time = k.getTime();
				String name = k.getName();
				String sttime = time.substring(0,2);
				int tsize = (int)(Integer.parseInt(time.substring(2,4))-Integer.parseInt(time.substring(0,2)))/2;
				
				out.print("<div class='dir'/>신청자 : "+name+"<br>시간 : "+time+"</div>");
			}
		}
		out.print("</td></tr>");
	}%>
</table>
</body>
</html>