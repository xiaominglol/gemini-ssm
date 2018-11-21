package com.gemini.ssm.module.sys.service.user;

import com.gemini.ssm.module.sys.entity.user.User;

import java.util.List;
import java.util.Set;

/**
 * @author 小明
 * @date 2018-02-11
 */
public interface UserService {

	/**
	 * 列表（分页查询）
	 */
	List<User> list(User user);

	/**
	 * 增加
	 * 
	 * @param user
	 */
	void add(User user);

	/**
	 * 更新
	 * 
	 * @param user
	 * @return
	 */
	boolean update(User user);

	/**
	 * 删除
	 * 
	 * @param userAccount
	 * @return
	 */
	boolean delete(String userAccount);

	/**
	 * 根据userAccount查询用户
	 * 
	 * @param userAccount
	 * @return
	 */
	User getUserById(String userAccount);

	/**
	 * 根据userAccount查询用户角色
	 * 
	 * @param userAccount
	 * @return
	 */
	Set<String> getRoleById(String userAccount);

	/**
	 * 根据userAccount查询用户权限
	 * 
	 * @param userAccount
	 * @return
	 */
	Set<String> getPermissionsById(String userAccount);
}
