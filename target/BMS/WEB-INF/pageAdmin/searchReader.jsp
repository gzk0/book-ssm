<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
<!--
* {
	margin: 0;
	padding: 0;
}

.searchBar {
	height: 100px;
	background-color: #99cc33;
}

.hBar {
	height: 50px;
	line-height: 50px;
	position: relative;
	top: 25px;
	left: 100px;
}

label, input, button {
	font-size: 25px;
	font-family: "楷体";
}
-->
</style>
<body>
	<!-- 内容主体区域 -->
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>查询读者</legend>
	</fieldset>


	<!-- 模糊查询字段-->
	<div class="searchBar">
		<div class="hBar">
			<form action="${baseUri}/admin/searchReader.do" method="get">
				<label class="">读者账号</label>
				<input type="text" name="rCard" class="" style="width: 15%;" placeholder="${placeholder1 }">
				<label class="">读者姓名</label>
				<input type="text" name="rNick" class="" style="width: 15%;" placeholder="${placeholder2 }">
				<label class="">读者身份</label>
				<input type="radio" name="rPrivilege" value="0" placeholder="${placeholder3 }">学生
				<input type="radio" name="rPrivilege" value="1" placeholder="${placeholder3 }">教师
				<button type="submit" class="layui-btn layui-btn-radius layui-btn-primary" style="margin-left: 5%">搜索</button>
			</form>
		</div>
	</div>

	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="150">
			</colgroup>
			<thead>
				<tr>
					<th>用户账号</th>
					<th>用户姓名</th>
					<th>用户身份</th>
					<th>用户详情</th>
					<th>借阅图书情况</th>
					<!-- <th>超期罚款总额(元)</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${readers}" var="reader">
					<tr>
						<td>${reader.rCard }</td>
						<td>${reader.rNick }</td>
						<td>${reader.rPrivilege==0?"学生":"教师" }</td>
						<td><a class="layui-btn"
							style="background-color: rgb(204, 139, 41)"
							   href="${baseUri}/admin/${reader.rId}/getReaderInof.do">进入</a>
						</td>
						<td><a class="layui-btn"
							style="background-color: cadetblue"
							   href="${baseUri}/admin/${reader.rId}/getBorrowsByReader.do">查看</a>
						</td>
						<%-- <td>${admin.identityId }</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="${baseUri}/static/layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		layui.use([ 'form' ], function() {
			var form = layui.form;
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
	</script>
</body>
</html>