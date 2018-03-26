<%@page import="model.bean.Member"%>
<%@page import="model.dao.superInterface.MemberDAO"%>
<%@page import="model.bean.Ride"%>
<%@page import="model.dao.superInterface.RideDAO"%>
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
<title>Member Dao Test</title>
</head>
<body>

	<%
		ApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(pageContext.getServletContext());

		MemberDAO memberDAO = (MemberDAO) wac.getBean("memberDAO");
		SessionFactory sf = wac.getBean("sessionFactory", SessionFactory.class);

		sf.getCurrentSession().beginTransaction();

		Member bean = new Member();
		bean.setMid(null);

			Member select = memberDAO.select(bean.getMid());
			System.out.println(select);

// 			List<Ride> selectAll = rideDao.select();
// 			for (Ride ride : selectAll) {
// 				System.out.println(ride);
// 			}

// 			Integer insert = rideDao.insert(bean);
// 			System.out.println(insert);

// 			Ride update = rideDao.update(bean);
// 			System.out.println(update);

		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	%>

</body>
</html>