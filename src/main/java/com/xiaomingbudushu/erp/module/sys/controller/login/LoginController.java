package com.xiaomingbudushu.erp.module.sys.controller.login;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 登录Controller
 * @author 小明
 * @time 2017-10-27
 */
@Controller
@RequestMapping("/LoginController")
public class LoginController {

	@RequestMapping("/index")
	public String index () {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(
			@RequestParam("userAccount") String userAccount,
			@RequestParam("password") String password){
		//获取当前用户
		Subject currentUser = SecurityUtils.getSubject();
		
		//是否认证通过,即是否已经登录
		if(!currentUser.isAuthenticated()){
			//验证用户名和密码
			UsernamePasswordToken token = new UsernamePasswordToken(userAccount,password);
			try {
				currentUser.login(token);
				return "redirect:/LoginController/index";
			} catch (AuthenticationException e) {
				System.out.println("登录失败:"+e.getMessage());
			}
		}
		return "login";
	}
}
