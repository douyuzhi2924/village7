<%@ page import="vo.zhuhuTable" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.zhuhuTableDao" %>
<%@ page import="vo.weixiuTable" %>
<%@ page import="dao.weixiuTableDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.jdbcUtil" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/16
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <style>
        .myform_c {
            overflow: hidden;
            z-index: 9999;
            position: fixed;
            padding: 5px;
            top: 6%;
        }
        .bg_w {
            background-color: rgba(0, 0, 0, 0.5);
            width: 83%;
            height: 100vh;
        }
        #myformClose {
            display: none;
        }
    </style>
</head>
<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="homepage.jsp"><i class="menu-icon fa fa-laptop"></i>主页 </a>
                </li>
                <li class="menu-title">操作列表</li><!-- /.menu-title -->
                <li>
                    <a href="Table_zhuhu.jsp"> <i class="menu-icon fa fa-calendar"></i>住户信息</a>
                </li>
                <li>
                    <a href="Table_login.jsp"> <i class="menu-icon fa fa-calendar"></i>登陆信息</a>
                </li>
                <li>
                    <a href="Table_weixiu.jsp"> <i class="menu-icon fa fa-wrench"></i>维修维护</a>
                </li>
                <li>
                    <a href="Table_kuaidi.jsp"> <i class="menu-icon fa fa-truck"></i>快递存取</a>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-money"></i>费用管理</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-money"></i><a href="Table_money.jsp?type=water">水费</a></li>
                        <li><i class="menu-icon fa fa-money"></i><a href="Table_money.jsp?type=dian">电费</a></li>
                        <li><i class="menu-icon fa fa-money"></i><a href="Table_money.jsp?type=nuan">取暖费</a></li>
                        <li><i class="menu-icon fa fa-money"></i><a href="Table_money.jsp?type=wu">物业管理费</a></li>
                    </ul>
                </li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="homepage.jsp"><img src="images/logologo.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">
                <div class="header-left">
                    <div class="form-inline">
                        <form class="search-form">
                            <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                            <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                        </form>
                    </div>
                </div>

                <div class="user-area dropdown float-right">
                    <span class="name">欢迎您:&nbsp;admin</span>
                </div>

                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(20px, 55px, 0px);">
                        <a class="nav-link" href="#"><i class="fa fa- user"></i>修改密码</a>
                        <a class="nav-link" href="login.jsp"><i class="fa fa- user"></i>登出</a>

                    </div>
                </div>



            </div>
        </div>
    </header>
    <!-- Header-->
    <%
        ResultSet rs=weixiuTableDao.selectAll();
        request.setAttribute("result", rs);
    %>

    <div class="content">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">维修报修信息</strong><input style="float: right"
                                                                             class="btn btn-outline-success" type="submit"
                                                                             value="添加数据" onclick="openMyform(),changeName_add()">
                        </div>

                        <div class="card-body">

                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>维修编号</th>
                                    <th>住户编号</th>
                                    <th>住户姓名</th>
                                    <th>住户联系方式</th>
                                    <th>住户单元</th>
                                    <th>住户门牌号</th>
                                    <th>报修详情</th>
                                    <th>报修时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                             <%
                                 ResultSet rss= (ResultSet) request.getAttribute("result");

                                while (rss.next()){
                                    out.println("<tr id=\"tr"+rss.getObject(1)+"\">");
                                    out.println("<td>"+rss.getObject(1)+"</td>");
                                    out.println("<td>"+rss.getObject(8)+"</td>");
                                    out.println("<td>"+rss.getObject(2)+"</td>");
                                    out.println("<td>"+rss.getObject(3)+"</td>");
                                    out.println("<td>"+rss.getObject(4)+"</td>");
                                    out.println("<td>"+rss.getObject(5)+"</td>");
                                    out.println("<td>"+rss.getObject(6)+"</td>");
                                    out.println("<td>"+rss.getObject(7)+"</td>");
                                    out.println("<td>");
                                    out.println("<input onclick=\"openMyform(),changeName_up("+rs.getObject(1)+")\" class=\"btn btn-outline-primary\" type=\"button\" value=\"修改\">");
                                    out.println("<input name=\"" + rs.getObject(1) + "\" onclick=\"del(this.name)\" class=\"btn btn-outline-danger\" type=\"submit\" value=\"删除\">");
                                    out.println("</td></tr>");
                                }
                             %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div><!-- .animated -->
    </div><!-- .content -->


    <div class="clearfix"></div>


    <script src="assets/jquery-3.5.1.js"></script>
    <script>
        function openMyform() {
            document.getElementById("myformClose").style.display = "inline-block";
        }
        function closeMyform() {
            document.getElementById("myformClose").style.display = "none";
        }

        function changeName_add() {
            document.getElementById("tijiao_up").style.display="none";
            document.getElementById("tijiao").style.display="inline-block";
            document.getElementById("cxtx").style.display="inline-block";
            document.getElementById("tableName").innerText="添加维修信息";

            var myDate = new Date;
            var year = myDate.getFullYear(); //获取当前年
            var mon = myDate.getMonth() + 1; //获取当前月
            var date = myDate.getDate(); //获取当前日
            var h = myDate.getHours();//获取当前小时数(0-23)
            var m = myDate.getMinutes();//获取当前分钟数(0-59)
            var s = myDate.getSeconds();//获取当前秒
            var time=year+"-"+mon+"-"+date+" "+h+":"+m+":"+s;
            document.getElementById("baoxiuTime").value=time;

        }
        function changeName_up(myid) {
            document.getElementById("tijiao_up").style.display="inline-block";
            document.getElementById("tijiao").style.display="none";
            document.getElementById("cxtx").style.display="none";
            document.getElementById("tableName").innerText="修改维修信息";

            document.getElementById("myLittleId").value=myid;

            var mytr=$("#tr"+myid).children("td");
            document.getElementById("selectid").value=mytr.eq(1).html();
            document.getElementById("guzhang").value=mytr.eq(6).html();
            document.getElementById("baoxiuTime").value=mytr.eq(7).html();
        }

        /**********************************************************************************/
        $(document).ready(function () {
            $("#tijiao").click(function () {
                $.post("weixiu.add",
                    {
                        zhuhuid: $("#selectid").val(),
                        guzhang: $("#guzhang").val(),
                        baoxiuTime: $("#baoxiuTime").val(),
                    },
                    function (data, status) {
                        alert(data);
                        window.location.replace("Table_weixiu.jsp");

                    });
            });
        });
        $(document).ready(function () {
            $("#tijiao_up").click(function () {
                $.post("weixiu.up",
                    {
                        id:document.getElementById("myLittleId").value,
                        zhuhuid: $("#selectid").val(),
                        guzhang: $("#guzhang").val(),
                        baoxiuTime: $("#baoxiuTime").val(),
                    },
                    function (data, status) {
                        alert(data);
                        window.location.replace("Table_weixiu.jsp");

                    });
            });
        });
        function del(id) {
            var r = confirm("是否确认删除");
            if (r == true) {
                $.post("weixiu.del",
                    {
                        myid: id
                    },
                    function (data, status) {
                        alert(data);
                        window.location.replace("Table_weixiu.jsp");
                    });
            }
        }
    </script>


    <div class="col-lg-5" class="myform_c" id="myformClose">
        <div class="bg_w myform_c">
            <div class="card" style="width: 80%;margin: 0 auto">
                <div class="card-header">
                    <strong id="tableName">添加住户信息</strong>
                    <button style="float: right" onclick="closeMyform()" class="btn btn-outline-danger"><span
                            class="ti-close"></span></button>
                </div>
                <div class="card-body card-block">
                    <form id="myform" action="submit.do" method="post">
                        <input id="myLittleId" type="button" value="0" style="display: none">

                        <div class="row form-group">
                            <div class="col col-md-3"><label for="selectid" class=" form-control-label">住户姓名</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <select name="sex" id="selectid" class="form-control">
                                    <option value="0">请选择</option>
                                    <%
                                        List<zhuhuTable> list= jdbcUtil.executeQuery(zhuhuTable.class,"select * from zhuhutable");
                                        for (zhuhuTable z:list) {
                                            out.println("<option value=\""+z.getId()+"\">"+z.getZhuhuName()+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3"><label for="guzhang" class=" form-control-label">故障详情</label></div>
                            <div class="col-12 col-md-9"><textarea name="textarea-input" id="guzhang" rows="9" placeholder="请填写故障详情" class="form-control"></textarea></div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3"><label for="baoxiuTime" class=" form-control-label">报修时间</label>
                            </div>
                            <div class="col-12 col-md-9"><input name="phone" type="text" id="baoxiuTime"
                                                                placeholder="请输入报修时间" class="form-control"></div>
                        </div>

                        <div style="float: right">
                            <button id="cxtx" onclick="formInit()" type="button" class="btn btn-info">重新填写</button>
                            <button id="tijiao" type="button" class="btn btn-success">确认提交</button>
                            <button style="display: none" id="tijiao_up" type="button" class="btn btn-success">确认提交</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>




    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2020.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                </div>
                <div class="col-sm-6 text-right">

                </div>
            </div>
        </div>
    </footer>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>


<script src="assets/js/lib/data-table/datatables.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="assets/js/lib/data-table/jszip.min.js"></script>
<script src="assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="assets/js/init/datatables-init.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        $('#bootstrap-data-table-export').DataTable();
    } );
</script>


</body>
</html>
