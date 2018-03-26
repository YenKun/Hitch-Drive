package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Faq;
import model.dao.superInterface.FaqDAO;

@Repository
public class FaqDAOHibernate implements FaqDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Faq select(int id) {
		return this.getSession().get(Faq.class, id);
	}

	@Override
	public List<Faq> select() {
		return this.getSession().createQuery("FROM Faq", Faq.class).list();
	}

	@Override
	public Integer insert(Faq bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public Faq update(Faq bean) {
		if (bean != null) {
			Faq result = this.getSession().get(Faq.class, bean.getQid());
			if (result != null) {
				result.setRideId(bean.getRideId());
				result.setFromMid(bean.getFromMid());
				result.setQtype(bean.getQtype());
				result.setContent(bean.getContent());
				result.setResponse(bean.getResponse());
				result.setIsResponsed(bean.getIsResponsed());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		Faq temp = this.getSession().get(Faq.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
