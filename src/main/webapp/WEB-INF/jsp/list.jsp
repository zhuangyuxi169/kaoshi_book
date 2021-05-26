<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaojing
  Date: 2021/4/26
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售信息查询</title>
    <link rel="stylesheet" href="/statics/css/bootstrap.css">
    <script src="/statics/js/jquery-1.12.4.js"></script>
    <script src="/statics/js/bootstrap.js"></script>
    <%--引入bootstrap的分页插件--%>
    <script src="/statics/js/bootstrap-paginator.js"></script>

    <style>
        #page li{
            /*手型样式*/
            cursor:pointer;
        }
    </style>
</head>

<body>

<!-- Modal 添加图书的模态框-->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加销售</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="bookType" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-4">
                            <%--<input type="text" name="bookType" class="form-control" id="bookType" placeholder="bookType">--%>
                            <select class="form-control" name="bookType" id="bookType">
                                    <option value ="volvo">铅笔</option>
                                    <option value ="saab">橡皮</option>
                                    <option value="opel">桌子</option>
                                    <option value="audi">键盘</option>
                                    <option value="audi">鼠标</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookName" class="col-sm-2 control-label">销售单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="bookName" class="form-control" id="bookName" placeholder="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookAuthor" class="col-sm-2 control-label">销售数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="bookAuthor" class="form-control" id="bookAuthor" placeholder="数量">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="gogo()" >保存</button>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-3 col-md-offset-5" style="align-content: center">
                <h1>销售信息查询</h1>
            </div>
        </div>
        <p>欢迎：张三，<a href="/user/login">退出登录</a></p>
        <!--搜索框-->
        <div class="row">
            <div class="col-md-9 col-md-offset-3">
                <form action="/goods/list" method="post" class="form-inline" id="myForm">
                    <%--隐藏域--%>
                    <input type="hidden" name="pageNum" id="pageNum">
                    <div class="form-group">
                        <!--class="control-label": 标题和文本对齐-->
                        <%--<label for="title" class="control-label">图书类型</label>--%>
                        <%--<select class="form-control" id="title">--%>
                            <%--<option>-请选择-</option>--%>
                        <%--</select>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <label for="title1" class="control-label">商品名称</label>
                        <input type="text" name="searchName" id="title1" value="${searchName}" class="form-control"/>&nbsp;&nbsp;&nbsp;&nbsp;

                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary">搜索</button>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;
                        <%--<input type="button" class="btn btn-success" value="添加图书" id="btn1"/>--%>
                        <button type="button" class="btn btn-success " id="bookAddBtn" data-toggle="modal" data-target="#bookAddModal">
                            添加销售
                        </button>
                        <a href="#">添加销售</a>
                </form>
            </div>
        </div>
        <br /><br />
        <!--表格-->
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table class="table table-bordered table-striped table-hover">
                    <theard>
                        <tr>
                            <th>ID</th>
                            <th>商品</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>总价</th>
                            <th>销售日期</th>
                            <th>销售员</th>
                            <th>操作</th>
                        </tr>
                    </theard>
                    <tobday>
                        <!--动态加载-->
                        <c:forEach items="${pageInfo.list}" var="bookInfo">
                            <tr>
                                <td>${bookInfo.id}</td>
                                <td>${bookInfo.goodname}</td>
                                <td>${bookInfo.price}</td>
                                <td>${bookInfo.quantity}</td>
                                <td>${bookInfo.totalprice}</td>
                                <td>
                                    <%--格式化日期--%>
                                    <fmt:formatDate value="${bookInfo.saledate}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td>${bookInfo.salename}</td>
                                <td>
                                    <a href="javascript:toCat(${bookInfo.id})">查看库存</a> ||
                                    <a href="javascript:toDel(${bookInfo.id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tobday>
                </table>
            </div>
        </div>
        <%--分页插件--%>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <!--分页组件-->
                <ul id="page"></ul>
            </div>
        </div>
    </div>
    <script>
        /*jquery的入口函数*/
        $(function() {
            //获取当前页
            var currentPage = ${pageInfo.pageNum};
            //获取总页数
            var totalPages = ${pageInfo.pages};
            $("#page").bootstrapPaginator({
                bootstrapMajorVersion:3, //对应的bootstrap版本
                currentPage: currentPage, //当前页数
                numberOfPages: 10, //每次显示页数
                totalPages:totalPages, //总页数
                useBootstrapTooltip:false,
                itemTexts : function(type, page, current) {//设置分页按钮显示字体样式
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                },
                //点击事件
                onPageClicked: function (event, originalEvent, type, page) {
                    console.log(page);
                    // 业务处理
                    //page: 表示当前页码
                    /*获取pageNum隐藏域，给它赋值 page*/
                    $("#pageNum").val(page);
                    /*提交表单*/
                    $("#myForm").submit();
                }
            });
        });

        /*跳转到查询回复信息列表的控制器方法*/
        function toCat(id){
            window.location.href = "/goods/cat/" + id;
        }

        /*根据帖子id，删除帖子列表和回复信息*/
        function toDel(id){
            //删除提示
            if(confirm("确认删除该条发帖和帖子回复信息？")){
                window.location.href = "/goods/del/" + id;
            }
        }

        //提示信息
        if(${delMsg != null and delMsg != ''}){
            alert("${delMsg}");
        }
        //添加图书信息
        // $("#btn1").on("click",function(){
        //     window.location.href = "/bookInfo/add/";
        // });

        //点击添加按钮弹出添加图书信息模态框
        $("bookAddBtn").click(function () {
            //发送ajax请求，查出图书分类信息，显示在下拉列表中
            getBookType();
            $("bookAddModal").modal({
                backdrop:"static"
            });
        });

        function gogo() {
            alert("添加成功！！！");
            window.open("/goods/list")
        }

        //查出所有的图书分类信息并显示在下拉列表中
        function getBookType() {
            $.ajax({
                url:"/bookInfo/bookType",
                type:"GET",
                success:function (result) {
                    console.log(result)
                    $("bookAddModal select").append("")
                    $.each(result.extend.bookTypes,function () {
                        
                    })
                }

            });
        }

    </script>
</body>
</html>
