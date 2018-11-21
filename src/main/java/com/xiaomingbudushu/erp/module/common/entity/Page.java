package com.xiaomingbudushu.erp.module.common.entity;

/**
 * 封装分页
 * @author 小明
 * @date 2017-11-09
 */
public class Page {

    /**
     * 分页页码
     */
    private int pageNum;
    /**
     * 分页大小
     */
    private int pageSize;
    /**
     * 排序方式
     */
    private String order;
    /**
     * 排序字段
     */
    private String sort;
    /**
     * 搜索关键字
     */
    private String search;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getSearch() {
        return search == null ? "" : "%" + this.search + "%";
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getOrderBy(){
        return this.getSort() +" "+ this.getOrder();
    }
}
