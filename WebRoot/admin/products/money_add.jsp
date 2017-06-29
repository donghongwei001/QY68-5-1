<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">


</HEAD>

<body>
	<table class="table table-hover">
  		<c:forEach items="${list}" var="a"> 
  			<tr>
  				<td>${a.role_id}</td>
  				<td>${a.role_name}</td>
  				<td>${a.code_name}</td>
  			</tr>
  		</c:forEach>
	</table>
	
</body>
</HTML>