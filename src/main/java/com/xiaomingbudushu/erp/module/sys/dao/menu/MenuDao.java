package com.xiaomingbudushu.erp.module.sys.dao.menu;

import com.xiaomingbudushu.erp.module.common.dao.CrudDao;
import com.xiaomingbudushu.erp.module.sys.entity.menu.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单Dao层
 * @author 小明
 * @date 2018-02-11
 */
@Mapper
public interface MenuDao extends CrudDao<Menu>{

    /**
     * 根据userAccount查询用户角色
     *
     * @param userAccount
     * @return
     */
    List<Menu> getByUserAccount(String userAccount);

}