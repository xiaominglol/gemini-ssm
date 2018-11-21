package com.gemini.ssm.module.sys.dao.user;

import com.gemini.ssm.module.sys.entity.user.User;

import java.util.List;
import java.util.Set;

/**
 * @author 小明
 * @date 2017-11-10
 */
public interface UserDao {

    /**
     * 列表
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
    // @Update("update t_sys_user set user_account=#{userAccount}
    // ,user_name=#{userName},password=#{password},status=#{status},last_update_time=#{lastUpdateTime},last_update_id=#{lastUpdateId},last_update_name=#{lastUpdateName}where
    // user_account=#{userAccount}")
    public boolean update(User user);

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
