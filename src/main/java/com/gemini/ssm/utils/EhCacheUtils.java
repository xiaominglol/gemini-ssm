/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.gemini.ssm.utils;

import com.gemini.ssm.module.common.service.SpringContextHolder;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/**
 * Cache工具类
 * @author 小明
 * @date 2019-01-19
 */
public class EhCacheUtils {


	private static CacheManager cacheManager = SpringContextHolder.getBean("cacheManager");

	public static final String USER_CACHE = "userCache";

	/**
	 * 获取缓存
	 * @param cacheName 缓存名称
	 * @param key
	 * @return
	 */
	public static Object get(String cacheName, String key) {
		Element element = getCache(cacheName).get(key);
		return element==null?null:element.getObjectValue();
	}

	/**
	 * 写入缓存
	 * @param cacheName 缓存名称
	 * @param key
	 * @param value
	 */
	public static void put(String cacheName, String key, Object value) {
		Element element = new Element(key, value);
		getCache(cacheName).put(element);
	}

	/**
	 * 从缓存中移除
	 * @param cacheName 缓存名称
	 * @param key
	 */
	public static void remove(String cacheName, String key) {
		getCache(cacheName).remove(key);
	}
	
	/**
	 * 获得一个Cache，没有则创建一个。
	 * @param cacheName 缓存名称
	 * @return cache 缓存
	 */
	private static Cache getCache(String cacheName){
		Cache cache = cacheManager.getCache(cacheName);
		if (cache == null){
			cacheManager.addCache(cacheName);
			cache = cacheManager.getCache(cacheName);
			cache.getCacheConfiguration().setEternal(true);
		}
		return cache;
	}

	public static CacheManager getCacheManager() {
		return cacheManager;
	}

	public static void main (String[] strings){
		String userName = null;
		if(EhCacheUtils.get(EhCacheUtils.USER_CACHE,"userName") == null){
			System.out.println("写入缓存");
			EhCacheUtils.put(EhCacheUtils.USER_CACHE,"userName","xiaoming");
		} else {
			System.out.println("读取缓存");
			userName = (String) EhCacheUtils.get(EhCacheUtils.USER_CACHE,"userName");
		}
		System.out.println("userName="+userName);

		EhCacheUtils.remove(EhCacheUtils.USER_CACHE,"userName");
		System.out.println("删除缓存");
		String userName1 = (String) EhCacheUtils.get(EhCacheUtils.USER_CACHE,"userName");
		System.out.println("userName1="+userName1);
	}
	
}
