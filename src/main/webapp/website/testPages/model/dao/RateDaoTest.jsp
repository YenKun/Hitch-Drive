<%@page import="model.bean.Rate"%>
<%@page import="model.dao.superInterface.RateDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rate Dao Test</title>
</head>
<body>

	<%
		ApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(pageContext.getServletContext());

		RateDAO rateDao = (RateDAO) wac.getBean("rateDAO");
		SessionFactory sf = wac.getBean("sessionFactory", SessionFactory.class);

		sf.getCurrentSession().beginTransaction();

		Rate bean = new Rate();
		bean.setFromMid(null);
		bean.setToMid(null);
		bean.setRideId(null);
		bean.setStar(null);
		bean.setComment(null);
		bean.setStar(null);
		bean.setRateDate(null);

// 			Rate select = rateDao.select(bean.getFromMid());
// 			System.out.println(select);

// 			List<Rate> selectAll = rateDao.select();
// 			for (Rate rate : selectAll) {
// 				System.out.println(rate);
// 			}
				
// 			List<Rate> selectByFromMid = rateDao.selectByFromMid(bean.getFromMid());
// 			for (Rate rate : selectByFromMid) {
// 				System.out.println(rate);
// 			}
				
// 			List<Rate> selectByToMid = rateDao.selectByToMid(bean.getToMid());
// 			for (Rate rate : selectByToMid) {
// 				System.out.println(rate);
// 			}

// 			Integer insert = rateDao.insert(bean);
// 			System.out.println(insert);

// 			Rate update = rateDao.update(bean);
// 			System.out.println(update);

// 			Boolean isRateExist = rateDao.isRateExist(bean);
// 			System.out.println(isRateExist);

		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	%>

</body>
</html>