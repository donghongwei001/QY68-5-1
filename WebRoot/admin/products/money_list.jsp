

<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css"
	rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/Myjs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/jquery-2.1.3.js"></script>


<script type="text/javascript">
	
</script>
<style type="text/css">
body {
	font-size: 30px;
}

table {
	font-size: 30px;
}

#search_he {
	border: 0px solid red;
	position: absolute;
	width: 150;
	top: 66px;
	left: 108px;
	background-color: white;
}

.shijian {
	height: 50px;
	text-align: center;
}

.jin {
	height: 50px;
	text-align: center;
}

.jieguo {
	border: 1px solid green;
	width: 100%;
	text-align: center;
}

#a1 {
	border: 1px solid green;
	width: 500px;
	height: 30px;
}

h1 {
	text-align: center;
	background: gray;
	height: 80px;
	line-height: 80px;
}

.container {
	
}

.control-group {
	float: left;
}

#shijian1 {
	margin-left: 300px;
	margin-right: 40px;
	margin-top: px;
}

#shijian2 {
	margin-top: px;
}

#hengxian {
	margin-left: -840px;
	margin-top: -150px;
}

#chaxun {
	margin-right: -500px;
}

#shijiankuang1 {
	border: 1px solid green;
	height: 25px;
}

#shijiankuang2 {
	border: 1px solid green;
	height: 25px;
}

td {
	width: 40%;
}
</style>

</HEAD>
<script type="text/javascript">
	
</script>

<body id="in">


	<h1>财务统计查询</h1>
	<table cellSpacing="1"
		class="table table-border table-bordered table-bg table-hover table-sort"
		cellPadding="0" width="100%" align="center" bgColor="#f5fafe"
		border="0">

		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查
					询 条 件</strong></td>
		</tr>
		<tr>
			<td class="shijian">
				<div class="container" id="shijian1">
					<form action="/Ordersystem/chaxun.action" class="form-horizontal">
						<fieldset>
							<legend></legend>
							<div class="control-group" id="shijian1">
								<label class="control-label"> 初始时间</label>
								<div class="controls input-append date form_datetime"
									data-date="2017-06-16T00:00:00Z" data-date-format="yyyy-MM-dd"
									data-link-field="dtp_input1">
									<input id="shijiankuang1" name="shijiankuang1" size="25"
										type="text" value="" readonly> <span class="add-on"><i
										class="icon-remove"></i> </span> <span class="add-on"><i
										class="icon-th"></i> </span>
								</div>
								<input type="hidden" id="dtp_input1" value="" /><br />
							</div>

							<div class="control-group" id="shijian2">
								<label class="control-label">截止时间</label>
								<div class="controls input-append date form_datetime"
									data-date="2017-06-16T00:00:00Z" data-date-format="yyyy-MM-dd"
									data-link-field="dtp_input1">
									<input id="shijiankuang2" name="shijiankuang2" size="25"
										type="text" value="" readonly> <span class="add-on"><i
										class="icon-remove"></i> </span> <span class="add-on"><i
										class="icon-th"></i> </span>
								</div>
								<input type="hidden" id="dtp_input1" value="" /><br />
							</div>


							<input type="submit" class="btn btn-info" value="查询">
						</fieldset>
					</form>
				</div></td>

		</tr>
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3"><strong>今日结算</strong>

			</td>

		</tr>
		<tr>
			<td class="jin"><div>
					<table
						class="table table-border table-bordered table-bg table-hover table-sort"
						align="center" width=100%>
						<tr>
							<td align="center">今日总订单数</td>
							<td align="center">今日总金额</td>
						</tr>
						<c:forEach items="${list}" var="s">

							<tr>
								<c:forEach items="${s}" var="d">
									<td align="center">${d}</td>
								</c:forEach>

							</tr>
						</c:forEach>

					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3"><strong>查询结果</strong>

			</TD>
		</tr>

		<tr>

		</tr>

	</table>
	<div></div>

	<table
		class="table table-border table-bordered table-bg table-hover table-sort">
		<tr>
			<td align="center">查询总订单数</td>
			<td align="center">查询总金额</td>
		</tr>
		<c:forEach items="${list1}" var="a">
			<c:forEach items="${a}" var="b">
				<td align="center">${b}</td>
			</c:forEach>

		</c:forEach>
	</table>


	<div id="info"></div>



	<script type="text/javascript" src="../js/jquery-2.1.3.js"
		charset="UTF-8"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$(".form_datetime").datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
		$(".form_date").datetimepicker({
			language : "fr",
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>



</body>
</HTML>

