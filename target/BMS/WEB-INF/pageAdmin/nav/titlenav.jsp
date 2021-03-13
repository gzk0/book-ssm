<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<div class="layui-header">
	<div class="layui-logo">图书管理系统</div>
	<!-- 头部区域（可配合layui已有的水平导航） -->
	<%--
	<ul class="layui-nav layui-layout-left">
		<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="###">邮件管理</a>
				</dd>
			</dl></li>
	</ul>--%>
	
	<ul class="layui-nav layui-layout-right">
		<li class="layui-nav-item">
			<a href="javascript:;">
				<c:if test="${admin.aPhoto==null}">
					<img id="user_photo" class="layui-nav-img" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
				</c:if>
				<c:if test="${admin.aPhoto !=null }">
					<c:if test="${admin.aPhoto=='' }">
						<img id="user_photo"  class="layui-nav-img" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
					</c:if>
					<c:if test="${admin.aPhoto !='' }">
						<img  id="user_photo"  class="layui-nav-img" src="${baseUri}/headPhoto/${admin.aPhoto}" alt="" width="80px" height="80px;">
					</c:if>
				</c:if>
			</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="${baseUri}/admin/AdminInfo.do" target="iframe">个人信息</a>
				</dd>
				<dd>
					<a href="${baseUri}/admin/AdminEdit.do" target="iframe">修改信息</a>
				</dd>
				<dd>
					<a href="${baseUri}/admin/updatePwd.do" target="iframe">修改密码</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="${baseUri}/admin/logout.do" onclick="return confirm('确认退出管理员 ${admin.aNick} ？')">安全退出</a></li>
	</ul>
</div>