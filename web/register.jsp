<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Movie</title>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/svwp_style.css" rel="stylesheet" type="text/css">
    <link href="css/hide.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.slideViewerPro.1.0.js" type="text/javascript"></script>
    <script src="js/jquery.timers.js" type="text/javascript"></script>
    <script src="js/popup2.js" type="text/javascript"></script>
</head>
<body>
<div id="templatemo_top_wrapper">
    <div id="templatemo_top">
        <ul id="social_box">
            <li><a href="javascript:void(0);" id="signin">登录</a></li>
            <li class="line"></li>
            <li class="last"><a href="javascript:void(0);" id="register">注册</a></li>
        </ul>
    </div>
</div>
<div id="hidden">
    <iframe src="home.jsp" width="100%" height="500px"></iframe>
</div>
<div id="checkin_wrap" class="popup_wrap">
    <p>注册账号</p>
    <form action="#" method="post">
        <label class="label" for="checkin_email">邮箱：</label>
        <input class="input" type="text" autocomplete="off " onblur="vallidateEmail()" id="checkin_email"
               name="email" value="" maxlength="50">
        <span class="message message1" type="text" style="display: none;">邮箱不能为空</span>
        <span class="message message2" type="text" style="display: none;">邮箱格式不正确</span>
        <label class="label" for="checkin_password">密码：</label>
        <input class="input" type="password" autocomplete="off" id="checkin_password" name="password" value=""
               maxlength="50">
        <br/>
        <br/>
        <br/>
        <input class="submit_register" id="btn_checkin" type="button" value="注册">
    </form>
</div>

<div id="signin_wrap" class="popup_wrap">
    <p>用户登录</p>
    <form action="#" method="post">
        <label class="label" for="signin_email">邮箱：</label>
        <input class="input" type="text" id="signin_email" name="email" value="" maxlength="50">
        <span class="message message3" style="display: none;">邮箱不能为空！</span>
        <label class="label" for="signin_password">密码：</label>
        <input class="input" type="password" id="signin_password" name="password" value="" maxlength="50">
        <span class="message message4" style="display: none;">密码不能为空！</span>
        <span class="message message5" style="display: none;">邮箱或密码错误</span>
        <br/>
        <br/>
        <input class="submit_login" id="btn_signin" type="button" value="登 录">
        <br/>
        <br/>
        <input class="submit_login_YK" id="btn_signin_YK" type="button" value="游客登录">
    </form>
</div>

<div id="black_overlay"></div>

</body>
</html>