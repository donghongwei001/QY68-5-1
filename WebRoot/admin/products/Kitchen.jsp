<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kitchen_sortFood</title>
<link href="${pageContext.request.contextPath }/admin/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<script src="${pageContext.request.contextPath }/admin/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: opx;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<%-- <li role="presentation" class="active"><a href="#">待做菜品<span class="badge" id="usetable">${count}</span></a></li>
		<!-- <li role="presentation"><a href="#">正在做菜品<span class="badge" id="surplustable">12</span>	</a></li> -->
		<li role="presentation"><a href="#">已做菜品</a></li> --%>
		 <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">待做菜品<span class="badge" id="usetable">${count}</span></a>
		 <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">已做菜品</a>
	</ul>
	
	<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home"><div class="col-md-7">
	<h3>待做菜单</h3>
	<table class="table table-hover" style="font-size:14">
		<tr>
			<th>序号</th>
			<th>桌号</th>
			<th>服务员</th>
			<th>菜名</th>
			<th>数量</th>
			<th>订单时间</th>
			<th>上菜间隔</th>
			<th>催菜</th>
			<th>备注</th>
			<th>做菜</th>			
		</tr>
		<c:forEach items="${list }" var="li" varStatus="sta">
		<tr>
			<td>${sta.count }</td>
			<td>${li.tabid }</td>
			<td>${li.wfb.emp_name }</td>
			<td>${li.wfb.food_name}</td>
			<td>${li.foodnum }</td>
			<td>${li.wfb.time }</td>
			<td>${li.wfb.lasttime }</td>
			<td>${li.wfb.order_press }</td>
			<td>${li.wfb.order_food_mark }</td>
			<td><a href="${pageContext.request.contextPath}/kitchen_doFood.action?orderfoodid=${li.order_food_id }&status=2" type="button" class="btn btn-info btn-xs">做菜</a></td>
			
		</tr>
		</c:forEach>
	</table>
</div>
<div class="col-md-5">
	<h3>正做菜单</h3>
	<table class="table table-hover" style="font-size:14">
		<tr>
			<th>序号</th>
			<th>桌号</th>
			<th>服务员</th>
			<th>菜名</th>
			<th>数量</th>
			<th>备注</th>
			<th>上菜</th>
		</tr>
		<c:forEach items="${doing }" var="dg" varStatus="di">
		<tr>
			<td>${di.count }</td>
			<td>${dg.tabid }</td>
			<td>${dg.wfb.emp_name }</td>
			<td>${dg.wfb.food_name}</td>
			<td>${dg.foodnum }</td>
			<td>${dg.wfb.order_food_mark }</td>
			<td><a type="button" class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/kitchen_servingFood.action?orderfoodid=${dg.order_food_id }&status=3&orderId=${dg.orderId}">上菜</a></td>
		</tr>
		</c:forEach>
	</table>
</div></div>
    <!-- <div role="tabpanel" class="tab-pane" id="profile">...okiokiokioki</div>
    <div role="tabpanel" class="tab-pane" id="messages">..srtghjl.</div> -->
    <div role="tabpanel" class="tab-pane" id="settings">
	<table class="table table-hover" style="font-size:14">
		<tr>
			<th>序号</th>
			<th>桌号</th>
			<th>服务员</th>
			<th>菜名</th>
			<th>数量</th>
			<th>上菜时间</th>
			
			<th>备注</th>
			
			<!-- <th>上菜</th> -->
		</tr>
				<tbody id="tbody">
					<c:forEach items="${done.rows }" var="dg" varStatus="di">
						<tr>
							<td>${di.count }</td>
							<td>${dg.table_name }</td>
							<td>${dg.emp_name }</td>
							<td>${dg.food_name}</td>
							<td>${dg.food_num }</td>
							<td>${dg.servingtime }</td>
							<td>${dg.order_food_mark }</td>
							<%-- <td><a type="button" class="btn btn-success btn-xs"
								href="${pageContext.request.contextPath}/kitchen_doFood.action?orderfoodid=${dg.order_food_id }&status=1">查看</a>
							</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	<button class="pre" onclick="bac()">上一页</button>
	<button class="bac" onclick="pre(4)">下一页</button><span id="currentpage">第1页</span><span>共${done.allPage }页</span>
	<input type="hidden" value="${done.allPage }" id="allpage">
	</div>
  </div>
</body>
<script type="text/javascript">
	/* $(function(){
		$(".pre").click(function(){
			alert("555");
			$.post("kitchen_slitPage.action",
				{pageNo:++pageNo},
				function(tlist){
					$("#tbody").empty();
					var list = eval("("+tlist+")");
					for(var i=0,i<list.length,i++){
						var tr = $("<tr><td>"+(pageNo*10+i)+"</td><td>"+list[i].table_name+"</td><td>"+list[i].emp_name+"</td><td>"+list[i].food_num+"</td><td>"+list[i].servingtime+"</td><td>"+list[i].order_food_mark+"</td><td><a type='button' class='btn btn-success btn-xs' href='${pageContext.request.contextPath}/kitchen_doFood.action?orderfoodid="+list[i].order_food_id+"&status=1'>查看</a></td>");
						$("#tbody").append(tr);	
					}
				},"text");
		});
	})	 */
	var pageNo=1;
	function bac(){
		pageNo = --pageNo<1?1:pageNo;
		 $.ajax({
			url:"/Ordersystem/kitchen_slitPage.action",
			data:{pageNo:pageNo},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
					 var tr = $("<tr><td>"+((pageNo-1)*10+i+1)+"</td><td>"+list[i].table_name+"</td><td>"+list[i].emp_name+"</td><td>"+list[i].food_name+"</td><td>"+list[i].food_num+"</td><td>"+list[i].servingtime+"</td><td>"+list[i].order_food_mark+"</td><td><a type='button' class='btn btn-success btn-xs' href='${pageContext.request.contextPath}/kitchen_doFood.action?orderfoodid="+list[i].order_food_id+"&status=1'>查看</a></td>");
					$("#tbody").append(tr);	 
				}  
				$("#currentpage").text("第"+pageNo+"页"); 
			}
		}); 
	}
	function pre(){
		var total = $("#allpage").val();
		pageNo = ++pageNo>total?total:pageNo;
		 $.ajax({
			url:"/Ordersystem/kitchen_slitPage.action",
			data:{pageNo:pageNo},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
						 var tr = $("<tr><td>"+((pageNo-1)*10+i+1)+"</td><td>"+list[i].table_name+"</td><td>"+list[i].emp_name+"</td><td>"+list[i].food_name+"</td><td>"+list[i].food_num+"</td><td>"+list[i].servingtime+"</td><td>"+list[i].order_food_mark+"</td><td><a type='button' class='btn btn-success btn-xs' href='${pageContext.request.contextPath}/kitchen_doFood.action?orderfoodid="+list[i].order_food_id+"&status=1'>查看</a></td>");
						$("#tbody").append(tr);	 
				}   
				 $("#currentpage").text("第"+pageNo+"页");
			}
		}); 
	};

</script>
</html>





