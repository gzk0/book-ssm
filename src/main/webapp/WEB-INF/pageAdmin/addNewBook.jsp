<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("baseUri", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统</title>
<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${baseUri}/static/layui/css/modules/laydate/default/laydate.css">
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
		<legend>上架新书籍</legend>
	</fieldset>

	<form class="layui-form" action="${baseUri}/admin/addBook.do" method="POST"
		enctype="multipart/form-data">
		<!-- 图书标题 -->
		<div class="layui-form-item">
			<label class="layui-form-label">图书标题</label>
			<div class="layui-input-block" style="width: 400px;">
				<input type="text" name="bName" lay-verify="required"
					autocomplete="off" placeholder="请输入标题" class="layui-input">
			</div>
		</div>

		<!-- 图书ISBN -->
		<div class="layui-form-item">
			<label class="layui-form-label">ISBN</label>
			<div class="layui-input-block" style="width: 400px;">
				<input type="text" name="ISBN" lay-verify="required"
					autocomplete="off" placeholder="请输入ISBN号" class="layui-input">
			</div>
		</div>

		<!-- 图书作者 -->
		<div class="layui-form-item">
			<label class="layui-form-label">作者</label>
			<div class="layui-input-block" style="width: 400px;">
				<input type="text" name="bAuthor" lay-verify="required"
					autocomplete="off" placeholder="请输入作者" class="layui-input">
			</div>
		</div>

		<!-- 图书作者 -->
		<div class="layui-form-item">
			<label class="layui-form-label">出版社</label>
			<div class="layui-input-block" style="width: 400px;">
				<input type="text" name="bPublisher" lay-verify="required"
					   autocomplete="off" placeholder="请输入出版社" class="layui-input">
			</div>
		</div>

		<!-- 图书价格 -->
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="bPrice" placeholder="元" autocomplete="off"
					class="layui-input">
			</div>
			<label class="layui-form-label">数量</label>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="bNum" placeholder="本" autocomplete="off"
					class="layui-input">
			</div>
		</div>

		<!-- 图书出版时间 -->
		<div class="layui-form-item">
			<label class="layui-form-label">出版时间</label>
			<div class="layui-input-inline" style="width: 150px;">
				<input type="date" name="bPubTime" pattern="yyyy-MM-dd"
					   autocomplete="off" class="layui-input" >
				<%--<input type="text" name="bPubTime"  id="test1"
					class="layui-input" autocomplete="off">--%>
			</div>
		</div>

		<!-- 图书简介 -->
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">图书简介</label>
			<div class="layui-input-block">
				<textarea name="bIntroduce" placeholder="请输入内容" class="layui-textarea"
					style="width: 400px; height: 150px"></textarea>
			</div>
		</div>


		<!-- 图书的封面图片按钮 -->
		<div class="layui-form-item">
			<label class="layui-form-label">上传封面</label>
			<div class="layui-upload">
				<input type="file" name="file" class="img_btn"
					onchange="showPreview(this)" />
			</div>
		</div>

		<!-- 图书的封面图片 -->
		<div class="layui-form-item">
			<label class="layui-form-label">选择的封面</label>
			<div class="layui-upload">
				<div class="layui-upload-list">
					<img id="portrait" src=""
						style="display: none; width: 100px; height: 140px;" />
				</div>
			</div>
		</div>

		<!-- 提交图书信息 -->
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>




	<script src="${baseUri}/static/layui/lay/modules/laydate.js"></script>
	<script type="text/javascript">
		//执行一个laydate实例
		laydate.render({
			elem: '#test1', //指定元素
			format : 'yyyy-MM-dd HH:mm:ss',
			type : 'datetime',
			position : 'fixed'
		});
	</script>


</body>
</html>