<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">

</HEAD>
<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/cook_modify.action?cookid=${coks.dishes_id}" method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑菜系</STRONG> </strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">菜品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="dishes_name" class="bg" value="${coks.dishes_name} "/>
				</td>
			</tr>
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					
					
						
					<input type="submit" class="button_ok" value="确定">	
						
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					
					
					
					<input type="reset" value="重置" class="button_cancel">

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1">
					
					</span>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
	<script type="text/javascript">
	/* $(document).ready(function(){
			alert("2222");
			$.post("dishe_findCategory.action",
				function (data){
					$("#category").empty();
					$("#category").append("<option value='' selected='selected'>--选择菜品类--</option>");
					for(var i=0;i<data.length;i++){
						var str = $("<option value="+data[i].dishes_id+">"+data[i].dishes_name+"</option>");
						$("#category").append(str);
					}
				},"json");
		})
		 */
		 
		 //var jq=jQuery.noConflict();
		/*$(document).ready(function(){
			$.post("dishe_findCategory.action",
				function (data){
					$("#category").empty();
					$("#category").append("<option value='' selected='selected'>--选择菜系--</option>");
					for(var i=0;i<data.length;i++){
						var str = $("<option value="+data[i].dishes_id+">"+data[i].dishes_name+"</option>");
						$("#category").append(str);
					}
				},"json");
		})*/
		
	/* //设置类别的默认值
	function setProductCategory(t) {
		var category = document.getElementById("category");

		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {

			if (ops[i].value == t) {
				ops[i].selected = true;
				return;
			}
		}

	};
		 */
	
	</script>
	
</body>
</HTML>