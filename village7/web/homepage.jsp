<%@ page import="vo.zhuhuTable" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.zhuhuTableDao" %>
<%@ page import="dao.moneyDao" %>
<%@ page import="vo.money" %>
<%@ page import="vo.weixiuTable" %>
<%@ page import="util.jdbcUtil" %>
<%@ page import="vo.kuaidi" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.weixiuTableDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dao.tubiaoDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/17
  Time: 16:31
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


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/normalize.css" /><!--CSS RESET-->
    <link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css"><!--演示页面样式，使用时可以不引用-->
    <link href="dist/camroll_slider.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">

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

    <style>
        #my-slider {
            width: 100%;
            height: 404px;
            color: #000;
        }

        @media (max-width: 640px) {
            #my-slider .crs-bar-roll-current {
                width: 38px;
                height: 38px;
            }

            #my-slider .crs-bar-roll-item {
                width: 30px;
                height: 30px;
            }
        }
        #myyemian{
            margin-top: -60px;
        }
        .blackk{
            color: #000;
        }


        .ZchartBox .item canvas {
            width: 100%;
            height: 100%;
        }
        @media only screen and (max-width: 419px) {
            .ZchartBox .item{width: 98%;height: 98%;}
        }
        @media only screen and (min-width: 420px) and (max-width: 1600px) {
            .ZchartBox .item{width: 44%;height: 44%;}
        }
        @media only screen and (min-width: 1601px) {
            .ZchartBox .item{width: 32.3%;height: 32.3%;}
        }

        #lineChartTag{
            height: 400px;
        }
    </style>
</head>

<body style="color: #000">

<div id="my-slider" class="crs-wrap">
    <div class="crs-screen">
        <div class="crs-screen-roll">
            <div class="crs-screen-item" style="background-image: url('images/1.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
            <div class="crs-screen-item" style="background-image: url('images/2.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
            <div class="crs-screen-item" style="background-image: url('images/5.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
            <div class="crs-screen-item" style="background-image: url('images/4.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
            <div class="crs-screen-item" style="background-image: url('images/3.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
            <div class="crs-screen-item" style="background-image: url('images/6.jpg')">
                <div class="crs-screen-item-content"><h1>Lorem...</h1></div>
            </div>
        </div>
    </div>
    <div class="crs-bar">
        <div class="crs-bar-roll-current"></div>
        <div class="crs-bar-roll-wrap">
            <div class="crs-bar-roll">
                <div class="crs-bar-roll-item" style="background-image: url('images/1.jpg')"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/2.jpg')"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/5.jpg')"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/4.jpg')"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/3.jpg')"></div>
                <div class="crs-bar-roll-item" style="background-image: url('images/6.jpg')"></div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="dist/camroll_slider.js"></script>
<script>
    $("#my-slider").camRollSlider();
