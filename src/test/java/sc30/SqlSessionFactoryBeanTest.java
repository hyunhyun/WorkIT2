/*
 * 2016.04.02 테스트 완료
 * by wjheo
 */
package sc30;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

public class SqlSessionFactoryBeanTest extends AbstractTest{

	@Inject
	SqlSessionFactoryBean factoryBean;
	
	@Test
	public void test(){
		logger.info(""+factoryBean);
	}// test()
	
	@Test
	public void sesseionTest(){
		try {
			logger.info(""+factoryBean.getObject().openSession().toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// test()
	
}// class
