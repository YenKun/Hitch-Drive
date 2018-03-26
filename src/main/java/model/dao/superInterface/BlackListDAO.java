package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.BlackList;

public interface BlackListDAO {

	Session getSession();

	BlackList select(int id);

	List<BlackList> select();

	Integer insert(BlackList bean);

	BlackList update(BlackList bean);

	boolean delete(int id);

}