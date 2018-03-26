package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.Member;
import model.service.LoginService;

@Controller
@RequestMapping
public class LoginController {

	@Autowired
	private LoginService ms;
	
	

	@RequestMapping(path = { "/pages/login.controller" }, method = { RequestMethod.POST })
	public String login(String email, String password, HttpSession session) {

		Map<String, String> errors = new HashMap<>();
		session.setAttribute("errors", errors);

		if (email == null || email.trim().length() == 0) {
			errors.put("useremail", "請輸入email");
		}
		if (password == null || password.trim().length() == 0) {
			errors.put("password", "請輸入password");
		}

		if (errors != null && !errors.isEmpty()) {
			errors.put("loginFail", "帳號或密碼不得為空");
			return "login.fail";
		}

		Member member = ms.login(email, password);
		if (member != null) {
			member.setPhoto(null);
			member.setLicensePhoto(null);
			member.setLastLog(new Date());
			session.setAttribute("memberInfo", member);
			return "login.success";
		}
		errors.put("loginFail", "您的帳號密碼有誤!");
		return "login.fail";
	}

	@RequestMapping(path = { "/pages/logout.controller" }, method = { RequestMethod.GET })
	public String logout(HttpSession session) {
		session.setAttribute("memberInfo", null);
		return "login.success";
	}

}
