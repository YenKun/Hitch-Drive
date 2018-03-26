package model.dao.superInterface;

import java.util.List;

import org.hibernate.Session;

import model.bean.Verification;

public interface VerificationDAO {
	Session getSession();
	List<Verification> select();
	Verification selectByMid(Integer mid);
	List<Verification>selectNotVerify();
	Verification update(Verification bean);
	Integer insert(Verification bean);
	
}
