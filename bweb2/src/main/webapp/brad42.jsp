<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:set var="x" value="123"></c:set>
		<c:set var="x" value="345" scope="request"></c:set>
		x = ${x }<br />
		x = ${requestScope.x }
		<hr />
		<c:out value="Hello, World"></c:out><br />
		<c:out value="${x }"></c:out>
		<c:out value="${param.i }" default="no value"></c:out>
		<hr />
		<jsp:useBean id="member" class="tw.brad.utils.Member"></jsp:useBean>
		<c:set target="${member }" property="id">4</c:set>
		<c:set target="${member }" property="account">brad</c:set>
		<c:set target="${member }" property="cname">Brad</c:set>
		${member.id } : ${member.account } : ${member.cname }
		<hr />
		${member }
		<hr />
		<c:remove var="member"/>
		${member }
		
		
		
	
	</body>
</html>