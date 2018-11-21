package com.gemini.ssm.module.sys.service.menu;

import com.gemini.ssm.module.common.service.CrudService;
import com.gemini.ssm.module.sys.entity.menu.Menu;

import java.util.List;

/**
 * 菜单服务层接口
 * @author 小明
 * @date 2017-12-25
 */
public interface MenuService extends CrudService<Menu> {

	/**
	 * 通过用户ID查询所有列表（不带分页）
	 */
	List<Menu> getByUserAccount(String userAccount);

}
