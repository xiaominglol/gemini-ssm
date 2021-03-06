package com.gemini.ssm.module.common.service;

import java.util.List;

/**
 *
 * @author 小明
 * @date 2018-02-11
 */
public interface CrudService<T> {

    /**
     * 通过ID（主键）获取单条数据
     * @param id
     * @return
     */
    T getById(String id);

    /**
     * 获取所有数据
     * @return
     */
    List<T> getList();

    /**
     * 插入数据
     * @param entity
     * @return
     */
    void insert(T entity);

    /**
     * 更新数据
     * @param entity
     * @return
     */
    void update(T entity);

    /**
     * 通过ID（主键）删除数据
     * @param id
     * @return
     */
    void delete(String id);

    /**
     * 通过entity删除数据
     * @param entity
     * @return
     */
    void delete(T entity);

}
