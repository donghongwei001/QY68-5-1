<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <link href = "../css/bootstrap.min.css" rel = "stylesheet">
  <script src="../js/jquery-2.1.3.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <style>
	.mytable{
		height:460px;
		background-color:#669933;
	}
	td{text-align:center;}
	th{text-align:center;}

	.mymenu{
		height:460px;
	}
	.button-control {
	width:100px;
	
	text-align: center;
	}
	.button-control{
		
		margin:15 0 0 15;
		text-align:center;
	}
	.collg7{width:40%;
		float:left;	
	}
	.collg5{width:55%;
		float:right;
		margin:0 12 0 12;
		height:460px;
	}
	.rowee{
		overflow:auto;
		margin:0 auto;
	}
  </style>
  <script type="text/javascript">
  	//统计菜品总价
  	function countprice(){
  		var numb = document.getElementsByName("numb");
  		var price = document.getElementsByName("price");
  		var count = 0;
  		var val = document.getElementById("countRMB");
  		for(var i=0;i<numb.length;i++){
  			count +=   parseInt(numb[i].innerText)* parseInt(price[i].innerText);
  		}
  		val.innerHTML=count;
  	}
  
  </script>
  
 </HEAD>

 <BODY onload="countprice()">
 
	<div class="rowee">
		<div class="collg7">
				<div align="center" style="font-size:16;"><b>已点菜单&nbsp;&nbsp;&nbsp;&nbsp;餐桌名字:${table_id}</b></div>
			<div class="mytable">
			  <table class="table table-striped table-condensed table-hover">
				<tr>
					<th>序号</th><th>菜目名称</th><th>数量</th><th>单价</th><th>状态</th><th>删除</th>
				</tr>
				<c:forEach items="${solb }" var="sb" varStatus="sob">
				<tr>
					<td>${sob.count }</td>
					<td>${sb.food_name }</td>
					<td name="numb" class="numb">${sb.order_food_num }</td>
					<td name="price">${sb.food_price }</td>
					<td>${sb.code_name }</td>
					<td><input type="checkbox" name="foodmenu" value="${sb.order_food_id }"></td>
				</tr>
				</c:forEach>
				</table>
			</div>
		</div>
		<div class="collg5">
			<div class="mymenu">
					<b style="font-size:15">菜单目录</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="foodname" name="foodname" value="${userseach }" style="width:120px">
					<button  id="searchfood" >搜索</button>
				<table class="table table-striped table-condensed table-hover">
					<tr>
						<td>序号</td><td>菜目名称</td><td>菜系</td><td>单价</td><td>耗时</td><td>选择</td>
					</tr>
					<tbody id="tbody">
					<c:forEach items="${menuList }" var="me" varStatus="st">
					<tr>
						<td>${st.count }</td>
						<td>${me.food_name }</td>
						<td>${me.dishes_name }</td>
						<td>${me.food_price }</td>
						<td>${me.food_time }</td>
						<td><input type="checkbox" name="addmenu" value="${me.food_id }"></td>
					</tr>
					</c:forEach>
					</tbody>
				  </table>
				  <button class="pre" onclick="bac()">上一页</button>
				  <button class="bac" onclick="pre()">下一页</button><span id="currentpage">第1页</span><span id="pagetotal">共${pageCount }页</span>
				  <input type="hidden" value="${pageCount }" id="allpage">
				  <input type="hidden" value="${table_id}" id="tbid">
			</div>
		</div>
	</div>
<div style="margin-top:10px">
	<div style="float:left;line-height:2" ><B>总计消费:</B></div><div id="countRMB" style="float:left;width:40px;line-height:2" ></div><span>元</span>&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;	
	<a class="btn btn-danger button-control" href="javascript:delfood()">移除菜品</a>
	<a class="btn btn-primary button-control" href="javascript:addfood('${table_id}')">添加菜品</a>
	<a class="btn btn-primary button-control" href="javascript:paymoney('${table_id}')">结账</a>
	<a class="btn btn-warning button-control" href="javascript:flush()" style="margin:0 10 0 10">页面刷新</a>
	<a class="btn btn-primary button-control" href="javascript:reminder('${table_id}')">催菜</a>
