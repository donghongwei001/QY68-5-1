<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">


<script type="text/javascript" src="../js/jquery-2.1.3.js"></script></HEAD>

<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/account_add.action" method="post">&nbsp; 
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加员工账号状态</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">账号：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="account_number" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">密码：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="account_psw" class="bg"  id="tbname"/>
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">员工编号：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<select name="account_fk_emp_id" id="posSelect">
				<option value="--请选择--" selected="selected">--请选择--</option>
				</select>
				</TD>
			</TR>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">状态：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<select name="account_status" id="posSelect">
				<option value="--请选择--" selected="selected">--请选择--</option>
				<option value="14">14</option>
				<option value="15">15</option>
				</select>
				</TD>
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
</body>
<script type="text/javascript">

	$(document).ready(
		function(){
			$.post("account_selemp.action",
				function(data){
					$("#posSelect").empty();
					$("#posSelect").append("<option value='qingxuanze' selected='selected'>--请选择--</option>");
					for(var i = 0;i<data.length;i++){
						var str = $("<option value="+data[i].emp_id+">"+data[i].emp_id+"</option>");
						$("#posSelect").append(str);
					}
				},"json");
		});
	
</script>
</HTML>