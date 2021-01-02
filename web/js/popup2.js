$(document).ready(function () {

    /* open the popup window */
    $('#register').click(function () {
        popup_checkin_win();
        $('#signin_wrap').hide();
        return false;
    });

    $('#signin').click(function () {
        popup_signin_win();
        $('#checkin_wrap').hide();
        return false;
    });

    /* submit */
    $('#btn_checkin').click(function () {
        checkin_submit();
        return false;
    });

    $('#btn_signin').click(function () {
        signin_submit();
        return false;
    });
//排期更新
    $('#ScheduleUpdate').click(function () {
        ScheduleUpdate_submit();
        return false;
    });
    //   排期添加
    $('#ScheduleAdd').click(function () {
        ScheduleAdd_submit();
        return false;
    });

    $('#btn_signin_YK').click(function () {
        signin_YK_submit();
        return false;
    });

    /* close the popup window */
    $('.popup_wrap').click(function (e) {
        e.stopPropagation();
    });

});

function popup_checkin_win() {
    $('#checkin_wrap').slideDown();
}

//验证邮箱合法性
function vallidateEmail() {
    var checkin_email = document.getElementById("checkin_email").value;
    var pattern = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    if (checkin_email == '') {
        /*document.getElementById('checkin_email').value = "email不能为空";*/
        $('#checkin_wrap .message2').hide();
        $('#checkin_wrap .message1').show();

    } else if (!pattern.test(checkin_email)) {
        /* document.getElementById('checkin_email').value = "email格式不正确！";*/
        $('#checkin_wrap .message1').hide();
        $('#checkin_wrap .message2').show();
    } else {
        $('#checkin_wrap .message1').hide();
        $('#checkin_wrap .message2').hide();
    }

}

//注册点击验证是否已注册过
function checkin_submit() {
    if ($("#checkin_email").val() == '') {
        $("#checkin_email").val("不能为空");
    } else if ($("#checkin_password").val() == '') {
        $("#checkin_email").val("密码不能为空");
    } else {
        $.ajax({
            type: 'post',
            url: 'RegisterServlet',
            data: {
                'email': $("#checkin_email").val(),
                'password': $("#checkin_password").val()
            },
            dataType: "text",
            success: function (data) {
                if (data == "ok") {
                    //已存在
                    window.location.href = "login.jsp";
                } else {
                    $("#checkin_email").val("已存在");
                    $("#checkin_password").val("");
                    $("#checkin_email").focus().select();
                }
            }
        });
    }
}

function popup_signin_win() {
    $('#signin_wrap').slideDown();
}

//筛选电影      条件     当前页面     权限
function select(choose, currentPage, power) {
    //window.location.href = "my.jsp";
    window.location = "MovieServlet?choose=" + choose + "&currentPage=" + currentPage + "&power=" + power;
}

//筛选收藏夹     当前页面     用户id
function collect(currentPage, id) {
    window.location = "CollectServlet?currentPage=" + currentPage + "&id=" + id;
}

//电影详情          电影ID
function selectBYid(id, way,c_id) {
    window.location = "MovieIDServlet?id=" + id + "&way=" + way +"&c_id="+ c_id;
}

//订单          当前页面 用户id 权限
function order(currentPage, id, power) {
    window.location = "OrderServlet?currentPage=" + currentPage + "&id=" + id + "&power=" + power;
}

function show() {
    window.location = "SaleServlet";
}

//登录验证
function signin_submit() {
    if ($("#signin_email").val() == '') {
        $('#signin_wrap .message3').show();
        $('#signin_wrap .message4').hide();
        $('#signin_wrap .message5').hide();
    } else if ($("#signin_password").val() == '') {
        $('#signin_wrap .message4').show();
        $('#signin_wrap .message3').hide();
        $('#signin_wrap .message5').hide();
    } else {
        $('#signin_wrap .message3').hide();
        $('#signin_wrap .message4').hide();
        $('#signin_wrap .message5').hide();
        $.ajax({
            type: 'post',
            url: 'LoginServlet',
            data: {
                'email': $("#signin_email").val(),
                'password': $("#signin_password").val()
            },
            dataType: "json",
            success: function (response) {
                if (response.status == 1) {
                    window.location.href = "my.jsp";
                } else if (response.status == 3) {
                    window.location.href = "home.jsp";
                } else if (response.status == 2) {
                    window.location = "SaleServlet";
                } else {
                    $('#signin_wrap .message5').show();
                    $("#signin_password").val("");
                    $("#signin_email").focus().select();
                }
            }
        });
    }
}

//游客登录
function signin_YK_submit() {
    $('#signin_wrap .message3').hide();
    $('#signin_wrap .message4').hide();
    $('#signin_wrap .message5').hide();
    $.ajax({
        type: 'post',
        url: 'LoginServlet',
        data: {
            'email': 'lingshi',
            'password': '12345'
        },
        dataType: "json",
        success: function (response) {
            if (response.status == 0) {
                $('#signin_wrap .message5').show();
                $("#signin_password").val("");
                $("#signin_email").focus().select();
            } else if (response.status == 3) {
                window.location.href = "home.jsp";
            }
        }
        /* dataType: "text",
         success: function (data) {
             if (data == "home") {
                 window.location.href = "home.jsp";
             } else {
                 $('#signin_wrap .message5').show();
                 $("#signin_password").val("");
                 $("#signin_email").focus().select();
             }
         }*/
    });
}

//排期显示
function schedule(currentPage) {
    window.location = "ScheduleServlet?=currentPage" + currentPage;
}

function ScheduleAdd_submit() {
    window.location.href = "arrange02.jsp";
}

function ScheduleUpdate_submit() {
    $.ajax({
        type: 'post',
        url: 'ScheServlet',
        data: {
            'action':"update",
            'time_id': $("#ScheduleUpdate_s").val()
        },
        dataType: "text",
        success: function (data) {
            if (data == "ok") {
                window.location.href = "arrange01.jsp";
            } else {
                window.location.href = "arrange.jsp";
            }
        }
    });
}