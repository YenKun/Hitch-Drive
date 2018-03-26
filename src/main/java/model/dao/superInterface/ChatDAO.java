package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Chat;
import model.bean.Member;

public interface ChatDAO {

	Session getSession();

	Chat select(int id);

	List<Chat> select();

	Integer insert(Chat bean);

	Chat update(Chat bean);

	boolean delete(int id);

	List<Chat> selectContacts(Integer Mid);

	List<Chat> selectByFromToMid(Integer fromMid, Integer toMid);

	List<Member> selectContactsInfo(Integer Mid);

}