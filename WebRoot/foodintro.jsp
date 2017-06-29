<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
  	body{
  		background:url("uploadFile/87u58PICE5W.jpg") no-repeat;
  		background-size:100%;
  	}
  	.name{
  		font-size:30px;
  		margin-left:330px;
  		margin-top:-100px;
  	}
  	#jian{
  		float:left;
  		margin-left:200px;
  		margin-top:700px;
  	}
  	#shu{float:left;
  		margin-top:710px;
  		margin-left:50px;
  	}
  	#jia{
  		margin-left:50px;
  		float:left;
  		margin-top:700px;
  	}
  	.btn-success{
  		margin-left:500px;
  		margin-top:-50px;
  	}.btn-warning{
  		margin-left:-800px;
  		margin-top:780px;
  	}#jiage{
  		font-size:25px;
  		margin-left:100px;
  		margin-top:-40px;
  	}
  	.aaa{
  		margin-top:-40px;	
  		margin-left:530px;
  		font-size:30px;
  		color:red;
  	}
  	
  </style>

  </head>
  
  <body>
  
   <c:forEach items="${foodintro}" var="b">
    	<form action="wei_addshopcars.action?id=${b.food_id}&price=${b.food_price}" method="post">
		<div
			style="float:left;margin-left:27%;margin-top:10%;width:700px;height:600px;background:url('uploadFile/${b.food_pic}') no-repeat;background-size:100%">
			<div id="name" class="name">${b.food_name}</div>
			<div class="aaa">Price:¥<div id="jiage">${b.food_price}</div></div>
			
			<button type="button"id="jian" onclick="jianshao()"class="btn btn-danger btn-lg">-</button>
			<div id="shu"><span class="shuliang"id="shuliang" >1</span></div>
			<input type="hidden" name="count" id="num">
			<button type="button" id="jia" onclick="tianjia()"
				class="btn btn-danger btn-lg">+</button>
			<button type="submit" class="btn btn-success btn-lg">确定</button>
			
		</div>
		</form>
    </c:forEach>
    <a href="mainfood.jsp"><button class="btn btn-warning btn-lg">返回</button></a>
  </body>
  <script src="js/jquery-2.1.3.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  var num=1;
  	function jianshao(){
  		var index=document.getElementById("shuliang").innerText;
  		if (index>1) {
			index--;
		}
		
  		document.getElementById("shuliang").innerText=index;
  		$("#num").val(index);
  		
  	}
  	function tianjia(){
  		var index=document.getElementById("shuliang").innerText;
  		index++;
  		document.getElementById("shuliang").innerText=index;
  		$("#num").val(index);
  	}
  	window.onload=function(){
     	var index=document.getElementById("shuliang").innerText;
     	$("#num").val(index);
	}
  	/* function tijiao(){
  		var index=document.getElementById("shuliang").innerText;
  		var name=document.getElementById("name").innerHTML;
  		var price=document.getElementById("jiage").innerHTML;
  		
  		if (index>0) {
			$.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/addshopcars.action", //请求地址
					data:{name:$("#name").text(),index:$("#shuliang").text(),price:$("#jiage").text()},
					dataType : "text",
					//async : false,
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
						alert("1111")
					}
	
				})
		}
  	} */
  </script>
</html>
