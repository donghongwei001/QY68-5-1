<%@page import="java.util.ArrayList"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/check.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.table-hover td {
	text-align: center;
	width: 500px;
	border: 1px solid gray;
}

.table-hover {
	margin-top: 30px;
}

.btn-primary {
	margin-left: 90%;
	margin-top: 100px;
}

.btn-success {
	margin-left: 100px;
}
</style>

</HEAD>
<script type="text/javascript" src="../js/jquery-2.1.3.js"
	charset="UTF-8"></script>

<body>

	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target=".bs-example-modal-sm">增加</button>

	<div class="modal fade bs-example-modal-sm" id="zengjia" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<form action="/Ordersystem/cust_addrole.action" mthod="post">
					<div class="input-group input-group-lg">
						<span class="input-group-addon" id="sizing-addon1">角色名称</span> <input
							type="text" id="rolename" onblur="jiaoseyanzheng()"
							name="rolename" class="form-control" placeholder="Rolename"
							aria-describedby="sizing-addon1">
					</div>
					<br> <input type="radio" name="zhuangtai" value="15">正常
					<input type="radio" name="zhuangtai" value="14">禁用 <br>
					<br>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success">确定添加</button>
				</form>
			</div>
		</div>
	</div>
	<table class="table table-hover">
		<tr>
			<td style="font-size:30px;color:brown;">id</td>
			<td style="font-size:30px;color:brown;">角色名称</td>
			<td style="font-size:30px;color:brown;">角色状态</td>
			<td style="font-size:30px;color:brown;">修改角色状态</td>
		</tr>
		<c:forEach items="${list}" var="a">
			<tr>
				<td id="id">${a.role_id}</td>
				<td>${a.role_name}</td>
				<td>${a.code_name}</td>
				<td><a href="/Ordersystem/cust_changerole.action?id=${a.role_id}"><button type="button" class="btn btn-info">修改</button></a></td>
			</tr>
		</c:forEach>
	</table>
	


</body>
<script src="../js/jquery-2.1.3.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	function jiaoseyanzheng(){
		var name=document.getElementById("rolename").value;
		$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/cust_checkrole.action", //请求地址
					data:{rolename:name},
					dataType : "text",					
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
						if (data!="0") {
							alert("角色名称已存在，添加失败");
							$("#zengjia").modal("toggle");
							
						}
						
					}
	
				})
			
	}
	function zhuangtai(){
		
		$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/cust_huitian.action", //请求地址
					data:{rolename:name},
					dataType : "text",					
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
						if (data!="0") {
							alert("角色名称已存在，添加失败");
							$("#zengjia").modal("toggle");
							
						}
						
					}
	
				})
	}
</script>
</HTML>