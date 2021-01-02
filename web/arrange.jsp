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
            <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
            <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
            <li><a href="javascript:schedule()" class="current">arrange</a></li>
            <li><a href="javascript:show()">show</a></li>
        </ul>
    </div>
</div>
<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div id="post_box">
                <c:if test="${not empty requestScope.pageBeanSchedule}">
                    <table class="tableorder">
                        <tr id="tablemenu">
                            <th>排期编号</th>
                            <th>电影</th>
                            <th>电影厅</th>
                            <th>日期</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                        </tr>
                        <c:forEach items="${requestScope.pageBeanSchedule.list}" var="s">
                            <tr>
                                <td>${s.time_id}</td>
                                <td>${s.f_id}</td>
                                <td>第${s.room_id}影厅</td>
                                <td>${s.date}</td>
                                <td>${s.start_h}:${s.start_m}</td>
                                <td>${s.end_h}:${s.end_m}</td>
                                <form action="ScheServlet">
                                    <input type="hidden" name="time_id" value="${s.time_id}">
                                    <td><input type="submit" name="action"
                                               class="btn_operation" value="delete">
                                    </td>
                                </form>
                                <input type="hidden" id="ScheduleUpdate_s" name="id" value="${s.time_id}">
                                <td><input type="button" id="ScheduleUpdate" name="action"
                                           class="btn_operation" value="更新">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
                <div align="center">
                    <a href="javascript:schedule('${pageBeanSchedule.beforePage}')">上一页</a>
                    共${pageBeanSchedule.totalPages}页 共${pageBeanSchedule.totalRows}行
                    第${pageBeanSchedule.currentPage}页
                    每页${pageBeanSchedule.pageSize}行
                    <a href="javascript:schedule('${pageBeanSchedule.afterPage}')">下一页</a>
                    <td><input type="button" name="action" id="ScheduleAdd"
                               class="btn_operation" value="添加">
                    </td>
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
