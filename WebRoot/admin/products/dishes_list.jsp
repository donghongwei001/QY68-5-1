<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript" src ="${pageContext.request.contextPath }/admin/js/Myjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/dishes_add.jsp";
	}
</script> 
<style type="text/css">
	#search_he{
		border:0px solid red;
		position:absolute;
		width:150;
		top:66px;
		left:108px;
		background-color:white;
	}
</style>
</HEAD>
<script type="text/javascript">
	
	
	/* window.onload = function(){
		//alert("00");
		var ipt = document.getElementById("Form1_userName");
		var div = document.getElementById("search_he");
		ipt.onkeyup = function(){
			var xhr = getXMLHttpRequest();//获取连接
			//处理结果
			xhr.onreadystatechange=function(){
					//alert(xhr.readyState);
				if(xhr.readyState==4&&xhr.status==200){
					var str=xhr.responseText;
					var ss = str.split(",");
					var childdivs = "";
					for(var i=0;i<ss.length;i++){
						childdivs+="<div onmouseover='bgco(this)' onmouseout='bgcot(this)' onclick='writeva(this)'>"+ss[i]+"</div>";
					}
					div.innerHTML=childdivs;
				};
			};
			//建立连接
			xhr.open("post","searchele?name="+ipt.value+"&time="+new Date().getTime());
			//发送连接
			xhr.send(null);
		};
		ipt.onblur=function(){
			div.innerHTML="";
		};
		
	};	
		function writeva(di){
			alert("55");
			var dive = document.getElementById("search_he");
			var value = di.innerHTML;
			dive.innerHTML=value;
		}
		function bgco(div){
			div.style.backgroundColor="gray";
		}
		function bgcot(div){
			div.style.backgroundColor="white";
		} */
</script>

<body>
	<!-- <div id="search_he"></div> -->
