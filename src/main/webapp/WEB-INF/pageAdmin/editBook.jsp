<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            fr.onloadend = function (e) {
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
    <legend>编辑书籍信息</legend>
</fieldset>

<form class="layui-form" action="${baseUri}/admin/updateBook.do" method="post" enctype="multipart/form-data" >
    <input type="hidden" name="id" value="${book.id }"/>

    <!-- 图书标题 -->
    <div class="layui-form-item">
        <label class="layui-form-label">图书名</label>
        <div class="layui-input-block" style="width: 400px;">
            <input type="text" name="bName" lay-verify="required"
                   autocomplete="off" value="${book.bName }" class="layui-input">
        </div>
    </div>

    <!-- 图书ISBN -->
    <div class="layui-form-item">
        <label class="layui-form-label">ISBN</label>
        <div class="layui-input-block layui-input" style="width: 400px;height: 40px;line-height: 40px;color: #adadad">
			${book.ISBN }
        </div>
    </div>

    <!-- 图书作者 -->
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block" style="width: 400px;">
            <input type="text" name="author" lay-verify="required"
                   autocomplete="off" value="${book.bAuthor }" class="layui-input">
        </div>
    </div>

    <!-- 图书价格 -->
    <div class="layui-form-item">
        <label class="layui-form-label">价格(元)</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="bPrice" value="${book.bPrice }" autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">总的数量(本)</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input type="text" name="bNum" value="${book.bNum }" autocomplete="off"
                   class="layui-input">
        </div>
    </div>



	<div class="layui-form-item">
		<label class="layui-form-label">上架时间</label>
		<div class="layui-input-block layui-input" style="width: 400px;height: 40px;line-height: 40px;color: #adadad">
			${book.bJoinTime }
		</div>
	</div>

	<!-- 出版时间 -->
	<div class="layui-form-item">
		<label class="layui-form-label">出版社</label>
		<div class="layui-input-inline" style="width: 200px;">
			<input type="text" name="bPublisher"
				   autocomplete="off" class="layui-input" value="${book.bPublisher}">
		</div>
	</div>

    <!-- 出版时间 -->
    <div class="layui-form-item">
        <label class="layui-form-label">出版时间</label>
        <div class="layui-input-inline" style="width: 200px;">
            <input type="date" name="bPubTime" pattern="yyyy-MM-dd"
                   autocomplete="off" class="layui-input" value="${book.bPubTime}">
        </div>
    </div>

    <!-- 图书简介 -->
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">图书简介</label>
        <div class="layui-input-block">
				<textarea name="bIntroduce" class="layui-textarea"
                          style="width: 400px; height: 150px">${book.bIntroduce}</textarea>
        </div>
    </div>

    <!-- 图书的封面图片 -->
    <div class="layui-form-item">
        <label class="layui-form-label">原图书封面</label>
        <div class="layui-upload">
            <div class="layui-upload-list">
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
            </div>
        </div>
    </div>
    <!-- 图书的封面图片按钮 -->
    <div class="layui-form-item">
        <label class="layui-form-label">上传新封面</label>
        <div class="layui-upload">
            <input type="file" name="file" class="img_btn"
                   onchange="showPreview(this)"/>
        </div>
    </div>

    <!-- 图书的封面图片 -->
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-upload">
            <div class="layui-upload-list">
                <img id="portrait" src=""
                     style="display: none; width: 100px; height: 140px;"/>
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

    <script src="${baseUri}/static/layui/layui.js"></script>
    <script>
        //JavaScript代码区域
        layui.use('element', function () {
            var element = layui.element;

        });
        layui.use(['form'], function () {
            var form = layui.form;
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
    </script>
</body>
</html>