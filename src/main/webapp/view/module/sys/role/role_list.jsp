<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/view/common/header.jsp" %>

<div class="container-fluid">

    <br/>

    <%--查询--%>
    <div class="row">
        <div class="col-md-4">
            <div id="toolbar" class="btn-group btn-group-md">
                <button id="addButton" class="btn btn-primary"><span class="glyphicon glyphicon-plus"
                                                                     aria-hidden="true"></span>添加
                </button>
                <button id="editButton" class="btn btn-success"><span class="glyphicon glyphicon-play"
                                                                      aria-hidden="true"></span>修改
                </button>
                <button id="delButton" class="btn btn-danger"><span class="glyphicon glyphicon-remove"
                                                                    aria-hidden="true"></span>删除
                </button>
            </div>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <form class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名称">
                </div>
                <button type="button" id="queryButton" class="btn btn-default">查询</button>
                <button type="reset" class="btn btn-default">重置</button>
                <button type="button" id="advancedQueryButton" class="btn btn-default">高级查询</button>
            </form>
        </div>
    </div>

    <br/>

    <%--高级查询--%>
    <div id="advancedQueryDiv" class="row">
        <div class="col-md-12">
            <form class="form-inline">
                <div class="form-group">
                    <label class="sr-only" for="userName">请输入用户名称</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名称">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="userName">请输入用户名称</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名称">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="userName">请输入用户名称</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名称">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="userName">请输入用户名称</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名称">
                </div>
            </form>
        </div>
    </div>

    <br/>

    <%--列表--%>
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table id="table" class="table table-bordered table-hover table-striped table-condensed">

                </table>
            </div>
        </div>
    </div>

</div>

<%--新增--%>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addModalLabel">新增角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roleId" name="roleId" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roleName" name="roleName" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">排序</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sort" name="sort" placeholder="" value="">
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

<%--授权--%>
<div class="modal fade" id="authorityModal" tabindex="-1" role="dialog" aria-labelledby="authorityModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="authorityModalLabel">授权</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roleId" name="roleId" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roleName" name="roleName" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">排序</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="sort" name="sort" placeholder="" value="">
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
    $(function () {

        //初始化表格
        initTable();

        /*查询*/
        $("#queryButton").click(function () {
            refreshTable();
        });

        /*高级查询*/
        $("#advancedQueryDiv").hide();
        $("#advancedQueryButton").click(function () {
            if ($("#advancedQueryDiv").is(":hidden")) {
                $("#advancedQueryDiv").show();
            } else {
                $("#advancedQueryDiv").hide();
            }
        });

        /*添加*/
        $("#addButton").click(function () {
            $("#checkbox").empty();
            $.ajax({
                url: '${ctx}/RoleController/list',
                type: 'GET',
                success: function (result) {
                    console.log(result);
                    $.each(result.list, function (index, item) {
                        var lable = $("<label></label>");
                        var input = $("<input>").attr("type", "checkbox").attr("value", item.roleId);
                        lable.append(input).append(item.roleName);
                        $("#checkbox").append(lable);
                    });
                }
            });

            $("#addModal").modal({
                keyboard: 'static'
            })
        });
    });


    function initTable() {
        $('#table').bootstrapTable({
            url: '${ctx}/RoleController/pageList',		//（必须）请求地址
            method: 'get', 							//请求方式
            contentType: "application/x-www-form-urlencoded",//（必须）未测试
            dataType: 'json',						//服务器返回的数据类型
            sidePagination: 'server',				//（必须）分页类型
            cache: true,							//设置为 false 禁用 AJAX 数据缓存
            pagination: true, 						//（必须）启用分页
            pageNumber: 1,
            pageSize: 20,
            pageList: [10, 20, 50, 100],
            idField: 'user_account',						//主键列
            uniqueId: 'user_account',					//每一行的唯一标识，一般为主键列
            sortName: 'user_account', 					//排序列
            sortOrder: 'asc',						//排序方式 'asc' 或者 'desc'
            paginationPreText: '上一页',
            paginationNextText: '下一页',
            clickToSelect: true,					//设置true 将在点击行时，自动选择checkbox或者rediobox
            height: $(window).height() * 0.9, /*定义表格的高度*/
            width: $(window).width() * 0.9, /*定义表格的宽度*/
//        toolbar: '#toolbar',					/*可以在table上方显示的一条工具栏*/
            singleSelect: false, /*设置True 将禁止多选*/
            searchOnEnterKey: true,					//ENTER键搜索
            search: false,							//是否启用搜索框
            showColumns: false,						//是否显示 内容列下拉框
            showRefresh: false,						//是否显示 刷新按钮
            maintainSelected: true,					//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
            sortable: true,							//设置为 false 将禁止所有列的排序
            silentSort: false,						//设置为 false 将在点击分页按钮时，自动记住排序项。仅在 sidePagination设置为 server时生效.
//        detailView: true,						//设置为 true 可以显示详细页面模式。
            //格式化详细页面模式的视图。
//		detailFormatter: function (index, row) {
//			return '';
//       },

            //（必须）查询参数
            queryParams: function (params) {
                console.log(params);
                var temp = {
                    userName: $("#userName").val(),
                    pageSize: this.pageSize, 	//页面大小
                    pageNum: this.pageNumber,	//页码
                    sort: this.sortName,		//排序列
                    order: this.sortOrder,		//排序方式
                    search: params.search		//搜索关键字
                };
                for (var col = 0; col < this.columns[0].length; col++) {
                    if (this.columns[0][col].field == this.sortName) {
//                  console.log(this.columns[0][col].sortName);
                        temp.sort = this.columns[0][col].sortName;
                    }
                }
                return temp;
            },
            //（必须）获取返回的数据的时候做相应处理，让bootstrap table认识我们的返回格式
            responseHandler: function (res) {
//            console.log(res);
                return {
                    "rows": res.list,
                    "total": res.total
                };
            },
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'roleId',
                    title: '角色ID',
                    align: 'center',
                    sortable: true,
                    sortName: 'role_id'
                }, {
                    field: 'roleName',
                    title: '角色名称',
                    align: 'center',
                    sortable: true,
                    sortName: 'role_name'
                }, {
                    field: 'sort',
                    title: '排序',
                    align: 'center',
                    sortable: true,
                    sortName: 'sort'
                }, {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    sortable: true,
                    sortName: 'status'
                }, {
                    title: '操作',
                    width: '280px',
                    formatter: 'operateButon',
                    events: 'operateEvents'
                }]
        });
    }

    //操作列按钮
    function operateButon(value, row, index) {
        return '<div id="toolbar" class="btn-group">' +
            '<button id="btn_authority" type="button" class="btn btn-default">' +
            '<span class="glyphicon glyphicon-search" aria-hidden="true"></span>授权' +
            '</button>' +
            '<button id="btn_edit" type="button" class="btn btn-default">' +
            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑' +
            '</button>' +
            '<button id="btn_authority" type="button" class="btn btn-default">' +
            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除' +
            '</button>' +
            '</div>'
    }

    //操作列按钮事件
    window.operateEvents = {
        "click #btn_authority": function (event, row, index) {
            window.location.href = "detail?id=" + index.id;
        }, "click #btn_edit": function (event, row, index) {
            window.location.href = "edit?id=" + index.id;
        }, "click #btn_delete": function (event, row, index) {
            layer.confirm('您确定要删除吗？', {
                icon: 3
            }, function () {
                ajaxDeleteData("delete", index.id);
            });
        }
    }

    /*刷新表格*/
    function refreshTable() {
        $('#table').bootstrapTable("refresh");
    }


</script>

<%@ include file="/view/common/footer.jsp" %>