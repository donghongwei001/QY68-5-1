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
#preview, .img, img  
 {  
 width:200px;  
 height:200px;  
 } 

</style>
<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/dishe_updateDishe.action" method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑菜品</STRONG> </strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">菜品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="db.food_name" class="bg" value="${disheInfo.food_name}" />
				</td>
				<!-- 上传图片预览 --><!-- 上传图片预览 --><!-- 上传图片预览 -->
				<!-- 上传图片预览 --><!-- 上传图片预览 --><!-- 上传图片预览 -->
				<td align="center" bgColor="#ffffff" rowspan="5" class="ta_01">
					<div id="preview"><img src="uploadFile/${disheInfo.food_pic }" alt="菜品预览"></div> 
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01"></td>
				
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">菜品单价：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="db.food_price" value="${disheInfo.food_price }"
					class="bg" />
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01"></td>
				
			</tr>
			
			
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">最大并菜数：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="db.food_merge" value="${disheInfo.food_merge }"
					class="bg" />
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01"></td>
				
			</tr>

		<tr>
		<td align="center" bgColor="#f5fafe" class="ta_01">所属菜系：</td>
				<input type="hidden" value="${disheInfo.food_fk_dishes_id }" id="cate">
				<td class="ta_01" bgColor="#ffffff"><select name="db.food_fk_dishes_id"
					id="category">
						<option value="" selected="selected">--选择菜品类--</option>
									
				</select>
				</td>
			<td align="center" bgColor="#ffffff" class="ta_01"></td>
		</tr>
		
		<tr>
		<td align="center" bgColor="#f5fafe" class="ta_01">加工时间:</td>
		<td class="ta_01" bgColor="#ffffff" ><input type="text"
					name="db.food_time" value="${disheInfo.food_time}"
					class="bg" />
				</td>
			<td align="center" bgColor="#ffffff" class="ta_01" style="width:200px"></td>
		</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">上传：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
				<input type="hidden" value="${disheInfo.food_pic }" name="oldpic">
				<input type="hidden" value="${disheInfo.food_id }" name="db.food_id">
				<input
					type="file" name="food_pic" onchange="preview(this)" size="30" value=""/>
				</td>
			</tr>
			
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">菜品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<textarea
						name="description" cols="30" rows="3" 
						style="WIDTH: 96%">${disheInfo.food_description}</textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"><%-- <img
					src="${pageContext.request.contextPath}/admin/images/shim.gif"> --%>
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
	
	
	window.onload = function(){
		showpos();		//同步显示数据库中的菜系信息
	};
	
	//菜系回填函数
	function databack() {
		//alert("565");
		var cate = document.getElementById("cate").value;		//得到返回的菜系id
		var category = document.getElementById("category");
		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {
			//alert(ops[i].value);
			if (ops[i].value == cate) {
				ops[i].selected = true;
				return;
			}
		}
	};
	
	//同步数据库中的菜系类别
	function showpos(){
		var xhr = getXMLHttpRequest();//获取连接
		var posid = document.getElementById("category");
		//处理结果
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var json=JSON.parse(xhr.responseText);
				var childdivs = "";
				for(var i=0;i<json.length;i++){
					childdivs+="<option value='"+json[i].dishes_id+"'>"+json[i].dishes_name+"</option>";
				}
				posid.innerHTML=childdivs;
			};
			databack();		//职位回填函数
		};
		//建立连接
		xhr.open("post","dishe_findCategory.action");
		//发送连接
		xhr.send(null);
	
	}
		
		//封装公用函数获取XMLHttpRequest对象
	function getXMLHttpRequest() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for all new browsers
			xmlhttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {// code for IE5 and IE6
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		return xmlhttp;
	
	}
			
	
	
	
 $(document).ready(function(){
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
		 
		 
		 //var jq=jQuery.noConflict();
	/* 	$(document).ready(function(){
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
		 */
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