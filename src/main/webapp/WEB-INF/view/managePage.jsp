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

    <script>
        // function keyup_submit(e) {
        //     var evt = window.event || e;
        //
        //     if (evt.keyCode == 13) {
        //         debugger;
        //         $("#toLinkManage")[0].contentWindow.search();
        //         // $('#tb_departments').bootstrapTable("refresh");
        //     }
        // }

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
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="左右结构项目" src="/images/logo.png"><span>门户管理</span></p>
        </div>
        <div class="meun-title">账号管理</div>
        <%--<div class="meun-item meun-item-active" data-type="sour" href="#news" aria-controls="sour" role="tab" data-toggle="tab"><img src="images/icon_source.png">资源管理</div>--%>
        <!-- <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">权限管理</div> -->
        <div class="meun-item meun-item-active" data-type="user" href="#news" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">用户管理</div>
        <div class="meun-item" data-type="pic" href="#news" aria-controls="pic" role="tab" data-toggle="tab"><img src="images/icon_house_grey.png">图片管理</div>
        <div class="meun-item" data-type="link" href="#news" aria-controls="link" role="tab" data-toggle="tab"><img src="images/icon_rule_grey.png">链接管理</div>
        <div class="meun-item" data-type="article" href="#news" aria-controls="article" role="tab" data-toggle="tab"><img src="images/icon_card_grey.png">文章管理</div>
        <div class="meun-item" data-type="news" href="#news" id="news_btn" aria-controls="news" role="tab" data-toggle="tab"><img src="images/icon_char_grey.png">新闻管理</div>
        <div class="meun-item" data-type="chan" href="#news" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改密码</div>
    </div>
    <input type="hidden" id="hiddenId" value="1">
    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <%--<div role="tabpanel" class="tab-pane" id="user">--%>
            <%--<iframe src="/toUserManage.do" style="width: 100%;height: 100%;"></iframe>--%>
            <%--</div>--%>
            <%--<div id="article" role="tabpanel" class="tab-pane">--%>
            <%--<iframe src="/toArticleManage.do" style="width: 100%;height: 100%;">--%>

            <%--</iframe>--%>
            <%--</div>--%>
            <div style="text-align: right; background-color: #4d5e70;height: 70px;">
                <li class="dropdown" >
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <font color="#fff" size="4">${loginName}</font>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="javascript:$('#toLinkManage').attr('src','/toUserInfor.do');">个人信息</a></li>

                        <li><a href="/toLogout.do">退出登录</a></li>

                    </ul>
                </li>
            </div>

            <div id="news" role="tabpanel" class="tab-pane">
                <iframe src="/toUserManage.do" id="toLinkManage" style="width: 100%;height: 100%;"></iframe>
            </div>
            <%--<div role="tabpanel" class="tab-pane" id="pic">--%>
            <%--<iframe src="/toPictureManage.do" style="width: 100%;height: 100%;">--%>
            <%--</iframe>--%>
            <%--</div>--%>
            <%--<div id="link" role="tabpanel" class="tab-pane">--%>
            <%--<iframe src="/toLinkManage.do" style="width: 100%;height: 100%;">--%>

            <%--</iframe>--%>
            <%--</div>--%>
            <%--<div id="chan" role="tabpanel" class="tab-pane">--%>
            <%--<iframe src="/toChangePwd.do" style="width: 100%;height: 100%;">--%>

            <%--</iframe>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<script src="js/jquery.nouislider.js"></script>
<script>
    // $(document).ready(function () {
    //     $('#toLinkManage').attr('src','/toUserManage.do');
    // })
    $(function () {
        $('.meun-item').on('click',function () {
            var clickType=$(this).attr('data-type');
            // console.log(clickType);
            switch (clickType) {
                case 'news':
                    $('#toLinkManage').attr('src','/toNewsManage.do');
                    break;
                case 'pic':
                    $('#toLinkManage').attr('src','/toPictureManage.do');
                    break;
                case 'article':
                    $('#toLinkManage').attr('src','/toArticleManage.do');
                    break;
                case 'user':
                    $('#toLinkManage').attr('src','/toUserManage.do');
                    break;
                case 'link':
                    $('#toLinkManage').attr('src','/toLinkManage.do');
                    break;
                case 'chan':
                    $('#toLinkManage').attr('src','/toChangePwd.do');
                    break;
            }
        })

    })
</script>
</body>

</html>