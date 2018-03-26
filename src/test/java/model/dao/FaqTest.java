package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Faq;
import model.dao.superInterface.FaqDAO;

public class FaqTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			FaqDAO dao = (FaqDAO) ctx.getBean("faqDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(220001));
			System.out.println("---------------SELECT BY ID---------------");
	
			Faq insert = new Faq();
			insert.setRideId(7);
			insert.setFromMid(6);
			insert.setQtype(8);
			insert.setContent("INSERT測試");
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Faq update = dao.select(220001);
			update.setContent("update測試");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(220000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
