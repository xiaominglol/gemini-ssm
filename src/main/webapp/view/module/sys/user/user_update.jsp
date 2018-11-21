<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<div>
	更新用户：${user }
	<form id="addUserForm" action="${pageContext.request.contextPath}/UserController/update">
		用户账号:<input type="text" id="userAccount" name="userAccount" value="${user.userAccount }" />
		用户名称:<input type="text" id="userName" name="userName" value="${user.userName }" />
		密码:<input type="text" id="password" name="password" value="${user.password }" />
		员工ID:<input type="text" id="empId" name="empId" value="${user.empId }" />
		<input type="button" value="确定" onclick="updateUser()" />
		<input type="button" value="查询用户" onclick="queryUser()" />
		<input type="button" value="查询用户1" onclick="queryUser1()" />
		<input type="button" value="查询用户2" onclick="queryUser2()" />
	</form>
</div>

<script>
	function updateUser() {
		//var data = $("#addUserForm").serialize();
		//var url ='${pageContext.request.contextPath}/UserController/update?' + data;
		//window.location.href = url;
		//window.open("${pageContext.request.contextPath}/UserController/update?" + data, "_blank");

		$("#addUserForm").submit();
	}
	
	function queryUser() {
		$("#addUserForm").attr("action","${pageContext.request.contextPath}/UserController/queryAll");
		$("#addUserForm").submit();
	}
	function queryUser1() {
		$("#addUserForm").attr("action","${pageContext.request.contextPath}/UserController/queryAll1");
		$("#addUserForm").submit();
	}
	function queryUser2() {
		$("#addUserForm").attr("action","${pageContext.request.contextPath}/UserController/queryAll2");
		$("#addUserForm").submit();
	}
</script>

<%@ include file="/view/common/footer.jsp"%>