<%@page import="tw.brad.utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
	
<c:catch var="err">
	<c:import var="data" url=
		"https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx"></c:import>	
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password="root"
		/> 
	<sql:update>DELETE FROM gift</sql:update>
	<sql:update>ALTER TABLE gift AUTO_INCREMENT = 1</sql:update>
	
	<%
		String[] names = {"brad","peter"};
		pageContext.setAttribute("names", names);
	%>
	<c:set var="gifts" value="${names }"></c:set>
	${gifts[0] }
</c:catch>
${err }
