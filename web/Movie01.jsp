<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>info</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/svwp_style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/bt.css"/>
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.slideViewerPro.1.0.js" type="text/javascript"></script>
    <script src="js/jquery.timers.js" type="text/javascript"></script>
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
                    <li><a href="arrange.jsp">arrange</a></li>
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

<div id="templatemo_middle_wrapper_outer">
    <div id="templatemo_middle_wrapper_inner">
        <div id="templatemo_middle_top"></div>
        <div id="templatemo_middle">
            <div id="templatemo_content">
                <div class="post_box">
                    <h2>${MOVIE.name}</h2>
                    <div class="post_meta"><strong>上映日期:</strong> ${MOVIE.startdate} |
                        <strong>价格:</strong> ${MOVIE.price}
                        | <strong>导演:</strong> ${MOVIE.director}
                    </div>
                    <a href="#"><img alt="image" style="height: 100px;width: 180px" src="images/${MOVIE.poster}"></a>
                    <p>${MOVIE.description}</p>
                    <div class="category"><strong>类型: </strong><a
                            href="javascript:select('${MOVIE.type}','1',${USER.power})">${MOVIE.type}</a>
                        <div id="shopping_box">
                            <ul id="shopping_line">
                                <c:if test="${USER.power==2}">
                                    <li><a href="javascript:selectBYid('${MOVIE.id}','2',${USER.id})"> <input
                                            class="btn_shopping" type="button"
                                            value="购买"></a>
                                    </li>
                                    <c:choose>
                                        <c:when test="${COLLed==1}">
                                            <li><a> <input class="btn_shopping" type="button" value="已收藏"></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="javascript:selectBYid('${MOVIE.id}','3',${USER.id})"> <input
                                                    class="btn_shopping" type="button"
                                                    value="收藏"></a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="cleaner"></div>
                    <!-- 用户评论 -->
                    <div><h2>128 comments</h2></div>
                    <div id="comment_section">
                        <ol class="comments first_level">
                            <li>
                                <div class="comment_box commentbox1">
                                    <div class="gravatar">
                                        <img src="images/comments/people1.jpg" alt="author"/>
                                    </div>
                                    <div class="comment_text">
                                        <div class="comment_author">Wfj<span class="date">May 28, 2048</span><span
                                                class="time">11:40 PM</span></div>
                                        <p>So long as there are people, there will be love stories -- I hope they all
                                            feel
                                            as lush and lively as this one.
                                    </div>
                                    <div class="cleaner"></div>
                                </div>
                            </li>
                            <li>
                                <div class="comment_box commentbox1">
                                    <div class="gravatar">
                                        <img src="images/comments/people5.jpg" alt="author 3"/>
                                    </div>
                                    <div class="comment_text">
                                        <div class="comment_author">Jw<span class="date">May 31, 2048</span><span
                                                class="time">06:45 AM</span></div>
                                        <p>While the sequel should have fans squealing, New Moon probably won't convert
                                            too
                                            many holdouts.</p>
                                    </div>
                                    <div class="cleaner"></div>
                                </div>
                            </li>
                            <li>
                                <div class="comment_box commentbox1">
                                    <div class="gravatar">
                                        <img src="images/comments/people6.jpg" alt="author 3"/>
                                    </div>
                                    <div class="comment_text">
                                        <div class="comment_author">Dxl<span class="date">May 31, 2048</span><span
                                                class="time">06:45 AM</span></div>
                                        <p>Two hours and 10 minutes of rambling, pointless drivel, where nothing of any
                                            real
                                            interest happens.</p>
                                    </div>
                                    <div class="cleaner"></div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div> <!-- end of content -->
            </div> <!-- end of templatemo_middle -->
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

                <div class="sidebar_box">
                    <ul class="ads_125">
                        <li><a href="#"><img style="width: 125px;height: 125px" alt="CSS Templates" src="images/01.jpg"></a>
                        </li>
                        <li class="odd"><a href="#"><img style="width: 125px;height: 125px" alt="banner"
                                                         src="images/02.jpg"></a></li>
                        <li class="last_row"><a href="http://www.cssmoban.com/"><img style="width: 125px;height: 125px"
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
        </div>
        <div id="templatemo_middle_bottom"></div>
    </div>
</div>
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
</body>
<script type="text/javascript">
    //刷新上级页面
    //window.parent.main.document.location.reload();
    //刷新当前页面
    /*document.location.reload();*/
</script>
</html>