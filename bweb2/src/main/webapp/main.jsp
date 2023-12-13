<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html>
<html>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/brad"
		user="root"
		password="root"
		/> 
	<c:if test="${!empty param.delid }">
		<sql:update>
			DELETE FROM member WHERE id = ?
			<sql:param>${param.delid }</sql:param>
		</sql:update>
	</c:if>	
	
	<sql:query var="rs">
		SELECT * FROM member
	</sql:query>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<h1>Brad Big Company</h1>
	<hr />
	<a href="addnew.jsp">AddNew</a>
	<table border="1" width="100%">
		<tr>
			<th>id</th>
			<th>Account</th>
			<th>Name</th>
			<th>Del</th>
			<th>Edit</th>
		</tr>
		<script>
			function delAlert(cname){
				var isDel = confirm("Delete #" + cname + "# ?");
				return isDel;
			}
		</script>
		<c:forEach items="${rs.rows }" var="member">
			<tr>
				<td>${member.id }</td>
				<td>${member.account }</td>
				<td>${member.cname }</td>
				<td><a href="?delid=${member.id }" onclick="return delAlert('${member.cname }');">Del</a></td>
				<td><a href="edit.jsp?editid=${member.id }">Edit</a></td>
			</tr>
		
		</c:forEach>
	</table>
	</body>
</html>