<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
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
    <link href="/static/css/bookInfo.css" rel="stylesheet">
    <title>首页</title>
</head>
<body>
<div class="container">
    <div class="col-md-12">
        <table class="table table-hover" id="borrowtable">
            <div id="headBook">借阅记录</div>
            <tr>
                <th class="active" style="width: 20px;">序号</th>
                <th class="success" style="width: 50px;">借阅卡号</th>
                <th class="danger" style="width: 50px">借阅人</th>
                <th class="info" style="width: 80px;">图书ISBN</th>
                <th class="warning" style="width: 300px;">书名</th>
                <th class="active" style="width: 50px">作者</th>
                <th style="width: 90px;">封面</th>
                <th class="info">借阅时间</th>
                <th class="danger">应还时间</th>
                <th class="warning" style="width: 100px;">是否逾期</th>
                <th class="info">状态</th>
                <c:if test="${! empty sessionScope.reader}">
                    <th class="success">操作</th>
                </c:if>
            </tr>
            <c:forEach items="${borrows}" var="borrow" varStatus="vs">
                <tr>
                    <td class="active">${vs.index}</td>
                    <td class="success">${borrow.reader.rCard}</td>
                    <td class="danger">${borrow.reader.rNick}</td>
                    <td class="info">${borrow.book.ISBN}</td>
                    <td class="warning">${borrow.book.bName}</td>
                    <td class="active">${borrow.book.bAuthor}</td>
                    <td>
                        <c:if test="${borrow.book.bPath==null}">
                            <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                        </c:if>
                        <c:if test="${borrow.book.bPath !=null }">
                            <c:if test="${borrow.book.bPath=='' }">
                                <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                            </c:if>
                            <c:if test="${borrow.book.bPath !='' }">
                                <img src="${imgPath}/bookPhoto/${borrow.book.bPath}" alt="" width="80px"
                                     height="100px;">
                            </c:if>
                        </c:if>
                    </td>
                    <td class="info">${borrow.startTime}</td>
                    <td class="danger">${borrow.endTime}</td>
                    <%
                        Timestamp now = new Timestamp(new Date().getTime());
                        pageContext.setAttribute("now", now);
                    %>
                    <td class="warning">
                        <c:if test="${borrow.endTime.before(now)}">
                            <span style="color: red; font-weight: bold">逾期</span>
                        </c:if>
                        <c:if test="${!borrow.endTime.before(now)}">
                            <span style="color: green; font-weight: bold">未逾期</span>
                        </c:if>
                    </td>
                    <td class="info" style="width: 100px">
                        <c:if test="${borrow.state==0}">
                            <span style="color: red; font-weight: bold">未归还</span>
                        </c:if>
                        <c:if test="${borrow.state==1}">
                            <span style="color: green; font-weight: bold">已归还</span>
                        </c:if>
                    </td>
                    <c:if test="${! empty sessionScope.reader}">
                    <td class="success">
                        <c:if test="${borrow.state==0}">
                            <a class="btn btn-primary" role="button" href="${baseUri}/${borrow.id}/returnBook.do">归还</a>
                        </c:if>
                        <c:if test="${borrow.state==1}">
                            <button class="btn btn-success" role="button" disabled>已归还</button>
                        </c:if>

                    </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
