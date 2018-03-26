package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.PassDetail;

public interface PassDetailDAO {

	Session getSession();

	PassDetail select(int id);

	List<PassDetail> select();

	Integer insert(PassDetail bean);

	PassDetail update(PassDetail bean);

	boolean delete(int id);

	List<PassDetail> selectByRideId(Integer id);


}