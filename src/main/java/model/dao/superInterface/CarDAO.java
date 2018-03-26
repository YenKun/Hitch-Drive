package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Car;

public interface CarDAO {

	Session getSession();

	Car select(int id);

	List<Car> select();

	Car select(String carNo);

	Integer insert(Car bean);

	Car update(Car bean);

	boolean delete(int id);

	Car selectByCarNo(int mid, String carNo);

	List<Car> selectByMid(int mid);

	List<Car> selectByMember(int mid);

	List<Car> selectNoVerify();

}