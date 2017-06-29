

<!DOCTYPE html>
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

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	  
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
	<style type="text/css">
		body{
			font-size:20px;
		}table{
			width:100%;
			text-align:center;
		}td{
			height:40px;
		}#shoukuan{
			margin-left:40%;
		}
	</style>
  <body>
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
		<ul id="nav-tabs" class="nav nav-tabs" role="tablist">
		
		<li role="presentation" class="active"><a id="active" href="#home" aria-controls="home" role="tab" data-toggle="tab"><button type="submit" id="sousuo1" class="btn btn-info btn-lg"><span class=" glyphicon glyphicon-apple"></span>现金支付<span class="glyphicon glyphicon-apple"></span></button></a></li>

		<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><button type="submit" id="sousuo1" class="btn btn-info btn-lg"><span class=" glyphicon glyphicon-apple"></span>扫码支付<span class="glyphicon glyphicon-apple"></span></button></a></li>
		</ul>
		</div>
		</nav>
		<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="home">
			<br/>
			<br/>
			<br/>
			<TABLE id="tab">
						<TR>
							<TD>菜品</TD>
							<TD>数量</TD>
							<TD>口味</TD>
							<TD></TD>
						</TR>
						<hr/>
						<TR>
							<TD>香炸琵琶虾</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>清炖马蹄鳖</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>龙井虾仁</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>七星鱼丸汤</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>金瓜粉蒸肉</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>糖醋排骨</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>红烧鱼</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>宫保鸡丁</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>香炸琵琶虾</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>清炖马蹄鳖</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>龙井虾仁</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>七星鱼丸汤</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>金瓜粉蒸肉</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>糖醋排骨</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>红烧鱼</TD>
							<TD>2</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
						<TR>
							<TD>宫保鸡丁</TD>
							<TD>1</TD>
							<TD>微辣</TD>
							<TD>58</TD>
						</TR>
					</TABLE>
		</div>
		<div role="tabpanel" class="tab-pane" id="profile">
			<div id="shoukuan">
				<img src="QQ图片收款二维码1.jpg" width="50%"height="60%"/><br/>
				<br/>
				<br/>
				<img src="QQ图片收款二维码2.jpg" width="50%"height="60%"/>
			</div>
		</div>
		</div>
		</div>
					
		
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var index=2;
		function addTr(){
			var tb=document.getElementById("tab");
			var trNew=document.createElement("tr");
			tb.appendChild(trNew);
			var td1=document.createElement("td");
			td1.innerHTML=index+"1";
			var td2=document.createElement("td");
			td2.innerHTML=index+"2";
			var td3=document.createElement("td");
			td3.innerHTML=index+"3";
			trNew.appendChild(td1);
			trNew.appendChild(td2);
			trNew.appendChild(td3);
			index++;
			var btn=document.createElement("input");
			btn.type="button";
			btn.value="删除";
			btn.onclick=delSelf;
			td3.appendChild(btn);
		}
		function delSelf(e){
			e=e.target||window.event;//选中当前事件
			var trNew=e.parentNode.parentNode;
			var tb=document.getElementById("tab");
			tb.removeChild(trNew);
			// document.getElementById('tab').removeChild(trNew);
		}
		function delTr(){
			var tb=document.getElementById("tab");
			var trNew=tb.lastChild;
			tb.removeChild(trNew);
		}
	</script>
  </body>
</html>

