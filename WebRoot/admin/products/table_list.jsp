
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
		window.location.href = "${pageContext.request.contextPath}/admin/products/table_add.jsp";
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
	
</script>
<body>
	<div id="search_he"></div>
	
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
						 		<td>
							<form action="Table_selezhuo.action" method="post">
								桌号：<input type="text" name="zhuohao"/><br>
								<input type="submit" value="查询"> 
							</form>
								</td>
							</tr> 
						 </table> 
					</td>

				</tr>
				
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>餐桌列表</strong>
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
								<td align="center" width="15%">桌号</td>
								<td align="center" width="15%">桌名</td>
								<td align="center" width="10%">可供就餐人数</td>
								<td align="center" width="20%">服务员</td>
								<td width="15%" align="center">状态</td>
								<td width="9%" align="center">编辑</td>
								<td width="9%" align="center">删除</td>
							</tr>
							
							 <c:forEach items="${list}" var="row">
									<tr style="FONT-WEIGHT: bold; HEIGHT:33px;FONT-WEIGHT: bold;FONT-SIZE: 12pt; HEIGHT: 25px;">
										<td align="center" width="15%">${row.table_id}</td>
										<td align="center" width="10%">${row.table_name}</td>
										<td align="center" width="10%">${row.table_Capacity}</td>
										<td align="center" width="20%">${row.fk_emp_id}</td>
										<td align="center" width="15%">${row.table_state }</td>
										<td width="9%" align="center">
										 <a href="${pageContext.request.contextPath}/Table_seid.action?tabled=${row.table_id}&name=${row.table_name}&capacity=${row.table_Capacity}" > 
											<img
											src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											width="16" height="16" border="0" style="CURSOR: hand" type="submit">
									</a>
									
								</td>
								<td width="9%" align="center">
									<a
										href="${pageContext.request.contextPath}/Table_del.action?tab=${row.table_id}">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a>
								</td> 
									</tr>
								</c:forEach>
							</table>
					</td>
				</tr>
			</TBODY>
		</table>
	<button  class="pre" onclick="bac()">上一页</button>
	<button  class="bac" onclick="pre(4)">下一页</button><span id="currentpage">第1页</span><span>共1页</span>
	<input type="hidden" value="${total }" id="allpage">
<script type="text/javascript">
var pageNo=1;
	/* function bac(){
		pageNo = --pageNo<1?1:pageNo;
		 $.ajax({
			url:"/Ordersystem/emp_ajxQueryEmp.action",
			data:{pageNo:pageNo,emp_idcar:$("#emp_idcar").val(),emp_id:$("#emp_id").val(),emp_name:$("#emp_name").val(),emp_gender:$("#emp_gender").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
					  var tr = $("<tr onmouseover='this.style.backgroundColor ='white''	onmouseout='this.style.backgroundColor = '#F5FAFE';'><td align='center'>"+list[i].emp_id+"</td><td align='center'>"+list[i].emp_name+"</td><td align='center'>"+list[i].emp_gender+"</td><td align='center'>"+list[i].emp_birday+"</td><td align='center'>"+list[i].emp_age+"</td><td align='center'>"+list[i].emp_idcar+"</td><td align='center'>"+list[i].emp_address+"</td><td align='center'>"+list[i].emp_hire_date+"</td><td align='center'>"+list[i].role_name+"</td><td align='center'>"+list[i].emp_state+"</td><td align='center'>"+list[i].emp_phone+
						 "</td><td align='center' style='HEIGHT: 22px' width='5%'><a href='${pageContext.request.contextPath}/emp_editEmp.action?emp_id="+list[i].emp_id+"'><img src='${pageContext.request.contextPath}/admin/images/i_edit.gif'	border='0' style='CURSOR: hand'> </a></td><td align='center' style='HEIGHT: 22px' width='5%'><img src='${pageContext.request.contextPath}/admin/images/i_del.gif' width='16' height='16' onclick = 'delEmp("+list[i].emp_id+")'"+
						 " border='0' style='CURSOR: hand'>	</td></tr>");
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
			url:"/Ordersystem/emp_ajxQueryEmp.action",
			data:{pageNo:pageNo,emp_idcar:$("#emp_idcar").val(),emp_id:$("#emp_id").val(),emp_name:$("#emp_name").val(),emp_gender:$("#emp_gender").val()},
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#tbody").empty();
				 for(var i=0;i<list.length;i++){
						  var tr = $("<tr onmouseover='this.style.backgroundColor ='white''	onmouseout='this.style.backgroundColor = '#F5FAFE';'><td align='center'>"+list[i].emp_id+"</td><td align='center'>"+list[i].emp_name+"</td><td align='center'>"+list[i].emp_gender+"</td><td align='center'>"+list[i].emp_birday+"</td><td align='center'>"+list[i].emp_age+"</td><td align='center'>"+list[i].emp_idcar+"</td><td align='center'>"+list[i].emp_address+"</td><td align='center'>"+list[i].emp_hire_date+"</td><td align='center'>"+list[i].role_name+"</td><td align='center'>"+list[i].emp_state+"</td><td align='center'>"+list[i].emp_phone+
						 "</td><td align='center' style='HEIGHT: 22px' width='5%'><a href='${pageContext.request.contextPath}/emp_editEmp.action?emp_id="+list[i].emp_id+"'><img src='${pageContext.request.contextPath}/admin/images/i_edit.gif'	border='0' style='CURSOR: hand'> </a></td><td align='center' style='HEIGHT: 22px' width='5%'><img src='${pageContext.request.contextPath}/admin/images/i_del.gif' width='16' height='16' onclick = 'delEmp("+list[i].emp_id+")'"+
						 " border='0' style='CURSOR: hand'>	</td></tr>");
						$("#tbody").append(tr);	 
				}   
				 $("#currentpage").text("第"+pageNo+"页");
			}
		}); 
	}; */
	
</script>

</body>
</HTML>

