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
                    <li><a href="javascript:select('all','1',${USER.power})" class="current">movie</a></li>
                    <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
                    <li><a href="javascript:schedule()">arrange</a></li>
                    <li><a href="javascript:show()">show</a></li>
                </c:when>
                <c:when test="${USER.power==2}">
                    <li><a href="home.jsp">home</a></li>
                    <li><a href="javascript:select('all','1',${USER.power})" class="current">movie</a></li>
                    <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
                    <li><a href="javascript:collect('1',${USER.id})">collectionlist</a></li>
                    <li><a href="my.jsp">my</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="home.jsp">home</a></li>
                    <li><a href="javascript:select('all','1',${USER.power})" class="current">movie</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<!--middle主要内容  -->
<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div id="templatemo_content">
                <c:if test="${not empty requestScope.pageBean.list}">
                    <c:choose>
                        <c:when test="${USER.power==1}">
                            <table class="tableorder">
                                <tr id="tablemenu">
                                    <th>影片编号</th>
                                    <th>影片名</th>
                                    <th>主演</th>
                                    <th>导演</th>
                                    <th>片长</th>
                                    <th>类型</th>
                                    <th>海报</th>
                                </tr>
                                <c:forEach items="${requestScope.pageBean.list}" var="movie">
                                    <tr>
                                        <th>${movie.id}</th>
                                        <td><a href="javascript:selectBYid('${movie.id}','1',${USER.id})">${movie.name}</a></td>
                                        <td>${movie.star}</td>
                                        <td>${movie.director}</td>
                                        <td>${movie.duration}</td>
                                        <td>${movie.type}</td>
                                        <td><img style=" height: 100px;width: 180px" src="images/${movie.poster}">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.pageBean.list}" var="movie">
                                <div class="post_box post_box_last">
                                    <h2><a href="javascript:selectBYid('${movie.id}','1',${USER.id})">${movie.name}</a></h2>
                                    <div class="post_meta"><strong>上映日期:</strong> ${movie.startdate} |
                                        <strong>导演:</strong> ${movie.director}
                                    </div>
                                    <a href="#"><img alt="image" style="height: 150px;width: 280px"
                                                     src="./images/${movie.poster}"></a>
                                    <p>${movie.description}</p>
                                    <div class="cleaner_h20"></div>
                                    <div class="category"><strong>类型: </strong>${movie.type}</div>
                                    <div class="btn_more float_r"><a href="javascript:selectBYid('${movie.id}','1',${USER.id})">Read more
                                        <span>»</span></a>
                                    </div>
                                    <div class="cleaner"></div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <div align="center">
                    <a href="javascript:select('${choose}','${pageBean.beforePage}','${USER.power}')">上一页</a>
                    共${pageBean.totalPages}页 共${pageBean.totalRows}行
                    第${pageBean.currentPage}页
                    每页${pageBean.pageSize}行
                    <a href="javascript:select('${choose}','${pageBean.afterPage}','${USER.power}')">下一页</a>
                </div>
            </div>
        </div>
        <div id="templatmeo_sidebar">
            <div class="sidebar_box">
                <h4>分类</h4>
                <ul class="tmo_list">
                    <li><a href="javascript:select('喜剧','1',${USER.power})">喜剧</a></li>
                    <li><a href="javascript:select('家庭','1',${USER.power})">家庭</a></li>
                    <li><a href="javascript:select('动画','1',${USER.power})">动画</a></li>
                    <li><a href="javascript:select('奇幻','1',${USER.power})">奇幻</a></li>
                    <li><a href="javascript:select('剧情','1',${USER.power})">剧情</a></li>
                    <li><a href="javascript:select('爱情','1',${USER.power})">爱情</a></li>
                </ul>
            </div>

            <div class=" sidebar_box">
                <ul class="ads_125">
                    <li><a href="#"><img style="width: 125px;height: 125px" alt="CSS Templates"
                                         src="images/01.jpg"></a>
                    </li>
                    <li class="odd"><a href="#"><img style="width: 125px;height: 125px" alt="banner"
                                                     src="images/02.jpg"></a></li>
                    <li class="last_row"><a href="http://www.cssmoban.com/"><img
                            style="width: 125px;height: 125px"
                            alt="banner"
                            src="images/04.jpg"></a></li>
                    <li class="odd last_row"><a href="#"><img style="width: 125px;height: 125px" alt="banner"
                                                              src="images/03.jpg"></a></li>
                </ul>
                <div class="cleaner"></div>
            </div>

            <div class="sidebar_box">
                <h4>口碑回归</h4>
                <div class="recent_comment_box">
                    <a href="javascript:selectBYid('6','1',${USER.id})">疯狂动物城</a>
                    <p>《疯狂动物城》由迪士尼影业出品的3D动画片，由里奇·摩尔、拜恩·霍华德及杰拉德·布什联合执导。该片讲述
                        了在一个 所有动物和平共处的动物城市，兔子朱迪通过自己努力奋斗完成自己儿时的梦想，成为动物警察的故
                        事。</p>
                </div>
                <div class="recent_comment_box">
                    <a href="javascript:selectBYid('7','1',${USER.id})">海上钢琴师</a>
                    <p>《海上钢琴师》是由朱塞佩·托纳托雷执导，蒂姆·罗斯、比尔·努恩、梅兰尼·蒂埃里主演的剧情片，讲述了一
                        个被命名为“1900”的弃 婴在一艘远洋客轮上与钢琴结缘，成为钢琴大师的传奇故事。
                    </p>
                </div>

                <div class="recent_comment_box">
                    <a href="javascript:selectBYid('8','1',${USER.id})">飞屋环游记</a>
                    <p> 《飞屋环游记》讲述了一个 老人曾经与老伴约定去一座坐落在遥远南美洲的瀑布旅行，却因为生活奔波 一直
                        未 能成行，直到政府要强拆自己的老屋时才决定带着屋子一起飞向瀑布，路上与结识的小胖子罗素一起冒险的
                        经历。
                    </p>
                </div>

                <div class="recent_comment_box">
                    <a href="javascript:selectBYid('9','1',${USER.id})">怦然心动</a>
                    <p>《怦然心动》是由罗伯·莱纳执导，玛德琳·卡罗尔、卡兰·麦克奥利菲主演影片。该片根据文德琳·范·德拉安南
                        的同 名原著小说改编，描述了青春期中男孩女孩之间的有趣战争。</p>
                </div>

            </div>

            <div class="cleaner"></div>

        </div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo_middle -->
    <div id="templatemo_middle_bottom"></div>
</div><!-- end of templatemo_middle_wrapper_inner -->
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
</body>
</html>
