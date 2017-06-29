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

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
body {
	background: white;
	background-size: 100%;
	background: url("uploadFile/timg.jpg");
	background-attachment: fixed;
}

#waibian {
	width: 12%;
	height: 150px;
	background: url("webimages/13152800091302.jpg");
	background-size: 100%;
	margin-top: 5%;
	margin-bottom: 3%;
	margin-left: 10%;
	float: left;
}

.left {
	margin-left: 5%;
	margin-top: 1%;
	border-radius: 5px;
}

.right {
	margin-left: 2%;
	margin-top: -1%;
	border-radius: 5px;
}

.shuliang {
	width: 20%;
	margin-top: 64%;
}

input {
	text-align: center;
}

.btn-success {
	display: none;
}

span {
	display: inline-block;
	background: white;
	text-align: center;
	border-radius: 5px;
}

.btn-danger {
	margin-left: 5%;
	margin-top: 1%;
	border-radius: 5px;
}

.name {
	font-weight: bold;
	margin-top: 0%;
	margin-left: 30%;
	font-size: 18px;
}

#wodiandecai {
	margin-rifht: 200px;;
	position: absolute;
}

.navbar-default {
	margin-left: 1200px;
	margin-top: 80px;
}

.modal3-body {
	height: 500px;
	overflow: scroll;
}

.modal-footer {
	
}

.navbar-default {
	width: 0;
}

#myModal3 {
	margin-top: 100px;
	margin-left: -300px;
}

.nav-tabs li {
	width: 20%;
}

.navbar-default {
	margin-bottom: 100px;
}

.div1 {
	margin-top: 500px;
}

.navbar-default1 {
	margin-left: -200px;

}
.navbar-default{
	width:0px;
}
</style>
</head>

<body>


	<!-- <div id="waibian">
		<button type="button" id="left" class="btn btn-danger btn-sm">-</button>
		<span id="shuliang">0</span>
		<button type="button" id="right" class="btn btn-danger btn-sm">+</button>
		<button type="button" id=""class="btn btn-success btn-sm">确定</button>
		</div> -->
	<input type="hidden" id="count" value="${list2}">
	<c:forEach items="${list1}" var="b">
		<div id="${b.food_id}" class="div1"
			style="float:left;margin-left:8%;margin-top:5%;width:250px;height:200px;background:url('uploadFile/${b.food_pic}') no-repeat;background-size:100%">
			<span class="name" id="${b.food_id}">${b.food_name}</span>
			<%-- <button type="button"  id="${b.food_id}" class="btn btn-danger btn-sm">-</button>
			<span class="shuliang"  id="${b.food_id}">0</span>
			<button type="button"  id="${b.food_id}" onclick="tianjia(this)"
				class="btn btn-danger btn-sm">+</button>
			<button type="button"  id="${b.food_id}" class="btn btn-success btn-sm">确定</button> --%>
			<a href="/Ordersystem/foodintro.action?id=${b.food_id}"><button
					type="button" onclick="xiangqing">
					<span><FONT SIZE="2" COLOR="red"><B>菜品介绍</B> </FONT>
				</button>
				</span> </a>
		</div>
	</c:forEach>
	<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<button type="button" id="wodiandecai" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#myModal3">我的购物车 ￥${he}</button>
	</div>
	</nav>

	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal3-title" id="myModal3Label">下单中...</h4>
				</div>
				<div class="modal3-body">
					<div>

						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">未下单</a></li>
							<li role="presentation"><a href="#profile"
								aria-controls="profile" role="tab" data-toggle="tab">已下单</a></li>

						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<table class="table table-hover">
									<tr>
										<td width="250">名称</td>
										<td width="250">数量</td>
										<td width="250">单价</td>
									</tr>
									<c:forEach items="${cart}" var="a">
										<tr>

											<td id="aaa" width="250">${a.name}</td>
											<td width="250">${a.count}</td>
											<td width="250">${a.price}</td>
											<td width="250"><a href="/Ordersystem/shanchucai.action?caiid=${a.id}"><button type="button"
													class="btn btn-danger">删除</button></a>
											</td>

										</tr>
									</c:forEach>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">
								<table class="table table-hover">
									<tr>
										<td width="250">名称</td>
										<td width="250">数量</td>
										<td width="250">单价</td>
									</tr>
									<c:forEach items="${cart1}" var="a">
										<tr>
											<td width="250">${a.food_name}</td>
											<td width="250">${a.order_food_num}</td>
											<td width="250">${a.food_price}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<nav class="navbar navbar-default1 navbar-fixed-bottom">
						<div class="container">


							<div class="modal-footer">
								<FONT SIZE="5" COLOR="red"><B>总金额:${he}元</B> </FONT>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" onclick="xiadan()" class="btn btn-default">确认下单</button>
							</div>
						</div>
						</nav>


					</div>
				</div>
			</div>
		</div>


		<!-- Bootstrap core JavaScript
	<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery-2.1.3.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function xiadan() {
				var aaa = document.getElementById("aaa").innerHTML;
				if (aaa != "") {
					$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
						type : "post", //请求方式
						url : "/Ordersystem/xiadan.action", //请求地址
						data : {},
						dataType : "text",
						//async : false,

						success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
							if (data != "true") {
								alert("下单成功");

								document.getElementById("home").innerHTML = "";
								
								  parent.location.reload();   

							} else {
								$("#myModal3").modal("hide");
								alert("请开台");
							}
						}

					})
				} else {
					alert("请开台");
				}

			}
		</script>
</body>
</html>