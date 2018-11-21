<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/view/common/header.jsp"%>

<div>
	<form id="addUserForm"
		action="${pageContext.request.contextPath}/UserController/add">
		用户账号:<input type="text" name="userAccount" value="" />
		用户名称:<input type="text" name="userName" value="" />
		员工ID:<input type="text" name="empId" value="" />
		<input type="button" value="添加用户" onclick="addUser()" />
		<input type="button" value="查询用户" onclick="queryUser()" />
		<input type="button" value="查询用户1" onclick="queryUser1()" />
		<input type="button" value="查询用户2" onclick="queryUser2()" />
	</form>
</div>

<script>
	function addUser() {
		var data = $("#addUserForm").serialize();
		//var url ='${pageContext.request.contextPath}/UserController/add?' + data;
		//window.location.href = url;
		//window.open("${pageContext.request.contextPath}/UserController/add?" + data, "_blank");

		$("#addUserForm").submit();

		/* $("#addUserForm").ajaxSubmit({
			dataType : "json",
			data: data,
			success : function(data) {
				alert("添加成功.");
			},
			error : function(request) {
				alert("添加失败.");
			}
		}); */
	}

	function queryUser() {
		$("#addUserForm").attr("action",
				"${pageContext.request.contextPath}/UserController/queryAll");
		$("#addUserForm").submit();
	}
	function queryUser1() {
		$("#addUserForm").attr("action",
				"${pageContext.request.contextPath}/UserController/queryAll1");
		$("#addUserForm").submit();
	}
	function queryUser2() {
		$("#addUserForm").attr("action",
				"${pageContext.request.contextPath}/UserController/queryAll2");
		$("#addUserForm").submit();
	}
</script>

<%@ include file="/view/common/footer.jsp"%>