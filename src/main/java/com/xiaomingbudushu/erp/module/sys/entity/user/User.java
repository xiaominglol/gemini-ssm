package com.xiaomingbudushu.erp.module.sys.entity.user;

import com.xiaomingbudushu.erp.module.common.entity.BaseEntity;

import java.util.Date;

/**
 * 用户表 t_sys_user
 * 
 * @author 小明
 * @date 2017-11-09
 *
 */
public class User extends BaseEntity<User> {

	/**
	 * 自增主键
	 */
	private Integer id;

	/**
	 * 主键:用户账号（姓名拼音）
	 */
	private String userAccount;

	/**
	 * 用户名称
	 */
	private String userName;

	/**
	 * 密码(MD5加密)
	 */
	private String password;

	/**
	 * 用户头像
	 */
	private String userPicture;

    /**
     * 创建时间(YYYY-MM-DD HH:MM:SS)
	 */
	private Date createDate;

	public User() {
		super();
	}

	public User(int status, String lastUpdateId, String lastUpdateName, Date lastUpdateTime, Integer id, String userAccount, String userName, String password, String userPicture, Date createDate) {
		super(status, lastUpdateId, lastUpdateName, lastUpdateTime);
		this.id = id;
		this.userAccount = userAccount;
		this.userName = userName;
		this.password = password;
		this.userPicture = userPicture;
		this.createDate = createDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
