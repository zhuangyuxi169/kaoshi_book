<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: zhaojing
  Date: 2021/4/26
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <h1>查看库存</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-md-offset-8">
                <a href="/goods/addUI/${id}">添加销售</a>
                <a href="/goods/list">返回查询页面</a>
            </div>
        </div>
        <br /><br />
        <!--表格-->
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <table class="table table-bordered table-striped table-hover">
                    <theard>
                        <tr>
                            <th>产品名称</th>
                            <th>库存量</th>
                        </tr>
                    </theard>
                    <tobday>
                        <!--动态加载-->
                        <c:forEach items="${pageInfo.list}" var="replyDetail">
                            <tr>
                                <td>${replyDetail.productname}</td>
                                <td>${replyDetail.quantity}</td>
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
                    window.location.href = "/goods/cat/" + ${id} +"?pageNum=" + page;
                }
            });
        });

        //提示信息
        if(${saveMsg != null and saveMsg != ''}){
            alert("${saveMsg}");
        }
    </script>
</body>
</html>
