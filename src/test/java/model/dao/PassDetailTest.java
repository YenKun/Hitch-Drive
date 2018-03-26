package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.PassDetail;
import model.dao.superInterface.PassDetailDAO;

public class PassDetailTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			PassDetailDAO dao = (PassDetailDAO) ctx.getBean("passDetailDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(990000));
			System.out.println("---------------SELECT BY ID---------------");
				
			PassDetail insert = new PassDetail();
			insert.setMid(8);
			insert.setRideId(5);
			insert.setSeatsBooked(2);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			PassDetail update = dao.select(990001);
			update.setMid(6);
			update.setRideId(9);
			update.setSeatsBooked(3);
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(990000));
			System.out.println("---------------DELETE---------------");
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
