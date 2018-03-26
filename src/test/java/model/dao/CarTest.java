package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Car;
import model.dao.superInterface.CarDAO;

public class CarTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			CarDAO dao = (CarDAO) ctx.getBean("carDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(880000));
			System.out.println("---------------SELECT BY ID---------------");
			
			System.out.println(dao.select("999-AAA"));
			System.out.println("---------------SELECT BY email---------------");
			
			Car insert = new Car();
			insert.setCarNo("123-444");
			insert.setMid(4);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Car update = dao.select(880001);
			update.setCarNo("555-555");
			update.setCarNo("update-update");
			update.setMid(4);
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(880000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
