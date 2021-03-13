<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
	scope="request"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统</title>
<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
</head>
<script type="text/javascript">
	function showPreview(source) {
		var file = source.files[0];
		if (window.FileReader) {
			var fr = new FileReader();
			console.log(fr);
			var portrait = document.getElementById('portrait');
			fr.onloadend = function(e) {
				portrait.src = e.target.result;
			};
			fr.readAsDataURL(file);
			portrait.style.display = 'block';
		}
	}
</script>
<body>
	<!-- 内容主体区域 -->
	<fieldset class="layui-elem-field layui-field-title">
		<legend>已下架的图书</legend>
	</fieldset>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="50">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="50">
				<col width="450">
				<col width="50">
				<col width="50">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>ISBN</th>
					<th>书名</th>
					<th>作者</th>

					<th>价格(元)</th>
					<th>介绍</th>
					<th>封面</th>
					<th>重新上架</th>
					<th>彻底删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="vs">
					<tr>
						<td>${vs.index }</td>
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
						<td>
						<a class="layui-btn"
							style="background-color: #33cc00" href="${baseUri}/admin/${book.id}/onBook.do">重新上架</a>
						</td>
						<td>
							<a class="layui-btn"
							style="background-color: #ff0000" href="${baseUri}/admin/${book.id}/deleteBook.do"
							onclick="return confirm('确认彻底删除该图书:《${book.bName }》？')">彻底删除</a>
						</td>
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