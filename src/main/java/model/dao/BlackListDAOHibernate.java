package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.BlackList;
import model.dao.superInterface.BlackListDAO;

@Repository
public class BlackListDAOHibernate implements BlackListDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public BlackList select(int id) {
		return this.getSession().get(BlackList.class, id);
	}

	@Override
	public List<BlackList> select() {
		return this.getSession().createQuery("From BlackList", BlackList.class).list();
	}

	@Override
	public Integer insert(BlackList bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public BlackList update(BlackList bean) {
		if (bean != null) {
			BlackList result = this.getSession().get(BlackList.class, bean.getBlackId());
			if (result != null) {
				result.setFromMid(bean.getFromMid());
				result.setToMid(bean.getToMid());
				result.setRideId(bean.getRideId());
				result.setReportType(bean.getReportType());
				result.setContent(bean.getContent());
				result.setIsDealed(bean.getIsDealed());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		BlackList temp = this.getSession().get(BlackList.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
}
