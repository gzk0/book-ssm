<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/static/css/bookInfo.css" rel="stylesheet">
    <link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
    <title>首页</title>
</head>
<body>
<c:if test="${borrowInfo !=null}">
    <button   class="layui-anim layui-anim-rotate layui-anim-fadeout layui-btn layui-btn-radius layui-btn-warm"
              style="font-size: 20px;
				  position: fixed; top: 430px;left: 77%;
				  background-color: rgba(255,4,31,0.61)">${borrowInfo}</button>
</c:if>
<div class="container">

    <div class="col-md-offset-2 col-md-8">
        <table class="table table-hover" id="bookinfotable">
            <div id="headBook">《<span id="span_bookname">${book.bName}</span>》详细信息</div>
            <tr>
                <th class="active">书名</th>
                <td class="success">${book.bName}</td>
            </tr>
            <tr>
                <th class="active">简介</th>
                <td class="success">
                    <c:if test="${book.bPath==null}">
                        <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                    </c:if>
                    <c:if test="${book.bPath !=null }">
                        <c:if test="${book.bPath=='' }">
                            <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                        </c:if>
                        <c:if test="${book.bPath !='' }">
                            <img src="${imgPath}/bookPhoto/${book.bPath}" alt="" align="left" width="80px" height="100px;">
                        </c:if>
                    </c:if>
                    ${book.bIntroduce}
                </td>
            </tr>
            <tr>
                <th class="active">作者</th>
                <td class="success">${book.bAuthor}</td>
            </tr>
            <tr>
                <th class="active">出版社</th>
                <td class="success">${book.bPublisher}</td>
            </tr>
            <tr>
                <th class="active">出版日期</th>
                <td class="success">${book.bPubTime}</td>
            </tr>
            <tr>
                <th class="active">价格</th>
                <td class="success"><span>${book.bPrice}</span><span>元</span></td>
            </tr>
            <tr>
                <th class="active">索书号</th>
                <td class="success">${book.ISBN}</td>
            </tr>
            <tr>
                <th class="active">图书数量</th>
                <td class="success">${book.bNum}</td>
            </tr>
        </table>
    </div>

    <div class="col-md-offset-2 col-md-8" id="divBookOption" style="margin-bottom: 100px">
        <table class="table table-hover">
            <tr>
                <th class="active">书名</th>
                <th class="success">编号</th>
                <th class="warning">在架信息</th>
                <th class="danger">操作</th>
            </tr>
            <c:forEach begin="1" end="${book.bLendNum}" var="num">
            <tr>
                <td class="active">${book.bName}</td>
                <td class="success">${num}</td>
                <td class="warning">外借</td>
                <td class="danger">
                    <button type="button" class="btn btn-danger" disabled>借阅</button>
                </td>
            </tr>
            </c:forEach>
            <c:forEach begin="1" end="${book.bNum-book.bLendNum}" var="temp">
                <tr>
                    <td class="active">${book.bName}</td>
                    <td class="success">${temp+book.bLendNum}</td>
                    <td class="warning">在架</td>
                    <td class="danger">
                        <a href="${baseUri}/${book.id}/borrowBook.do" class="btn btn-primary">借阅</a>
                    </td>
                </tr>
            </c:forEach>




        </table>
    </div>

</div>
</body>
</html>
