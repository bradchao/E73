<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="brad" %>
<%@ taglib uri="/WEB-INF/mytags.tld" prefix="abc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<h1>Brad Big Company</h1>
	<hr />
	<brad:test1 /> | <brad:test2 />
	<hr />
	<brad:sayHello user="Brad"></brad:sayHello>
	<hr />
	<brad:calc x="100" y="33">
		10 + 3 = ${plus }<br />
		10 - 3 = ${minu }<br />
		10 x 3 = ${multi }<br />
		10 / 3 = ${divide }<br />
	</brad:calc>
	<hr />
	<table border="1" width="100%">
		<tr>
			<th>Name</th>
			<th>Price</th>
		</tr>
		<brad:test3 name="Java" price="1000" />
		<brad:test3 name="MySQL" price="2000" />
		<brad:test3 name="C#" price="5000" />
	</table>
	<hr />
	Lottery: <abc:Lottery/>
	</body>
</html>