<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统-逾期</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
	<style>
		.pageshow {
			background-color: orage;
			float: right;
			line-height: 50px;
			margin-right: 100px;
		}
	</style>
  </head>
  
  <body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		<legend>全部逾期</legend>
	</fieldset>
	
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
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
					<th>ISBN</th>
					<th>书名</th>
					<th>逾期罚款(元)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.pageMsg.lists }" var="overdue" varStatus="loop">
					<tr>
						<td>${overdue.adminNumber }</td>
						<td>${overdue.adminName }</td>
						<td>${overdue.ISBN }</td>
						<td>${overdue.title }</td>
						<td>
							<ul class="layui-nav" style="background-color: rgb(211, 26, 81);">
								<li class="layui-nav-item"> 
									<a href="javascript:;">需缴费${overdue.borrowPenalty }</a>
									<dl class="layui-nav-child">
										<dd>
											<a href="toPayAndReturn?id=${overdue.bookId }&readerId=${overdue.readerId }&from=showAllOverdue"
												onclick="return confirm('读者已付款？清除记录？')">缴费，并且还书</a>
										</dd>
										<dd>
											<a href="toPayNoReturn?id=${overdue.bookId }&readerId=${overdue.readerId }&from=showAllOverdue"
												onclick="return confirm('读者已付款？清除记录？')">缴费，但未还书</a>
										</dd>
									</dl>
								</li>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
			
	<!-- 页码显示 -->
	<div class="pageshow">
		<span> 第${requestScope.pageMsg.currPage }/${requestScope.pageMsg.totalPage}页</span>
		&nbsp;&nbsp; <span>总记录数：${requestScope.pageMsg.totalCount }&nbsp;&nbsp;每页显示:${requestScope.pageMsg.pageSize}</span>
		&nbsp;&nbsp; <span>
			<c:if test="${requestScope.pageMsg.currPage != 1}">
				<a href="${baseUri}/showOverdue?currentPage=1">[首页]</a>&nbsp;&nbsp;
				<a href="${baseUri}/showOverdue?currentPage=${requestScope.pageMsg.currPage-1}">[上一页]</a>
				&nbsp;&nbsp;
			</c:if>
			<c:if test="${requestScope.pageMsg.currPage != requestScope.pageMsg.totalPage}">
				<a href="${baseUri}/showOverdue?currentPage=${requestScope.pageMsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
				<a href="${baseUri}/showOverdue?currentPage=${requestScope.pageMsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
			</c:if>
		</span>
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
	</script>
  </body>
</html>
