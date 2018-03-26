package model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Ride;
import model.dao.RideDAOHibernate;

@Service
@Transactional
public class RideService {
	@Autowired
	private RideDAOHibernate rideDao;
	
	public Integer insert(Ride bean) {
		Integer result = null;
		if (bean != null) {
			result = rideDao.insert(bean);
		}
		return result;
	}
	
	public List<Ride> select(String start, Date date) {
		List<Ride> result = null;
		if (start != null) {
			result = rideDao.select(start, date);
		}
		return result;
	}
	
	public List<Ride> select(String start, String end, Date date) {
		List<Ride> result = null;
		if (start != null && end != null) {
			result = rideDao.select(start, end, date);
		}
		return result;
	}
	
	public List<Ride> selectCurrent(Integer memberid) {
		return rideDao.selectCurr(memberid);
	}
	
	public List<Ride> selectFuture() {
		return rideDao.selectFuture();
	}
	
	public List<Ride> selectHistory(Integer memberid) {
		return rideDao.selectHist(memberid);
	}
	
	public Ride select(int id) {
		return rideDao.select(id);
	}
	
	public boolean delete(int id) {
		return rideDao.delete(id);
	}
	
	public Ride update(Ride bean) {
		Ride result = null;
		if (bean != null) {
			result = rideDao.update(bean);
		}
		return result;
	}
}
