package com.xiaomingbudushu.erp.filter;

import com.xiaomingbudushu.erp.utils.CookieUtils;
import com.xiaomingbudushu.erp.module.sys.dao.menu.MenuDao;
import com.xiaomingbudushu.erp.module.sys.entity.menu.Menu;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ContextConfiguration(locations = {"classpath:mybatis/spring-mybatis.xml"})
public class MenuFilter implements Filter {

    @Autowired
    MenuDao menuDao;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("MenuFilter初始化...");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        //对菜单url进行拦截分析，设置默认选中样式
        String params = req.getQueryString();
        String uri = req.getRequestURI();
        if (StringUtils.isNotEmpty(params)) {
            uri += "?" + req.getQueryString();
        }
        String contextPath = req.getContextPath();
        String url = uri.substring(uri.indexOf(contextPath) + contextPath.length());
        Menu menu = menuDao.getById(url);
        if (null != menu) {
            servletRequest.setAttribute("menu_code", menu.getMenuId());
            CookieUtils.addCookie(req, res  , "current_menu", menu.getMenuId());
        }

        // 放行。让其走到下个链或目标资源中
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("MenuFilter销毁...");
    }
}
