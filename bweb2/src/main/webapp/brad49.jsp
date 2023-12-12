<%@page import="tw.brad.utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
	
<c:catch var="err">
<c:import var="data" url=
	"https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx"></c:import>	
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/brad"
	user="root"
	password="root"
	/> 
<sql:update>DELETE FROM gift</sql:update>
<sql:update>ALTER TABLE gift AUTO_INCREMENT = 1</sql:update>

<c:set var="gifts" value="${BradUtils.parseGift(data) }" />
<c:forEach items="${gifts }" var="gift">
	<sql:update>
		INSERT INTO gift (name,tel,city,town) VALUES (?,?,?,?)
		<sql:param>${gift.name }</sql:param>
		<sql:param>${gift.tel }</sql:param>
		<sql:param>${gift.city }</sql:param>
		<sql:param>${gift.town }</sql:param>
	</sql:update>		
</c:forEach>

<%
	/*
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
	*/
%>
</c:catch>
${err }
