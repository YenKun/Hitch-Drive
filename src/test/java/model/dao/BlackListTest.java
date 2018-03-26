package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.BlackList;
import model.dao.superInterface.BlackListDAO;

public class BlackListTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			BlackListDAO dao = (BlackListDAO) ctx.getBean("blackListDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(440000));
			System.out.println("---------------SELECT BY ID---------------");
				
			BlackList insert = new BlackList();
			insert.setFromMid(6);
			insert.setToMid(8);
			insert.setRideId(7);
			insert.setReportType(6);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			BlackList update = dao.select(440001);
			update.setContent("update");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(440000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
