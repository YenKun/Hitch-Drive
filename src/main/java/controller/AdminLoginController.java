package controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;
import model.service.AdminLoginService;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminLoginService adminLoginService;


	@RequestMapping(path = { "/manager/adminLogin.controller" }, method = { RequestMethod.GET, RequestMethod.POST })

	public String method(String email, String password, Model model, HttpSession session) {
		System.out.println("測試是否可以接到訊息");
		System.out.println("使用者輸入的資訊為：" + "email=" + email + "，" + "password=" + password);

		// 接收資料
		Map<String, String> errors = new HashMap<>();
		session.setAttribute("errors", errors);

		if (email == null || email.trim().length() == 0) {
			errors.put("useremail", "請輸入email");
		}
		if (password == null || password.trim().length() == 0) {
			errors.put("password", "請輸入password");
		}

		if (errors != null && !errors.isEmpty()) {
			return "adminLogin.fail";
		}

		// 呼叫model
		Member bean = adminLoginService.login(email, password);
		System.out.println("跑到這邊");
		System.out.println(bean);
		// 根據model執行結果呼叫view元件

		if (bean != null) {
		bean.setPhoto(null);
		bean.setLicensePhoto(null);
		session.setAttribute("adminLogin", bean);
			return "adminLogin.success";
		}
		errors.put("loginFail", "您的帳號密碼有誤！");
		return "adminLogin.fail";

	}
}
