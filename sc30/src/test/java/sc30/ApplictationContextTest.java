/*
 * 2016.04.02 테스트 완료
 * by wjheo
 */
package sc30;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

public class ApplictationContextTest extends AbstractTest{

	@Inject
	private ApplicationContext ctxt;
	
	
	@Test
	public void test() {
		logger.info(""+ctxt);
		
	}// test()

}// class
