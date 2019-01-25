<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2019/1/8
  Time: 9:48
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
    <title>pictureManage</title>


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
                    url: 'pictureList.do',         //请求后台的URL（*）
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
                        field: 'name',
                        title: ' 图片名',
                        align : 'center'

                    }, {
                        field: 'url',
                        title: '图片地址',
                        align : 'center'

                    }, {
                            field: 'position',
                            title: '位置',
                            align : 'center'

                    },{
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
                                var operateHtml = '<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#revisePicture" onclick="toChangePicture(\''+row.id+'\')">修改</button> &nbsp;';
                                // operateHtml = operateHtml + '<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deletePicture" onclick="setPictureId(\''+row.id+'\')">删除</button> &nbsp;';
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
                    position: $("#pos").val()
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

        //分页查询方法
        function search() {
            //2.初始化Button的点击事件
            $('#tb_departments').bootstrapTable("refresh");
        }
    </script>

</head>
<body>
<script>
    function getObjectURL(file) {
        var url = null;

        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    $(function () {
        $("#file").change(function () {
            var objUrl = getObjectURL(this.files[0]);
            console.log("objUrl = " + objUrl);

            if (objUrl) {
                $("#pic").attr("src", objUrl);
            }
        })

        $("#file1").change(function () {
            var objUrl = getObjectURL(this.files[0]);
            console.log("objUrl = " + objUrl);

            if (objUrl) {
                $("#pic1").attr("src", objUrl);
            }
        })
    })

</script>

<script>
    function toChangePicture(id) {
        $.ajax({
            type : "post",
            url : "toChangePicture.do",
            data : {id : id},
            dataType : "json",
            success : function (data) {
                document.getElementById("id1").value = data.id;
                document.getElementById("name1").value = data.name;
                $("#pic1").attr("src", data.url);
                document.getElementById("position1").value = data.position;
                document.getElementById("note1").value = data.note;
            },
            error : function () {
                alert("跳转失败！");
            }
        });
    }
</script>
<script>
    function addPicture() {
        var formData = new FormData();

        formData.append("name", $("#name").val());
        formData.append("position", $("#position").val());
        formData.append("note", $("#note").val());
        formData.append("file", document.getElementById("file").files[0]);

        $.ajax({
            type : "post",
            url : "addPicture.do",
            data : formData,
            contentType : false,
            processData : false,

            success : function (data) {
                $('#addPicture').modal('hide');//隐藏moda
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);
            },
            error : function (data) {
                alert(data);
            }
        });

    }
</script>
<script>
    function changePicture() {
        var formData = new FormData();

        formData.append("id", $("#id1").val());
        formData.append("name", $("#name1").val());
        formData.append("position", $("#position1").val());
        formData.append("note", $("#note1").val());
        formData.append("file", document.getElementById("file1").files[0]);

        $.ajax({
            type : "post",
            url : "changePicture.do",
            data : formData,
            dataType : "text",
            contentType : false,
            processData : false,

            success : function (data) {
                $('#revisePicture').modal('hide');//隐藏moda
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);
            },
            error : function (data) {
                console.log((JSON.stringify(data)));
                alert(JSON.stringify(data));
                alert(data);
            }
        });
    }
</script>

<script>
    var id;
    function setPictureId(pictureId) {
        id = pictureId;
    }

    function deletePicture() {
        $.ajax({
            type : "POST",
            url : "deletePicture.do",
            data : {id : id},
            dataType : "text",
            success : function (data) {
                $('#deletePicture').modal('hide');//隐藏modal
                $('#tb_departments').bootstrapTable("refresh");
                layer.msg(data);
            },
            error : function () {
                alert("删除失败！");
            },
        });
    }
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
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal" onsubmit="return false;">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1">图片位置</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="pos" onkeypress="keyup_submit()">
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
            <%--<span class="glyphicon glyphicon-plus"  data-toggle="modal" data-target="#addPicture" aria-hidden="true">新增</span>--%>
        <%--</button>--%>
    <%--</div>--%>
    <table id="tb_departments"></table>
</div>


<!--弹出添加图片窗口-->
<div class="modal fade" id="addPicture" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加图片</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" enctype="multipart/form-data" action="/addPicture.do" method="post" id="addPictureForm">
                        <div class="form-group ">
                            <label for="name" class="col-xs-3 control-label">图片名：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm" id="name" placeholder="" name="name" style="width: 250px;height: 35px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="file" class="col-xs-3 control-label">图片：</label>
                            <div class="col-xs-8 ">
                                <img src="" id="pic" style="width:50px;height: 50px; float: left;">
                                <input type="file" class="form-control input-sm " id="file" placeholder="" name="file" style="width: 200px;height: 35px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="position" class="col-xs-3 control-label">位置：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm" id="position" placeholder="" name="position" style="width: 250px;height: 35px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note" class="col-xs-3 control-label">备注：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm" id="note" placeholder="" name="note" style="width: 250px;height: 35px;">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn btn-xs btn-green" onclick="addPicture()" id="addPictureBtn">保 存</button>
            </div>
        </div>
    </div>
</div>
<!--弹出修改图片窗口-->
<div class="modal fade" id="revisePicture" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改图片</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" id="changeUserForm">
                        <div class="form-group">
                            <label for="id1" class="col-xs-3 control-label">序号：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm" id="id1" placeholder="" name="id1" readonly="readonly" style="width: 250px;height: 35px;">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="name1" class="col-xs-3 control-label">图片名：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm" id="name1" placeholder="" name="name1" style="width: 250px;height: 35px;">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="file1" class="col-xs-3 control-label">图片：</label>
                            <div class="col-xs-8 ">
                                <img src="" id="pic1" style="width:50px;height: 50px;float: left">
                                <input type="file" class="form-control input-sm" id="file1" placeholder="" name="file1" style="width: 200px;height: 35px;">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label for="position1" class="col-xs-3 control-label">位置：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm" id="position1" placeholder="" name="position1" style="width: 250px;height: 35px;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="note1" class="col-xs-3 control-label">备注：</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control input-sm" id="note1" placeholder="" name="note1" style="width: 250px;height: 35px;">
                            </div>
                        </div>


                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn btn-xs btn-green" onclick="changePicture()">保 存</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出删除图片警告窗口-->
<div class="modal fade" id="deletePicture" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    确定要删除该图片？删除后不可恢复！
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="button" class="btn  btn-xs btn-danger" onclick="deletePicture()">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
</html>
