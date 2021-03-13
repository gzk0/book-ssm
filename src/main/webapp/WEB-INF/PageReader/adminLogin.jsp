<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"
isErrorPage="true" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <link href="/static/css/login.css" rel="stylesheet">
    <title>用户登录</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div id="form_div" class="col-md-offset-4 col-md-4">
            <div class="row">
                <div class="h2 col-md-offset-3 col-md-6">管理员登录</div>
                <a href="login.jsp">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户登录
                </a>
            </div>
            <div>
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Account</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入账户">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>

                    </div>
                    <button type="submit" class="btn btn-primary active btn-block">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>