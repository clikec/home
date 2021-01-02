<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈可后
  Date: 2020/12/26
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Movie Theater</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/svwp_style.css" rel="stylesheet" type="text/css">
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
                <c:when test="${USER.power==2}">
                    <li><a href="home.jsp" class="current">home</a></li>
                    <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
                    <li><a href="javascript:order(1,'${USER.id}',${USER.power})">order</a></li>
                    <li><a href="javascript:collect('1',${USER.id})">collectionlist</a></li>
                    <li><a href="my.jsp">my</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="home.jsp" class="current">home</a></li>
                    <li><a href="javascript:select('all','1',${USER.power})">movie</a></li>
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
                <div id="templatemo_slider">
                    <div id="featuredslideshow">
                        <ul>
                            <li><img width="600" height="300" alt="送你一朵小红花" src="images/slideshow/timg.jpg"/></li>
                            <li><img width="600" height="300" alt="许愿神龙" src="images/slideshow/timg03.jpg"/></li>
                            <li><img width="600" height="300" alt="温暖的抱抱" src="images/slideshow/timg06.jpg"/></li>
                            <li><img width="600" height="300" alt="悬崖上的金鱼姬" src="images/slideshow/timg05.jpg"/></li>
                            <li><img width="600" height="300" alt="晴雅集" src="images/slideshow/timg07.jpg"/></li>
                            <!-- eccetera -->
                        </ul>
                    </div>
                    <script type="text/javascript">
                        $("div#featuredslideshow").slideViewerPro({
                            thumbs: 4,
                            thumbsPercentReduction: 15,
                            galBorderWidth: 0,
                            galBorderColor: "#666",
                            thumbsTopMargin: 10,
                            thumbsRightMargin: 10,
                            thumbsBorderWidth: 1,
                            thumbsActiveBorderColor: "#000",
                            thumbsActiveBorderOpacity: 0.8,
                            thumbsBorderOpacity: 0,
                            buttonsTextColor: "#707070",
                            autoslide: true,
                            typo: true
                        });
                    </script>
                </div>

                <div class="cleaner"></div>

                <div class="post_box">

                    <h2><a>最近上映</a></h2>
                    <div class="post_meta"><strong>上映日期:</strong> 2020-12-31 | <strong>导演:</strong>韩延
                    </div>
                    <a><img alt="image" style="height: 150px;width: 280px" src="images/pict01.jpg"></a>
                    <img alt="image" style="height: 150px;width: 280px" src="images/redflower.jpg">
                    <p><em>两个抗癌家庭，两组生活轨迹。影片讲述了一个温情的现实故事，思考和直面了每一个普通人都会面临的终极问
                        题——想象死亡随时可能到来，我们唯一要做的就是爱和珍惜。</em></p>
                    <p> 《送你一朵小红花》是由韩延执导，易烊千玺、刘浩存领衔主演，朱媛媛、高亚麟主演，夏雨特别出演，岳云鹏友
                        情出演的剧情片，将于2020年12月31日上映。 该片围绕两个抗癌家庭的两组生活轨迹，讲述了一个温情的现实故事
                        ，思考和直面了每一个普通人都会面临的人生命题。 2020年12月26日，《送你一朵小红花》在预售票房破亿。 20
                        20年12月28日，官方发布“小太阳花”珍藏版海报。这张海报由著名设计师黄海亲自操刀制作。</p>
                    <div class="cleaner_h20"></div>
                    <div class="category"><strong>类型: </strong><a href="#">剧情</a>, <a href="#">家庭</a>
                    </div>
                    <div class="btn_more float_r"><a href="javascript:selectBYid('4','1')">Read more <span>»</span></a>
                    </div>
                    <div class="cleaner"></div>
                </div>
                <div class="post_box post_box_last">
                    <div class="post_meta"><strong>上映日期:</strong> 2020-12-31 | <strong>导演:</strong> 常远
                    </div>
                    <a href="#"><img alt="image" src="images/pict02.jpg"></a>

                    <p>《温暖的抱抱》是由常远执导，常远、李沁、沈腾、乔杉领衔主演，马丽、艾伦、田雨、王智、魏翔、王宁、黄 才
                        伦、张一鸣、王成思、张子栋、陈昊明主演的喜剧电影。 影片讲述了对整洁和计划有着超乎常人执念的鲍抱在 遇
                        到个性率真的宋温暖、妙手“神经”贾医生和假仁假义王为仁之后，上演了一段阴差阳错的喜剧故事。 2020年1 2月
                        27日，喜剧电影《温暖的抱抱》在北京举办首映礼。 该片定档2020年12月31日在中国上映。 对整洁和计划 有着
                        超乎常人执念的鲍抱(常远 饰)，本以为自己是一个友情爱情的绝缘体，但在遇到个性率真宋温暖(李沁 饰) 、妙手
                        “神经”贾医生(沈腾 饰)和假仁假义王为仁（乔杉 饰）之后，上演了一段阴差阳错的喜剧故事……</p>
                    <div class="cleaner_h20"></div>
                    <div class="category"><strong>类型: </strong><a href="#">喜剧</a></div>
                    <div class="btn_more float_r"><a href="javascript:selectBYid('3','1')">Read more <span>»</span></a>
                    </div>
                    <div class="cleaner"></div>

                </div>

            </div> <!-- end of content -->

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
                        <a href="javascript:selectBYid('6','1')">疯狂动物城</a>
                        <p>《疯狂动物城》由迪士尼影业出品的3D动画片，由里奇·摩尔、拜恩·霍华德及杰拉德·布什联合执导。该片讲述
                            了在一个 所有动物和平共处的动物城市，兔子朱迪通过自己努力奋斗完成自己儿时的梦想，成为动物警察的故
                            事。</p>
                    </div>
                    <div class="recent_comment_box">
                        <a href="javascript:selectBYid('7','1')">海上钢琴师</a>
                        <p>《海上钢琴师》是由朱塞佩·托纳托雷执导，蒂姆·罗斯、比尔·努恩、梅兰尼·蒂埃里主演的剧情片，讲述了一
                            个被命名为“1900”的弃 婴在一艘远洋客轮上与钢琴结缘，成为钢琴大师的传奇故事。
                        </p>
                    </div>

                    <div class="recent_comment_box">
                        <a href="javascript:selectBYid('8','1')">飞屋环游记</a>
                        <p> 《飞屋环游记》讲述了一个 老人曾经与老伴约定去一座坐落在遥远南美洲的瀑布旅行，却因为生活奔波 一直
                            未 能成行，直到政府要强拆自己的老屋时才决定带着屋子一起飞向瀑布，路上与结识的小胖子罗素一起冒险的
                            经历。
                        </p>
                    </div>

                    <div class="recent_comment_box">
                        <a href="javascript:selectBYid('9','1')">怦然心动</a>
                        <p>《怦然心动》是由罗伯·莱纳执导，玛德琳·卡罗尔、卡兰·麦克奥利菲主演影片。该片根据文德琳·范·德拉安南
                            的同 名原著小说改编，描述了青春期中男孩女孩之间的有趣战争。</p>
                    </div>

                </div>

                <div class="cleaner"></div>

            </div>

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
