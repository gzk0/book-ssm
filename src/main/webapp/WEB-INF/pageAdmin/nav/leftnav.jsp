<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("baseUri", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
%>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">    <!-- layui-nav-itemed 展开 -->
                <a class="" href="javascript:;">图书管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${baseUri}/admin/getAllBooks.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有图书</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/toSearchBook.do"
                           target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查询图书</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/addBook.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上架新图书</a>
                    </dd>
                    <%--<dd>
                        <a href="newBookList" target="iframe">最新图书列表</a>
                    </dd>--%>
                    <dd>
                        <a href="${baseUri}/admin/getAllOffBook.do"
                           target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下架图书列表</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">    <!-- layui-nav-itemed 展开 -->
                <a class="" href="javascript:;">借阅管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${baseUri}/admin/getBorrows.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部记录</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/getBorrows.do?state=0" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未归还记录</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/getBorrows.do?state=1" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已归还记录</a>
                    </dd>
                </dl>
            </li>
            <%--<li class="layui-nav-item">
                <a href="javascript:;">逾期管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="showOverdue" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部逾期</a>
                    </dd>
                </dl>
            </li>--%>


            <c:if test="${admin.aPrivilege==0}">


            <li class="layui-nav-item">
                <a href="javascript:;">读者管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${baseUri}/admin/getReaders.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有读者</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/getReaders.do?rPrivilege=0" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有学生</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/getReaders.do?rPrivilege=1" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有教师</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/showReaderInfo.do"
                           target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查询读者</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/addReader.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加读者</a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">系统管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${baseUri}/admin/getAllAdmins.do"
                           target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有管理员</a>
                    </dd>
                    <dd>
                        <a href="${baseUri}/admin/addAdmin.do" target="iframe">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加管理员</a>
                    </dd>

                </dl>
            </li>
            </c:if>
        </ul>
    </div>
</div>