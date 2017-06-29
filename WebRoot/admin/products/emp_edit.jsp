<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-2.1.3.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/check.js"></script>

</HEAD>
<style>
 #preview, .img, img  
 {  
 width:145px;  
 height:180px;  
 }  

</style>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/emp_updateInfo.action?id=${empinfo.emp_id}" method="post" enctype="multipart/form-data"> 
	<input type="hidden" value="${empinfo.code_id }" id="sta" />
		<input type="hidden" value="${empinfo.emp_fk_pos_id }" id="poid" />
		<input type="hidden" value="${empinfo.emp_gender }" id="gend" />
		<input type="hidden" value="${empinfo.emp_id }" id="empid" name="emp.emp_id" />
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="6"
					height="26"><strong><STRONG>编辑员工信息</STRONG> </strong><!-- 编辑员工信息 -->
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">员工编号：</td>
				<td class="ta_01" bgColor="#ffffff"><span>${empinfo.emp_id }</span>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">姓名：</td>
				<td class="ta_01" bgColor="#ffffff" width="20%"><input type="text"
					name="emp.emp_name" value="${empinfo.emp_name }" class="bg" />
				</td>
				<td bgColor="#f5fafe" align="center" class="ta_01" rowspan="5"  width="8%"><div id="preview">
				<!-- 图片预览上传的文件域 -->
					<img alt="照片预览" src="uploadFile/${empinfo.emp_pic}"/>
				</div></td>
				<td class="ta_01" bgColor="#ffffff" width="8%"></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">性别：</td>
				<td class="ta_01" bgColor="#ffffff" >
					<input type="radio" name="emp.emp_gender" value="男"/>男
					<input type="radio"name="emp.emp_gender" value="女"/>女
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">出生年月：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type = "text" value="${empinfo.emp_birday }" name="emp.emp_birday">
				</td>
				<td class="ta_01" bgColor="#ffffff"></td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">年龄：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" value="${empinfo.emp_age }" name="emp.emp_age">
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">身份证号：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" value="${empinfo.emp_idcar }"	name="emp.emp_idcar" class="bg" />
				</td>
				<td class="ta_01" bgColor="#ffffff"></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">家庭住址：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="emp.emp_address" value="${empinfo.emp_address }"	class="bg" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">入职时间：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" value="${empinfo.emp_hire_date }" name="emp.emp_hire_date" />
				</td>
				<td class="ta_01" bgColor="#ffffff"></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">职位：</td>
				<td class="ta_01" bgColor="#ffffff">
				<select  name="emp.emp_fk_pos_id" id="posid">
						<option>---请选择---</option>
				</select>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">状态：</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="emp.emp_state" id="empstatus">
						<option value="4">在职</option>
						<option value="5">请假</option>
						<option value="7">调休</option>
						<option value="6">离职</option>
					</select>
				</td>
			
			<td class="ta_01" bgColor="#ffffff"></td>
			</tr>
			
			<TR>
				<td align="center" colSpan="1" >电话：
				</td>
				<td class="ta_01" colSpan="3"><input type="text"
					name="emp.emp_phone" class="bg" value="${empinfo.emp_phone }"/></td>
				<td width="10%" class="ta_01"  colspan="2">
				<input type="file" name="emppic" onchange="preview(this)" >	<!-- 文件上传input -->
				<input type="hidden" name="oldemppic" value="${empinfo.emp_pic }" onchange="preview(this)" >	<!-- 文件上传input -->
				</td>	
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="6">
					<input type="submit"
					class="button_ok" value="确定"> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>



					<input type="reset" value="重置" class="button_cancel"> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span></td>
			</tr>
		</table>
	</form>





