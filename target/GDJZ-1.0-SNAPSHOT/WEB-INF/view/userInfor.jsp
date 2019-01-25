<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2019/1/24
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
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

</head>
<body>
<form class="form-horizontal">
    <div class="form-group">
        <label for="id" class="col-xs-4 control-label">序号：</label>
        <div class="col-xs-5">
            <input type="text" class="form-control input-sm duiqi" id="id" placeholder="" style="margin-top: 7px;" value="${user.id}">
        </div>
    </div>
    <div class="form-group">
        <label for="username" class="col-xs-4 control-label">用户名：</label>
        <div class="col-xs-5">
            <input type="text" class="form-control input-sm duiqi" id="username" placeholder="" style="margin-top: 7px;" value="${user.username}">
        </div>
    </div>
    <div class="form-group">
        <label for="note" class="col-xs-4 control-label">备注：</label>
        <div class="col-xs-5">
            <input type="text" class="form-control input-sm duiqi" id="note" placeholder="" style="margin-top: 7px;" value="${user.note}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-4 control-label">创建时间：</label>
        <div class="col-xs-5">
            <input type="text" class="form-control input-sm duiqi" id="createDate" placeholder="" style="margin-top: 7px;" value='<fmt:formatDate value="${user.createDate}" pattern="yyyy-MM-dd"/>'>
            <%--<fmt:formatDate value="${user.createDate}" pattern="yyyy-MM--dd"/>--%>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-4 control-label">更新时间：</label>
        <div class="col-xs-5">
            <input type="text" class="form-control input-sm duiqi" id="updateDate" placeholder="" style="margin-top: 7px;" value='<fmt:formatDate value="${user.updateDate}" pattern="yyyy-MM-dd"/>'>
        </div>
    </div>
</form>

</body>
</html>
