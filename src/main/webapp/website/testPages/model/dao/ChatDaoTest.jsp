
<%@page import="model.bean.Chat"%>
<%@page import="model.dao.superInterface.ChatDAO"%>
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
<title>Chat Dao Test</title>
</head>
<body>

	<%
		ApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(pageContext.getServletContext());

		ChatDAO chatDao = (ChatDAO) wac.getBean("chatDAO");
		SessionFactory sf = wac.getBean("sessionFactory", SessionFactory.class);

		sf.getCurrentSession().beginTransaction();

		Chat bean = new Chat();
		bean.setChatId(null);
		bean.setFromMid(null);
		bean.setToMid(null);
		bean.setChatDateTime(null);
		bean.setContent(null);
		bean.setPhoto(null);
		bean.setIsRead(null);

// 		Chat select = chatDao.select(bean.getChatId());
// 		System.out.println(select);

// 		List<Chat> selectAll = chatDao.select();
// 		for (Chat chat : selectAll) {
// 			System.out.println(chat);
// 		}

// 		Integer insert = chatDao.insert(bean);
// 		System.out.println(insert);

// 		Chat update = chatDao.update(bean);
// 		System.out.println(update);
		
// 		List<Chat> selectContacts = chatDao.selectContacts(bean.getFromMid());
// 		for(Chat chat : selectContacts){
// 			System.out.println(chat);
// 		}
		
// 		List<Chat> chats = chatDao.selectByFromToMid(bean.getFromMid(), bean.getToMid());
// 		for(Chat chat : chats){
// 			System.out.println(chat);
// 		}
		
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	%>

</body>
</html>