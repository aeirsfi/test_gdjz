<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ch">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="左右结构项目，属于大人员的社交工具">
    <meta name="keywords" content="左右结构项目 社交 占座 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>门户后台管理</title>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/source/layer-v3.1.1/layer/layer.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/layer.css">

    <script>
        $(function() {
            $(".meun-item").click(function() {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function() {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function() {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function() {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function() {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function() {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/jquery.nouislider.css">

</head>

<body>
<script>
$(function () {
    $("#changePwdBtn").click(function () {
        var originalPwd = $("#originalPwd").val();
        var newPwd = $("#newPwd").val();
        var newPwdAgain = $("#newPwdAgain").val();

        $.ajax({
            type : "post",
            url : "changePwd.do",
            data : {originalPwd : originalPwd, newPwd : newPwd, newPwdAgain : newPwdAgain},
            dataType : "text",

            success : function (data) {
                layer.msg(data);

                if (data == "密码修改成功！") {
                    window.location.reload();
                }
            }
        });
    })
})
</script>
<div class="check-div">
    登录id为：${userId}
</div>
<div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
    <form class="form-horizontal" id="changePwdForm">
        <div class="form-group">
            <label for="originalPwd" class="col-xs-4 control-label">原密码：</label>
            <div class="col-xs-5">
                <input type="password" class="form-control input-sm duiqi" id="originalPwd" placeholder="" style="margin-top: 7px;" name="originalPwd">
            </div>
        </div>
        <div class="form-group">
            <label for="newPwd" class="col-xs-4 control-label">新密码：</label>
            <div class="col-xs-5">
                <input type="password" class="form-control input-sm duiqi" id="newPwd" placeholder="" style="margin-top: 7px;" name="newPwd">
            </div>
        </div>
        <div class="form-group">
            <label for="newPwdAgain" class="col-xs-4 control-label">重复密码：</label>
            <div class="col-xs-5">
                <input type="password" class="form-control input-sm duiqi" id="newPwdAgain" placeholder="" style="margin-top: 7px;" name="newPwdAgain">
            </div>
        </div>
        <div class="form-group text-right">
            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                <%--<button type="reset" class="btn btn-xs btn-white">取 消</button>--%>
                <button type="button" class="btn btn-xs btn-green" id="changePwdBtn">保存</button>
            </div>
        </div>
    </form>
</div>

</div>
<script src="js/jquery.nouislider.js"></script>
</body>

</html>