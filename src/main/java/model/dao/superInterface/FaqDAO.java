package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Faq;

public interface FaqDAO {

	Session getSession();

	Faq select(int id);

	List<Faq> select();

	Integer insert(Faq bean);

	Faq update(Faq bean);

	boolean delete(int id);

}