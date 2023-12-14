<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. input p
	int p = Integer.parseInt(request.getParameter("page"));

	// 2. output json
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
	
	root.put("error", 0);
	root.put("page", p);
	
	JSONArray ary = new JSONArray();
	for (int i = 0; i<10; i++){
		JSONObject data = new JSONObject();
		data.put("name", String.format("Brad_%d_%d", p, (int)(Math.random()*100)));
		data.put("age", String.format("age_%d_%d", p, (int)(Math.random()*100)));
		data.put("tel", String.format("tel_%d_%d", p, (int)(Math.random()*100)));
		ary.put(data);
	}
	
	root.put("data", ary);
	out.print(root.toString());
%>