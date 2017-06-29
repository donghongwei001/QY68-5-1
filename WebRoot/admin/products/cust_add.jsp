<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">


</HEAD>

<body>
<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
	style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid;WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
	<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
		<td width="10%">订单编号</td>
		<td width="15%">订单时间</td>
		<td width="10%">顾客编号</td>
		<td width="10%">消费金额</td>
		<td width="10%">服务员编号</td>
		<td width="20%">评分</td>
		<td width="25%">评价</td>
	</tr>
<c:forEach items="${list}" var="row">
	<tr>
		<td>${row.order_id}</td>
		<td>${row.order_time}</td>
		<td>${row.order_fk_cusid}</td>
		<td>${row.order_money}</td>
		<td>${row.order_fk_empid}</td>
		<td>${row.order_dt_score}</td>
		<td>${row.oeder_dt_mark}</td>
	</tr>
</c:forEach>
</table>
</body>
</HTML>