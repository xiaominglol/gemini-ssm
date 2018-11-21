package com.xiaomingbudushu.erp.module.common.entity;

import java.util.HashMap;
import java.util.Map;

public class Message {
	
	/**
	 *  状态码 200-失败 100-成功
	 */
	private int code;
	
	/**
	 *  提示信息
	 */
	private String message;

	/**
	 *  用户要返回给浏览器的数据
	 */
	private Map<String, Object> result = new HashMap<String, Object>();

	public static Message success() {
		Message result = new Message();
		result.setCode(100);
		result.setMessage("处理成功！");
		return result;
	}

	public static Message fail() {
		Message result = new Message();
		result.setCode(200);
		result.setMessage("处理失败！");
		return result;
	}

	public Message add(String key, Object value) {
		this.getResult().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getResult() {
		return result;
	}

	public void setExtend(Map<String, Object> result) {
		this.result = result;
	}
}
