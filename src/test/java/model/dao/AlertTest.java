package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Alert;
import model.dao.superInterface.AlertDAO;

public class AlertTest {

	public static void main(String[] args) throws ParseException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			AlertDAO dao = (AlertDAO) ctx.getBean("alertDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");

			System.out.println(dao.select(1190000));
			System.out.println("---------------SELECT BY ID---------------");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = sdf.parse("2018-2-12");
			System.out.println(dao.select(d, "台北", "台東", false));
			System.out.println("---------------SELECT BY Alerted---------------");

			Alert insert = new Alert();
			insert.setMid(6);
			insert.setStart("insert");
			insert.setDest("insert");
			insert.setAlertDate(new java.util.Date());
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");

			Alert update = new Alert();
			update.setAlertId(1190001);
			update.setMid(4);
			update.setStart("update");
			update.setDest("update");
			update.setAlertDate(new java.util.Date());
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");

			System.out.println(dao.delete(1190000));
			System.out.println("---------------DELETE---------------");

		} finally {
			((ConfigurableApplicationContext) ctx).close();
		}

	}

}
