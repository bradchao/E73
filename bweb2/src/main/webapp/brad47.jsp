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
	<sql:query var="rs">
		SELECT * FROM food
	</sql:query>
	
	<c:set var="rpp" value="10" />
	<c:set var="pages0">
		${rs.rowCount % rpp == 0 ? rs.rowCount / rpp : (rs.rowCount - (rs.rowCount % rpp)) / rpp + 1 }
	</c:set>
	<c:set var="pages">${Double.valueOf(pages0).intValue() }</c:set>
	
	<c:set var="page" value="${param.page == null || param.page < 1 ? 1 : param.page }" />
	<c:set var="start" value="${(page - 1) * rpp }" />
	<c:set var="prev" value="${page <= 1 ? 1 : page - 1 }" />
	<c:set var="next" value="${BradUtils.nextPage(page, pages) }" />
	
	<sql:query var="rs2">
		SELECT * FROM food LIMIT ${start }, ${rpp }
	</sql:query>	
	
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

		<h1>美食小吃列表</h1>
		<hr />
		總筆數: ${rs.rowCount }<br />
		頁數: ${page } / ${pages } <br />
		<a href="?page=${prev }">上一頁</a> | <a href="?page=${next }">下一頁</a>
		<hr />
		<table border="1" width="100%">
			<tr>
				<th>#</th>
				<th>Name</th>
				<th>Tel.</th>
				<th>pic</th>
			</tr>
			<c:forEach items="${rs2.rows }" var="food" varStatus="status">
				<tr bgcolor='${status.index % 2 == 0 ? 'yellow' : 'pink' }'>
					<td>${food.id }</td>
					<td>${food.name }</td>
					<td>${food.tel }</td>
					<td><img src="${food.pic }" width="160px" height="90px" /></td>
				</tr>
			</c:forEach>
		</table>
		
		
		
	</body>
</html>