</body>
<script type="text/javascript">

	//添加图片预览的方法
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

	
	// 定义页面加载事件 需要执行以下两个动作 1.加载数据库中的职位信息   2.回填现在个人的已有职位
	window.onload = function(){
		showpos();		//同步显示数据库中的职位状态
		
		statusback();	//状态回填函数
		sexback();		//性别回填函数
		
	};
		
	//回填个人状态信息
	function statusback() {
		var status = document.getElementById("sta").value;		//得到返回的状态id
		var category = document.getElementById("empstatus");
		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {
			if (ops[i].value == status) {
				ops[i].selected = true;
				return;
			}
		}
	};
		
	//回填个人性别信息
	function sexback(){
		var sex = document.getElementsByName("emp.emp_gender");
		var t = document.getElementById("gend").value;		//得到返回的职位id
		for(var i=0;i<sex.length;i++){
			if(sex[i].value==t){
				sex[i].checked = true;
				return;
			}
		}
	}
	
	//回填个人职位信息
	function databack() {
		//alert("565");
		var pos = document.getElementById("poid").value;		//得到返回的职位id
		var category = document.getElementById("posid");
		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {
			//alert(ops[i].value);
			if (ops[i].value == pos) {
				ops[i].selected = true;
				return;
			}
		}
	};
	
	//封装公用函数 显示职位全部信息
	function showpos(){
		var xhr = getXMLHttpRequest();//获取连接
		var posid = document.getElementById("posid");
		//处理结果
		xhr.onreadystatechange=function(){
				//alert(xhr.readyState);
			if(xhr.readyState==4&&xhr.status==200){
				var json=JSON.parse(xhr.responseText);
				var childdivs = "";
				for(var i=0;i<json.length;i++){
					childdivs+="<option value='"+json[i].role_id+"'>"+json[i].role_name+"</option>";
				}
				posid.innerHTML=childdivs;
			};
			databack();		//职位回填函数
		};
		//建立连接
		xhr.open("post","emp_showPosition.action");
		//发送连接
		xhr.send(null);
	
	}
		
		//获取XMLHttpRequest对象
	function getXMLHttpRequest() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for all new browsers
			xmlhttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {// code for IE5 and IE6
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		return xmlhttp;
	
	}
			
			


	//设置类别的默认值
	function appendopt(){
		alert("55555");
		
		/*  $.ajax({
			url:"/Ordersystem/emp_showPosition.action",
			type:"post",
			dataType:"json",
			success:function(list){
				 $("#posid").empty();
				 for(var i=0;i<list.length;i++){
					 var tr = $("<option value="+data[i].role_id+">"+data[i].role_name+"</option>");
					$("#posid").append(tr);	 
				}  
			}
		});  */
		
		/* $.post("emp_showPosition.action",
				function(data){
					$("#posid").empty();
					for(var i = 0;i<data.length;i++){
						var str = $("<option value="+data[i].role_id+">"+data[i].role_name+"</option>");
						$("#posid").append(str);
					}
				},"json");  */
				
	/* $.ajax({ //发送了一个新的请求，与按钮这个请求完全不是一马事
					type : "post", //请求方式
					url : "/Ordersystem/emp_showPosition.action", //请求地址
					dataType : "json",
					//async : false,
					
					
					success : function(data) { //请求成功后调用的回调函数，参数1【data】 请求返回的数据，这个数据类型是dataType  制定
						$("#posid").empty();
						for ( var int = 0; int < data.length; int++) {
							var str = $("<option value="+data[i].role_id+">"+data[i].role_name+"</option>");
							$("#posid").append(str);
						}
							
						}
					
	
				})
	}
	 */
	 
	 $(function(){
		$("#posid").click(function(){
			$.post("emp_showPosition.action",
				function(data){
					$("#posid").empty();
					
					for(var i = 0;i<data.length;i++){
						var str = $("<option value="+data[i].role_id+">"+data[i].role_name+"</option>");
						$("#posid").append(str);
					}
				},"json");
		});
	});
			
	$(document).ready(function(){alert("0303");});
	
	function setPageInfo() {
		var posid = document.getElementById("posid");
		var empgender = document.getElementsByName("emp_gender");
		var empstatus = document.getElementById("empstatus");
		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {
			if (ops[i].value == t) {
				ops[i].selected = true;
				return;
			}
		}

	}}
</script>
</HTML>