</script>
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
                    <span class="name blackk">欢迎您:&nbsp;<%=request.getSession().getAttribute("username")%></span>
                </div>

                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                    </a>

                    <div class="user-menu dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(20px, 55px, 0px);">
                        <a class="nav-link" href="#"><i class="fa fa- user"></i>修改密码</a>
                        <a class="nav-link" href="login.del" onclick="delSession()"><i class="fa fa- user"></i>登出</a>

                    </div>
                </div>



            </div>
        </div>
    </header>


    <!-- /#header -->
    <!-- Breadcrumbs-->
    <div class="breadcrumbs">

            <!-- Widgets  -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-1">
                                    <i class="pe-7s-cash"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text">¥<span class="count"><%=tubiaoDao.selectYingMoneyCount()%></span></div>
                                        <div class="stat-heading">预收入金额</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-1">
                                    <i class="ti-money text-success border-success"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text">¥<span class="count"><%=tubiaoDao.selectYiMoneyCount()%></span></div>
                                        <div class="stat-heading">实际收入金额</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-3">
                                    <i class="pe-7s-browser"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span class="name"><%=tubiaoDao.selectMoneyBi()%></span>%</div>
                                        <div class="stat-heading">收费完成比率</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-4">
                                    <i class="pe-7s-users"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span class="count">
                                            <%

                                                Connection conn3 = jdbcUtil.getConnection();
                                                String sql3="select COUNT(*) from zhuhutable";
                                                PreparedStatement ps3 = conn3.prepareStatement(sql3);
                                                ResultSet result3=ps3.executeQuery();
                                                Integer count3=0;
                                                while (result3.next()){
                                                    count3=result3.getInt(1);
                                                }
                                                out.println(count3);
                                            %>

                                        </span></div>
                                        <div class="stat-heading">小区人数</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


    </div>
    <!-- /.breadcrumbs-->


    <script type="text/javascript" src="./ES5/z-chart.js"></script>


    <!-- Content -->
    <div class="content">
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
<%--                        <div class="item" id="lineChartTag">--%>
<%--                        </div>--%>
                        <div class="item" id="pieChart">
                        </div>
                    </div>
                </div><!-- /# column -->

                <div class="col-lg-6">
                    <div class="card">
                        <div class="item" id="circleChart">
                        </div>

                    </div><!-- /# card -->
                </div><!-- /# column -->
            </div>

            <div class="card">
                <div class="card-body">
                    <h4 class="box-title blackk">优秀住户</h4>
                </div>
                <div class="card-body--">
                    <div class="table-stats ov-h">
                        <table  class="table">
                            <tbody>

                            <%
                                List<zhuhuTable> list= zhuhuTableDao.selectByWhere("id>0 and id<7");
                                int money=200;
                                for (zhuhuTable z:list) {
                                    out.println("<tr><td class=\"serial\">"+z.id+".</td>");
                                    out.println("<td class=\"avatar\"><div class=\"round-img\"><a href=\"#\"><img class=\"rounded-circle\" src=\""+z.tupian+"\" alt=\"\"></a></div></td>");
                                    out.println("<td><span class=\"name\">"+z.getZhuhuName()+"</span></td>");
                                    out.println("<td><span class=\"name\">"+z.getZhuhuSex()+"</span></td>");
                                    out.println("<td> <span class=\"name\">"+z.getDanyuanNum()+"</span> </td>");
                                    out.println("<td><span class=\"name\">"+z.getMenpaiNum()+"</span>室</td>");
                                    out.println("<td>"+z.getZhuhuPhone()+"</td>");
                                    out.println("<td>奖励<span class=\"name\">"+money+"</span>元</td></tr>");
                                    money-=20;
                                }
                            %>
                            </tbody>
                        </table>
                    </div> <!-- /.table-stats -->
                </div>
            </div>

                <div class="row">
                    <div class="col-xl-6">


<%--                        <div class="card">--%>
<%--                            <div class="card-body">--%>
<%--                                <h4 class="box-title blackk">未及时缴费住户 </h4>--%>
<%--                            </div>--%>
<%--                            <div class="card-body--">--%>
<%--                                <div class="table-stats order-table ov-h">--%>
<%--                                    <table class="table ">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>

<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>



