<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2019/1/3
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="左右结构项目，属于大人员的社交工具">
    <meta name="keywords" content="左右结构项目 社交 占座 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap3.3.4.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table.css" />

    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/jquery.nouislider.css">
    <link rel="stylesheet" type="text/css" href="/css/layer.css">
    <title>userManage</title>


    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/source/layer-v3.1.1/layer/layer.js"></script>

    <script src="/js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap-table-zh-CN.js" type="text/javascript" charset="utf-8"></script>

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
            //1.初始化Table
            var oTable = new TableInit();
            oTable.Init();


        })

        var TableInit = function () {
            var oTableInit = new Object();
            //初始化Table
            oTableInit.Init = function () {
                $('#tb_departments').bootstrapTable({
                    url: 'userList.do',         //请求后台的URL（*）
                    method: 'get',                      //请求方式（*）
                    toolbar: '#toolbar',                //工具按钮用哪个容器
                    contentType: "application/x-www-form-urlencoded",
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true,                   //是否显示分页（*）
                    sortable: false,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    queryParams: oTableInit.queryParams,//传递参数（*）
                    sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                    pageNumber:1,                       //初始化加载第一页，默认第一页
                    pageSize: 10,                       //每页的记录行数（*）
                    pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                    search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    strictSearch: false,
                    showColumns: false,                  //是否显示所有的列
                    showRefresh: false,                  //是否显示刷新按钮
                    minimumCountColumns: 2,             //最少允许的列数
                    clickToSelect: true,                //是否启用点击选中行
                    height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                    showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
                    cardView: false,                    //是否显示详细视图
                    detailView: false,                   //是否显示父子表
                    columns: [{
                        field: 'id',
                        title: ' 序号',
                        align : 'center'

                    },{
                        field: 'username',
                        title: ' 用户名',
                        align : 'center'

                    }, {
                        field: 'note',
                        title: '备注',
                        align : 'center'

                    }, {
                        field: 'createDate',
                        title: '创建时间',
                        align : 'center',
                        formatter: function (value, row, index) {
                            return changeDateFormat(value)
                        }
                    }, {
                        field: 'updateDate',
                        title: '更新时间',
                        align : 'center',
                        formatter: function (value, row, index) {
                            return changeDateFormat(value)
                        }
                    },
                        {
                            title: "操作",
                            field: "id",
                            align : 'center',
                            formatter: function (value, row, index) {
                                var operateHtml = '<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="toChangeUser(\''+row.id+'\')">修改</button> &nbsp;';
                                // operateHtml = operateHtml + '<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="setUserId(\''+row.id+'\')">删除</button> &nbsp;';
                                return operateHtml;
                            }
                        }]
                });
            };

            //转换日期格式(时间戳转换为datetime格式)
            function changeDateFormat(cellval) {
                var dateVal = cellval + "";
                if (cellval != null) {
                    var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return date.getFullYear() + "-" + month + "-" + currentDate;
                }
            }
            //得到查询的参数
            oTableInit.queryParams = function (params) {
                var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    pageNumber : this.pageNumber,
                    pageSize : this.pageSize,
                    username: $("#name").val()
                };
                return temp;
            };
            return oTableInit;
        };


        var ButtonInit = function () {
            var oInit = new Object();
            var postdata = {};

            oInit.Init = function () {
                //初始化页面上面的按钮事件
            };

            return oInit;
        };
    </script>

</head>
<body>
<script>
    function saveUser() {
        var username = $("#username").val();
        var password = $("#password").val();
        var note = $("#note").val();
        $.ajax({
            type : "post",
            url : "addUser.do",
            data : {username : username, password : password, note : note},
            dataType : "text",
            success : function (data) {
                $('#addUser').modal('hide');//隐藏moda
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);

            }
        });
    }



    function changeUser() {
        var id = $("#id1").val();
        var username = $("#username1").val();
        var note = $("#note1").val();
        $.ajax({
            type : "post",
            url : "changeUser.do",
            data : {id : id, username : username, note : note},
            dataType : "text",
            success : function (data) {
                $('#reviseUser').modal('hide');//隐藏moda
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);

            }
        });
    }
    function toChangeUser(id) {
        $.ajax({
            type : "post",
            url : "toChangeUser.do",
            data : {id : id},
            dataType : "json",
            success : function (data) {
                document.getElementById("id1").value = data.id;
                document.getElementById("username1").value = data.username;
                document.getElementById("note1").value = data.note;
            },
            error : function () {

            }
        });
    }
    var userId;
    function setUserId(id) {
        userId = id;
    }

    function deleteUser() {
        $.ajax({
            type : "POST",
            url : "deleteUser.do",
            data : {id : userId},
            dataType : "text",
            success : function (data) {
                $('#deleteUser').modal('hide');//隐藏modal
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);

            },
            error : function () {

            },
        });
    }
    //分页查询方法
    function search() {
        //2.初始化Button的点击事件
        $('#tb_departments').bootstrapTable("refresh");
    }
</script>



<script>

</script>
<script>
    function keyup_submit() {

        if (window.event.keyCode == 13) {
            document.getElementById("btn_query").click();
        }
    }
</script>

<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <p>查询条件</p>
                </div>
                <div class="col-xs-9" style="text-align: right">
                    <%--<li class="dropdown" >--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                            <%--<font color="black">个人信息</font>--%>
                            <%--<b class="caret"></b>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu pull-right">--%>
                            <%--<li><a href="javascript:window.location.replace('toLogout.do');" onclick="">个人信息</a></li>--%>

                            <%--<li><a href="/toLogout.do">退出登录</a></li>--%>

                        <%--</ul>--%>
                    <%--</li>--%>
                </div>
            </div>


        </div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal" onsubmit="return false;">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1">用户名</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="name" onkeypress="keyup_submit()">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" onclick="search();" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--<div id="toolbar" class="btn-group">--%>
        <%--<button id="btn_add" type="button" class="btn btn-default">--%>
            <%--<span class="glyphicon glyphicon-plus"  data-toggle="modal" data-target="#addUser" aria-hidden="true">新增</span>--%>
        <%--</button>--%>
    <%--</div>--%>
    <table id="tb_departments"></table>
</div>

<!--弹出添加用户窗口-->
<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal">
                        <div class="form-group ">
                            <label for="username" class="col-xs-3 control-label">用户名：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" id="username" placeholder="" name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-xs-3 control-label">密码：</label>
                            <div class="col-xs-8 ">
                                <input type="password" class="form-control input-sm duiqi" id="password" placeholder="" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-xs-3 control-label">备注：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm duiqi" id="note" placeholder="" name="note">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn btn-xs btn-green" onclick="saveUser()">保 存</button>
            </div>
        </div>
    </div>
</div>
<!--弹出修改用户窗口-->
<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" id="changeUserForm">
                        <div class="form-group">
                            <label for="id1" class="col-xs-3 control-label">序号：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm duiqi" id="id1" placeholder="" name="id1" readonly="readonly" value="0">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="username1" class="col-xs-3 control-label">用户名：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" id="username1" placeholder="" name="username1" value="0">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="note1" class="col-xs-3 control-label">备注：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm duiqi" id="note1" placeholder="" name="note1" value="0">
                            </div>
                        </div>


                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn btn-xs btn-green" onclick="changeUser()">保 存</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出删除用户警告窗口-->
<div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    确定要删除该用户？删除后不可恢复！
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn  btn-xs btn-danger" onclick="deleteUser()">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


</body>
</html>
