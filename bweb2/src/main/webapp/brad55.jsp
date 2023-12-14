<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="tw.brad.utils.*"%>
<c:catch var="error">
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password="root"
		/> 	
	<sql:update var="n">
		INSERT INTO member (account,cname,passwd) VALUES (?,?,?)
		<sql:param>${param.account }</sql:param>
		<sql:param>${param.cname }</sql:param>
		<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
	</sql:update>
	${n }
</c:catch>
<c:if test="${!empty error }">0</c:if>		


