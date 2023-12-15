<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		Locale locale = request.getLocale();
		String lang = locale.getLanguage();
		String country =  locale.getCountry();
		out.print(lang + "_" + country);
		String langCountry = lang + "_" + country;
		pageContext.setAttribute("langCountry", langCountry);
		
		Date now = new Date();
		pageContext.setAttribute("now", now);
		
	%>
	<hr />
	Language: ${pageContext.request.locale.language }<br />
	Country: ${pageContext.request.locale.country }<hr />
	<fmt:setLocale value="${langCountry }"/>
	<fmt:setBundle basename="res"/>
	<h1><fmt:message key="companyName" /></h1>
	<hr />
	<fmt:message key="hello" />, <fmt:message key="world" />
	<hr />
	<fmt:setTimeZone value="Asia/Taipei"/>
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss" /><br />
	
	<fmt:setTimeZone value="Asia/Tokyo"/>
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss" /><br />
	
	<fmt:setTimeZone value="Europe/Berlin"/>
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss" /><br />
	
	<fmt:setLocale value="de_de"/>
	<fmt:formatNumber value="1234567.7654321" 
						type="currency" currencyCode="EUR" />
	
	
	</body>
</html>