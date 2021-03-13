<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<c:set var="baseUri" value="${pageContext.request.contextPath }"
	scope="request"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统</title>
<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
</head>
<!-- <style>
.pageshow {
	background-color: orage;
	float: right;
	line-height: 50px;
	margin-right: 100px;
}
</style> -->
<body>
	<!-- 内容主体区域 -->
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>图书借阅信息</legend>
	</fieldset>
		
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="50">
				<col width="100">
				<col width="200">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="200">
				<col width="200">
				<col width="50">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>ISBN</th>
					<th>书名</th>
					<th>作者</th>
					<th>图片</th>
					<th>读者账户</th>
					<th>读者昵称</th>
					<th>借出时间</th>
					<th>归还时间</th>
					<th>借阅状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${borrows}" var="borrow" varStatus="loop">
					<tr>
						<th>${loop.index}</th>
						<td>${borrow.book.ISBN }</td>
						<td>${borrow.book.bName }</td>
						<td>${borrow.book.bAuthor }</td>
						<td>
							<c:if test="${borrow.book.bPath==null}">
								<img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
							</c:if>
							<c:if test="${borrow.book.bPath !=null }">
								<c:if test="${borrow.book.bPath=='' }">
									<img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
								</c:if>
								<c:if test="${borrow.book.bPath !='' }">
									<img src="${imgPath}/bookPhoto/${borrow.book.bPath}" alt="" width="80px" height="100px;">
								</c:if>
							</c:if>
						</td>
						<td>${borrow.reader.rCard }</td>
						<td>${borrow.reader.rNick }</td>
						<td>${borrow.startTime }</td>
						<td>${borrow.endTime }</td>
						<c:if test="${borrow.state==0}">
							<td style="color: red">未归还</td>
						</c:if>
						<c:if test="${borrow.state==1}">
							<td style="color: green">已归还</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 页码显示 -->
	<%-- <div class="pageshow">
		<span> 第${requestScope.pageMsg.currPage }/${requestScope.pageMsg.totalPage}页</span>
		&nbsp;&nbsp; <span>总记录数：${requestScope.pageMsg.totalCount }&nbsp;&nbsp;每页显示:${requestScope.pageMsg.pageSize}</span>
		&nbsp;&nbsp; <span> <c:if
				test="${requestScope.pageMsg.currPage != 1}">
				<a href="${baseUri}/showBook?currentPage=1">[首页]</a>&nbsp;&nbsp;
         				<a
					href="${baseUri}/showBook?currentPage=${requestScope.pageMsg.currPage-1}">[上一页]</a>
         				&nbsp;&nbsp;
     				</c:if> <c:if
				test="${requestScope.pageMsg.currPage != requestScope.pageMsg.totalPage}">
				<a
					href="${baseUri}/showBook?currentPage=${requestScope.pageMsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
         				<a
					href="${baseUri}/showBook?currentPage=${requestScope.pageMsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
     				</c:if>
		</span>
	</div> --%>

	<script src="${baseUri}/static/layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

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
		layer.open({
			type : 4,
			content : [ '已下架', '#soldBook' ]
		//数组第二项即吸附元素选择器或者DOM
		});
	</script>
</body>
</html>