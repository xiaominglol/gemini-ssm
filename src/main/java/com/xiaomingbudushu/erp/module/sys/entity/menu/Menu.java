package com.xiaomingbudushu.erp.module.sys.entity.menu;

import com.xiaomingbudushu.erp.module.common.entity.BaseEntity;

import java.util.Date;

/**
 * t_sys_menu
 *
 * @author 小明
 * @date 2017-11-02
 */
public class Menu extends BaseEntity<Menu> {

    /**
     * 菜单ID（主键）
     */
    private String menuId;

    /**
     * 上级菜单，如果为null，则为顶级菜单
     */
    private String parentMenuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单类型（1=一级菜单，2=二级菜单，3=三级菜单，4=按钮）
     */
    private String menuType;

    /**
     * 菜单url
     */
    private String menuUrl;

    /**
     * 菜单icon
     */
    private String menuIcon;

    /**
     * 权限标识
     */
    private String permissionsFlag;

    /**
     * 排序
     */
    private int sort;

    public Menu() {
        super();
    }

    public Menu(int status, String lastUpdateId, String lastUpdateName, Date lastUpdateTime, String menuId, String parentMenuId, String menuName, String menuType, String menuUrl, String menuIcon, String permissionsFlag, int sort) {
        super(status, lastUpdateId, lastUpdateName, lastUpdateTime);
        this.menuId = menuId;
        this.parentMenuId = parentMenuId;
        this.menuName = menuName;
        this.menuType = menuType;
        this.menuUrl = menuUrl;
        this.menuIcon = menuIcon;
        this.permissionsFlag = permissionsFlag;
        this.sort = sort;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(String parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public String getPermissionsFlag() {
        return permissionsFlag;
    }

    public void setPermissionsFlag(String permissionsFlag) {
        this.permissionsFlag = permissionsFlag;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }
}