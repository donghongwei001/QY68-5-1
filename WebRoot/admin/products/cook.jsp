<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript" src ="${pageContext.request.contextPath }/admin/js/Myjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/cook_add.jsp";
	}
</script> 
<style type="text/css">
	#search_he{
		border:0px solid red;
		position:absolute;
		width:150;
		top:66px;
		left:108px;
		background-color:white;
	}
</style>
</HEAD>
<script type="text/javascript">
</script>

<body>
	<div id="search_he"></div>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/cook_findCook.action"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0"> 
			<TBODY>
				<%-- <tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" ><strong>查
							询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									菜品编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="dishes_id" size="15" value="" id="dishes_id" class="bg" value="${dishes_id }" />
								</td>
								
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									菜品名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="dishes_name" size="15" id="dishes_name" class="bg" value="${dishes_name }"/>
								</td>
								
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								
							</tr>
						</table>
					</td>
				</tr> --%>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>菜系列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addProduct()">&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<th align="center" width="25%">编号</th>
								<th align="center" width="25%">菜系名称</th>
								<th width="25%" align="center">编辑</th>
								<th width="25%" align="center">删除</th>
							</tr>
							<tbody id = "tbody">
							<c:forEach items="${cookInfo }" var="ci">
							<tr	style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="25%">${ci.dishes_id }</td>
								<td align="center" width="25%">${ci.dishes_name }</td>
								<td align="center" style="HEIGHT: 22px" width="25%"><a
										href="${pageContext.request.contextPath}/cook_editcook.action?cookid=${ci.dishes_id}">
											<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>
								<td align="center" style="HEIGHT: 22px" width="25%">
										<a href="${pageContext.request.contextPath}/cook_delcook.action?cookid=${ci.dishes_id}">
										<img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand" >
									</a></td>
							</tr>
							</c:forEach>
						</tbody>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
  </body>
</html>
