<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>订餐系统</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="css/dataTables.responsive.css" rel="stylesheet">
	 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	
	
<body>
	<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/account_ed.action" method="post">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑员工状态信息</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td>
					您要修改的员工状态编号为:${account_fk_emp_id}
				</td>
			</tr>
			<tr>
				
				<td align="center" bgColor="#f5fafe" class="ta_01">员工账号：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="account_number" class="bg" value="${account_number}"  />
				<input type="hidden" name="account_fk_emp_id" value="${account_fk_emp_id}">
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">员工密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="account_psw" class="bg"  value="${account_psw}" id="tbname" />
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">员工状态：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3" >
				<select name="zhuangtai"  >
				<option value="--请选择--">--请选择--</option>
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
<script >
	/* $(function(){
		alert("ddd");
	}); */
	 $(document).ready(
		function(){
			$.post("Table_sewaiter.action",
			function(data){
					$("#posSelect").empty();
					$("#posSelect").append("<option value='qingxuanze' selected='selected'>--请选择--</option>");
					for(var i = 0;i<data.length;i++){
						var str = $("<option value="+data[i].emp_id+">"+data[i].waiter+"</option>");
						$("#posSelect").append(str);
					}
				},"json");
		}); 
	function seletbnam(){
		$.ajax({
			url:"/Ordersystem/Table_sltbname.action",
			data:{tbname:$("#tbname").val()},
			type:"post",
			dataType:"text",
			success:function(list){
				 if(list=="false"){
				 	alert("该桌子名称已存在,请重新输入");
				 }
			}
		}); 
	}
</script>
</html>