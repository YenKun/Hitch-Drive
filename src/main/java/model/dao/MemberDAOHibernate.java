package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

@Repository("memberDAO")
public class MemberDAOHibernate implements MemberDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Member select(int id) {
		System.out.println("DAO" + this.getSession().get(Member.class, id));
		return this.getSession().get(Member.class, id);
	}

	@Override
	public List<Member> select() {
		return this.getSession().createQuery("FROM Member", Member.class).list();
	}

	@Override
	public Member select(String email) {
		return this.getSession().createQuery("FROM Member WHERE email= :email", Member.class)
				.setParameter("email", email).uniqueResult();
	}
	
	@Override
	public Integer insert(Member bean) {
		if (bean != null) {
			Member temp = this.getSession().createQuery("FROM Member WHERE email= :email", Member.class)
					.setParameter("email", bean.getEmail()).uniqueResult();
			if (temp == null) {
				return (Integer) this.getSession().save(bean);
			}
		}
		return null;
	}

	@Override
	public Member update(Member bean) {
		if (bean != null) {
			Member result = this.getSession().get(Member.class, bean.getMid());
			if (result != null) {
				result.setEmail(bean.getEmail());
				result.setPwd(bean.getPwd());
				result.setFirstName(bean.getFirstName());
				result.setLastName(bean.getLastName());
				result.setGender(bean.getGender());
				result.setCountry(bean.getCountry());
				result.setBirthYear(bean.getBirthYear());
				result.setPhoto(bean.getPhoto());
				result.setPhone(bean.getPhone());
				result.setBio(bean.getBio());
				result.setLicensePhoto(bean.getLicensePhoto());
				result.setPhoneVerified(bean.getPhoneVerified());
				result.setEmailVerified(bean.getEmailVerified());
				result.setLicenseVerified(bean.getLicenseVerified());
				result.setPrefPaPet(bean.getPrefPaPet());
				result.setPrefPaSmoke(bean.getPrefPaSmoke());
				result.setPrefPaTalk(bean.getPrefPaTalk());
				result.setPrefPaMusic(bean.getPrefPaMusic());
				result.setPrefDrPet(bean.getPrefDrPet());
				result.setPrefDrSmoke(bean.getPrefDrSmoke());
				result.setPrefDrTalk(bean.getPrefDrTalk());
				result.setPrefDrMusic(bean.getPrefDrMusic());
				result.setCurrentLv(bean.getCurrentLv());
				result.setRegisDate(bean.getRegisDate());
				result.setLastLog(bean.getLastLog());
				result.setMalPoint(bean.getMalPoint());
				result.setRate(bean.getRate());
				result.setRateReceived(bean.getRateReceived());
				result.setRidesOffered(bean.getRidesOffered());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		Member temp = this.getSession().get(Member.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
}
