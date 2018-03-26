package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

public class MemberTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			MemberDAO dao = (MemberDAO) ctx.getBean("memberDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(6));
			System.out.println("---------------SELECT BY ID---------------");
			
			System.out.println(dao.select("aaa@aaa"));
			System.out.println("---------------SELECT BY email---------------");
			
			Member insert = new Member();
			insert.setEmail("test2@test2");
			insert.setPwd("test1");
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			Member update = dao.select(4);
			update.setEmail("update@update");
			update.setPwd("update");
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(2));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
