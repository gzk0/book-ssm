<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>修改密码</title>
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

</head>
<body>
<div class="container">


	<div class="col-md-offset-4 col-md-4">
		<form action="${baseUri}/admin/updatePwd.do" method="post">
			<input type="hidden" name="_method" value="put">
			<table class="table">
				<caption><h1>修改密码</h1></caption>
				<!-- On rows -->
				<tr class="danger">
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
					</td>
				</tr>
				<tr class="warning">
					<td colspan="2">
						<div class="form-group">
							<label for="old_password">原密码</label>
							<input type="password" class="form-control" id="old_password"
								   name="old_password"
								   placeholder="输入原密码">
						</div>
					</td>
				</tr>
				<tr class="info">
					<td colspan="2">
						<div class="form-group">
							<label for="new_password">新密码</label>
							<input type="password" class="form-control" id="new_password" name="new_password"
								   placeholder="输入新密码">
						</div>
					</td>
				</tr>
				<tr class="success">
					<td colspan="2">
						<div class="form-group">
							<label for="repwd">新密码</label>
							<input type="password" class="form-control" id="repwd" name="repwd"
								   placeholder="确认新密码">
						</div>
					</td>
				</tr>
				<tr class="warning">
					<td colspan="2" style="text-align: center">
						<span style="color: red">${pwd_error}</span>
						<button type="submit" class="btn btn-info btn-lg btn-block">确认修改</button>
					</td>
				</tr>
			</table>

		</form>
	</div>



</div>
</body>
</html>