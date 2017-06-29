<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <link href = "../css/bootstrap.min.css" rel = "stylesheet">
  <script src="../js/jquery-2.1.3.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
 </HEAD>

 <BODY>
 <div class="container">
	<h3 align="center" style="font-weight:bold">客户预定餐</h3>
	 <form class="form-horizontal">
	  <div class="form-group">
		<label for="inputEmail3" class="col-sm-2 control-label">客户姓名</label>
		<div class="col-sm-8">
		  <input type="text" class="form-control" id="inputEmail3" placeholder="">
		</div>
	  </div>
	  <div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">联系电话</label>
		<div class="col-sm-8">
		  <input type="text" class="form-control" id="inputPassword3" placeholder="">
		</div>
	  </div>
	  <div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">就餐时间</label>
		<div class="col-sm-8">
		  <input type="text" class="form-control" id="inputPassword3" placeholder="">
		</div>
	  </div>
	  <div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">就餐人数</label>
		<div class="col-sm-3">
		  <input type="text" class="form-control" id="inputPassword3" placeholder="">
		</div>
		<label for="inputPassword3" class="col-sm-2 control-label">预定桌号</label>
		<div class="col-sm-3">
		  <input type="text" class="form-control" id="inputPassword3" placeholder="">
		</div>
	  </div>
	   <div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">备注信息</label>
		<div class="col-sm-8">
		  <textarea  class="form-control" id="inputPassword3" placeholder=""> </textarea>
		</div>
	  </div>
	  
	  <div class="form-group">
		<!-- <div class="col-sm-offset-2 col-sm-10">
		  <div class="checkbox">
			<label>
			  <input type="checkbox"> Remember me
			</label>
		  </div>
		</div> -->
	  </div>
	  <div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
		  <button type="submit" class="btn btn-success btn-lg">确定</button>
		</div>
	  </div>
	</form>
</div>
 </BODY>
</HTML>