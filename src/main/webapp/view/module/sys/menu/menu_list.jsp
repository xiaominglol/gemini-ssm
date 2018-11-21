<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp"%>

<div class="container-fluid">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>菜单列表</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-2 col-md-offset-10">
			<button class="btn btn-primary">查询</button>
			<button id="addButton" class="btn btn-primary">新增</button>
			<button class="btn btn-danger">删除</button>
		</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
			<table id="dataTable" class="table table-bordered table-hover">
				<tr>
					<th class="text-center">
						<a href="#"><img src="${ctx}/static/img/icon/32/add_32.png" title="全部展开" onclick="expandAll()"></a>
						<a href="#"><img src="${ctx}/static/img/icon/32/subtract_32.png" title="全部折叠" onclick="collapseAll()"></a>
						菜单名称
					</th>
					<th class="text-center">菜单类型</th>
					<th class="text-center">url</th>
					<th class="text-center">icon</th>
					<th class="text-center">权限标识</th>
					<th class="text-center">排序</th>
					<th class="text-center">状态</th>
					<th class="text-center">操作</th>
				</tr>
				<c:forEach var="list" items="${list }" varStatus="status">

					<tr data-tt-id="${list.menuId}" data-tt-parent-id="${empty list.parentMenuId?'':list.parentMenuId}" class="text-center">
						<td>
							<c:if test="${not empty list.menuIcon}">
								<img src="${ctx}${list.menuIcon }" width="25px" height="25px">&nbsp;
							</c:if>
							${list.menuName }</td>
						<td>
							<c:if test="${list.menuType eq 1}">
								一级菜单
							</c:if>
							<c:if test="${list.menuType eq 2}">
								二级菜单
							</c:if>
							<c:if test="${list.menuType eq 3}">
								三级菜单
							</c:if>
							<c:if test="${list.menuType eq 4}">
								按钮
							</c:if>
						</td>
						<td>${list.menuUrl }</td>
						<td>${list.menuIcon }</td>
						<td>${list.permissionsFlag}</td>
						<td>${list.sort}</td>
						<td>${list.status eq 1 ? '正常':'无效' }</td>
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

			</table>
		</div>
	</div>
	
</div>

<!-- 新增 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增</h4>
      </div>
      <div class="modal-body">
		<form id="addForm" class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">上级菜单</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="parentMenuId" name="parentMenuId" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">菜单名称</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="menuName" name="menuName" placeholder="" value="测试菜单">
		    </div>
		  </div>
			<div class="form-group">
				<label class="col-sm-2 control-label">菜单类型</label>
				<div class="col-sm-10">
					<select class="form-control" name="menuType">
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						<option value="3">三级菜单</option>
						<option value="4">按钮</option>
					</select>
				</div>
			</div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">url</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="menuUrl" name="menuUrl" placeholder="" value="">
		    </div>
		  </div>
			<div class="form-group">
				<label class="col-sm-2 control-label">icon</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="menuIcon" name="menuIcon" placeholder="" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">权限标识</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="permissionsFlag" name="permissionsFlag" placeholder="" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">排序</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="sort" name="sort" placeholder="" value="1">
				</div>
			</div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">状态</label>
		    <div class="col-sm-4">
		    	<select class="form-control" name="status" id="status">
					<option value="1">有效</option>
			  		<option value="0">无效</option>
				</select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button id="saveButton" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>


<script>
$(function(){
    $("#dataTable").treetable({
        expandable: true,//默认false，树是否可以展开，可以展开的树包含展开/折叠按钮。
        initialState: 'expanded',//默认collapsed，可选值: "expanded" or "collapsed" 是否初始化展开或者折叠.
        clickableNodeNames: true,//默认false，点击展开图标打开子节点。设置为true时，点击节点名称也打开子节点.
        stringCollapse: '折叠',//默认Collapse，折叠按钮的title
        stringExpand: '展开',//默认Expand，展开按钮的title
        indent: 10,//默认19，每个分支缩进的像素数。
        column: 0 //默认0，表中要展示为树的列数。
	});
	
	$("#addButton").click(function(){
		$("#addModal").modal({
			  keyboard: 'static'
		});
	});

    $("#saveButton").click(function(){
        $.ajax({
            url:'${ctx}/MenuController/save',
			data:$("#addForm").serialize(),
            type:'POST',
            success:function(data){
                console.log(data);
            }
        });
    });


	
});

function expandAll() {
    $("#dataTable").treetable("expandAll");
}

function collapseAll() {
    $("#dataTable").treetable("collapseAll");
}

function getMenu(){
	$.ajax({
		url:'${ctx}/',
		type:'GET',
		success:function(result){
			console.log(result);
		}
	});
}

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