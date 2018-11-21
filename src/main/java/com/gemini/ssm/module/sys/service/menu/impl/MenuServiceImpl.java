package com.gemini.ssm.module.sys.service.menu.impl;

import com.gemini.ssm.module.sys.dao.menu.MenuDao;
import com.gemini.ssm.module.sys.entity.menu.Menu;
import com.gemini.ssm.module.sys.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单业务层
 * @author 小明
 * @date 2017-12-12
 */
@Service
@CacheConfig(cacheNames = "userCache")
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDao menuDao;

	@Override
	public Menu getById(String id) {
		return null;
	}

	/**
	 * 查询树形菜单（分页查询）
	 */
	@Override
	public List<Menu> getList() {
		return menuDao.getList();
	}

	@Override
	public void insert(Menu entity) {
		menuDao.insert(entity);
	}

	/**
	 * 更新
	 *
	 * @param menu
	 * @return
	 */
	@Override
	public void update(Menu menu) {
		menuDao.update(menu);
	}

	@Override
	public void delete(String id) {
		menuDao.delete(id);
	}

	@Override
	public void delete(Menu entity) {
		menuDao.delete(entity);
	}

	/**
	 * 通过用户ID查询所有列表（不带分页）
	 */
	@Override
	@Cacheable(key="'USER_MENU_'+#userAccount")
	public List<Menu> getByUserAccount(String userAccount) {

		System.out.println("调用了");
		List<Menu> list = menuDao.getByUserAccount(userAccount);
		return list;
	}

}
