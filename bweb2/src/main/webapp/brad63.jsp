<%@page import="tw.brad.utils.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Integer a = (Integer)session.getAttribute("a");
	int[] b = (int[])session.getAttribute("b");
	if (b == null){
		response.sendRedirect("brad62.jsp");
		return;
	}
	int bb = b[2];
	Bike b1 = (Bike)session.getAttribute("b1");
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	a = ${a }<br />
	bb = <%= bb %><br />
	b1 = <%= b1.getSpeed() %><br />
	<a href="brad64.jsp">brad64</a>
	</body>
</html>