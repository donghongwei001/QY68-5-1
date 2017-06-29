<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


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

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	  
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		body{
			background:url("../images/123456.jpg") ;
		}.input-group{
			margin-left:1400px;
			width:400px;
			margin-top:20px;
		}.input-group2{
			width:400px;
			margin-left:1400px;
			margin-top:10px;
		}#mima{
			margin-top:20px;
		}#idcode{
			font-size:25px;
		}#erweima{
			margin-left:1400px;
			margin-top:15px;
			width:500px;
			height:50px;
		}#erweima1{
			background-color:#330000;
			color:white;
			height:30px;
			width:150px;
			font-size:20px;
		}h1{
			margin-left:1400px;
			margin-top:400px;
			color:#330000;
		}
	</style>
  </head>

  <body>
	<h1>欢迎登陆后台系统</h1>
	<form action="../../wei_save.action" method="post">
	<div class="input-group">
	  <span class="input-group-addon" id="basic-addon1">请输入用户名</span>
	  <input type="text" name="username"id="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
	</div>
	<div class="input-group" id="mima">
	  <span class="input-group-addon" id="basic-addon1">请&nbsp;输&nbsp;入&nbsp;密&nbsp;码</span>
	  <input type="password" name="password"id="password" onblur="houtaidenglu()" class="form-control" placeholder="Password" aria-describedby="basic-addon1">
	</div>
	<div id="erweima">
		<div id="erweima1">请输入验证码</div><input type="text" id ="Txtidcode" class ="txtVerification"><span id="idcode"></span>
		<input type="submit" id="butn" value="提交">
	</div>
	</form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.idcode.js"></script>
	<script>
		$.idcode.setCode();   //加载生成验证码方法
		 $("#butn").click(function(){
			var IsBy = $.idcode.validateCode()  //调用返回值，返回值结果为true或者false
			if(IsBy){
            
			}else {
            alert("请重新输入")
			}
		 })
		 function houtaidenglu(){
		 	$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
				type : "post", //请求方式
				url : "/Ordersystem/wei_houtaidenglu.action", //请求地址
				dataType : "text",
				data : {
					user : $("#username").val(),
					pass : $("#password").val()
				},
				//async : false,

				success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
					if (data==0) {
						alert("用户名或密码错误,请从新输入");
						$("#username").val("");
						$("#password").val("");
					} 
				}

			})
		 }
	</script>
  </body>
</html>