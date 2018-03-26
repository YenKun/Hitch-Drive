package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Car;
import model.bean.Verification;
import model.dao.superInterface.VerificationDAO;

@Repository
public class VerificationDAOHibernate implements VerificationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public List<Verification> select() {
		return this.getSession().createQuery("FROM Verification", Verification.class).list();
	}

	@Override
	public Verification selectByMid(Integer mid) {
		return this.getSession().createQuery("FROM Verification WHERE mid=:mid",Verification.class).setParameter("mid", mid).uniqueResult();
	}

	@Override
	public List<Verification> selectNotVerify() {
		return this.getSession().createQuery("FROM Verification WHERE emailVerified=:emailVerified or licenseVerified=:licenseVerified",Verification.class).setParameter("emailVerified", false).setParameter("licenseVerified", false).list();
		
	}

	@Override
	public Verification update(Verification bean) {
		if(bean!=null) {
		Verification  verification =this.getSession().createQuery("FROM Verification WHERE mid=:mid",Verification.class).setParameter("mid", bean.getMid()).uniqueResult();
			if(verification!=null) {
				verification.setCode(bean.getCode());
				verification.setEmailVerified(bean.getEmailVerified());
				verification.setLicenseVerified(bean.getLicenseVerified());
				return verification;
			}
			return null;
		}
		return null;
	}

	@Override
	public Integer insert(Verification bean) {
		return (Integer) this.getSession().save(bean);

	}

}
