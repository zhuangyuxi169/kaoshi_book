<%--
  Created by IntelliJ IDEA.
  User: zhangyuxi
  Date: 2021/4/26
  Time: 17:32
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
</head>
<body>
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <h1>添加图书信息</h1>
            </div>
        </div>
        <!--表单提交-->
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <form action="/bookInfo/add/${bookId}" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="bookCode" class="control-label col-md-2">图书编号：</label>
                        <div class="col-md-6">
                            <input type="text" name="bookCode" class="form-control" id="bookCode" placeholder="请输入图书编号"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="control-label col-md-2">图书分类：</label>
                        <div class="col-md-6">
                            <input type="text" name="author" class="form-control" id="author" placeholder="请输入昵称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookName" class="control-label col-md-2">图书名称：</label>
                        <div class="col-md-6">
                            <input type="text" name="bookName" class="form-control" id="bookName" placeholder="请输入书名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-2">
                            <button type="submit" class="btn btn-success">提交</button>
                            <!--type="button" ： 必须要写，否则谷歌浏览器会默认type="submit"-->
                            <button type="button" class="btn btn-info">返回</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
