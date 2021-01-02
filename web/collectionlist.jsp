<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Movie</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/popup2.js" type="text/javascript"></script>
</head>
<body>
<iframe src="head.jsp" frameborder="no" scrolling="no" width="100%" height="205px"></iframe>
<div id="templatemo_menu_wrapper">
    <div id="templatemo_menu">
        <ul>
            <li><a href="home.jsp">home</a></li>
            <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
            <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
            <li><a href="javascript:collect('1',${USER.id})" class="current">collectionlist</a></li>
            <li><a href="my.jsp">my</a></li>
        </ul>

    </div>
</div>
<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div class="post_box">
                <ul>
                    <c:if test="${not empty requestScope.pageBeancoll.list}">
                        <c:forEach items="${requestScope.pageBeancoll.list}" var="movie">
                            <li>
                                <div class="post_box">
                                    <h2><a href="javascript:selectBYid('${movie.id}','1',${USER.id})">${movie.name}</a>
                                    </h2>
                                    <div class="post_meta"><strong>上映日期:</strong>${movie.startdate}</div>
                                    <a href="#"><img alt="image" style="height: 100px;width: 180px"
                                                     src="images/${movie.poster}"></a>
                                    <p><em>${movie.name}</em></p>
                                    <p>主演：${movie.star}</p>
                                    <div class="category"><strong>类型: </strong>${movie.type}</div>
                                    <div><a href="CollServlet?cid=${USER.id}&mid=${movie.id}">
                                        <input id="dltwish" class="btn_shopping" type="button" value="删除"></a>
                                        <div class="cleaner"></div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <div align="center">
                    <a href="javascript:collect('${choose}','${pageBeancoll.beforePage}','${USER.power}')">上一页</a>
                    共${pageBeancoll.totalPages}页 共${pageBeancoll.totalRows}行
                    第${pageBeancoll.currentPage}页
                    每页${pageBeancoll.pageSize}行
                    <a href="javascript:collect('${choose}','${pageBeancoll.afterPage}','${USER.power}')">下一页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
</body>
</html>
