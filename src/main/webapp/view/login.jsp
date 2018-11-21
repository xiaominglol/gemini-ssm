<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--公共标签tab--%>
<%@ include file="/view/common/taglib.jsp"%>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<%--IE 兼容模式 （未测试）--%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<%--bootstrap设置移动设备优先（响应式设计必加）（未测试）--%>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>erp</title>

	<%-- =======================第三方插件======================= --%>

	<%-- jquery --%>
	<script src="${ctx }/static/plugins/jquery/jquery-2.2.4.min.js"></script>

	<%-- bootstrap --%>
	<link href="${ctx }/static/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${ctx }/static/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>

	<%-- =======================自定义插件======================= --%>
	<link href="${ctx }/static/css/login.css" rel="stylesheet">
</head>

<body class="body-bg">

<div class="middle-box text-center loginscreen">
	<div>
		<div>
			<h1 class="logo-name">ERP</h1>
		</div>

		<form action="${ctx}/LoginController/login" method="post">
			<div class="form-group">
				<input type="text" name="userAccount" class="form-control" placeholder="用户名" value="admin">
			</div>
			<div class="form-group">
				<input type="password" name="password" class="form-control" placeholder="密码" value="123456">
			</div>
			<button type="submit" class="btn btn-primary btn-block">登 录</button>


			<p class="text-muted text-center">
				<label><input type="checkbox">记住我</label> | 
				<a href="login.html#"><small>忘记密码了？</small></a>
			</p>
		</form>
	</div>
</div>

<%@ include file="/view/common/footer.jsp"%>