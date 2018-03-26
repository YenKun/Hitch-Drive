package model.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.bean.BlockList;
import model.dao.superInterface.BlockListDAO;

public class BlockListTest {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("SpringRoot.config.xml");
		try {
			BlockListDAO dao = (BlockListDAO) ctx.getBean("blockListDAOHibernate");

			System.out.println(dao.select());
			System.out.println("---------------SELECT ALL---------------");
			
			System.out.println(dao.select(4040001));
			System.out.println("---------------SELECT BY ID---------------");
				
			BlockList insert = new BlockList();
			insert.setFromMid(6);
			insert.setToMid(8);
			System.out.println(dao.insert(insert));
			System.out.println("---------------INSERT---------------");
			
			BlockList update = dao.select(4040001);
			update.setToMid(6);
			System.out.println(dao.update(update));
			System.out.println("---------------UPDATE---------------");
			
			System.out.println(dao.delete(4040000));
			System.out.println("---------------DELETE---------------");
			
		} finally {
			((ConfigurableApplicationContext)ctx).close();
		}

	}

}
