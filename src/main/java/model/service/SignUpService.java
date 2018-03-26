package model.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

@Service
@Transactional
public class SignUpService {

	@Autowired
	private MemberDAO memberDao;

	public Integer insert(Member bean) {
		Integer result = null;
		if (bean != null) {
			result = memberDao.insert(bean);
			System.out.println("確認已經跑了SQL指令:" + result);
		}
		return result;
	}

	@Transactional(readOnly = true)
	public Member selectByEmail(String email) {
		Member selectResult = memberDao.select(email);
		return selectResult;
	}
	
	public Member addName(Member memberLogin, Member bean) {
		Member member = memberDao.select(memberLogin.getMid());
		if (member != null) {
			member.setFirstName(bean.getFirstName());
			member.setLastName(bean.getLastName());
			member.setRegisDate(new Date());
			return member;
		}
		return member;
	}

}
