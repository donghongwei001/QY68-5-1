<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <link href = "../css/bootstrap.min.css" rel = "stylesheet">
  <script src="../js/jquery-2.1.3.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
  <style>
  *{margin:0px;
	 padding:0px;}
	.very-rowe{
		overflow:auto;
		height:auto;
		border:1px solid blue;
	}
	.mytable{
		float:left;
		border:0px red solid;
		margin-left:15px;
	}
	p{
		align:center;
	}
  </style>
 </HEAD>

 <BODY>
 
 <div class="very-row" style="font-size:12px;" align="center">
 <c:forEach items="${tbList }" var="tb">
 	<c:if test="${tb.table_state==8}" var="result">
	<div class="mytable"><a href="serv_orderDetails.action?table_id=${tb.table_id }" target="main"><img src="../images/000002.png"   width="125px" height="85px"></img></a><BR><p align="center">
	<input type="checkbox" name="table_id" value="${tb.table_id }">&nbsp;&nbsp;${tb.table_id }</p><p>服务员:${tb.emp_name}</p></div>
 	</c:if>
 	<c:if test="${tb.table_state==9}" var="result">
	<div class="mytable"><a href="serv_orderDetails.action?table_id=${tb.table_id }" target="main"><img src="../images/000001.png"   width="125px" height="85px"></img></a><BR><p align="center">
	<input type="checkbox" name="table_id" value="${tb.table_id }">&nbsp;&nbsp;${tb.table_id }</p><p>服务员:${tb.emp_name}</p></div>
 	</c:if>
 	<c:if test="${tb.table_state==10}" var="result">
	<div class="mytable"><a href="serv_orderDetails.action?table_id=${tb.table_id }" target="main"><img src="../images/000003.png"   width="125px" height="85px"></img></a><BR><p align="center">
	<input type="checkbox" name="table_id" value="${tb.table_id }">&nbsp;&nbsp;${tb.table_id }</p><p>服务员:${tb.emp_name }</p></div>
 	</c:if>
 	<c:if test="${tb.table_state==13}" var="result">
	<div class="mytable"><a href="serv_orderDetails.action?table_id=${tb.table_id }" target="main"><img src="../images/000004.png"   width="125px" height="85px"></img></a><BR><p align="center">
	<input type="checkbox" name="table_id" value="${tb.table_id }">&nbsp;&nbsp;${tb.table_id }</p><p>服务员:${tb.emp_name }</p></div>
 	</c:if>
</c:forEach>
 </div>
   
  <!-- <div class="container">
	<button class="btn btn-primary">添加餐桌</button>
 <input type="hidden" id="txt1" value="555444">-->
 </BODY>
</HTML>