<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
	scope="request"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
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
  </head>
  <style>
	.pageshow {
		background-color: orage;
		float: right;
		line-height: 50px;
		margin-right: 100px;
	}
  </style>
  
  <body>
    <fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>所有读者</legend>
	</fieldset>
	
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="150">
				<col width="100">
				<col width="100">
				<col width="150">
				<col width="150">
			</colgroup>
			<thead>
				<tr>
					<th>用户账号</th>
					<th>用户姓名</th>
					<th>用户头像</th>
					<th>用户身份</th>
                    <th>用户性别</th>
					<th>用户详情</th>
					<th>借阅图书详情</th>
					<th>删除</th>
					<!-- <th>超期罚款总额(元)</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${readers}" var="reader">
					<tr>
						<td>${reader.rCard }</td>
						<td>${reader.rNick }</td>
						<td>
							<c:if test="${reader.rPhoto==null}">
								<img id="user_photo" class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
							</c:if>
							<c:if test="${reader.rPhoto !=null }">
								<c:if test="${reader.rPhoto=='' }">
									<img id="user_photo"  class="img-circle" src="${baseUri}/static/images/head.jpg" width="80px" height="80px;">
								</c:if>
								<c:if test="${reader.rPhoto !='' }">
									<img  id="user_photo"  class="img-circle" src="${baseUri}/headPhoto/${reader.rPhoto}" alt="" width="80px" height="80px;">
								</c:if>
							</c:if>
						</td>
						<td>${reader.rPrivilege==0?"学生":"教师" }</td>
                        <td>${reader.rSex==0?"男":"女" }</td>
						<td><a class="layui-btn"
							style="background-color: rgb(204, 139, 41)"
							href="${baseUri}/admin/${reader.rId}/getReaderInof.do">进入</a>
						</td>
						<td><a class="layui-btn"
							style="background-color: cadetblue"
							href="${baseUri}/admin/${reader.rId}/getBorrowsByReader.do">查看</a>
							<%-- <c:if test="${admin.id == 15 }">
								<span style="color: red">有逾期</span>
							</c:if> --%>
						</td>
						<td><a class="layui-btn"
							style="background-color: rgb(211, 26, 81)"
							href="${baseUri}/admin/${reader.rId}/deleteReader.do" onclick="return confirm('确认删除${reader.rCard }吗？')">删除</a>
						</td>
						<%-- <td>${admin.identityId }</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 页码显示 -->
	<%--<div class="pageshow">
		<span> 第${requestScope.pageMsg.currPage }/${requestScope.pageMsg.totalPage}页</span>
		&nbsp;&nbsp; <span>总记录数：${requestScope.pageMsg.totalCount }&nbsp;&nbsp;每页显示:${requestScope.pageMsg.pageSize}</span>
		&nbsp;&nbsp; <span> <c:if
				test="${requestScope.pageMsg.currPage != 1}">
				<a href="${baseUri}/showReader?currentPage=1">[首页]</a>&nbsp;&nbsp;
         				<a
					href="${baseUri}/showReader?currentPage=${requestScope.pageMsg.currPage-1}">[上一页]</a>
         				&nbsp;&nbsp;
     				</c:if> <c:if
				test="${requestScope.pageMsg.currPage != requestScope.pageMsg.totalPage}">
				<a
					href="${baseUri}/showReader?currentPage=${requestScope.pageMsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
         				<a
					href="${baseUri}/showReader?currentPage=${requestScope.pageMsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
     				</c:if>
		</span>
	</div>--%>
  </body>
</html>