<!-- 	<br> -->
	<input type="hidden" value="${food_fk_dishes_id}" id="cate">
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/dishe_queryAllDishes.action"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0"> 
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" ><strong>查
							询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									菜品编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="food_id" size="15" value="" id="food_id" class="bg" value="${food_id }" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									菜品类别：</td>
								<td class="ta_01" bgColor="#ffffff"><select name="category"
									id="category">
									
								</select></td>
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									菜品名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="food_name" size="15" id="food_name" class="bg" value="${food_name }"/>
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									id="minprice" name="minprice" size="10" value="${minprice}" />- <input type="text"
									id="maxprice" name="maxprice" size="10" value="${maxprice}" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="&#37325;&#32622;"
									class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>菜目列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addProduct()">&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<th align="center" width="14%">编号</th>
								<th align="center" width="18%">菜品名称</th>
								<th align="center" width="9%">菜品价格</th>
								<th width="8%" align="center">所属菜系</th>
								<th align="center" width="9%">最大并菜数</th>
								<th width="10%" align="center">加工时间</th>
								<th width="8%" align="center">编辑</th>
								<th width="8%" align="center">删除</th>
							</tr>
							<tbody id = "tbody">
							<c:forEach items="${disheInfo }" var="di">
							<tr	style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="14%">${di.food_id }</td>
								<td align="center" width="18%">${di.food_name }</td>
								<td align="center" width="9%">${di.food_price }</td>
								<td align="center" width="9%">${di.dishes_name }</td>
								<td width="8%" align="center">${di.food_merge }</td>
								<td width="8%" align="center">${di.food_time }</td>
								<td align="center" style="HEIGHT: 22px" width="5%"><a
										href="${pageContext.request.contextPath}/dishe_editDishe.action?food_id=${di.food_id}">
											<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>
								<td align="center" style="HEIGHT: 22px" width="5%">
										<img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand" onclick = "delDeshe('${di.food_id}')">
									</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
	<button class="pre" onclick="bac()">上一页</button>
	<button class="bac" onclick="pre(4)">下一页</button><span id="currentpage">第1页</span><span>共${total }页</span>
	<input type="hidden" value="${total }" id="allpage">
	
	<script type="text/javascript">
	//回填后台查询出来的菜系类别
	function databack() {
		//alert("565");
		var pos = document.getElementById("cate").value;		//得到返回的菜系id
		//alert(pos+"ppp");
		var category = document.getElementById("category");
		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {
			//alert(ops[i].value);
			if (ops[i].value == pos) {
				ops[i].selected = true;
				return;
			}
		}
	};
	
	var pageNo = 1;
	
	//动态显示下拉框中的选项
	$(document).ready(function(){
		$.post("dishe_findCategory.action",
			function (data){
				$("#category").empty();
				$("#category").append("<option check='checked' value=''>----请选择----</option>");
				for(var i=0;i<data.length;i++){
					var str = $("<option value="+data[i].dishes_id+">"+data[i].dishes_name+"</option>");
					$("#category").append(str);
				};databack();
			},"json");
		})
	//上一页按钮分页
	function bac(){
		pageNo = --pageNo<1?1:pageNo;
		 $.ajax({
			url:"/Ordersystem/dishe_ajaxQueryDishes.action",
			data:{pageNo:pageNo,category:$("#category").val(),food_id:$("#food_id").val(),food_name:$("#food_name").val(),minprice:$("#minprice").val(),maxprice:$("#maxprice").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
					  var tr = $("<tr style='FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3'>"+
								"<td align='center' width='14%'>"+list[i].food_id+"</td>"+
								"<td align='center' width='18%'>"+list[i].food_name+"</td>"+
								"<td align='center' width='9%'>"+list[i].food_price+"</td>"+
								"<td align='center' width='9%'>"+list[i].dishes_name+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_merge+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_time+"</td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><a href='${pageContext.request.contextPath}/dishe_editDishe.action?food_id="+list[i].food_id+"'><img src='${pageContext.request.contextPath}/admin/images/i_edit.gif' border='0' style='CURSOR: hand'> </a></td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><img src='${pageContext.request.contextPath}/admin/images/i_del.gif' width='16' height='16' border='0' style='CURSOR: hand' onclick = 'delDeshe("+list[i].food_id+")'></td></tr>");
					$("#tbody").append(tr);	 
				}  
				$("#currentpage").text("第"+pageNo+"页"); 
			}
		}); 
	}
	
	//下一页按钮分页
	function pre(){
		var total = $("#allpage").val();
		pageNo = ++pageNo>total?total:pageNo;
		 $.ajax({
			url:"/Ordersystem/dishe_ajaxQueryDishes.action",
			data:{pageNo:pageNo,category:$("#category").val(),food_id:$("#food_id").val(),food_name:$("#food_name").val(),minprice:$("#minprice").val(),maxprice:$("#maxprice").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
						  var tr = $("<tr style='FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3'>"+
								"<td align='center' width='14%'>"+list[i].food_id+"</td>"+
								"<td align='center' width='18%'>"+list[i].food_name+"</td>"+
								"<td align='center' width='9%'>"+list[i].food_price+"</td>"+
								"<td align='center' width='9%'>"+list[i].dishes_name+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_merge+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_time+"</td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><a href='${pageContext.request.contextPath}/dishe_editDishe.action?food_id="+list[i].food_id+"'><img src='${pageContext.request.contextPath}/admin/images/i_edit.gif' border='0' style='CURSOR: hand'> </a></td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><img src='${pageContext.request.contextPath}/admin/images/i_del.gif' width='16' height='16' border='0' style='CURSOR: hand' onclick = 'delDeshe("+list[i].food_id+")'></td></tr>");
						$("#tbody").append(tr);	 
				}   
				 $("#currentpage").text("第"+pageNo+"页");
			}
		}); 
	};
	
	//删除的方法
	function delDeshe(id){
	var flag = window.confirm("确认删除菜品信息吗?");
		if (flag) {
		 $.ajax({
			url:"/Ordersystem/dishe_delDishe.action",
			data:{pageNo:pageNo,del_id:id,category:$("#category").val(),food_id:$("#food_id").val(),food_name:$("#food_name").val(),minprice:$("#minprice").val(),maxprice:$("#maxprice").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
						  var tr = $("<tr style='FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3'>"+
								"<td align='center' width='14%'>"+list[i].food_id+"</td>"+
								"<td align='center' width='18%'>"+list[i].food_name+"</td>"+
								"<td align='center' width='9%'>"+list[i].food_price+"</td>"+
								"<td align='center' width='9%'>"+list[i].dishes_name+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_merge+"</td>"+
								"<td width='8%' align='center'>"+list[i].food_time+"</td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><a href='${pageContext.request.contextPath}/dishe_editDishe.action?emp_id="+list[i].food_id+"'><img src='${pageContext.request.contextPath}/admin/images/i_edit.gif' border='0' style='CURSOR: hand'> </a></td>"+
								"<td align='center' style='HEIGHT: 22px' width='5%'><img src='${pageContext.request.contextPath}/admin/images/i_del.gif' width='16' height='16' border='0' style='CURSOR: hand' onclick = 'delDeshe("+list[i].food_id+")'></td></tr>");
						$("#tbody").append(tr);	 
				}   
				 $("#currentpage").text("第"+pageNo+"页");
			}
		}); 
	}
	};
	</script>
</body>
</HTML>

