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
* {
	margin: 0px
}

body {
	margin: 0px;
	padding: 70px;
}

.kuangjia1 {
	margin-top: 0%;
	margin-left: -40;
}

.kuangjia2 {
	margin-left: 20%;
	margin-top: -48%;
}

#nav-tabs {
	font-size: 30px;
	width: 100%;
	margin-left: 20%;
}

#sousuo1 {
	margin-top: 7px;
	margin-left: 40px;
}

#sousuo2 {
	margin-top: 17px;
}

#pingfen {
	width: 40px;
	margin-left:00px;
	margin-top:00px;
}

#tijiao {
	margin-left: 95%;
	margin-top: 2%;
}

.form-group {
	margin-top: 15px;
}

.container {
	width: 100%;
	background: url("uploadFile/36.jpg") repeat-x;
}

.navbar-default {
	width: 100%;
	margin-bottom: 10px;
}

#shanchu {
	margin-left: 30%;
}

#jiezhang {
	margin-top: 28%;
	margin-left: 70%;
}

#hujiao {
	margin-left: 10%;
	margin-bottom: %;
}

.btn-info {
	background: url("images/anniubeijing3.jpg");
}

#zhuohao {
	margin-left: -15%;
	margin-top: 3%;
	background: url("images/anniubeijing4.jpg");
	padding: 5px;
	color: white;
	font-size: 20px;
}

#user {
	margin-left: -18%;
	color: brown;
}

#xiamiancaidan {
	height: 80px;
}

#zhuyemian {
	margin-top: 10px;
}

#kaitai {
	margin-top: 17px;
	margin-left: 60px;
}

#geren {
	margin-left: 40px;
}

#sousuo {
	margin-left: 60px;
}

