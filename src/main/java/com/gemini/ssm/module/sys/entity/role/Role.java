package com.gemini.ssm.module.sys.entity.role;

import com.gemini.ssm.module.common.entity.BaseEntity;

import java.util.Date;

/**
 * 角色
 *
 * @author 小明
 * @table t_sys_role
 * @date 2018-02-12
 */
public class Role extends BaseEntity<Role> {

    /**
     * 角色ID（主键）
     */
    private String roleId;

    private String roleName;

    private int sort;

    public Role() {

    }

    public Role(int status, String lastUpdateId, String lastUpdateName, Date lastUpdateTime, String roleId, String roleName, int sort) {
        super(status, lastUpdateId, lastUpdateName, lastUpdateTime);
        this.roleId = roleId;
        this.roleName = roleName;
        this.sort = sort;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }
}