<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib 
    uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib 
    uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %><sql:setDataSource
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/brad"
			user="root"
			password="root"
			/><sql:query var="rs">
				SELECT * FROM member WHERE account = ?
				<sql:param>${param.account }</sql:param></sql:query><c:if 
				test="${rs.rowCount > 0 }">Account exist!</c:if>