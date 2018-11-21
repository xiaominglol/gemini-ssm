<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%--公共标签tab--%>
<%@ include file="/view/common/taglib.jsp" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <%--IE 兼容模式 （未测试）--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--bootstrap设置移动设备优先（响应式设计必加）（未测试）--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>erp</title>

    <!-- =======================第三方插件======================= -->

    <!-- jquery 为核心，所以优先引入，才能让以下插件使用 -->
    <script src="${ctx }/static/plugins/jquery/jquery-2.2.4.min.js"></script>

    <!-- bootstrap（依赖jquery） -->
    <script src="${ctx }/static/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx }/static/plugins/bootstrap-3.3.7/css/bootstrap.min.css">

    <!-- bootstrap table（依赖jquery、bootstrap） -->
    <script src="${ctx }/static/plugins/bootstrap-table-1.11.1/js/bootstrap-table.min.js"></script>
    <script src="${ctx }/static/plugins/bootstrap-table-1.11.1/js/bootstrap-table-zh-CN.min.js"></script>
    <link rel="stylesheet" href="${ctx }/static/plugins/bootstrap-table-1.11.1/css/bootstrap-table.min.css">

    <!-- jquery-treetable（依赖jquery） -->
    <script src="${ctx}/static/plugins/jquery-treetable-3.2.0/js/jquery.treetable.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/jquery-treetable-3.2.0/css/jquery.treetable.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/jquery-treetable-3.2.0/css/jquery.treetable.theme.default.css">


    <!-- jqGrid（依赖jquery） -->
    <script src="${ctx}/static/plugins/jqGrid-5.2.1/js/jquery.jqGrid.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/jqGrid-5.2.1/css/ui.jqgrid-bootstrap.css">


    <%-- =======================自定义插件======================= --%>
    <%--公共页面--%>
    <link rel="stylesheet" href="${ctx }/static/css/common.css">
</head>

<body>

