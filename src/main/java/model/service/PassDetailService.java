package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.PassDetail;
import model.dao.PassDetailDAOHibernate;

@Service
@Transactional
public class PassDetailService {
	@Autowired
	private PassDetailDAOHibernate pdDao;
	
	public PassDetail select(int cid) {
		return pdDao.select(cid);
	}
	
	public Integer insert(PassDetail bean) {
		Integer result = null;
		if (bean != null) {
			result = pdDao.insert(bean);
		}
		return result;
	}
	
	public List<PassDetail> selectByMember(int mid) {
		return pdDao.selectByMember(mid);
	}
	
	public List<PassDetail> selectByRide(int rid) {
		return pdDao.selectByRide(rid);
	}
	
	public boolean delete(int pdid) {
		return pdDao.delete(pdid);
	}
	
	
}
