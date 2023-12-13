<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="tw.brad.utils.*"%>  
<!DOCTYPE html>
<html>
	<c:if test="${!empty param.account }">
		<c:if test="${pageContext.request.method == 'GET' }">
			<c:redirect url="main.jsp"></c:redirect>
		</c:if>
		
		<sql:setDataSource
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/brad"
			user="root"
			password="root"
			/> 	
		
		<sql:update>
			INSERT INTO member (account,cname,passwd) VALUES (?,?,?)
			<sql:param>${param.account }</sql:param>
			<sql:param>${param.cname }</sql:param>
			<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
		</sql:update>
		<c:redirect url="main.jsp"></c:redirect>
	</c:if>
	
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>AddNew</h1>
		<hr />
		<form method="post">
			Account: <input name="account" /><br />
			Password: <input type="password" name="passwd" /><br />
			Name: <input name="cname" /><br />
			<input type="submit" value="Add" />
		</form>	
	</body>
</html>