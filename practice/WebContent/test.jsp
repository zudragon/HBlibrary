<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cal.*" %>  
<
<%@ page import="java.sql.*" %>   
<%
System.out.println("test.jsp");
Connection con=ConnectionProvider.getConnection();
out.println("con===>"+con+"<br>");

String st="2015-01-15 00:00:00.0";
out.println(st.substring(0, 10));


%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>