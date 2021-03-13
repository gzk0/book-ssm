<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"
         isErrorPage="true" %>
<%
    pageContext.setAttribute("baseUri", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
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
    <link href="${baseUri}/static/css/index.css" rel="stylesheet">
    <title>首页</title>
</head>
<body style="padding: 0px;margin: 0px;align-content: center">
<div class="container" style="margin: 0px;padding: 0px;width: 100%;">


    <nav class="navbar navbar-default col-md-offset-1 col-md-10">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header active">
                <a class="navbar-brand" href="${baseUri}/toIndex.do" alt="首页"><img id="brandIoc"
                                                                                   src="${baseUri}/static/images/ioc.png"
                                                                                   alt="图书管理系统"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${baseUri}/toIndex.do">首页 <span class="sr-only">(current)</span></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">借阅<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${baseUri}/getBorrows.do" target="iframe">全部记录</a></li>
                            <li><a href="${baseUri}/getBorrowsOnNoReturn.do" target="iframe">当前借阅</a></li>
                            <li><a href="${baseUri}/getBorrowsOnReturn.do" target="iframe">归还记录</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">逾期<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${baseUri}/getOverdueBorrows.do" target="iframe">全部逾期</a></li>
                            <li><a href="${baseUri}/getOverdueBorrows.do?state=1" target="iframe">逾期已归还</a></li>
                            <li><a href="${baseUri}/getOverdueBorrows.do?state=0" target="iframe">逾期未归还</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" action="${baseUri}/searchBook.do" method="get" target="iframe">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="condition">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">我的<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${baseUri}/showReaderInfo.do" target="iframe">个人信息</a></li>
                            <li><a href="${baseUri}/toEditReader.do" target="iframe">修改信息</a></li>
                            <li><a href="${baseUri}/updatePwd.do" target="iframe">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${baseUri}/logout.do">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <!-- 内容主体区域 -->
    <div id="divIfreame" class="layui-body" style="width: 100%">
        <div style="width: 100%;">
            <iframe src="${baseUri}/getAllBook.do" width="100%" style="height: 200%" name="iframe" frameborder="0"
                    scrolling="no" id="mainIframe"></iframe>
        </div>
    </div>

</div>
</body>

</html>
