<%@page import="tw.brad.utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Brad Big Company</h1>
		<hr />
		<form>
			<input name='x' value="${param.x }"/>
			<select name="op">
				<option value="0" ${param.op == "0"?"selected":"" }>加</option>
				<option value="1" ${param.op == "1"?"selected":"" }>減</option>
				<option value="2" ${param.op == "2"?"selected":"" }>乘</option>
				<option value="3" ${param.op == "3"?"selected":"" }>除</option>				
			</select>
			<input name='y' value="${param.y }"/>
			<input type='submit' value='=' />
			<span>${BradUtils.calc(param.x, param.y, param.op) }</span>
		</form>
	</body>
</html>