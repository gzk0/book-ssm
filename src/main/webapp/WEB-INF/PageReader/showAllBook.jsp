<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
<div class="container" style="width: 100%;padding: 0px 60px;">

    <%--图书表格--%>
    <div id="divBooks">
        <table class="table table-condensed">
            <tr style="height: 0px;">
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <c:forEach items="${books}" var="book" varStatus="vs">
                <c:if test="${vs.index%7==0 && vs.index!=0}">
                    </tr>
                    <tr>
                </c:if>
                <td width="16%">
                    <div class="divBook">
                        <a href="${baseUri}/${book.id}/getBookDetail.do" title="${book.bIntroduce}(${book.bAuthor})"
                           target="">
                            <div class="divBookImg" style="height: 78%; margin-bottom: 1px">
                                <c:if test="${book.bPath==null}">
                                    <img src="${baseUri}/static/images/book.jpg" height="100%" class="img-rounded">
                                </c:if>
                                <c:if test="${book.bPath !=null }">
                                    <c:if test="${book.bPath=='' }">
                                        <img src="${baseUri}/static/images/book.jpg" height="100%" class="img-rounded">
                                    </c:if>
                                    <c:if test="${book.bPath !='' }">
                                        <img src="${imgPath}/bookPhoto/${book.bPath}" height="100%" alt=""
                                             class="img-rounded">
                                    </c:if>
                                </c:if>


                            </div>
                        </a>
                        <div class="divBookInfo" style="padding: 5px">
                            <span class="glyphicon glyphicon-user" aria-hidden="true" title="${book.bAuthor}" style="width: 100%;height: 15px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap">：${book.bAuthor}</span><br/>
                            <span class="glyphicon glyphicon-time" aria-hidden="true" title="${book.bPubTime}" style="width: 100%;height: 15px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap">：${book.bPubTime}</span><br/>
                            <span class="glyphicon glyphicon-book" aria-hidden="true" title="${book.bName}" style="width: 100%;height: 15px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap">：${book.bName}</span>
                        </div>
                    </div>
                </td>
                </c:forEach>
            </tr>

        </table>

    </div>
</div>

</body>
</html>
