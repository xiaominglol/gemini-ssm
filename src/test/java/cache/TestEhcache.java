package cache;

import com.gemini.ssm.module.sys.service.menu.MenuService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 如何获取spring中的bean
 * 一、
 *  1、创建Spring容器
 *      ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/spring.xml");
 *  2、从容器中获取mapper
 *      CacheManager cacheManager = ioc.getBean(CacheManager.class);
 * 二、
 *  1、引入Spring容器(在类上注解引入)
 *      @ContextConfiguration(locations={"classpath:spring-mybatis.xml"})
 *  2、注解引入实例
 *      @Autowired
 *      CacheManager cacheManager;
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/spring.xml"})
public class TestEhcache {

    public static final String cacheName = "userCache";
    @Autowired
    MenuService menuService;
    /**
     * 如何单独使用ehcache
     * 1、导入jar包
     * 2、ehcache.xml
     * 3、创建CacheManager缓存管理器
     */
    @Test
    public void testEhcache() {
        // 创建CacheManager缓存管理器
        CacheManager manager = CacheManager.newInstance("src/main/resources/ehcache.xml");

        if ( manager == null ) {
            System.out.println("manager为空");
            return;
        }

        // 获取缓存
        Cache cache = manager.getCache(cacheName);
        //如果不存在即添加
        if(cache == null){
            System.out.println("cache["+cacheName+"]为空");
            manager.addCache(cacheName);
            cache = manager.getCache(cacheName);
        }

        // 添加缓存
        Element element = new Element("key1", "哈哈");
        cache.put(element);
        Object value = element.getObjectValue();
        System.out.println("element.getObjectValue()" + value.toString());

        // 通过key获取value
        Element element1 = cache.get("key2");

        //如果不存在即添加
        if(element1 == null){
            System.out.println("element1["+cacheName+"]为空");
            Element element2 = new Element("key2", "哈哈");
            cache.put(element2);
            element1 = cache.get("key2");
        }
        System.out.println(element1.getObjectValue());

        //关闭缓存
        manager.shutdown();
    }

    /**
     * 如何使用spring集成ehcache
     * 1、导入jar包
     * 2、ehcache.xml
     * 3、创建CacheManager缓存管理器
     */
    @Test
    public void testEhcache1() {
        //测试发现只调用了一次，证明已缓存了
        for (int i = 0; i < 10; i++) {
            menuService.getByUserAccount("admin");
        }
    }

}
