package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Rate;
import model.dao.superInterface.RateDAO;

public class RateTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			RateDAO dao = (RateDAO) ctx.getBean("rateDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(6660000));
			System.out.println("---------------SELECT BY ID---------------");
				
			Rate insert = new Rate();
			insert.setFromMid(8);
			insert.setToMid(10);
			insert.setStar(1);
			insert.setRideId(7);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Rate update = dao.select(6660001);
			update.setComment("update");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(6660000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
