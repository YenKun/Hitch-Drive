package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Alert;

public interface AlertDAO {

	Session getSession();

	Alert select(int id);
	
	Alert select(java.util.Date alertDate,String start,String dest,Boolean alerted);

	List<Alert> select();

	Integer insert(Alert bean);

	Alert update(Alert bean);

	boolean delete(int id);

}