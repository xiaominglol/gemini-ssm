package com.gemini.ssm.module.sys.service.role.impl;

import com.gemini.ssm.module.sys.dao.role.RoleDao;
import com.gemini.ssm.module.sys.entity.role.Role;
import com.gemini.ssm.module.sys.service.role.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 角色service层
 *
 * @author 小明
 * @date 2018-02-12
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Role getById(String id) {
        return roleDao.getById(id);
    }

    @Override
    public List<Role> getList() {
        return roleDao.getList();
    }

    @Override
    public void insert(Role entity) {
        roleDao.insert(entity);
    }

    @Override
    public void update(Role entity) {
        roleDao.update(entity);
    }

    @Override
    public void delete(String id) {
        roleDao.delete(id);
    }

    @Override
    public void delete(Role entity) {
        roleDao.delete(entity);
    }


}
