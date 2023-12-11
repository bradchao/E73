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
			<input name='x' value=""/>
			<select name="op">
				<option value="0" >+</option>
				<option value="1" >-</option>
				<option value="2" >x</option>
				<option value="3" >/</option>				
			</select>
			<input name='y' value=""/>
			<input type='submit' value='=' />
			<span></span>
		</form>
	</body>
</html>