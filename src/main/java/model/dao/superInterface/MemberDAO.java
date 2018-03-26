package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Member;

public interface MemberDAO {

	Session getSession();

	Member select(int id);

	List<Member> select();

	Member select(String email);

	Integer insert(Member bean);

	Member update(Member bean);

	boolean delete(int id);

}