<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Movie</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/manage.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/popup2.js" type="text/javascript"></script>
</head>
<style>
    #addbox {
        margin-left: 200px;
        width: 600px;
        box-sizing: content-box;
        text-align: left;
    }

    /*        div.container{
           margin: auto;
           text-align: left;
           } */
    .btn_add {
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        -ms-border-radius: 3px;
        -o-border-radius: 3px;
        border-radius: 3px;
        background-color: #e95a00;
        color: #fff;
        display: inline-block;
        height: 40px;
        line-height: 28px;
        text-align: center;
        transition: background-color 0.2s linear 0s;
        border: none;
        cursor: pointer;
        margin-top: 30px;
        font-size: 15px;;
        font-weight: bold;
    }

    input[type="text"], input[type="password"] {
        /*边框*/
        border-radius: 10px;
        /*阴影*/
        box-shadow: inset 0 5px 5px #eee;
        padding: 7px;
        /*边框阴影宽度*/
        border: 1px solid #D4D4D4;
        margin-top: 5px;
    }

    .area {
        width: 380px;
        height: 100px;
        /*边框*/
        border-radius: 10px;
        /*阴影*/
        box-shadow: inset 0 5px 5px #eee;
        padding: 7px;
        /*边框阴影宽度*/
        border: 1px solid #D4D4D4;
        margin-top: 5px;
    }

    .movielable {
        font-size: 20px;
    }

    #moviebt {
        display: inline-block;
        margin-left: 130px;
    }
</style>
<body>
<iframe src="head.jsp" frameborder="no" scrolling="no" width="100%" height="205px"></iframe>
<!--menu页头导航  -->
<div id="templatemo_menu_wrapper">
    <div id="templatemo_menu">
        <ul>
            <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
            <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
            <li><a href="javascript:schedule()" class="current">arrange</a></li>
            <li><a href="javascript:show()">show</a></li>
        </ul>
    </div> <!-- end of templatemo_menu -->
</div>

<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div id="addbox" class="container">
                <p id="header-wrapper"></p>
                <%-- <c:if test="${not empty SCHEDULE}">--%>
                <form action="ScheServlet" method="POST" id="movieform">
                    <table>
                        <p style="font-size: 25px;color: #e95a00;margin-left: 80px;"><strong>更新排期</strong></p>
                            <input type="text" style="font-size: 15px" hidden
                                       value="${SCHEDULE.time_id}" name="time_id"/>
                        <tr class="movielable">
                            <td>电影编号：</td>
                            <td><input type="text" style="font-size: 15px" value="${SCHEDULE.f_id}"
                                       name="f_id"/>
                            </td>
                        </tr>
                        <tr class="movielable">
                            <td>放映厅号：</td>
                            <td>
                                <c:if test="${SCHEDULE.room_id==1}">
                                    <input type="radio" style="font-size: 15px" name="room_id" checked value="1">1</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" value="2">2</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" value="3">3</input>
                                </c:if>
                                <c:if test="${SCHEDULE.room_id==2}">
                                    <input type="radio" style="font-size: 15px" name="room_id" value="1">1</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" checked value="2">2</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" value="3">3</input>
                                </c:if>
                                <c:if test="${SCHEDULE.room_id==3}">
                                    <input type="radio" style="font-size: 15px" name="room_id" value="1">1</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" value="2">2</input>
                                    <input type="radio" style="font-size: 15px" name="room_id" checked value="3">3</input>
                                </c:if>
                            </td>
                        </tr>
                        <tr class="movielable">
                            <td>放映日期：</td>
                            <td><input type="date" style="font-size: 15px"
                                       name="date" value="<fmt:formatDate value="${SCHEDULE.date}"
                            pattern="yyyy-MM-dd"/>"/>
                            </td>
                        </tr>
                        <tr class="movielable">
                            <td>开始小时：</td>
                            <td><input type="text" style="font-size: 15px" value="${SCHEDULE.start_h}"
                                       name="start_h"/>
                            </td>
                        </tr>
                        <tr class="movielable">
                            <td>开始分钟：</td>
                            <td><input type="text" style="font-size: 15px" value="${SCHEDULE.start_m}"
                                       name="start_m"/></td>
                        </tr>
                        <tr class="movielable">
                            <td>结束小时：</td>
                            <td><input type="text" style="font-size: 15px" value="${SCHEDULE.end_h}" name="end_h"/></td>
                        </tr>
                        <tr class="movielable">
                            <td>结束分钟：</td>
                            <td><input type="text" style="font-size: 15px" value="${SCHEDULE.end_m}"
                                       name="end_m"/></td>
                        </tr>
                        </td></tr>
                    </table>
                    <p id="moviebt">
                        <input type="submit" class="btn_add" name="action" value="update now">
                    </p>
                </form>
                <%-- </c:if>--%>
            </div> <!-- end of content -->
            <div class="cleaner"></div>
        </div> <!-- end of templatemo_middle -->
        <div id="templatemo_middle_bottom"></div>
        <!-- end of footer -->
    </div>
</div>

<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">wyxddnwfjwlt</a>
    </div>
</div>
</body>
</html>