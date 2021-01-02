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
            <li><a href="javascript:collect('1',${USER.id})">collectionlist</a></li>
            <li><a href="my.jsp" class="current">my</a></li>
        </ul>
    </div>
</div>
<div class="container-wrap">
    <div id="fh5co-contact">
        <div class="row" align="center">
            <div class="col-md-2 col-md-push-1 animate-box">
            </div>
            <div class="col-md-6 col-md-push-1 animate-box">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">邮箱：</label>
                            <input type="text" style="width: 300px;height: 40px" name="email" id="email"
                                   class="form-control" value="${USER.email}" disabled="disabled">
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">昵称：</label>
                            <input type="text" style="width: 300px;height: 40px" name="username" id="username"
                                   class="form-control" value="${USER.username}" placeholder="<未填写该信息>(必填)"
                                   disabled="disabled">
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="sex" class="col-sm-3 control-label">性别：</label>
                            <input type="text" style="width: 300px;height: 40px" id="sex" name="sex"
                                   class="form-control" value="${USER.sex}" placeholder="<未填写该信息>" disabled="disabled">
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="phone" class="col-sm-3 control-label">电话：</label>
                            <input type="text" style="width: 300px;height: 40px" name="phone" id="phone"
                                   class="form-control" value="${USER.phone}" placeholder="<未填写该信息>"
                                   disabled="disabled">
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-12" id="oldpwd"></div>
                    <div class="col-md-12" id="newpwd"></div>
                    <div class="col-md-12" id="renewpwd"></div>
                    <br/>
                    <br/>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-9">
                                <input type="button" value="修改信息" id="update"
                                       class="btn btn-primary btn-modify col-sm-3">
                                <input type="button" value="保存修改" id="save"
                                       class="btn btn-primary btn-modify col-sm-3" disabled="disabled">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- END container-wrap -->
<br/>
<br/>
<br/>
<div id="templatemo_copyright_wrapper">
    <div id="templatemo_copyright">
        Copyright © 2048 <a href="#">let's ge to the Theater</a>
    </div>
</div>
<script>
    $('#update').click(function () {
        $("input[type=text]").attr("disabled", false);
        $("input[name=email]").attr("disabled", true);
        this.setAttribute("disabled", true);
        $('#save').attr("disabled", false);
        var html1 = "<div class='form-group'><label for='' class='col-sm-3 control-label'>";
        var html2 = "原密码:";
        var html3 = "</label>";
        var html4 = "<input type='text' style='width: 300px;height: 40px' name='oldpassword' class='form-control' placeholder='请输入原密码(必填)'>";
        var html5 = "</div><br/>";
        document.getElementById("oldpwd").innerHTML = html1 + html2 + html3 + html4 + html5;
        html2 = "新密码:";
        html4 = "<input type='text' style='width: 300px;height: 40px' name='newpassword' class='form-control' placeholder='请输入新密码(必填)'>";
        document.getElementById("newpwd").innerHTML = html1 + html2 + html3 + html4 + html5;
        html2 = "确认密码:";
        html4 = "<input type='text' style='width: 300px;height: 40px' name='renewpassword' class='form-control' placeholder='请再次输入原密码(必填)'>";
        document.getElementById("renewpwd").innerHTML = html1 + html2 + html3 + html4 + html5;
    });

    $('#save').click(function () {
        var username = $("input[name=username]").val();
        var sex = $("input[name=sex]").val();
        var phone = $("input[name=phone]").val();
        var oldpassword = $("input[name=oldpassword]").val();
        var newpassword = $("input[name=newpassword]").val();
        var renewpassword = $("input[name=renewpassword]").val();
        var email= $("input[name=email]").val();
        if (!username || !oldpassword || !newpassword || !renewpassword) {
            alert('必填字段字段不能为空');
            return false;
        }
        if (newpassword != renewpassword) {
            alert('密码不一致');
            return false;
        }
        $.ajax({
            type: 'post',
            url: 'MyMessageServlet',
            dataType: 'text',
            data: {
                email:email,
                username: username,
                phone: phone,
                sex: sex,
                password: oldpassword,
                newpassword: newpassword
            },
            success: function (data) {
                if (data == "ok") {
                    alert('修改成功');
                    $("input[type=text]").attr("disabled", false);
                    window.location.href = 'home.jsp';
                }else if (data == "error") {
                    alert('原密码不正确');
                }else if(data == "false"){
                    alert('修改失败');
                }
            }
        });
    });
</script>
</body>
</html>