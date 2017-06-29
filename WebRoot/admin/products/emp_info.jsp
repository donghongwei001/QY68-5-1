<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
	<title>Starter Template for Bootstrap</title>
	<style type="text/css">
	#table_center{
		text-align:center;
		width:100%;
		}
	#top1_left{
		float:left;
		}
	#top1_right{
		float:right;
		}
</style>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	  
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
  </head>

  <body>
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-2.1.3.js"></script>
    <script src="../js/bootstrap.min.js">
	
	</script>
     <nav class="navbar navbar-default navbar-fixed-top" style="width:100%" id="table_center">
  <div class="container"  style="width:100%" id="table_center">
  <div>
  	<div id="top1_left">
    查询:<input type="text">
  	</div>
    <div id="top1_right">
  	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">添加员工</button>
 </div>
  </div>
  </div>
    </nav>
  <br/>
    <br/>
<!--模态框-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title" id="exampleModalLabel">新员工信息</h4>
      </div>
      <div class="modal-body">
        <form>
        	
   <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">姓名</span>
 	 <input type="text" class="form-control" placeholder="请输入姓名" aria-describedby="basic-addon1">
	</div>
	 <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">性别</span>
 	 <input type="text" class="form-control" placeholder="请输入性别" aria-describedby="basic-addon1">
	</div>	
     <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">年龄</span>
 	 <input type="text" class="form-control" placeholder="请输入年龄" aria-describedby="basic-addon1">
	</div>
     <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">手机号</span>
 	 <input type="text" class="form-control" placeholder="请输入手机号" aria-describedby="basic-addon1">
	</div>
     <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">家庭住址</span>
 	 <input type="text" class="form-control" placeholder="请输入家庭住址" aria-describedby="basic-addon1">
	</div>
    <div class="input-group">
 	 <span class="input-group-addon" id="basic-addon1">身份证号</span>
 	 <input type="text" class="form-control" placeholder="请输入身份证号" aria-describedby="basic-addon1">
	</div>
    </form>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
    
<table class="table table-striped" id="table_center">
	<tr>
	<td >员工编号</td>
	<td>姓名</td>
	<td>联系方式</td>
	<td>职务</td>
    <td>相关操作</td>
  </tr>
 <tr >
	<td>110101</td>
	<td>张晓明</td>
	<td>135245698451</td>
	<td>服务员</td>
    <td><button  type="button" class="btn btn-primary  btn btn-default btn-xm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-xm">删除</button></td>
  </tr>
  <tr>
	<td>110102</td>
	<td>吴青</td>
	<td>18564753202</td>
	<td>服务员</td>
    <td><button  type="button" class="btn btn-primary  btn btn-default btn-xm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-xm">删除</button></td>
  </tr>
  <tr>
	<td>110103</td>
	<td>朱文慧</td>
	<td>18567535215</td>
	<td>服务员</td>
    <td><button  type="button" class="btn btn-primary  btn btn-default btn-xm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-xm">删除</button></td>
  </tr>
 
 
  </table>

  </body>
</html>