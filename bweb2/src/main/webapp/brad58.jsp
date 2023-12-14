<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.storeconfig.RealmSF"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@page import="tw.brad.utils.*"%>

<%
	int p = Integer.parseInt(request.getParameter("page"));
	JSONObject root = new JSONObject();
	if (p <= 0){
		root.put("error", 1);
		root.put("page", p);
		out.print(root.toString());
		return;
	}else if (p > 10){
		root.put("error", 2);
		root.put("page", p);
		out.print(root.toString());
		return;
	}


	int rpp = 10;
	int start = (p -1) * rpp;

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/brad","root","root");
	String sql = "SELECT * FROM food LIMIT ?, ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, start);
	pstmt.setInt(2, rpp);
	ResultSet rs = pstmt.executeQuery();

	// 2. output json

	
	root.put("error", 0);
	root.put("page", p);
	
	JSONArray ary = new JSONArray();
	
	while (rs.next()){
		JSONObject data = new JSONObject();
		data.put("name", rs.getString("name"));
		data.put("tel", rs.getString("tel"));
		data.put("addr", rs.getString("addr"));
		ary.put(data);
	}
	
	root.put("data", ary);
	out.print(root.toString());	
%>
