<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Movie</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/manage.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/popup2.js" type="text/javascript"></script>
</head>
<body>
<iframe src="head.jsp" frameborder="no" scrolling="no" width="100%" height="205px"></iframe>
<div id="templatemo_menu_wrapper">
    <div id="templatemo_menu">
        <ul>
            <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
            <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
            <li><a href="javascript:schedule()">arrange</a></li>
            <li><a href="javascript:show()" class="current">show</a></li>
        </ul>
    </div>
</div>
<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="box1" style="height: 100%"></div> <!-- end of content -->
        <div id="box2" style="height: 100%"></div>
    </div>
</div>
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@4/dist/echarts.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl@1/dist/echarts-gl.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat@1/dist/ecStat.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@4/dist/extension/dataTool.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@4/map/js/china.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@4/map/js/world.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@4/dist/extension/bmap.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("box1");
    var myChart = echarts.init(dom);
    var app = {};
    option = {
        backgroundColor: '#2c343c',
        title: {
            text: '销售数量统计',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [
                <c:forEach items="${SaleList}" var="s">
                ["${s.name}"],
                </c:forEach>
            ]
        },
        series: [
            {
                name: '销售比例',
                type: 'pie',
                radius: '55%',
                center: ['50%', '50%'],
                data: [
                    <c:forEach items="${SaleList}" var="s">
                    {value: "${s.num}", name: "${s.name}"},
                    </c:forEach>
                ],
                itemStyle: {
                    color: '#c23531',
                    shadowBlur: 200,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                },
                labelLine: {
                    lineStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    },
                    smooth: 0.2,
                    length: 10,
                    length2: 20
                },
                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
<script type="text/javascript">
    var dom = document.getElementById("box2");
    var myChart = echarts.init(dom);
    var app = {};
    option = {
        backgroundColor: '#2c343c',
        title: {
            text: '销售金额统计',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [
                <c:forEach items="${SaleList}" var="s">
                ["${s.name}"],
                </c:forEach>
            ]
        },
        series: [
            {
                name: '销售比例',
                type: 'pie',
                radius: '55%',
                center: ['50%', '50%'],
                data: [
                    <c:forEach items="${SaleList}" var="s">
                    {value: "${s.num*s.price}", name: "${s.name}"},
                    </c:forEach>
                ],
                itemStyle: {
                    color: '#c23531',
                    shadowBlur: 200,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                },
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>
