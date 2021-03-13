<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户修改</title>
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

    <style type="text/css">
        .table > tbody > tr > td {
            text-align: left;
        }
    </style>


    <script type="text/javascript">
        $(function () {
            $("#user_photo_td").click(function () {
                $("#photo").click()
            });
            $("#photo").change(function () {
                $("#user_photo").attr("src",URL.createObjectURL($(this)[0].files[0]))
            });
        });
    </script>

</head>
<body>
<div class="container">


    <div class="col-md-offset-4 col-md-4">
        <form action="${baseUri}/admin/update.do" method="post" enctype="multipart/form-data">

            <input name="_method" value="put" type="hidden"/>

            <table class="table">
                <caption><h1>修改信息</h1></caption>
                <!-- On rows -->
                <tr class="success">
                    <div class="form-group" hidden="hidden">
                        <input type="file" id="photo" accept="image/*"  name="aphoto" />
                    </div>
                    <td colspan="2" style="text-align: center" id="user_photo_td">
                        <c:if test="${admin.aPhoto==null}">
                            <img id="user_photo" class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
                        </c:if>
                        <c:if test="${admin.aPhoto !=null }">
                            <c:if test="${admin.aPhoto=='' }">
                                <img id="user_photo"  class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
                            </c:if>
                            <c:if test="${admin.aPhoto !='' }">
                                <img  id="user_photo"  class="img-circle" src="${baseUri}/headPhoto/${admin.aPhoto}" alt="" width="80px" height="80px;">
                            </c:if>
                        </c:if>
                        <br/>
                        <span style="color: #5bc0de;" class="glyphicon glyphicon-edit" aria-hidden="true" title="点我，修改头像"></span>
                        点我，修改头像
                    </td>
                </tr>
                <tr class="warning">
                    <td colspan="2">
                        <div class="form-group">
                            <label for="username">昵称</label>
                            <input type="text" class="form-control" id="username" name="aNick"
                                   placeholder="${admin.aNick}">
                        </div>
                    </td>
                </tr>
                <tr class="danger">
                    <td colspan="2">
                        <div class="form-group">
                            <label>性别</label><br/>
                            <c:if test="${admin.aSex==0}">
                                <label class="radio-inline">
                                    <input type="radio" name="aSex" id="inlineRadio1" value="0" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="aSex" id="inlineRadio2" value="1"> 女
                                </label>
                            </c:if>
                            <c:if test="${admin.aSex==1}">
                                <label class="radio-inline">
                                    <input type="radio" name="aSex" id="inlineRadio1" value="0"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="aSex" id="inlineRadio2" value="1" checked> 女
                                </label>
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr class="info">
                    <td colspan="2">
                        <div class="form-group">
                            <label for="email">邮箱</label>
                            <input type="email" class="form-control" id="email" name="aEmail"
                                   placeholder="${admin.aEmail}" disabled="disabled">
                        </div>
                    </td>
                </tr>
                <tr class="active">
                    <td colspan="2">
                        <div class="form-group">
                            <label for="Creed">人生信条</label>
                            <input type="text" class="form-control" id="Creed" name="aCreed"
                                   placeholder="${admin.aCreed}">
                        </div>
                    </td>
                </tr>
                <tr class="success">
                    <td colspan="2">
                        <div class="form-group">
                            <label for="regist_time">注册时间</label>
                            <input type="text" class="form-control" id="regist_time" name="aRegistTime"
                                   placeholder="${admin.aRegistTime}" disabled="disabled">
                        </div>
                    </td>
                </tr>
                <tr class="warning">
                    <td colspan="2" style="text-align: center">
                        <button type="submit" class="btn btn-info btn-lg btn-block">确认修改</button>
                    </td>
                </tr>
            </table>

        </form>
    </div>



</div>
</body>
</html>