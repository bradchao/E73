<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] name1 = {"Brad", "Eric", "Andy", "Tony"};
	//pageContext.setAttribute("myname1", name1);
	
	String[] name2 = {"Brad2", "Eric2", "Andy2", "Tony2"};
	//request.setAttribute("myname1", name2);
	
	String[] name3 = {"Brad3", "Eric3", "Andy3", "Tony3"};
	//session.setAttribute("myname1", name3);
	
	String[] name4 = {"Brad4", "Eric4", "Andy4", "Tony4"};
	application.setAttribute("myname1", name4);	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		name1[1] => ${myname1[1] }<br />
		name1[1] => ${pageScope.myname1[1] }<br />
		name2[1] => ${requestScope.myname1[1] }<br />
		name3[1] => ${sessionScope.myname1[1] }<br />
		name4[1] => ${applicationScope.myname1[1] }<br />
		
	</body>
</html>