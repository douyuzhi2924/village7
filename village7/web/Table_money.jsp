<%@ page import="java.util.List" %>
<%@ page import="vo.money" %>
<%@ page import="dao.moneyDao" %>
<%@ page import="vo.user" %>
<%@ page import="vo.zhuhuTable" %>
<%@ page import="dao.zhuhuTableDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.jdbcUtil" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/17
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div class="content">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">住户缴费信息</strong><input style="float: right"
                                                                             class="btn btn-outline-success" type="submit"
                                                                             value="添加数据" onclick="openMyform(),changeName_add()">
                        </div>

                        <div class="card-body">

                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>缴费序号</th>
                                    <th>缴费类型</th>
                                    <th>住户ID</th>
                                    <th>住户姓名</th>
                                    <th>联系方式</th>
                                    <th>应交费用</th>
                                    <th>实交费用</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                String type=request.getParameter("type");
                                List<money> list=new ArrayList<money>();
                                if (type.equals("water")){
                                    list= moneyDao.selectWaterMoney();
                                    type="水费";
                                }
                                else if (type.equals("dian")){
                                    list= moneyDao.selectDianMoney();
                                    type="电费";
                                }
                                else if (type.equals("nuan")){
                                    list= moneyDao.selectNuanMoney();
                                    type="供暖费";
                                }
                                else if (type.equals("wu")){
                                    list= moneyDao.selectWuMoney();
                                    type="物业管理费";
                                }
                                for (money m:list) {

                                    List<zhuhuTable> list2=zhuhuTableDao.selectById(m.zhuhuid);
                                    String name="";
                                    String phone="";

                                    for (zhuhuTable z:list2
                                         ) {
                                        name=z.zhuhuName;
                                        phone=z.zhuhuPhone;
                                    }

                                    out.println("<tr id=\"tr"+m.id+"\">");
                                    out.println("<td>"+m.getId()+"</td>");
                                    out.println("<td>"+type+"</td>");
                                    out.println("<td>"+m.getZhuhuid()+"</td>");
                                    out.println("<td>"+name+"</td>");
                                    out.println("<td>"+phone+"</td>");
                                    out.println("<td>"+m.getYingmoney()+"</td>");
                                    if (m.getYingmoney()>m.getYimoney())
                                        out.println("<td style=\"color:red;\">"+m.getYimoney()+"</td>");
                                    else
                                        out.println("<td>"+m.getYimoney()+"</td>");
                                    out.println("<td>");
                                    out.println("<input onclick=\"openMyform(),changeName_up("+m.id+")\" class=\"btn btn-outline-primary\" type=\"button\" value=\"修改\">");
                                    out.println("<input name=\"" +m.id+ "\" onclick=\"del(this.name)\" class=\"btn btn-outline-danger\" type=\"submit\" value=\"删除\">");
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
            document.getElementById("tableName").innerText="添加缴费信息";
        }
        function changeName_up(myid) {
            document.getElementById("tijiao_up").style.display="inline-block";
            document.getElementById("tijiao").style.display="none";
            document.getElementById("cxtx").style.display="none";
            document.getElementById("tableName").innerText="修改缴费信息";

            document.getElementById("myLittleId").value=myid;

            var mytr=$("#tr"+myid).children("td");

            var type=mytr.eq(1).html();

            if (type=="水费"){
                type=1;
            }
            else if (type=="电费"){
                type=2;
            }
            else if (type=="供暖费"){
                type=3;
            }
            else if (type=="物业管理费"){
                type=4;
            }

            document.getElementById("type").value=type;
            document.getElementById("zhuhuid").value=mytr.eq(2).html();
            document.getElementById("yingMoney").value=mytr.eq(5).html();
            document.getElementById("yiMoney").value=mytr.eq(6).html();

        }

        /**********************************************************************************/
        $(document).ready(function () {
            $("#tijiao").click(function () {
                $.post("money.add",
                    {
                        type: $("#type").val(),
                        zhuhuid: $("#zhuhuid").val(),
                        yingMoney: $("#yingMoney").val(),
                        yiMoney: $("#yiMoney").val(),
                    },
                    function (data, status) {
                        alert(data);
                        var type=$("#type").val();
                        if (type==1)
                            type="water";
                        else if (type==2)
                            type="dian";
                        else if (type==3)
                            type="nuan";
                        else if (type==4)
                            type="wu";
                        window.location.replace("Table_money.jsp?type="+type);

                    });
            });
        });
        $(document).ready(function () {
            $("#tijiao_up").click(function () {




                $.post("money.up",
                    {
                        id:document.getElementById("myLittleId").value,
                        type: $("#type").val(),
                        zhuhuid: $("#zhuhuid").val(),
                        yingMoney: $("#yingMoney").val(),
                        yiMoney: $("#yiMoney").val()
                    },
                    function (data, status) {
                        alert(data);
                        var type=$("#type").val();
                        if (type==1)
                            type="water";
                        else if (type==2)
                            type="dian";
                        else if (type==3)
                            type="nuan";
                        else if (type==4)
                            type="wu";
                        window.location.replace("Table_money.jsp?type="+type);

                    });
            });
        });
        //判断地址栏
        function getQueryVariable(variable)
        {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }
        function del(id) {
            var r = confirm("是否确认删除");

          var type=getQueryVariable("type");

            if (r == true) {
                $.post("money.del",
                    {
                        myid: id,
                        type: type
                    },
                    function (data, status) {
                    alert(data)
                        window.location.replace("Table_money.jsp?type="+type);
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
                            <div class="col col-md-3"><label for="type" class=" form-control-label">缴费类型</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <select name="sex" id="type" class="form-control">
                                    <option value="0">请选择</option>
                                    <option value="1">水费</option>
                                    <option value="2">电费</option>
                                    <option value="3">暖气费</option>
                                    <option value="4">物业管理费</option>

                                </select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3"><label for="zhuhuid" class=" form-control-label">住户姓名</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <select name="sex" id="zhuhuid" class="form-control">
                                    <option value="0">请选择</option>
                                    <%
                                        List<zhuhuTable> list2= jdbcUtil.executeQuery(zhuhuTable.class,"select * from zhuhutable");
                                        for (zhuhuTable z:list2) {
                                            out.println("<option value=\""+z.getId()+"\">"+z.getZhuhuName()+"</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col col-md-3"><label for="yingMoney" class=" form-control-label">应交费用</label>
                            </div>
                            <div class="col-12 col-md-9"><input name="phone" type="text" id="yingMoney"
                                                                placeholder="请输入应交费用" class="form-control"></div>
                        </div>

                        <div class="row form-group">
                            <div class="col col-md-3"><label for="yiMoney" class=" form-control-label">已交费用</label>
                            </div>
                            <div class="col-12 col-md-9"><input name="phone" type="text" id="yiMoney"
                                                                placeholder="请输入已交费用" class="form-control"></div>
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

