package model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;

@Service
@Transactional
public class AdminLoginService {

	@Autowired
	private MemberDAO memberDao;

	@Transactional(readOnly = true)
	public Member login(String email, String password) {
		Member bean = memberDao.select(email);
		System.out.println("Service裡有沒有抓出bean??"+bean);
		if (bean != null) {
			if (password != null && password.length() != 0) {
				String temp = password.trim(); // 使用者輸入
				String pass = bean.getPwd(); // 資料庫抓出這個人的密碼
				Integer level = bean.getCurrentLv();//資料庫抓出這個人的等級
				System.out.println(level);

				if (pass.equals(temp) && level==999 ) {
					return bean;
					
				}
			}
		}
		return null;
	}
}
