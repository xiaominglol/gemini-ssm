package spring;

import com.github.pagehelper.PageInfo;
import com.xiaomingbudushu.erp.module.sys.entity.user.User;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 用Spring测试模块提供的测试请求功能
 * @author 小明
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:spring/spring-mvc.xml", "classpath:mybatis/spring-mybatis.xml"})
public class MvcTest {
	//传入Springmvc的
	@Autowired
	WebApplicationContext context;
	//虚拟Mvc请求,获取处理结果
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc(){
		//创建Mvc
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception{
		//模拟请求，拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/UserController/list").param("pageNum", "1")).andReturn();
		
		//
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码：" + pageInfo.getPageNum());
		System.out.println("总页码：" + pageInfo.getPages());
		System.out.println("总记录数：" + pageInfo.getTotal());
		System.out.println("连续显示的页码");
		int[] nums = pageInfo.getNavigatepageNums();
		for(int i : nums){
			System.out.println(" " + i);
		}
		
		List<User> list = pageInfo.getList();
		for(User user : list){
			System.out.println("ID:"+user.getUserAccount());
		}
	}
}
