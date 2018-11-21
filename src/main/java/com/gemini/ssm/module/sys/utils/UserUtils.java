package com.gemini.ssm.module.sys.utils;

import org.apache.shiro.SecurityUtils;

/**
 * 用户工具类
 * @author 小明
 * @date 2018-02-09
 */
public class UserUtils {

    /**
     * 获取当前用户
     * @return user
     */
    public static String getCurrentUser() {
        return  (String) SecurityUtils.getSubject().getPrincipal();
    }
}
