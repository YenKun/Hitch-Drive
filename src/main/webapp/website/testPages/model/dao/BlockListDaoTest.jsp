<%@ page import="model.bean.BlockList"%>
<%@ page import="model.dao.superInterface.BlockListDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlockList Dao Test</title>
</head>
<body>

	<%
		ApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(pageContext.getServletContext());

		BlockListDAO blockListDao = (BlockListDAO) wac.getBean("blockListDao");
		SessionFactory sf = wac.getBean("sessionFactory", SessionFactory.class);

		sf.getCurrentSession().beginTransaction();

		BlockList bean = new BlockList();
		bean.setBlockId(null);
		bean.setFromMid(null);
		bean.setToMid(null);


// 		BlockList select = blockListDao.select(bean.getBlockId());
// 		System.out.println(select);

// 		List<BlockList> selectAll = blockListDao.select();
// 		for (BlockList block : selectAll) {
// 			System.out.println(block);
// 		}

// 		Integer insert = blockListDao.insert(bean);
// 		System.out.println(insert);

// 		BlockList update = blockListDao.update(bean);
// 		System.out.println(update);
		
		Boolean isBlockExist = blockListDao.isBlockExist(bean);
		System.out.println(isBlockExist);
		 
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	%>

</body>
</html>