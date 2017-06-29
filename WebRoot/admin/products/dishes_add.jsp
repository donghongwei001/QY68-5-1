<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">


<script type="text/javascript" src="../js/jquery-2.1.3.js"></script></HEAD>
<style>

#preview, .img , img
 {  
 width:200px;  
 height:200px;  
 }  

</style>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/dishe_addDishe.action" method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>菜品添加</STRONG> </strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">菜品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input  onblur="dishesadd()" id="se" type="text" name="db.food_name" class="bg"/></td>
				
				<td  bgColor="#ffffff" class="ta_01" colspan="2" rowspan="6"> <div id="preview"></div>  </td>
				
				
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">菜品单价：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="db.food_price" class="bg" />
				</td>
				
			</tr>
			
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">最大并菜数：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="db.food_merge" 
					class="bg" />
				</td>
				
			</tr>

		<tr>
		<td align="center" bgColor="#f5fafe" class="ta_01">加工时间:</td>
		<td class="ta_01" bgColor="#ffffff" ><input type="text"
					name="db.food_time" 
					class="bg" />
				</td>
		
		</tr>
		
		<tr>
		<td align="center" bgColor="#f5fafe" class="ta_01">所属菜系：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="db.food_fk_dishes_id"
					id="category">
						<option value="" selected="selected">--选择菜品类--</option>
									
				</select>
				</td>
		
		
		</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">上传图片：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
				<input
					type="file" name="food_pic" size="30"  onchange="preview(this)"  value=""/>
				</td>
			</tr>
			
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">菜品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<textarea
						name="description" cols="30" rows="3" 
						style="WIDTH: 96%"></textarea>
				</TD>
			</TR>
			<%-- <TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR> --%>


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
	
	<script type="text/javascript">
	//图片动态预览
	 function preview(file)  
		 {  
		 var prevDiv = document.getElementById('preview');  
		 if (file.files && file.files[0]){  
		 var reader = new FileReader();  
			 reader.onload = function(evt){  
			 	prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';  
			 }    
			 reader.readAsDataURL(file.files[0]);  
		}  
		 else {  
			 prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
		 }  
	}  
	
	//联动显示数据库中的菜系类别
	$(document).ready(function(){
			$.post("dishe_findCategory.action",
				function (data){
					$("#category").empty();
					$("#category").append("<option value='' selected='selected'>--选择菜系--</option>");
					for(var i=0;i<data.length;i++){
						var str = $("<option value="+data[i].dishes_id+">"+data[i].dishes_name+"</option>");
						$("#category").append(str);
					}
				},"json");
		})
	function dishesadd(){
		$.ajax({
			url:"/Ordersystem/dishe_se.action",
			data:{tbname:$("#se").val()},
			type:"post",
			dataType:"text",
			success:function(list){
				 if(list=="false"){
				 	alert("此菜已存在");
				 }
			}
		}); 
	}
	</script>
	
</body>
</HTML>