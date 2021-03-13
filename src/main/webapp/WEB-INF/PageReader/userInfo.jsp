<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>管理员信息</title>
    <!-- Bootstrap -->
    <link href="${baseUri}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--全局样式-->
    <link href="${baseUri}/static/css/global.css" rel="stylesheet" type="text/css">
    <!--私有样式-->
    <link href="${baseUri}/static/css/user_info.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${baseUri}/static/jquery/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${baseUri}/static/bootstrap/js/bootstrap.min.js"></script>


</head>
<body style="background-color: white">
<div class="container">


    <div class="col-md-offset-4 col-md-4">

        <table class="table">
            <caption><h1>读者信息</h1></caption>
            <!-- On rows -->
            <tr class="success">
                <td colspan="2">
                    <c:if test="${reader.rPhoto==null}">
                        <img id="user_photo" class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
                    </c:if>
                    <c:if test="${reader.rPhoto !=null }">
                        <c:if test="${reader.rPhoto=='' }">
                            <img id="user_photo"  class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="90px;">
                        </c:if>
                        <c:if test="${reader.rPhoto !='' }">
                            <img  id="user_photo"  class="img-circle" src="${baseUri}/headPhoto/${reader.rPhoto}" alt="" width="80px" height="80px;">
                        </c:if>
                    </c:if>
                </td>


            </tr>
            <tr class="warning">
                <th>昵称</th>
                <td>${reader.rNick}</td>
            </tr>
            <tr class="danger">
                <th>性别</th>
                <td>
                    ${reader.rSex==0?"男":"女"}
                </td>
            </tr>
            <tr class="info">
                <th>账户</th>
                <td>${reader.rCard}</td>
            </tr>
            <tr class="success">
                <th>权限</th>
                <td> ${reader.rPrivilege==0?"学生":"教师"}</td>
            </tr>
            <tr class="warning">
                <th>注册时间</th>
                <td> ${reader.rRegistTime}</td>
            </tr>

        </table>
    </div>
</div>
</body>
</html>