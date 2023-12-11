<%@page import="tw.brad.utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mesg = "";

	request.setCharacterEncoding("UTF-8");
	String account = request.getParameter("account");	
	String passwd = request.getParameter("passwd");
	
	if (request.getMethod().equals("POST")){
		if (account != null && passwd != null){
			MemberDB memberDB = new MemberDB();
			if (memberDB.login(account, passwd)){
				response.sendRedirect("main.jsp");
			}else{
				mesg = "Login Failure";
			}
		}
	}
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Brad Big Company V26</h1>
	<hr />
	Login Form<br />
	<div><%= mesg %></div>
	<form method="post">
		Account: <input name="account" /><br />
		Password: <input type="password" name="passwd" /><br />
		<input type="submit" value="Login" />
	</form>
	</body>
</html>