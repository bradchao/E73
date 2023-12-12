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
</c:catch>
${err }
