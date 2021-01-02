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
<body>
<iframe src="head.jsp" frameborder="no" scrolling="no" width="100%" height="205px"></iframe>
<div id="templatemo_menu_wrapper">
    <div id="templatemo_menu">
        <ul>
            <c:choose>
                <c:when test="${USER.power==1}">
                    <li><a href="javascript:select('all','1',${USER.power})" >movie</a></li>
                    <li><a href="javascript:order(1,'${USER.id}',${USER.power})" class="current">order</a></li>
                    <li><a href="javascript:schedule()">arrange</a></li>
                    <li><a href="javascript:show()">show</a></li>
                </c:when>
                <c:when test="${USER.power==2}">
                    <li><a href="home.jsp">home</a></li>
                    <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
                    <li><a href="javascript:order(1,'${USER.id}',${USER.power})" class="current">order</a></li>
                    <li><a href="javascript:collect('1',${USER.id})">collectionlist</a></li>
                    <li><a href="my.jsp">my</a></li>
                </c:when>
            </c:choose>
        </ul>
    </div>
</div>
<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div id="post_box">
                <c:if test="${not empty requestScope.pageBeandd.list}">
                    <c:choose>
                        <c:when test="${USER.power==2}">
                            <table class="tableorder">
                                <tr id="tablemenu">
                                    <th>电影名称</th>
                                    <th>放映厅</th>
                                    <th>座位号</th>
                                    <th>观看日期</th>
                                    <th>开始放映时间</th>
                                    <th>结束放映时间</th>
                                    <th>购买日期</th>
                                </tr>
                                <c:forEach items="${requestScope.pageBeandd.list}" var="ddm">
                                    <tr>
                                        <td>${ddm.name}</td>
                                        <td>${ddm.room_id}</td>
                                        <td>${ddm.s_id}</td>
                                        <td>${ddm.watchdate}</td>
                                        <td>${ddm.start_h}:${ddm.start_m}</td>
                                        <td>${ddm.end_h}:${ddm.end_m}</td>
                                        <td>${ddm.buydate}</td>
                                        <form action="OrdServlet">
                                            <input type="hidden" name="o_id" value="${ddm.o_id}">
                                            <td><input type="submit" name="action"
                                                       class="btn_operation" value="取消订单">
                                            </td>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <table class="tableorder">
                                <tr id="tablemenu">
                                    <th>订单编号</th>
                                    <th>购票日期</th>
                                    <th>用户编号</th>
                                    <th>支付方式</th>
                                    <th>排期编号</th>
                                </tr>
                                <c:forEach items="${requestScope.pageBeandd.list}" var="ddm">
                                    <tr>
                                        <td>${ddm.o_id}</td>
                                        <td>${ddm.buydate}</td>
                                        <td>${ddm.c_id}</td>
                                        <td>${ddm.way_of_pay}</td>
                                        <td>${ddm.time_id}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <div align="center">
                    <a href="javascript:order('${pageBeandd.beforePage}','${USER.id}','${USER.power}')">上一页</a>
                    共${pageBeandd.totalPages}页 共${pageBeandd.totalRows}行
                    第${pageBeandd.currentPage}页
                    每页${pageBeandd.pageSize}行
                    <a href="javascript:order('${pageBeandd.afterPage}','${USER.id}','${USER.power}')">下一页</a>
                </div>
            </div> <!-- end of content -->
            <div class="cleaner"></div>
        </div> <!-- end of templatemo_middle -->
        <div id="templatemo_middle_bottom"></div>
        <!-- end of footer -->
    </div>
</div>
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
</body>
</html>
