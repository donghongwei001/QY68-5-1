<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title></title>
<style type="text/css">
body {
	background-size: 100%;
}

.jumbotron {
	width: 100%;
	background: url("images/mainback.jpg") repeat;
}

#zhuti {
	font-size: 50px;
}

jumbotron {
	text-align: center;
	background: url("images/02116ef10f258df7ed14b0b3f37e38a1.jpg") no-repeat;
	width: 30%;
}

.btn btn-primary btn-lg {
	margin-top: 500px;
}

.btn-group-vertical {
	margin-left: 90%;
	margin-top: 1%;
}

.btn-primary {
	margin-left: 90%;
	margin-top: 2%;
}

.btn-warning {
	margin-left: 90%;
	margin-top: 2%;
}

.btn-success {
	margin-left: 90%;
	margin-top: 2%;
}

#carousel-example-generic {
	margin-left: 10%;
	width: 80%;
	height: 80%;
	margin-top: -18%;
}

carousel-inner {
	margin-left: 80%;
}

.item active {
	margin-left: 20%;
}

.active {
	margin-left: 20%;
}

#anniu {
	background: url("images/anniubeijing.jpg");
}

.modal fade {
	background: url("images/main2.jpg");
}
#tishi{
	display:none;
	position:absolute;
}
</style>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="jquery.idcode.css" type="text/css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="jumbotron">
		<h1>欢迎你的到来!</h1>
		<p>非常高兴为您服务，您的满意是对我们最大的鼓励！</p>
	</div>

	<button type="button" id="anniu" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">欢迎登陆</button>

	<button type="button" id="anniu" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal2">欢迎注册</button>

	<a href="项目前台2.html" />
	<button type="button" id="anniu" class="btn btn-success  btn btn-lg">本店介绍</button>
	</a>&nbsp;
	<a href="index.jsp" />
	<button type="button" id="anniu" class="btn btn-warning  btn btn-lg">欢迎点菜</button>
	</a>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">登录信息</h4>
				</div>
				<div class="modal-body">
					<!--表单验证-->
					<form action="hong_save.action" method="post">
						<div class="form-group" style="margin-left:0px">
							<label for="exampleInputEmail1">请输入用户名</label> <input type="text" id="username"
								name="username" class="form-control" placeholder="Username"
								aria-describedby="basic-addon1"style="width:60% ">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">请输入您的密码</label> <input
								type="password" name="password" onblur="dengluyanzheng()" class="form-control" id="password"
								placeholder="Password" aria-describedby="basic-addon1"style="width:60%">
						</div>
						
						<div>
							<input type="text" id="Txtidcode" class="txtVerification">
							&nbsp;&nbsp;&nbsp;&nbsp;<span id="idcode"></span> <input
								type="button" id="butn" value="提交">


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-default">登陆</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal2-title" id="myModal2Label">个人登录</h4>
				</div>
				<div class="modal2-body">
					<!--表单验证-->
					<form action="dong_save.action" method="post">
						<div class="form-group">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
								for="exampleInputEmail1">请输入用户名</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
								class="form-control" placeholder="Username"onblur="shijiao()"id="zhuce" name="u.user"
								aria-describedby="basic-addon1" style="width:60%">
								
						</div>
						<div id="tishi">用户名已存在</div>
						<div class="form-group">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
								for="exampleInputPassword1">&nbsp;&nbsp;&nbsp;请输入您的密码</label> <input
								type="password" class="form-control" name="u.pass"
								placeholder="Password" id="mima" aria-describedby="basic-addon1"style="width:60%">
						</div>
						<div>
							<input type="text" id="Txtidcode" class="txtVerification">
							&nbsp;&nbsp;&nbsp;&nbsp;<span id="idcode"></span> <input
								type="button" id="butn" value="提交">


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-default">注册和登录</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/main3.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="images/main3.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="images/main3.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			...
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span> </a> <a class="right carousel-control"
			href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span> </a>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.idcode.js"></script>
	<script>
		$.idcode.setCode(); //加载生成验证码方法
		$("#butn").click(function() {
			var IsBy = $.idcode.validateCode() //调用返回值，返回值结果为true或者false
			if (IsBy) {

			} else {
				alert("请重新输入")
			}
		})
		function shijiao(){
			
				$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/zhuce.action", //请求地址
					data:{value:$("#zhuce").val()},
					dataType : "text",
					//async : false,
					
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
						if(data=="ture"){
						$("#zhuce").val("");
						$("#mima").val("");
							alert("用户名已存在");
							
						}
					}
	
				})
			
		}
		function dengluyanzheng(){
			
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/dengluyan.action", //请求地址
					data:{nameha:$("#username").val(),passha:$("#password").val()},
					dataType : "json",
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType制定
							//alert(data);
							if (data==0) {
								$("#username").val("");
								$("#password").val("");
								alert("用户名或密码错误，请从新输入");
							}
							
					}
	
				})
				
				
		}
	</script>


</body>
</html>