</div>
	<input type="hidden" id="txt1" value="66666 ">
<script type="text/javascript">
	

	//jq修改数量的方法
	$(".numb").click(
			function(){
				var self=$(this);
				var trEle=$(this).text();
				var foodname = $(this).prev().text();
				var tbid = $("#tbid").val();
				$(this).text("");
				var newinput=$("<input type='text' value="+trEle+">");
				$(newinput).width("20");
				$(newinput).height("20");
				$(this).append(newinput);
				$(newinput).click(
					function(){return false;}
				);
				$(newinput).blur(
					function(){
						var flag = window.confirm("您确定修改菜品数量吗?");
						if(flag){
							var vl=$(this).val();
							$.ajax({			//调用ajax修改数据库订单数量
								url:"/Ordersystem/serv_updatenum.action",
								data:{foodname:foodname,tbid:tbid,newnum:vl},
								type:"post",
								dataType:"text",
								success:function(list){
										$(this).remove();
									if(list=="true"){
										alert("修改数量成功!");
										$(self).text(vl);
										countprice();
									}else{
										alert("操作失败,请稍后再试!");
										$(self).text(trEle);
									}
									
								}
							})
							
						}
					}
				);
			}
		)
	


	//菜品搜索功能
	$("#searchfood").click(function(){
		$.ajax({
			url:"/Ordersystem/dishe_ajaxQueryDishes.action",
			data:{pageNo:pageNo,food_name:$("#foodname").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 var total = list.length/12;
				 var pagecount=list.length%12>0?total+1:total;
				 for(var i=0;i<list.length;i++){
					  var tr = $("<tr><td>"+(parseInt((pageNo-1))*12+i+1)+"</td>"+
						"<td>"+list[i].food_name+"</td>"+
						"<td>"+list[i].dishes_name+"</td>"+
						"<td>"+list[i].food_price+"</td>"+
						"<td>"+list[i].food_time+"</td>"+
						"<td><input type='checkbox' name='addmenu' value='"+list[i].food_id+"'></td></tr>");
					$("#tbody").append(tr);	 
				}  
				$("#currentpage").text("第"+pageNo+"页"); 
				$("#allpage").val(pagecount); 
				document.getElementById("pagetotal").innerHTML="共"+parseInt(pagecount)+"页";
				//$("#pagetotal").text("共"+pagecount+"页"); 
			}
		}); 
	})
	
	//付款的方法
	function paymoney(tbid){
		var flag = window.confirm("您确定结账吗?");
		if(flag){
			$.ajax({
					url:"/Ordersystem/serv_checkfood.action",
					data:{tableid:tbid,count:$("#countRMB").text()},
					type:"post",
					dataType:"text",
					success:function(list){
						//alert(list);
						if(list=="true"){
							alert("结账成功!");
						}else{
							alert("操作失败,您有未上完的菜品!");
							/* var flag2 = window.confirm("您有未上完的菜品,确定结账吗?");
							if(flag2){
								$.ajax({
									url:"/Ordersystem/serv_paymoney.action",
									data:{tableid:tbid},
									type:"post",
									dataType:"text",
									success:function(data){
										//alert(list);
										if(data=="true"){
											alert("结账成功,您共计消费元!");
										}else{
											alert("结账操作失败!");
											
										}
									}
								})	//嵌套ajax结束 
							
							}*/
							
						}
					}
				})	//外层ajax结束
		}
	}
	
	//添加菜品的方法
	function addfood(tbid){
		var flag = window.confirm("确认添加选中菜品吗?");
		if(flag){
			var addmenu = document.getElementsByName("addmenu");
			var foodid = new Array();
			for(var i=0;i<addmenu.length;i++){
				if(addmenu[i].checked){
					foodid.push(addmenu[i].value);
				}
			}
			for(var j=0;j<foodid.length;j++){
				$.ajax({
					url:"/Ordersystem/serv_addOrderfood.action",
					data:{foodid:foodid[j],tableid:tbid},
					type:"post",
					dataType:"text",
					success:function(list){
						//alert(list);
						if(list=="true"){
							alert("添加菜品成功!");
						}else{
							alert("添加菜品失败!");
							
						}
					}
				})
			}//for循环结束
		}//if判断结束
	}

	//删除菜品的方法
	function delfood(){
		var flag = window.confirm("确认移除菜单信息吗?");
		if(flag){
			var foodmenu = document.getElementsByName("foodmenu");
			var foodid = new Array();
			for(var i=0;i<foodmenu.length;i++){
				if(foodmenu[i].checked){
					foodid.push(foodmenu[i].value);
				}
			}
			for(var j=0;j<foodid.length;j++){
				$.ajax({
				url:"/Ordersystem/serv_delOrderfood.action",
				data:{foodid:foodid[j]},
				type:"post",
				dataType:"text",
				success:function(list){
					//alert(list);
					if(list=="true"){
						alert("移除菜品成功!");
					}else{
						alert("移除菜品失败!");
						
					}
				}
			});
			}
		//flush();
		}
	}
	
	function flush(){
		location.reload(); 
	}
	
	//催菜的ajax函数js
	var num=0;
	function reminder(tbid){
		num++;
		if(num>2){
			alert("您催菜次数过于频繁!请耐心等待!");
			return;
		}
		$.ajax({
				url:"/Ordersystem/serv_reminder.action",
				data:{tableid:tbid},
				type:"post",
				dataType:"text",
				success:function(list){
					//alert(list);
					if(list=="true"){
						alert("催单成功,菜品马上就到!");
					}else{
						alert("操作失败,请稍后再试!");
					}
				}
			});
	}
	
	//菜品列表分页向后一页的方法
	var pageNo=1;
	function bac(){
		pageNo = --pageNo<1?1:pageNo;
		 $.ajax({
			url:"/Ordersystem/dishe_ajaxQueryDishes.action",
			data:{pageNo:pageNo,food_name:$("#foodname").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
					  var tr = $("<tr><td>"+(parseInt((pageNo-1))*12+i+1)+"</td>"+
						"<td>"+list[i].food_name+"</td>"+
						"<td>"+list[i].dishes_name+"</td>"+
						"<td>"+list[i].food_price+"</td>"+
						"<td>"+list[i].food_time+"</td>"+
						"<td><input type='checkbox' name='addmenu' value='"+list[i].food_id+"'></td></tr>");
					$("#tbody").append(tr);	 
				}  
				$("#currentpage").text("第"+pageNo+"页"); 
			}
		}); 
	}
	
	//菜品列表分页向前一页的方法
	function pre(count){
		var total = $("#allpage").val();
		pageNo = ++pageNo>total?total:pageNo;
		 $.ajax({
			url:"/Ordersystem/dishe_ajaxQueryDishes.action",
			data:{pageNo:pageNo,food_name:$("#foodname").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
						  var tr = $("<tr><td>"+(parseInt((pageNo-1))*12+i+1)+"</td>"+
						"<td>"+list[i].food_name+"</td>"+
						"<td>"+list[i].dishes_name+"</td>"+
						"<td>"+list[i].food_price+"</td>"+
						"<td>"+list[i].food_time+"</td>"+
						"<td><input type='checkbox' name='addmenu' value='"+list[i].food_id+"'></td></tr>");
						$("#tbody").append(tr);	 
				}   
				 $("#currentpage").text("第"+pageNo+"页");
			}
		}); 
	};
</script>
</BODY>
</HTML>