<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </div> <!-- /.table-stats -->--%>
<%--                            </div>--%>
<%--                        </div> <!-- /.card -->--%>
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">未及时缴费住户</strong>
                                    <div class="card-body">
                                        <table id="bootstrap-data-table" class="table table-striped ">
                                            <thead>
                                            <tr>
                                                <th>姓名</th>
                                                <th>联系方式</th>
                                                <th>住址</th>
                                                <th>欠费类型</th>
                                                <th>未缴纳数额</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                List<money> list2= moneyDao.selectNotMoney();
                                                for (money m:list2) {
                                                    List<zhuhuTable> list3= zhuhuTableDao.selectById(m.getZhuhuid());
                                                    String name="";
                                                    String phone="";
                                                    String tupian="";
                                                    String dan="";
                                                    String men="";
                                                    for (zhuhuTable z:list3) {
                                                        name=z.zhuhuName;
                                                        phone=z.zhuhuPhone;
                                                        tupian=z.tupian;
                                                        dan=z.getDanyuanNum();
                                                        men=z.menpaiNum;
                                                    }
                                                    String types=m.type;
                                                    String type="";
                                                    if (types.equals("water")){
                                                        type="水费";
                                                    }
                                                    else if (types.equals("dian")){
                                                        type="电费";
                                                    }
                                                    else if (types.equals("nuan")){
                                                        type="暖气费";
                                                    }
                                                    else if (types.equals("wu")){
                                                        type="物业管理费";
                                                    }
                                                    Integer jian=m.yingmoney-m.yimoney;
                                                    out.println("<td>"+name+"</td>");
                                                    out.println("<td>"+phone+"</td>");
                                                    out.println("<td>"+dan+men+"</td>");
                                                    out.println("<td>"+type+"</td>");
                                                    out.println("<td>-"+jian+"</td>");
                                                    out.println("</tr>");
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title blackk">需要维修的住户</h4>
                            </div>
                            <div class="card-body--">
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>住户姓名</th>
                                            <th>联系方式</th>
                                            <th>住址</th>
                                            <th>故障详情</th>
                                            <th>报修时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            Connection conn = jdbcUtil.getConnection();
                                            String sql="select * from weixiuTable";
                                            PreparedStatement ps = conn.prepareStatement(sql);
                                            ResultSet result=ps.executeQuery();
                                            while (result.next()){
                                                Integer id= result.getInt(2);
                                                List<zhuhuTable> list4= zhuhuTableDao.selectById(id);
                                                String name="";
                                                String phone="";
                                                String dan="";
                                                String men="";
                                                for (zhuhuTable z:list4) {
                                                    name=z.zhuhuName;
                                                    phone=z.zhuhuPhone;
                                                    dan=z.danyuanNum;
                                                    men=z.menpaiNum;
                                                }

                                                out.println("<tr>");
                                                out.println("<td>"+name+"</td>");
                                                out.println("<td>"+phone+"</td>");
                                                out.println("<td>"+dan+men+"</td>");
                                                out.println("<td>"+result.getObject(3)+"</td>");
                                                out.println("<td>"+result.getObject(4)+"</td>");
                                                out.println("</tr>");
                                            }

                                        %>

                                        </tbody>
                                    </table>
                                </div> <!-- /.table-stats -->
                            </div>
                        </div> <!-- /.card -->

                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title blackk" >需要取快递的住户</h4>
                            </div>
                            <div class="card-body--">
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>住户姓名</th>
                                            <th>联系方式</th>
                                            <th>住址</th>
                                            <th>快递编码</th>
                                            <th>取件码</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            Connection conn2 = jdbcUtil.getConnection();
                                            String sql2="select * from kuaidiTable";
                                            PreparedStatement ps2 = conn.prepareStatement(sql2);
                                            ResultSet result2=ps2.executeQuery();

                                            while (result2.next()){
                                                Integer id= result2.getInt(2);
                                                List<zhuhuTable> list5= zhuhuTableDao.selectById(id);
                                                String name="";
                                                String phone="";
                                                String dan="";
                                                String men="";
                                                for (zhuhuTable z:list5) {
                                                    name=z.zhuhuName;
                                                    phone=z.zhuhuPhone;
                                                    dan=z.danyuanNum;
                                                    men=z.menpaiNum;
                                                }

                                                out.println("<tr>");
                                                out.println("<td>"+name+"</td>");
                                                out.println("<td>"+phone+"</td>");
                                                out.println("<td>"+dan+men+"</td>");
                                                out.println("<td>"+result2.getObject(3)+"</td>");
                                                out.println("<td>"+result2.getObject(4)+"</td>");
                                                out.println("</tr>");
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                </div> <!-- /.table-stats -->
                            </div>
                        </div> <!-- /.card -->
                    </div>
                </div>

        </div><!-- .animated -->
    </div>
    <!-- /.content -->
    <div id="myyemian" class="clearfix"></div>



</div>
<!-- /#right-panel -->
<script>
    // 折线图
    var lineChartTagOption = {
        title: "一周销售额报表",
        xAxis: {
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '邮件营销',
            data: [820, 932, 901, 934, 1290, 1330, 1320],
            type: 'area',
            tag:'元'
        }]
    };

    //饼图
    var pieDatas = {
        title: "住户房屋类型报表",
        defalutIndex:0,
        type:"pie",//pie、circle
        data: [{ title: "20平米人数", num:<%=tubiaoDao.getNum20()%> }, { title: "45平米人数", num:<%=tubiaoDao.getNum45()%> }, { title: "50平米人数", num:<%=tubiaoDao.getNum50()%> }, { title: "60平米人数", num: <%=tubiaoDao.getNum60()%>}, { title: "80平米人数", num:<%=tubiaoDao.getNum80()%> },] ,
        callback:function(i){
            console.log(i);
        }
    }
    var pieDatas2 = {
        title: "未及时缴费人数报表",
        defalutIndex:0,
        type:"pie",//pie、circle
        data: [{ title: "水费人数", num:<%=tubiaoDao.getWater()%> }, { title: "电费人数", num:<%=tubiaoDao.getDian()%> }, { title: "暖气费人数", num:<%=tubiaoDao.getNuan()%> }, { title: "物业费人数", num:<%=tubiaoDao.getWu()%> }] ,
        callback:function(i){
            console.log(i);
        }
    }

    new pieChart("circleChart", {...pieDatas2,type:"circle"});
    new pieChart("pieChart", pieDatas);
</script>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-charts@0.8.3/excanvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-charts@0.8.3/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.time.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.stack.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.resize.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.crosshair.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot.curvedlines@1.1.1/curvedLines.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot.tooltip@0.9.0/js/jquery.flot.tooltip.min.js"></script>
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

<!--  Chart js
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>-->
<script type="text/javascript">
    $(document).ready(function() {
        $('#bootstrap-data-table-export').DataTable();
    } );
</script>
</body>
</html>
