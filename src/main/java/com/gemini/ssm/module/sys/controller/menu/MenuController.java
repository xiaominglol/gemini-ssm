package com.gemini.ssm.module.sys.controller.menu;


import com.gemini.ssm.module.sys.service.user.UserService;
import com.gemini.ssm.module.sys.utils.UserUtils;
import com.github.pagehelper.PageInfo;
import com.gemini.ssm.module.common.controller.BaseController;
import com.gemini.ssm.module.common.entity.Message;
import com.gemini.ssm.module.sys.entity.menu.Menu;
import com.gemini.ssm.module.sys.entity.user.User;
import com.gemini.ssm.module.sys.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 菜单控制层
 * @author 小明
 * @date 2017-12-12
 */
@Controller
@RequestMapping("/MenuController")
public class MenuController extends BaseController {
	
	@Autowired
	MenuService menuService;
	@Autowired
	private UserService userService;

	/**
	 * 跳转到列表
	 */
	@RequestMapping("/gotoList")
	public String gotoList(Model model) {
		String userAccount = UserUtils.getCurrentUser();
		List<Menu> list = menuService.getByUserAccount(userAccount);
		model.addAttribute("list",list);
		return "module/sys/menu/menu_list";
	}

	/**
	 * 菜单列表（分页查询）
	 */
	@RequestMapping("/pageList")
	public String pageList(Model model) {
		String userAccount = UserUtils.getCurrentUser();
		//第一步：组装数据
		List<Menu> menuList = menuService.getByUserAccount(userAccount);

		//第三步：封装分页信息，每页显示5页
		PageInfo pageInfo = new PageInfo(menuList,5);
		//第四步：绑定参数
		model.addAttribute("pageInfo", pageInfo);
		//转发
		return "module/sys/menu/menu_list";
	}

	/**
	 * 菜单列表（不带分页）
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Message list() {
		String userAccount = UserUtils.getCurrentUser();

		List<Menu> menuList = menuService.getByUserAccount(userAccount);

		// 以json格式返回数据
		return Message.success().add("menuList", menuList);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public String save(Menu menu) {
		String userAccount = UserUtils.getCurrentUser();
		User user = userService.getUserById(userAccount);
		menu.setLastUpdateName(user.getUserName());
		menuService.insert(menu);
		return "redirect:/MenuController/gotoList";
	}

	/**
	 * 更新
	 */
	@RequestMapping("/update")
	public String update(Menu menu) {
		menuService.update(menu);
		return "redirect:/MenuController/gotoList";
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public String delete(String id) {
		menuService.delete(id);
		return "redirect:/MenuController/gotoList";
	}
}
