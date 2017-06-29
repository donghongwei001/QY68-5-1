<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/Myjs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/emp_add.jsp";
	}
</script>
<style type="text/css">
#search_he {
	border: 0px solid red;
	position: absolute;
	width: 150;
	top: 66px;
	left: 108px;
	background-color: white;
}

#DataGrid1 td {
	width: 100px;
}
</style>
</HEAD>
<script type="text/javascript">
	/* /* var ipid = document.getElementById("Form1_userName");
	ipid.onkeyup=function(){
		alert("111");
	} */

	/* $(document).ready(function(){
		var ipid = document.getElementById("Form1_userName");
		//var div=document.getElementById("search_he");
		alert("111");
		ipid.onkeyup=function(){
		
	};
	}); */

	/* $("input").focus(
		function(){
			alert("11");
			 $("#search_he").get(0).style.left=$(this).get(0).offsetLeft+"px";
			$("#search_he").get(0).style.display="block";
			alert("000");
			$("#search_he").get(0).style.width=$(this).get(0).offsetWidth+"px";
			$("#search_he").get(0).style.top=$(this).get(0).offsetHeight+$(this).get(0).offsetTop+"px"; 
		}); */

	/* $("input").focus(
		function(){
			alert("aaaaa");
		
			$("#search_he").get(0).style.display="block";
			$("#search_he").get(0).style.left=$(this).get(0).offsetLeft+"px";
			$("#search_he").get(0).style.width=$(this).get(0).offsetWidth+"px";
			$("#search_he").get(0).style.top=$(this).get(0).offsetHeight+$(this).get(0).offsetTop+"px";
		
	}
	);
	$("input").blur(
	function(){$("#search_he").get(0).style.display="none";}
	);
	
	
	window.onload = function(){
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
		
		function backdata(){
			var gender = document.getElementsByName(emp_gender);
			for(var i=0;i<gender.length;i++){
				var sex = gender[i].value;
				alert(sex);
				/* if(data==sex){
					gender[i].checked;
				} */
			}
		}
		
</script>

<body>
	<!-- <div id="search_he"></div> -->
	
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/emp_queryEmp.action"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查
							询 条 件</strong></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									员工编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="emp_id" size="15" value="${emp_id }" id="emp_id" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									姓名：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="emp_name" size="15" value="${emp_name }" id="emp_name" class="bg" /></td>
							</tr>

							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									性别：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="radio" name="emp_gender" value="男" />男
									<input type="radio" name="emp_gender" value="女"/>女
									<input type="hidden" id="emp_gender" value="${emp_gender }"/>
									
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									身份证号：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="emp_idcar" size="15" value="${emp_idcar }" id="emp_idcar" class="bg" />
								</td>

							</tr>
							<!--  -->

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font></td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="&#26597;&#35810;" class="button_view">&#26597;&#35810;</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="reset"
									value="&#37325;&#32622;" class="button_view" /></td>
							</tr>
						</table></td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>员工信息列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addProduct()">&#28155;&#21152;
						</button></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<th align="center" width="7%">员工编号</th>
								<th align="center" width="6%">姓名</th>
								<th align="center" width="5%">性别</th>
								<th align="center" width="8%">出生年月</th>
								<th align="center" width="5%">年龄</th>
								<th  align="center" width="17%">身份证号</th>
								<th align="center" width="12%">家庭住址</th>
								<th  align="center" width="8%">入职时间</th>
								<th align="center" width="7%">职位</th>
								<th  align="center" width="6%">状态</th>
								<th  align="center" width="9%">电话</th>
								<th  align="center" width="5%">编辑</th>
								<th  align="center" width="5%">删除</th>
							</tr>
							<tbody id="tbody">
							<c:forEach items="${allemp }" var = "li">
							<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="7%">${li.emp_id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="6%">${li.emp_name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="5%">${li.emp_gender }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${li.emp_birday }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="5%">${li.emp_age }</td>
									<td align="center" style="HEIGHT: 22px" width="17%">${li.emp_idcar }</td>
									<td align="center" style="HEIGHT: 22px" width="12%">${li.emp_address }</td>
									<td align="center" style="HEIGHT: 22px" width="8%">${li.emp_hire_date }</td>
									<td align="center" style="HEIGHT: 22px" width="7%">${li.role_name }</td>
									<td align="center" style="HEIGHT: 22px" width="6%">${li.emp_state }</td>
									<td align="center" style="HEIGHT: 22px" width="9%">${li.emp_phone }</td>
									<td align="center" style="HEIGHT: 22px" width="5%"><a
										href="${pageContext.request.contextPath}/emp_editEmp.action?emp_id=${li.emp_id}">
											<img src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="5%">
										<img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand" onclick = "delEmp('${li.emp_id}')">
									</td>
								</tr>
								</c:forEach>
							</tbody>
							<%-- <c:forEach items="${allemp }" var = "li">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="23">${li.emp_id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%">${li.emp_name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${li.emp_gender }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${li.emp_birday }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${li.emp_age }</td>
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath}/deleterecord?id=${li.bookid}&method=update">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>

									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath}/deleterecord?id=${li.bookid}&method=del">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a>
									</td>
								</tr>
						</c:forEach> --%>
						</table></td>
				</tr>
			</TBODY>
		</table>
	</form>
	<button class="pre" onclick="bac()">上一页</button>
	<button class="bac" onclick="pre(4)">下一页</button><span id="currentpage">第1页</span><span>共${total }页</span>
	<input type="hidden" value="${total }" id="allpage">
</body>
<script type="text/javascript">

	//回填单选框男女信息
	window.onload=function(){
		var val = document.getElementById("emp_gender").value;
		var gend = document.getElementsByName("emp_gender");
		for(var i=0;i<gend.length;i++){
			if(gend[i].value==val){
				gend[i].checked = true;
			}
		}
	}

var pageNo=1;

function delEmp(name) {
		var flag = window.confirm("确认删除员工信息吗?");
		if (flag) {
			 $.ajax({
				url:"/Ordersystem/emp_delEmp.action",
				data:{pageNo:pageNo,emp_idcar:$("#emp_idcar").val(),emp_id:$("#emp_id").val(),emp_name:$("#emp_name").val(),emp_gender:$("#emp_gender").val(),del_id:name},
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
		}

	function bac(){
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
	};


</script>
</HTML>

