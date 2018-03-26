package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Ride;

public interface RideDAO {

	Session getSession();

	Ride select(int id);

	List<Ride> select();

	Integer insert(Ride bean);

	Ride update(Ride bean);

	boolean delete(int id);
	
	List<Ride> selectByDrId(int id);
}