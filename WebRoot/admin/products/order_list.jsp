<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Bootstrap 101 Template</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.panel-group {
	max-height: 770px;
	overflow: auto;
}

.leftMenu {
	margin: 10px;
	margin-top: 5px;
}

.leftMenu .panel-heading {
	font-size: 14px;
	padding-left: 20px;
	height: 36px;
	line-height: 36px;
	color: white;
	position: relative;
	cursor: pointer;
} /*转成手形图标*/
.leftMenu .panel-heading span {
	position: absolute;
	right: 10px;
	top: 12px;
}

.leftMenu .menu-item-left {
	padding: 2px;
	background: transparent;
	border: 1px solid transparent;
	border-radius: 6px;
}

.leftMenu .menu-item-left:hover {
	background: #C4E3F3;
	border: 1px solid #1E90FF;
}

#n1 {
	width: 100%;
	height: 600px;
}

#guanli2 {
	display: none;
}

#guanliyuann {
	display: none;
}

.text-c th {
	width: 100px;
}

#shijian1 {
	
}

#riqi {
	margin-left: -146px;
}

#name {
	
}
</style>
</head>
<body id="test">
	<!--白色，浅蓝色，深蓝色，绿色，黄色，红色，黑色，对应的class为btn,btn btn-primary,btn btn-info,btn btn-success,btn btn-warning,btn btn-danger,btn btn-inverse-->



	<!------------------------------------------------------------------------------------------------------------------------------->

	<div class="col-md-12">

		<div id="n1">

			<div>
				
				<section class="Hui-article-box"> <nav class="breadcrumb">
				 <a
					href="${pageContext.request.contextPath}/Ordersystem/wei_query1.action"><button
							
							style="background:#000; class="label label-success radius" filter:alpha(opacity:0); opacity:0.2;">全部订单</button>
				</a> </nav>
				<div class="Hui-article">
					<article class="cl pd-20">
					<form action="/Ordersystem/dongdingdan.action" method="post">
						

							<span id="riqi">日期范围</span>：
							<div class="control-group" id="shijian1">
								<label class="control-label"> 初始时间</label>
								<div class="controls input-append date form_datetime"
									data-date="2017-06-16T00:00:00Z" data-date-format="yyyy-MM-dd"
									data-link-field="dtp_input1">
									<input id="shijiankuang3" name="shijiankuang3" size="25"
										type="text" value="" readonly> <span class="add-on"><i
										class="icon-remove"></i> </span> <span class="add-on"><i
										class="icon-th"></i> </span>
								</div>
								<input type="hidden" id="dtp_input1" value="" /><br />
							</div>
							<div class="control-group" id="shijian2">
								<label class="control-label"> 初始时间</label>
								<div class="controls input-append date form_datetime"
									data-date="2017-06-16T00:00:00Z" data-date-format="yyyy-MM-dd"
									data-link-field="dtp_input1">
									<input id="shijiankuang4" name="shijiankuang4" size="25"
										type="text" value="" readonly> <span class="add-on"><i
										class="icon-remove"></i> </span> <span class="add-on"><i
										class="icon-th"></i> </span>
								</div>
								<input type="hidden" id="dtp_input1" value="" /><br />
							</div>
							<input type="text" name="ordername" id="ordername"
								placeholder=" 订单编号" style="width:250px" class="input-text">
							<button name="" id="" type="submit" class="btn btn-success">
								<i class="Hui-iconfont">&#xe665;</i> 搜订单
							</button>

						
					</form>
					<div class="cl pd-5 bg-1 bk-gray mt-20">
						<span class="l"> <span class="r">共有数据：<strong style="font-size:25px">${list.total }</strong> 条</span>
					</div>
					<div class="mt-20">
						<table
							class="table table-border table-bordered table-bg table-hover table-sort">
							<thead style="margin-bottom:0px">
								<tr class="text-c" style="margin-bottom:0px">
									<th width="40"></th>
									<th width="80"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">订单编号</th>

									<th width="150"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">订单时间</th>
									<th width="150"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">桌子id</th>
									<th width="60"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">消费金额</th>
									<th width="100"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">服务员</th>
									<th width="100"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">顾客</th>
									<th width="100"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">评分</th>
									<th width="100"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">评价</th>
										<th width="100"
										onmouseover="this.style.backgroundColor = '#5F9F9F ';"
										onmouseout="this.style.backgroundColor = '#afd1f3 ';">状态</th>
									
								</tr>

							</thead>
							<tbody id="xinxi">
								
								
								<c:forEach items="${List1}" var="b">
									<tr>
										<td><input type="checkbox"></td>
										<td>${b.order_id}</td>
										<td>${b.order_time}</td>
										<td>${b.order_fk_tabid}</td>
										<td>${b.order_money}</td>
										<td>${b.emp_name}</td>
										<td>${b.cus_name}</td>
										<td>${b.order_dt_score}</td>
										<td>${b.oeder_dt_mark}</td>
										<td><span class="label label-success radius">${b.code_name}</span></td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
										<span style="margin-left:700px;">${list.pageStr}   第${list.currPage }页     共${list.allPage}页</span>
						
						
						
					</div>
					</article>
				</div>
				</section>

			</div>

		</div>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="../js/jquery-2.1.3.js"
		charset="UTF-8"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
		
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	
	<script type="text/javascript" src="../js/jquery-2.1.3.js"
		charset="UTF-8"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
		 $(".form_datetime").datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1,
		})
	</script>
</body>
</html>