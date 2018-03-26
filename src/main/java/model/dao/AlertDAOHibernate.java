package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Alert;
import model.dao.superInterface.AlertDAO;

@Repository
public class AlertDAOHibernate implements AlertDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Alert select(int id) {
		return this.getSession().get(Alert.class, id);
	}
	
	@Override
	public Alert select(Date alertDate, String start, String dest, Boolean alerted) {
		return this.getSession().createQuery("From Alert where start= :start and dest= :dest and alertDate= :alertDate and alerted= :alerted",Alert.class)
				.setParameter("start", start)
				.setParameter("dest", dest)
				.setParameter("alertDate", alertDate)
				.setParameter("alerted", alerted)
				.uniqueResult();
	}

	@Override
	public List<Alert> select() {
		return this.getSession().createQuery("FROM Alert", Alert.class).list();
	}

	@Override
	public Integer insert(Alert bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public Alert update(Alert bean) {
		if (bean != null) {
			Alert result = this.getSession().get(Alert.class, bean.getAlertId());
			if (result != null) {
				result.setMid(bean.getMid());
				result.setStart(bean.getStart());
				result.setDest(bean.getDest());
				result.setAlertDate(bean.getAlertDate());
				result.setAlerted(bean.getAlerted());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		Alert temp = this.getSession().get(Alert.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}


}
