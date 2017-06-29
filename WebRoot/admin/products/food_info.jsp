<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>

 

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                 </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            菜品详情
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>菜品名称</th>
                                        <th>菜品详情</th>
                                        <th>口味</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>烤鸭</td>
                                        <td>鸭肉、烤鸭饼、蘸酱</td>
                                        <td>美味无穷</td>
                                        <td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>酸辣土豆丝</td>
                                        <td>土豆、青椒、小红椒</td>
                                        <td>酸辣</td>
                                        <td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
									  <tr class="odd gradeX">
                                        <td>蒜蓉炒青菜</td>
                                        <td>上海青</td>
                                        <td>清淡口味</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>黄焖排骨</td>
                                        <td>排骨、青椒</td>
                                        <td>麻辣、微辣、清香</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
									  <tr class="odd gradeX">
                                        <td>爽口藕尖</td>
                                        <td>精品小莲藕</td>
                                        <td>甜咸口味、微甜</td>
                                        <td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>剁椒鱼头</td>
                                        <td>鱼头、青椒、红辣椒</td>
                                        <td>微辣、麻辣</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr> 
									<tr class="odd gradeX">
                                        <td>夫妻肺片</td>
                                        <td>肺</td>
                                        <td>凉调菜品</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                     </tr>
                                    <tr class="even gradeC">
                                        <td>麻婆豆腐</td>
                                        <td>嫩豆腐、豆瓣酱、辣椒</td>
                                        <td>香辣</td>
                                        <td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
									<tr class="odd gradeX">
                                        <td>辣子鸡丁</td>
                                        <td>鸡肉、豆瓣酱、土豆块</td>
                                        <td>微辣</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>鱼香肉丝</td>
                                        <td>番茄、肉丝</td>
                                        <td>酸甜口味</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr> 
									<tr class="odd gradeX">
                                        <td>菌王汤</td>
                                        <td>蘑菇、香菇、金针菇</td>
                                        <td>清淡</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>大拌菜</td>
                                        <td>生菜、番茄、萝卜丝</td>
                                        <td>爽口</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr> 
									<tr class="odd gradeX">
                                        <td>酸菜鱼</td>
                                        <td>精品鱼、酸菜、秘制酸汤</td>
                                        <td>微酸、超酸、重口味</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    <tr class="even gradeC">
                                        <td>小龙虾</td>
                                        <td>小龙虾、大葱、土豆条</td>
                                        <td>麻辣、微辣、清香</td>
										<td><button  type="button" class="btn btn-primary  btn btn-default btn-sm">修改</button><button type="button" class="btn btn-danger  btn btn-default btn-sm">删除</button></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
          
            
           
           

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.bootstrap.min.js"></script>
    <script src="../js/dataTables.responsive.js"></script>
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: false
        });
    });
    </script>

</body>

</html>