<%
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String z = request.getParameter("z");
	
	int lottery1 = (Integer)request.getAttribute("lottery1");
	int lottery2 = (Integer)request.getAttribute("lottery2");
%>
Lottery: <%= lottery1 %><br />
Lottery: <%= lottery2 %><br />
Lottery: <%= z %><br />