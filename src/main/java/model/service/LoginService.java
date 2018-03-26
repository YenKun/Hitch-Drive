package model.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

@Service
@Transactional
public class LoginService {

	@Autowired
	private MemberDAO memberDao;

	@Transactional
	public Member login(String email, String password) {
		Member bean = memberDao.select(email);
		if (bean != null) {
			if (password != null && password.length() != 0) {
				String temp = password.trim(); // 使用者輸入
				String pass = bean.getPwd(); // 資料庫抓出
				if (pass.equals(temp)) {
					bean.setLastLog(new Date());
					return bean;
				}
			}
		}
		return null;
	}
}
