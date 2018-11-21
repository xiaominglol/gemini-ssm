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

	<%-- =======================自定义插件======================= --%>
	<%--公共页面--%>
	<link rel="stylesheet" href="${ctx }/static/css/common.css">
	<%--主页--%>
	<link rel="stylesheet" href="${ctx }/static/css/index.css">
	<script src="${ctx }/static/js/index.js"></script>
</head>

<body>

<div class="main">
	<!-- 头部开始 -->
	<div class="header">
		<!-- logo -->
		<div class="logo"><img src="${ctx}/static/img/logo.png" /></div>
		<div class="tab"></div>
		<div class="button"><a href="${ctx}/LoginController/logout">退出</a></div>
	</div>
	<!-- 头部结束 -->

	<!-- 左侧导航开始 -->
	<div class="nav">
		<!-- 主菜单 -->
		<ul class="main-menu">
			<!-- 主页 -->
			<li>
				<%--<i class="iconfont icon-check"></i>--%>
				<div>
					<a href="#" onclick="openMenu('${ctx}/UserController/gotoList');"><img class="icon" src="${ctx}/static/img/icon/index.png" /><span class="main-name">主页</span><img class="arrow-right" src="${ctx}/static/img/icon/arrow-right.png" /></a>
				</div>
			</li>

			<li>
				<div>
					<img class="icon" src="${ctx}/static/img/icon/set.png" /><span class="main-name">系统设置</span><img class="arrow-right" src="${ctx}/static/img/icon/arrow-right.png" />
				</div>
				<ul class="sub-menu">
					<li class="sub-name">
						<div>系统设置</div>
						<ul class="third-menu">
							<li>
								<a href="#" onclick="test('${ctx }/list.jsp');">组织架构</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">角色管理</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">用户管理</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">菜单管理</a>
							</li>
						</ul>
					</li>


					<li class="sub-name">
						<div>后台设置</div>
						<ul class="third-menu">
							<li>
								<a href="${ctx }/list.jsp">序列配置</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">字典配置</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">参数配置</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">接口配置</a>
							</li>
						</ul>
					</li>


					<li class="sub-name">
						<div>日志管理</div>
						<ul class="third-menu">
							<li>
								<a href="${ctx }/list.jsp">登录日志</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">操作日志</a>
							</li>
							<li>
								<a href="${ctx }/list.jsp">异常日志</a>
							</li>
						</ul>
					</li>


				</ul>
			</li>

		</ul>
	</div>
	<!-- 左侧导航结束 -->

	<!-- 右侧工作区开始 -->
	<div class="workspace">
		<%--<div style="height: 30px; width: 100%; background-color: #F3F3F4;line-height: 30px;">面包屑Dashboard/Home/Dashboard</div>--%>
		<%--<div style="height: 100%; width: 100%; background-color: #f3f3f3;">主要内容111</div>--%>
		<iframe id="mainIframe" style="width: 100%;" name="mainIframe" scrolling="yes" src="${ctx}/MenuController/gotoList">


		</iframe>
	</div>
	<!-- 右侧工作区结束 -->

</div>
<%--<script src="../static/js/index.js"></script>--%>
<script>
    $(function(){

        //初始化菜单
        initMenu();

        //自动调整宽高
        var heightObj = $(".nav, .workspace, #mainIframe");
        heightObj.height($("html").height() - $(".header").height());
        $(".workspace").width($(".main").width() - $(".nav").width());

        //鼠标经过主菜单显示当前菜单的下级菜单（注意要用动态加载on，否则append菜单后无法触发函数）
        $('.main-menu').on('mouseenter','>li',function(){
            $(this).find(".sub-menu").show();
            $(this).css("background-color","#222222");
            $(this).css("border","1px solid #2E3C3A");
        })

        $('.main-menu').on('mouseleave','>li',function(){
            $(this).css("background-color","#222222");
            $(this).css("border","0px solid");
            $(this).find(".sub-menu").hide();
        });

        $("#exitButton").click(function(){
            var url ='${ctx }/LoginController/logout';
            window.location.href = url;
        });


    });

    //加载菜单
    function initMenu(){
        $.ajax({
            url:"${ctx}/MenuController/list",
            type:"GET",
            success:function(result){
                console.log(result);
                addMenu(result.result.menuList);
            }
        });
    }

    function addMenu(data) {
        console.log(data);
        $.each(data,function(index,item){
            //console.log(item);
            //alert("item.menuUrl="+item.menuUrl);

//			debugger
            //加载一级菜单
            if (item.menuType == "1") {
                var main_li = $("<li></li>").attr("id",item.menuId);
                var main_div = $("<div></div>");
                var main_img = $("<img></img>").addClass("icon").attr("src","${ctx}" + item.menuIcon);
                var main_span = $("<span></span>").addClass("main-name").append(item.menuName);
                var main_arrow_right = $("<img></img>").addClass("arrow-right").attr("src","${ctx}/static/img/icon/arrow-right.png");
                var sub_ul = $("<ul></ul>").addClass("sub-menu");
                main_div.append(main_img).append(main_span).append(main_arrow_right);
                main_li.append(main_div).append(sub_ul);
                main_li.appendTo(".main-menu");
            }

            //加载二级菜单
            if (item.menuType == "2") {
                var sub_li = $("<li></li>").addClass("sub-name").attr("id",item.menuId);
                var sub_div = $("<div></div>").append(item.menuName);
                var third_ul = $("<ul></ul>").addClass("third-menu");
                sub_li.append(sub_div).append(third_ul);
                sub_li.appendTo("#" + item.parentMenuId + " .sub-menu");
            }

            //加载三级菜单 <a href="#" onclick="openMenu('${ctx }/list.jsp');">组织架构</a>
            if (item.menuType == "3") {
                var third_li = $("<li></li>").attr("id",item.menuId);
                var third_div = $("<div></div>");
                var third_a = $("<a></a>").attr("href","#").attr("onclick","openMenu('"+"${ctx}" + item.menuUrl+"')").append(item.menuName);
                third_div.append(third_a);
                third_li.append(third_div);
                third_li.appendTo("#" + item.parentMenuId + " .third-menu");
            }

        });

    }

    function openMenu(url) {
        $("iframe[name='mainIframe']").attr("src",url);
    }

</script>

<%@ include file="/view/common/footer.jsp"%>