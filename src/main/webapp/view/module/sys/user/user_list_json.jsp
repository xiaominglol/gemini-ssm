<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp"%>
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-8">
			<h1>用户列表</h1>
		</div>
		<div class="col-md-4">
		<h5>
			<a href="${pageContext.request.contextPath}/UserController/getUser">进入用户管理页</a>
		</h5>
			<button>退出</button>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<button class="btn btn-primary">查询</button>
			<button class="btn btn-primary">新增</button>
			<button class="btn btn-danger">删除</button>
		</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>用户账号1</th>
						<th>用户名称</th>
						<th>员工ID</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="user" items="${userList }" varStatus="status">
					<tr>
						<td>${user.userAccount }</td>
						<td>${user.userName }</td>
						<td>${user.empId }</td>
						<td>
							${user.status eq 3 ? '正常':'无效' }
						</td>
						<td>
							<button class="btn btn-primary btn-sm" onclik="updateUser('${user.userAccount}')">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-sm" onclik="deleteUser('${user.userAccount}')">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 分页 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-6">
			当前 ${pageInfo.pageNum }页,总${pageInfo.pages }页,总 ${pageInfo.total } 条记录
		</div>
		<!-- 分页条信息 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
				<c:if test="${pageInfo.hasPreviousPage }">
					<li>
					<a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					</a>
					</li>
				</c:if>

				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageInfo.hasNextPage }">
					<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
			</ul>
			</nav>
		</div>
	</div>
	
	<input type="button" id="addButton" value="增加用户">
	<a href="${ctx }/LoginController/logout">退出</a>
</div>


<script type="text/javascript">
$(function(){
	//1、页面加载完后，自动发送ajax请求
	$.ajax({
		url:"${pageContext.request.contextPath}/UserController/getUser",
		data:"pageNum=1",
		type:"GET",
		success:function(data){
			console.log(result);
		}
	});
	
	$("#addButton").click(function(){
		var url ='${pageContext.request.contextPath}/UserController/gotoAddUser';
		window.location.href = url;
	});
});

function updateUser(userAccount){
	var url ='${pageContext.request.contextPath}/UserController/gotoUpdateUser?userAccount='+userAccount;
	window.location.href = url;
}

function deleteUser(userAccount){
	//var url ='${pageContext.request.contextPath}/UserController/delete?userAccount='+userAccount;
	//window.location.href = url;
	var r=confirm("确定删除此数据？");
	if (r==false){return false;}
	$.ajax({
		url:'${pageContext.request.contextPath}/UserController/delete',
		//dataType:'json',
		type: 'POST',
		data: {userAccount:userAccount},
		success: function (data) {
			alert("success.");
		},
		error: function () {
			alert("error.");
		}
	});
	window.location.reload();

}

</script>

<%@ include file="/view/common/footer.jsp"%>