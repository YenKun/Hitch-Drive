package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Chat;
import model.bean.Member;
import model.dao.superInterface.ChatDAO;

@Repository("chatDAO")
public class ChatDAOHibernate implements ChatDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Chat select(int id) {
		return this.getSession().get(Chat.class, id);
	}

	@Override
	public List<Chat> select() {
		return this.getSession().createQuery("FROM Chat", Chat.class).list();
	}

	@Override
	public List<Chat> selectContacts(Integer Mid) {
		if (Mid != null) {
			return this.getSession().createNativeQuery("SELECT * FROM getContacts(?1)",Chat.class)
					.setParameter(1, Mid).list();
		}
		return null;
	}
	
	@Override
	public List<Member> selectContactsInfo(Integer Mid) {
		if (Mid != null) {
			return this.getSession().createNativeQuery("SELECT * FROM getContactsInfo(?1)",Member.class)
					.setParameter(1, Mid).list();
		}
		return null;
	}

	@Override
	public List<Chat> selectByFromToMid(Integer fromMid, Integer toMid) {
		if (fromMid != null && toMid != null) {
			return this.getSession().createQuery("FROM Chat WHERE ((fromMid = :fromMid AND toMid = :toMid)"
						+ " OR (toMid = :fromMid AND fromMid = :toMid))", Chat.class)
						.setParameter("fromMid", fromMid).setParameter("toMid", toMid).list();
		}
		return null;
	}

	@Override
	public Integer insert(Chat bean) {
		if (bean != null) {
			return (Integer) this.getSession().save(bean);
		}
		return null;
	}

	@Override
	public Chat update(Chat bean) {
		if (bean != null) {
			Chat result = this.getSession().get(Chat.class, bean.getChatId());
			if (result != null) {
				result.setFromMid(bean.getFromMid());
				result.setToMid(bean.getToMid());
				result.setChatDateTime(bean.getChatDateTime());
				result.setContent(bean.getContent());
				result.setPhoto(bean.getPhoto());
				result.setIsRead(bean.getIsRead());
			}
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		Chat temp = this.getSession().get(Chat.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
}
