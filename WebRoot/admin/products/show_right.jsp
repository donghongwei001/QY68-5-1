<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Starter Template for Bootstrap</title>
<style type="text/css">
.table-hover {
	margin-top: 200px;
	width: 1000px;
}

.table-hover td {
	text-align: center;
	border: 1px solid gray;
}
</style>

<link href="../css/bootstrap.min.css" rel="stylesheet">


</head>

<body>
	<table class="table table-hover">
		<tr>
			<td style="font-size:30px;color:brown;">角色</td>
			<td style="font-size:30px;color:brown;">权限</td>
		</tr>
		<c:forEach items="${list}" var="a">
			<tr>
				<td id="id">${a}</td>
				<td><button type="button" onclick="xiugaiquanxian('${a}')"
						class="btn btn-primary" data-toggle="modal"
						data-target=".bs-example-modal-sm">修改权限</button>
				</td>
			</tr>

		</c:forEach>

	</table>
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<form action="/Ordersystem/cust_xiugaiquanxian.action" method="post">
					<span style="margin-left:120px;font-size:20px;color:gray">权限修改</span>
					<br> <br> <br> <input type="checkbox" value="1"
						name="box">员工管理 <input style="margin-left:120px;"
						type="checkbox" name="box" value="2">订单管理<br> <input
						type="checkbox" name="box" value="3">财务管理 <input
						style="margin-left:120px;" type="checkbox" name="box" value="4">前台管理<br>
					<input type="checkbox" name="box" value="5">角色权限 <input
						style="margin-left:120px;" type="checkbox" name="box" value="6">综合排序<br>
					<input type="checkbox" name="box" value="7">先后排序 <input
						style="margin-left:120px;" type="checkbox" name="box" value="8">按桌排序<br>
					<input type="checkbox" name="box" value="9">菜品管理 <input
						style="margin-left:120px;" type="checkbox" name="box" value="10">餐桌管理<br>
					<input type="checkbox" name="box" value="11">顾客管理 
					<input style="margin-left:120px;" type="checkbox" name="box" value="12">角色管理<br>
					
					<input type="checkbox" name="box" value="30">员工查询
					<input style="margin-left:120px;" type="checkbox" name="box" value="13">员工添加<br>
					<input type="checkbox" name="box" value="14">员工删除 
					<input style="margin-left:120px;" type="checkbox" name="box" value="15">员工修改<br>
					<input type="checkbox" name="box" value="16">修改权限
					<input style="margin-left:120px;" type="checkbox" name="box" value="17">增加角色<br>
					<input type="checkbox" name="box" value="18">修改角色
					<input style="margin-left:120px;" type="checkbox" name="box" value="19">菜品查询<br>
					<input type="checkbox" name="box" value="20">菜品修改
					<input style="margin-left:120px;" type="checkbox" name="box" value="21">菜品增加<br>
					<input type="checkbox" name="box" value="22">菜品删除
					<input style="margin-left:120px;" type="checkbox" name="box" value="23">菜系查询<br>
					<input type="checkbox" name="box" value="24">菜系增加
					<input style="margin-left:120px;" type="checkbox" name="box" value="25">菜系删除<br>
					<input type="checkbox" name="box" value="26">餐桌查询
					<input style="margin-left:120px;" type="checkbox" name="box" value="27">餐桌添加<br>
					<input type="checkbox" name="box" value="28">餐桌修改
					<input style="margin-left:120px;" type="checkbox" name="box" value="29">餐桌删除<br>
					<input type="checkbox" name="box" value="31">菜系修改
					<input style="margin-left:120px;" type="checkbox" name="box" value="32">帐号管理<br>
					<input type="checkbox" name="box" value="33">帐号修改
					<input style="margin-left:120px;" type="checkbox" name="box" value="34">帐号添加<br>
					

					<br>
					<br>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" style="margin-left:150px;"
						class="btn btn-success">确定添加</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="../js/jquery-2.1.3.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	function xiugaiquanxian(index) {
		var box = document.getElementsByName("box");
		//alert(box.length);
		$.ajax({
			type : "post",
			url : "/Ordersystem/cust_xiugaijuese.action",
			data : {
				quanxianname : index
			},
			dataType : "text",
			success : function(data) {
				var arr = data.split(",");

				//alert("555");
				for ( var i = 0; i < box.length; i++) {
					box[i].checked = false;
					if (arr.indexOf(box[i].value) >= 0) {
						box[i].checked = true;
					}
				}
			}

		})

	}
</script>




</html>