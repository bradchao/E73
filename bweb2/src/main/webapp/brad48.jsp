<%@page import="java.sql.Statement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<c:import var="data" url=
		"https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx"></c:import>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<c:catch var="err">
	<%
		String json = (String)pageContext.getAttribute("data");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Properties prop = new Properties();
		prop.put("user", "root");
		prop.put("password", "root");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/brad", prop);
		
		// 1. delete all
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM gift");
		
		// 2. index => zero
		stmt.executeUpdate("ALTER TABLE gift AUTO_INCREMENT = 1");
		
		
		String sql = "INSERT INTO gift (name,tel,city,town) VALUES (?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		JSONArray root = new JSONArray(json);
		//for (int i = 0 ; i < root.length(); i++){
		//	JSONObject data = root.getJSONObject(i);
		//}
		
		for (Object row : root){
			JSONObject data = (JSONObject)row;
			//out.print(data.getString("Name") + "<br />");
			
			pstmt.setString(1, data.getString("Name"));
			pstmt.setString(2, data.getString("ContactTel"));
			pstmt.setString(3, data.getString("County"));
			pstmt.setString(4, data.getString("Township"));
			
			pstmt.executeUpdate();
		}
		
		out.print("Finish");
		
	%>
	</c:catch>
	${err }
	
	</body>
</html>