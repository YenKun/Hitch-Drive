<%@page import="model.bean.PassDetail"%>
<%@page import="model.dao.superInterface.PassDetailDAO"%>
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
<title>PassDetail Dao Test</title>
</head>
<body>

	<%
		ApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(pageContext.getServletContext());

		PassDetailDAO passDetailDAO = (PassDetailDAO) wac.getBean("passDetailDAO");
		SessionFactory sf = wac.getBean("sessionFactory", SessionFactory.class);

		sf.getCurrentSession().beginTransaction();

		PassDetail bean = new PassDetail();
		bean.setRideId(null);

// 			PassDetail select = passDetailDAO.select(bean.getDetailId());
// 			System.out.println(select);

// 			List<PassDetail> selectAll = passDetailDAO.select();
// 			for (PassDetail passDetail : selectAll) {
// 				System.out.println(passDetail);
// 			}

// 			Integer insert = passDetailDAO.insert(bean);
// 			System.out.println(insert);

// 			PassDetail update = passDetailDAO.update(bean);
// 			System.out.println(update);

// 			List<PassDetail> selectByRideId = passDetailDAO.selectByRideId(bean.getRideId());
// 			for (PassDetail passDetail : selectByRideId) {
// 				System.out.println(passDetail);
// 			}
		
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	%>

</body>
</html>