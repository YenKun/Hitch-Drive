package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Ride;
import model.dao.superInterface.RideDAO;

public class RideTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			RideDAO dao = (RideDAO) ctx.getBean("rideDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(1));
			System.out.println("---------------SELECT BY ID---------------");
				
			Ride insert = new Ride();
			insert.setRideDate(new java.util.Date(10));
			insert.setRideTime(new java.sql.Time(3*60*60*100));
			insert.setStart("台北");
			insert.setDest("花蓮");
			insert.setPickUpZone("信義區");
			insert.setDropOffZone("光復鄉");
			insert.setDuration(new java.sql.Time(3*60*60*100));
			insert.setPrice(300);
			insert.setCapacity(4);
			insert.setDriverId(6);
			insert.setCarId(880003);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Ride update = dao.select(3);
			update.setStart("update-start");
			update.setDest("update-dest");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(1));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
