//package com.enterprisesolutions.navigation;
//
//import java.math.BigInteger;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import junit.framework.TestCase;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.enterprisesolutions.utils.AppConstants;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:enterprise-solution-servlet.xml")
//public class NavObjectTest  extends TestCase{
//
//	@Autowired
//	NavObject navObject;
//	@Test
//	public void getDefaultNavList() {
//		Map<BigInteger, List<NavItem>> navItemMap = navObject.getNavItemMap();
//		
//		System.out.println("-------******************nav=-------------------4="+navItemMap);
//		System.out.println("-------******************nav=-------------------5="+navItemMap.size());
//		
//		
//		List<NavItem> navList = new ArrayList<NavItem>();
//
//		// get the root tree elements first
//		List<NavItem> rootNavItems = navItemMap.get(AppConstants.rootUcId);
//		
//		for (NavItem ucMst:rootNavItems){
//		navList.add(ucMst);
//		}
//		//return navList;
//		
//	}
//	
//	
//}
