package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Rate;

public interface RateDAO {

	Session getSession();

	Rate select(Integer id);

	List<Rate> select();

	Integer insert(Rate bean);

	Rate update(Rate bean);

	boolean delete(Integer id);

	Boolean isRateExist(Rate bean);

	List<Rate> selectByFromMid(Integer fromMid);

	List<Rate> selectByToMid(Integer toMid);

}