<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/12/27
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link href="/css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="/js/jquery.min.js"></script>
    <meta name="keywords" content="App Loction Form,Login Forms,Sign up Forms,Registration Forms,News latter Forms,Elements"./>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <!--webfonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
</head>
<body>
<script>
    $(function () {
        $("#submitBtn").click(function () {
            var username = $("#username").val();
            var password = $("#pwd").val();

            $.ajax({
                type : "post",
                url : "login.do",
                data : {username : username, password : password},
                dataType : "text",

                success : function (data) {
                    if (data == "登录成功！") {
                        window.location.replace("toManagePage.do");
                    } else {
                        alert(data);
                        window.location.reload();
                    }
                }
            })
        })
    })
</script>
<h1>后台登录</h1>
<div class="app-location">
    <h2>Welcome to Login</h2>
    <div class="line"><span></span></div>
    <div class="location"><img src="/images/location.png" class="img-responsive" alt="" /></div>
    <form>
        <input type="text" id="username" class="text" value="E-mail address" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'E-mail address';}" >
        <input type="password" id="pwd" value="Password" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Password';}">
        <div class="submit"><input type="button" value="Sign in" id="submitBtn"></div>
        <div class="clear"></div>
        <div class="new">
            <h3><a href="#">Forgot password ?</a></h3>
            <h4><a href="#">New here ? Sign Up</a></h4>
            <div class="clear"></div>
        </div>
    </form>
</div>
</body>
</html>
