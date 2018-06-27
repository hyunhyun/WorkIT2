///*
// * 2016.04.02 테스트 완료
// * by wjheo
// */
//package sc30;
//
//import javax.inject.Inject;
//
//import org.junit.Test;
//
//import com.spring.dao.MemberDAO;
//import com.spring.model.MemberVO;
//
//public class MemberDAOImplTest extends AbstractTest{
//
//	@Inject
//	private MemberDAO dao;
//	
//	@Test
//	public void test() {
//		logger.info(""+dao);
//	}
//
//	@Test
//	public void registerTest(){
//		MemberVO vo = new MemberVO();
//		vo.setMemberID("ejid");
//		vo.setPassword("ejpw");
//		vo.setNickname("ejg");		
//		// DB에 넣고 DB테이블에서 직접 확인해봐야 한다.
//		dao.register(vo);
//	}
//	
//	@Test
//	public void getTest(){
//		logger.info(""+dao.get("wjheoid"));
//	}
//	
//	@Test
//	public void getListTest(){
//		logger.info(""+dao.getList());
//	}
//	
//}// class