#gerenxinxi {
	width: 500px;
	margin-left: 300px;
}
</style>
`

</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<ul id="nav-tabs" class="nav nav-tabs" role="tablist">
			<li id="user" role="presentation">欢迎您:${user}</li>
			<li id="zhuohao" role="presentation">您当前桌号为:<span id="dangqian">${zhuohao}</span>
			</li>
			<li role="presentation" class="active"><a id="active"
				href="#home" aria-controls="home" role="tab" data-toggle="tab"><button
						type="submit" id="sousuo1" class="btn btn-info btn-lg">
						<span class=" glyphicon glyphicon-apple"></span>菜单信息<span
							class="glyphicon glyphicon-apple"></span>
					</button> </a>
			</li>

			<li role="presentation" id="geren"><a href="#profile"
				aria-controls="profile" role="tab" data-toggle="tab"><button
						type="submit" id="sousuo1" class="btn btn-info btn-lg">
						<span class=" glyphicon glyphicon-apple"></span>个人信息<span
							class="glyphicon glyphicon-apple"></span>
					</button> </a>
			</li>

			<li role="presentation"><button type="button" id="kaitai"
					class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal">
					<span class=" glyphicon glyphicon-apple"></span>开台<span
						class=" glyphicon glyphicon-apple"></span>
				</button></li>

			<li id="sousuo">
				<form class="navbar-form navbar-left"
					action="/Ordersystem/sousuocai.action" method="post">
					<div class="form-group">
						<input type="text" name="foodname" class="form-control"
							placeholder="请输入美食名称">
					</div>
					<button type="submit" id="sousuo1" class="btn btn-default">搜索</button>
				</form></li>



			<li><button type="button" id="jiezhang"
					class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal2">结账</button>
			</li>

		</ul>
	</div>
	</nav>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">欢迎开台</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">开台密码</span> <input
							type="password" class="form-control" onblur="kaitai()"
							placeholder="Password" id="kaitaiyanzheng"
							aria-describedby="basic-addon1">
					</div>
					<br /> <br /> <br /> 选桌:<select id="category" name="zhuohao">


					</select>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" onclick="kaitaitijiao()"
							class="btn btn-default">确认开台</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal	"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal2-title" id="myModal2Label">确认结账</h4>
				</div>
				<div class="modal2-body">
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

					<div class="modal-footer">
						<FONT SIZE="5" COLOR="red"><B>总金额:${he}元</B> </FONT>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" onclick="jiezhang()" class="btn btn-default">确认结账</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="home">
			<nav id="xiamiancaidan"
				class="navbar navbar-default navbar-fixed-bottom">
			<div class="container">
				<button type="button" onclick="hujiao()" id="hujiao" class="btn btn-danger btn-lg">呼叫服务员</button>

				<!-- <button type="button" id="wodiandecai"
					class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal3">我的菜单</button> -->
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
							<h4 class="modal3-title" id="myModal3Label">输入结账密码</h4>
						</div>
						<div class="modal3-body">
							<form action="/Ordersystem/jiezhang.action">
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon1">结账密码</span> <input
										type="password" class="form-control" name="jiezhangmima"
										placeholder="Password" id="kaitaiyanzheng"
										aria-describedby="basic-addon1">
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-default">确认结账</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<iframe class="kuangjia1" src="/Ordersystem/caipindaohang.action"
				width="20%" height="820px" scrolling="auto"> </iframe>
			<iframe class="kuangjia2" src="mainfood.jsp" name="main" width="83%"
				height="835px" scrolling="auto"> </iframe>
		</div>

		<div role="tabpanel" class="tab-pane" id="profile">
			<br /> <br /> <br /> <br />
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> <FONT SIZE="5" COLOR="green"><B>您的个人信息</B>
							</FONT> </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<p class="text-success">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">您的帐号</span> <input
									type="text" class="form-control" placeholder="Username"
									aria-describedby="basic-addon1" style="width:200px;"
									value="${user}">
							</div>
							</p>

							<br />
							<p class="text-info">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">您的密码</span> <input
									type="text" class="form-control" style="width:200px;"
									value="${pass}" placeholder="Username"
									aria-describedby="basic-addon1">
							</div>
							</p>

							<br /> <br /> <br />
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target=".bs-example-modal-sm">修改信息</button>
							<br /> <br />
							<div id="gerenxinxi" class="modal fade bs-example-modal-sm"
								tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">

								<div class="modal-dialog modal-lg" role="document">

									<div class="modal-content">
										<p class="text-success">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1">您的帐号</span>
											<input type="text" class="form-control" placeholder="${user}"
												id="gerenname" aria-describedby="basic-addon1"
												style="width:200px;" value="">
										</div>
										</p>

										<p class="text-info">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1">您的密码</span>
											<input type="text" class="form-control" placeholder="${pass}"
												id="gerenpass" aria-describedby="basic-addon1"
												style="width:200px;" value="">
										</div>
										</p>
										<Br /> <Br /> <Br />
										<button type="button" class="btn btn-danger btn-xm"
											data-dismiss="modal">取消</button>
										<button type="button" id="xiugai" onclick="xiugaixinxi()"
											class="btn btn-warning  btn btn-xm">确认修改</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> <FONT
								SIZE="5" COLOR="green"><B>请写下你对我们不满意的地方，我们一定竭力做到让您满意</B>
							</FONT> </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							
							<p><FONT SIZE="15" COLOR=""><B>请为我们的服务打分</B> </FONT></p> <select
								id="pingfen">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
							</select> <BR /> <BR /> <BR /> <BR /> 
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-list-alt"></span></span> <input
									type="text" id="yijian" class="form-control" width="150px" placeholder="请写下你最宝贵的意见，我们会努力做到让您满意"
									aria-describedby="sizing-addon1">
							</div>
							<button type="button" id="tijiao" onclick="tijiaopingfen()" class="btn btn-info">提交</button>
							
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- <div role="tabpanel" class="tab-pane" id="messages">
			<img src="images/13152800091302.jpg" /> dsfdsfds
		</div>
		<div role="tabpanel" class="tab-pane" id="settings">
			<img
				src="images/855afb27317633aa17385d7948db026ef74f244a184f3-OEcmVE_fw658.jpg" />
		</div> -->
	</div>


	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-2.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$("#mainframe", parent.document.body).attr("src",
				"http://www.111cn.net");
		function kaitai() {
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
				type : "post", //请求方式
				url : "/Ordersystem/kaitaiyanzheng.action", //请求地址
				data : {
					kaitaimima : $("#kaitaiyanzheng").val()
				},
				dataType : "json",
				success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
					//alert(data);
					if (data == "0") {
						$("#kaitaiyanzheng").val("");
						alert("开台密码输入错误,请从新输入！");
					} else {
						$("#category").empty();
						$("#category").append(
								"<option  check='checked'>请选择桌号</option>");
						for ( var i = 0; i < data.length; i++) {
							var op = $("<option id='id'>" + data[i].table_id
									+ "</option>");
							$("#category").append(op);
						}
					}

				}

			})

		}
		function kaitaitijiao() {
			var index = document.getElementById("category").value;
			var mima = document.getElementById("kaitaiyanzheng").value;
			if (index > 0 && mima != "") {
				$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事

					type : "post", //请求方式
					url : "/Ordersystem/kaitai.action", //请求地址
					dataType : "text",
					data : {
						zhuohao : index
					},
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
						alert("开台成功")
						$("#myModal").modal("toggle");
						$("#kaitai").attr("disabled", true);
						setTimeout(function() {
							window.location.reload();//页面刷新
						}, 100);
					}

				})
			}
		}
		function jiezhang() {
			$("#myModal2").modal("hide")
			$("#myModal3").modal("toggle");
		}
		function xiugaixinxi() {
			var gerenname = document.getElementById("gerenname").value;
			var gerenpass = document.getElementById("gerenpass").value;
			alert(gerenname + gerenpass)
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事

				type : "post", //请求方式
				url : "/Ordersystem/xiugaixinxi.action", //请求地址
				dataType : "text",
				data : {
					gerenxinxiname : gerenname,
					gerenxinxipass : gerenpass
				},
				success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
					/* alert("开台成功")
					$("#myModal").modal("toggle");
					$("#kaitai").attr("disabled", true);
					setTimeout(function() {
						window.location.reload();//页面刷新
					}, 100); */
					if (data == "0") {
						alert("修改成功");
						$("#gerenxinxi").modal("toggle");
						setTimeout(function() {
							window.location.reload();//页面刷新
						}, 150);
					}
				}

			})
		}
		
		
		function tijiaopingfen(){
			var index = document.getElementById("pingfen").value;
			var value=document.getElementById("yijian").value;
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事

					type : "post", //请求方式
					url : "/Ordersystem/pingfen.action", //请求地址
					dataType : "text",
					data : {
						pingfen:index,
						yijian:value,
					
					},
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
						alert(data);
						if (data==1) {
							alert("插入成功")
						}
					}

				})
		}
		function hujiao(){
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事

					type : "post", //请求方式
					url : "/Ordersystem/hujiao.action", //请求地址
					dataType : "text",
					data : {
						
					},
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
						if (data==1) {
							alert("已经呼叫,请您稍等！");
						}
						
					}

				})
		}
	</script>
</body>






</html>