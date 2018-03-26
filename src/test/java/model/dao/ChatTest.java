package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Chat;
import model.dao.superInterface.ChatDAO;

public class ChatTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			ChatDAO dao = (ChatDAO) ctx.getBean("chatDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(770000));
			System.out.println("---------------SELECT BY ID---------------");
			
			Chat insert = new Chat();
			insert.setFromMid(6);
			insert.setToMid(8);
			insert.setChatDateTime(new java.util.Date());
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Chat update = dao.select(770001);
			update.setContent("UPDATE");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(770000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
