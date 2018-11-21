package com.gemini.ssm.module.sys.controller.user;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gemini.ssm.module.common.entity.Message;
import com.gemini.ssm.module.common.entity.Page;
import com.gemini.ssm.module.sys.entity.user.User;
import com.gemini.ssm.module.sys.service.role.RoleService;
import com.gemini.ssm.module.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author 小明
 * @date 2017-11-03
 */
@Controller
@RequestMapping("/UserController")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	/**
	 * 跳转到列表
	 */
	@RequestMapping("/gotoList")
	//@RequiresPermissions("3333")
	public String gotoList() {
		return "module/sys/user/user_list";
	}

	/**
	 * 列表（分页查询），以json格式返回，需要导入jackson包
	 */
	@RequestMapping("/pageList")
	@ResponseBody
	//@RequiresPermissions("3333")
	public PageInfo<User> pageList(Page page, User user) {
		//第一步：设置分页参数
		PageHelper.startPage(page.getPageNum(), page.getPageSize() ,page.getOrderBy());
		//第二步：组装数据
		List<User> list = userService.list(user);
		//第三步：封装分页信息
		PageInfo<User> pageInfo = new PageInfo<>(list);
		//以json格式返回数据
		Message msg = Message.success().add("pageInfo", pageInfo);
		return pageInfo;
	}

	/**
	 * 跳转到添加页面
	 */
	@RequestMapping("/gotoAdd")
	public String gotoAdd() {
		return "module/sys/user/user_add";
	}

	/**
	 * 添加
	 */
	@RequestMapping("/add")
	public String add(User user) {
		Date now = new Date();
		user.setPassword("123456");
		user.setLastUpdateTime(now);
		userService.add(user);
		return "redirect:/UserController/list";
	}

	/**
	 * 跳转到更新页面
	 */
	@RequestMapping("/gotoUpdateUser")
	public String gotoUpdateUser(String userAccount, HttpServletRequest request) {
		User user = userService.getUserById(userAccount);
		request.setAttribute("user", user);
		return "module/sys/user/user_update";
	}

	/**
	 * 更新
	 */
	@RequestMapping("/update")
	public String update(User newUser) {
		userService.update(newUser);
		return "redirect:/UserController/queryAll";
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public String delete(String userAccount) {
		userService.delete(userAccount);
		return "redirect:/UserController/queryAll";
	}
}
