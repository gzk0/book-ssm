<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("baseUri", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
</head>
<body>
<!-- 内容主体区域 -->
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 20px;">
    <legend>所有图书</legend>
</fieldset>

<div class="layui-form" style="padding: 0px;margin: 0px">
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="100">
            <col width="150">
            <col width="100">
            <col width="50">
            <col width="450">
            <col width="100">
            <col width="80">
            <col width="50">
            <col width="100">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
            <th>ISBN</th>
            <th>书名</th>
            <th>作者</th>
            <th>价格(元)</th>
            <th>简介</th>
            <th>图片</th>
            <th>数量(剩/总)</th>
            <th>查看</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="book" varStatus="vs">
            <tr>
                <td>${vs.index}</td>
                <td>${book.ISBN }</td>
                <td>${book.bName }</td>
                <td>${book.bAuthor}</td>
                <td>${book.bPrice }</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${book.bIntroduce ==null || book.bIntroduce=='' ? '没有任何介绍！！':book.bIntroduce}</td>
                <td>
                    <c:if test="${book.bPath==null}">
                        <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                    </c:if>
                    <c:if test="${book.bPath !=null }">
                        <c:if test="${book.bPath=='' }">
                            <img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
                        </c:if>
                        <c:if test="${book.bPath !='' }">
                            <img src="${imgPath}/bookPhoto/${book.bPath}" alt="" width="80px" height="100px;">
                        </c:if>
                    </c:if>
                </td>

                <td>${book.bNum - book.bLendNum}/${book.bNum }</td>

                <td><a class="layui-btn"
                       style="background-color: cadetblue"
                       href="${baseUri}/admin/${book.id}/getBookInfo.do">查看</a>
                </td>

                <td>

                    <a class="layui-btn"
                       style="background-color: rgb(204, 139, 41)" href="${baseUri}/admin/${book.id}/editBookInfo.do">编辑</a>
                    <br><br>
                    <a class="layui-btn" id="soldBook"
                       style="background-color: rgb(211, 26, 81)"
                       href="${baseUri}/admin/${book.id}/offBook.do" onclick="return offBook(${book.bLendNum})">下架</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="${baseUri}/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '100%' //设置容器宽度
            ,
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
    layer.open({
        type: 4,
        content: ['已下架', '#soldBook']
        //数组第二项即吸附元素选择器或者DOM
    });



    function offBook(num) {
        if(num>0){
            alert("该图书正处于借阅状态，无法下架")
            return false;
        }else{
            return true;
        }
    }
</script>
</body>
</html>