package com.xiaomingbudushu.erp.module.common.entity;

import com.xiaomingbudushu.erp.module.sys.utils.UserUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * 基础字段
 * @author 小明
 * @date 2017-12-11
 */
public abstract class BaseEntity<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 状态(0=无效,1=有效)
     */
    private int status = CommonStatus.STATUS_VALIDITY;

    /**
     * 上一次更新人ID
     */
    private String lastUpdateId = UserUtils.getCurrentUser();

    /**
     * 上一次更新人
     */
    private String lastUpdateName;

    /**
     * 上一次更新时间(YYYY-MM-DD HH:MM:SS)

     */
    private Date lastUpdateTime = new Date();

    protected BaseEntity() {
    }

    public BaseEntity(int status, String lastUpdateId, String lastUpdateName, Date lastUpdateTime) {
        this.status = status;
        this.lastUpdateId = lastUpdateId;
        this.lastUpdateName = lastUpdateName;
        this.lastUpdateTime = lastUpdateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLastUpdateId() {
        return lastUpdateId;
    }

    public void setLastUpdateId(String lastUpdateId) {
        this.lastUpdateId = lastUpdateId;
    }

    public String getLastUpdateName() {
        return lastUpdateName;
    }

    public void setLastUpdateName(String lastUpdateName) {
        this.lastUpdateName = lastUpdateName;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }
}
