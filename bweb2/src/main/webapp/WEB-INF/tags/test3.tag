<%@tag import="java.util.HashMap"%>
<%@tag dynamic-attributes="product" %>
<%
	HashMap<String,String> detail =
		(HashMap<String,String>)jspContext.getAttribute("product");
	out.print("<tr>");
	out.print("<td>" + detail.get("name") + "</td>");
	out.print("<td>" + detail.get("price") + "</td>");
	out.print("</tr>");
%>