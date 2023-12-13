<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
    if (request.getMethod().equals("POST")){
    	String max = request.getParameter("max");
    	int intMax = max == null || max.equals("") ? 49 : Integer.parseInt(max);
		out.print((int)(Math.random()*intMax+1));
    }
%>