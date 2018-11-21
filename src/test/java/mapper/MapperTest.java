package mapper;

import com.xiaomingbudushu.erp.module.common.entity.CommonStatus;
import com.xiaomingbudushu.erp.module.sys.dao.user.UserDao;
import com.xiaomingbudushu.erp.module.sys.entity.user.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


/**
 * 测试mapper
 * 1、导入spring-test包
 * 2、使用@ContextConfiguration指定spring配置文件的位置
 * @author 小明
 * @date 2017-11-16
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/spring.xml"})
public class MapperTest {
	
	@Autowired
	UserDao userMapper;
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试
	 */
	@Test
	public void testCURD(){
//		//1、创建Spring容器
//		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring.xml");
//		//2、从容器中获取mapper
//		UserDao userMapper = ioc.getBean(UserDao.class);
		System.out.println("userMapper="+userMapper);
		
		
		UserDao userMapper = sqlSession.getMapper(UserDao.class);
		
		String algorithmName = "MD5";
		Object source = "123456";
		String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
		System.out.println(salt2);// 随机
		
		
		for(int i=0;i<200;i++){
			
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			
			Object salt = ByteSource.Util.bytes(uid);
			int hashIterations = 1024;
			Object result = new SimpleHash(algorithmName, source, salt, hashIterations);
			userMapper.add(new User(CommonStatus.STATUS_VALIDITY, null, null, null,null,uid, uid, result.toString(), null, null));
		}
		System.out.println("执行完成!");
		
		
	}
}
