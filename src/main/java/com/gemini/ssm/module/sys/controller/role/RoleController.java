package com.gemini.ssm.module.sys.controller.role;

import com.gemini.ssm.module.common.entity.Message;
import com.gemini.ssm.module.common.entity.Page;
import com.gemini.ssm.module.sys.entity.role.Role;
import com.gemini.ssm.module.sys.entity.user.User;
import com.gemini.ssm.module.sys.service.role.RoleService;
import com.gemini.ssm.module.sys.service.user.UserService;
import com.gemini.ssm.module.sys.utils.UserUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 小明
 * @date 2017-11-03
 */
@Controller
@RequestMapping("/RoleController")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;

    /**
     * 跳转到列表
     */
    @RequestMapping("/gotoList")
    public String gotoList() {
        return "module/sys/role/role_list";
    }

    /**
     * 跳转到列表（分页查询）,以json格式返回，需要导入jackson包
     */
    @RequestMapping("/pageList")
    @ResponseBody
    public PageInfo<Role> pageList(HttpServletRequest request
            , Model model, Page page) {
        //第一步：设置分页参数
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        //第二步：组装数据
        List<Role> list = roleService.getList();
        //第三步：封装分页信息
        PageInfo<Role> pageInfo = new PageInfo<>(list);
        //以json格式返回数据
        Message msg = Message.success().add("pageInfo", pageInfo);
//        model.addAttribute("pageInfo", pageInfo);
//
//        request.setAttribute("userList", userList);
//        // 返回ModelAndView
//        ModelAndView modelAndView = new ModelAndView();
//        // 相当于request的setAttribute，在jsp页面中通过itemList来获取
//        modelAndView.addObject("userList", userList);
//        // 指定视图
//        modelAndView.setViewName("system/user/user_list");
//        return modelAndView;
        return pageInfo;
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public String save(Role role) {
        String userAccount = UserUtils.getCurrentUser();
        User user = userService.getUserById(userAccount);
        role.setLastUpdateName(user.getUserName());
		roleService.insert(role);
        return "redirect:/RoleController/gotoList";
    }


    /**
     * 更新
     */
    @RequestMapping("/update")
    public String update(Role entity) {
        roleService.update(entity);
        return "redirect:/RoleController/gotoList";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/delete")
    public String delete(String id) {
        roleService.delete(id);
        return "redirect:/RoleController/gotoList";
    }
}
