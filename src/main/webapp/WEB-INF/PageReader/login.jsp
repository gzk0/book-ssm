<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"
isErrorPage="true" %>

<%
    pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <link href="${baseUri}/static/css/ReaderLogin.css" rel="stylesheet">
    <title>用户登录</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div id="form_div" class="col-md-offset-4 col-md-4">
            <div class="row">
                <div class="h2 col-md-offset-3 col-md-6">用户登录</div>
                <a href="${baseUri}/admin/login.do">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 管理员登录
                </a>
            </div>
            <div>
                <form action="${baseUri}/login.do" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">账户</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="rCard" placeholder="请输入账户" value="2017024110">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">密码</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" name="rPassword" value="123" placeholder="请输入密码">
                    </div>

                    <div class="checkbox">
                    </div>
                    <button type="submit" class="btn btn-primary active btn-block">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>