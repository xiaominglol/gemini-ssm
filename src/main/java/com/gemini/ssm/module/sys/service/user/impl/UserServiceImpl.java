package com.gemini.ssm.module.sys.service.user.impl;


import com.gemini.ssm.module.sys.dao.user.UserDao;
import com.gemini.ssm.module.sys.service.user.UserService;
import com.gemini.ssm.module.sys.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service
//@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	/**
	 * 列表（分页查询）
	 */
	@Override
	public List<User> list(User user) {
		return userDao.list(user);
	}

	/**
	 * 增加
	 * 
	 * @param user
	 */
	@Override
	public void add(User user) {
		userDao.add(user);
	}

	/**
	 * 更新
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public boolean update(User user) {
		return userDao.update(user);
	}

	/**
	 * 删除
	 * 
	 * @param userAccount
	 * @return
	 */
	@Override
	public boolean delete(String userAccount) {
		return userDao.delete(userAccount);
	}

	/**
	 * 根据userAccount查询用户
	 * 
	 * @param userAccount
	 * @return
	 */
	@Override
	public User getUserById(String userAccount) {
		return userDao.getUserById(userAccount);
	}

	/**
	 * 根据userAccount查询用户角色
	 * 
	 * @param userAccount
	 * @return
	 */
	@Override
	public Set<String> getRoleById(String userAccount) {
		Set<String> userRoleSet = new HashSet<String>();
		//if(EhCacheUtils.get(EhCacheUtils.USER_CACHE , "USER_ROLE") == null){
			userRoleSet = userDao.getRoleById(userAccount);
			//EhCacheUtils.put(EhCacheUtils.USER_CACHE , "USER_ROLE" , userRoleSet);
		//} else {
			//userRoleSet = (Set<String>) EhCacheUtils.get(EhCacheUtils.USER_CACHE , "USER_ROLE");
		//}

		return userRoleSet;
	}

	/**
	 * 根据userAccount查询用户权限
	 * 
	 * @param userAccount
	 * @return
	 */
	@Override
	public Set<String> getPermissionsById(String userAccount) {
		return userDao.getPermissionsById(userAccount);
	}
}
