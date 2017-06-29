<%@page import="com.daofactory.DaoFactory"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/Myjs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<script type="text/javascript">
	function addaccount() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/account_add.jsp";
	}
</script>
<style type="text/css">
#search_he {
	border: 0px solid red;
	position: absolute;
	width: 150;
	top: 66px; 
	left: 108px;
	background-color: white;
}
</style>


<script type="text/javascript">
	$(function() {
		$("Form1_userName").click(function() {
			alert("wswsws");
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
				type : "post", //请求方式
				url : "table_info.jsp", //请求地址
				dataType : "text", //返回值类型
				//async:false,
				/* data:{name:'zhangsan',pass:'123456'}, */
				success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
					$("#info").html(data);
				}

			})
		})
	})
</script>

</HEAD>
<body>
	<br>
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>登 录 信 息 查 询</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addaccount()">&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								</td> 
							</tr>
						</table>
					</td>

				</tr>
			

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="20%">账号</td>
								<td align="center" width="20%">密码</td>
								<td align="center" width="20%">员工编号</td>
								<td align="center" width="20%">员工名称</td>
								<td align="center" width="20%">状态</td>
								<td align="center" width="20%">编辑</td>
							</tr>
								<c:forEach items="${list}" var="row">
									<tr style="FONT-WEIGHT: bold; HEIGHT:33px;FONT-WEIGHT: bold;FONT-SIZE: 12pt; HEIGHT: 25px;">
										<td align="center" width="20%">${row.account_number }</td>
										<td align="center" width="20%">${row.account_psw}</td>
										<td align="center" width="20%">${row.account_fk_emp_id}</td>
										<td align="center" width="20%">${row.emp_name}</td>
										<td align="center" width="20%">${row.account_status}</td>
										
										<td align="center" width="20%">
											<a href="${pageContext.request.contextPath}/account_edit.action?account_number=${row.account_number}&account_psw=${row.account_psw}&account_fk_emp_id=${row.account_fk_emp_id}"> 
											<img
											src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											width="16" height="16" border="0" style="CURSOR: hand" type="submit">
									</a>
										
										</td>
									</tr>
								</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	<button onclick="cusshang()">上一页</button>
	<button onclick="cusxia()">下一页</button><span id="cusgong">第1页</span><span id="cusgong">共1页</span>
</body>
</HTML>

