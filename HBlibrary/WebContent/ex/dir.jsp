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
	.sch{width:110px;height:50px; margin-right:15px;font-size:12px;color:#ffffff;overflow:hidden;float:left; text-align: center; vertical-align: middle; padding: 0 auto;}
	.none{background:#d6d6d6;}
	.none:hover{background:#dfdfdf;}
	.blue{background:#5496dd;}
	.blue:hover{background:#5c9ef9;}
	.red{background:#ff454b;}
	.red:hover{background:#ff6164;}
	.yellow{background:#ffac4d;}
	.yellow:hover{background:#ffbd6a;}
	.green{background:#94e354;}
	.green:hover{background:#98e857;}
	div.dir{ width: 80px; height: 35px; float: left; }
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
		cal.add(Calendar.DATE, 1);
		out.print("<tr height='40px'><td width='3px'>"+m+"/"+d+"</td><td width='700px' style='margin : 0 auto;'>");
		String mon = null;
		if(m<10)	mon = "0"+m;
		else		mon = String.valueOf(m);
		String date = null;
		if(d<10)	date = "0"+d;
		else		date = String.valueOf(d);
		String md = mon+date;
		
		
		for(SchExVo k : list){
			if(md.equals(k.getSelmd())){
				String time = k.getTime();
				String name = k.getName();
				String sttime = time.substring(0,2);
				int tsize = (int)(Integer.parseInt(time.substring(2,4))-Integer.parseInt(time.substring(0,2)))/2;
				
			}
		}
		out.print("</td></tr>");
	}%>
</table>
</body>
</html>