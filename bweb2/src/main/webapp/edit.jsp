<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="tw.brad.utils.*"%>      
<!DOCTYPE html>
<html>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password="root"
		/> 	
	<c:if test="${!empty param.editid }">
		<sql:query var="rs">
			SELECT * FROM member WHERE id = ?
			<sql:param>${param.editid }</sql:param>
		</sql:query>
	</c:if>	
	<c:if test="${!empty param.updateid }">
		<sql:update>
			UPDATE member SET account = ?, passwd = ?, cname = ? WHERE id = ?
			<sql:param>${param.account }</sql:param>
			<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
			<sql:param>${param.cname }</sql:param>
			<sql:param>${param.updateid }</sql:param>			
		</sql:update>
		<c:redirect url="main.jsp"></c:redirect>
	</c:if>
	
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<h1>Edit</h1>
	<hr />
		<form action="?updateid=${rs.rows[0].id }" method="post">
			Account: <input id="account" name="account" value="${rs.rows[0].account }" /><br />
			Password: <input type="password" name="passwd" /><br />
			Name: <input name="cname" value="${rs.rows[0].cname }"/><br />
			<input type="submit" value="Update" />
		</form>		
	</body>
</html>