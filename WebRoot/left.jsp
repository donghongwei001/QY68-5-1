<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		body{
			background:url("uploadFile/35.jpg");
			background-attachment:fixed;
			font-size:25px;
		}#zhuohao{
			font-size:23px;
		}.btn-info{
			width:60%;
			background:url("images/anniubeijing.jpg");
		}
	</style>
  </head>

  <body>
	<br/>

	<ul class="nav nav-pills nav-stacked">
	<c:forEach items="${list}" var="a">
		<li role="presentation" ><a href="/Ordersystem/findfood.action?id=${a.dishes_id}" target="main"><button class="btn btn-info btn-lg" > <B>${a.dishes_name}</B></button></a></li>
	</c:forEach>
		
		
	</ul>
		
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-2.1.3.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>