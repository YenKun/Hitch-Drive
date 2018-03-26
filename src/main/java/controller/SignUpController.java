package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Member;
import model.service.SignUpService;

@Controller
public class SignUpController {

	@Autowired
	private SignUpService signUpService = null;

	@RequestMapping(path = { "/member.controller" }, method = RequestMethod.POST)
	public String method(String prodaction, Member bean, BindingResult bindingResult, Model model, HttpSession session,
			@RequestParam("email") String temp1, @RequestParam("pwd") String temp2) {
		// servlet裡面的request.getParameter("email")

		// 接收資料
		Map<String, String> errors = new HashMap<>();
		session.setAttribute("errors", errors);// 把error存在model物件裡面，此物件跟Spring要來的
		// 此物件存在requestScope裡面，因為是一次性的東西，所以我在viewConfig裡面用的是Redeirect的方法，等於又送了一次request，所以東西會失效
		bean.setRegisDate(new java.util.Date());

		System.out.println("測試使用者輸入的資料");
		System.out.println("Email:" + bean.getEmail());
		System.out.println("Password:" + bean.getPwd());
		System.out.println("----------------------------------------------");
		System.out.println("temp:" + temp1);
		System.out.println("pwd:" + temp2);
		System.out.println("bindingResult:" + bindingResult);
		System.out.println("model:" + model);
		System.out.println("registerDate:" + bean.getRegisDate());
		System.out.println(prodaction);
		// 轉換資料

		if (bindingResult != null && bindingResult.hasErrors()) {
			if (bindingResult.getFieldErrorCount("email") != 0) {
				errors.put("xxx1", "email有問題");
			}
		}

		// ------------------------------------------------------------------------------------------

		// 邏輯驗證

		// temp1是email,temp2是pwd
		// 如果pordaction的name是signUp(也就是點了SignUp的按鈕)

		if (prodaction != null) {
			String pattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
					+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

			// 檢查Email是否有輸入或為空值
			if (temp1 == null || temp1.length() == 0) {
				errors.put("xxx1", "請輸入Eail");
			}
			// 檢查是否符合Email格式
			else if (!temp1.matches(pattern)) {
				errors.put("xxx1", "Email格式錯誤");
			}

			if (temp2 == null || temp2.length() == 0) {
				errors.put("xxx2", "密碼不得為空");
			}

			// 檢查PassWord是否有輸入或為空值
			// String pwdPattern = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z] {8,16}$";
			// if (!temp2.matches(pwdPattern)){
			// errors.put("xxx1","密碼格式錯誤");}

		}
		// 如果errors裡面存了東西，就回傳"signUp.error"這個頁面
		if (errors != null && !errors.isEmpty()) {
			return "signUp.error";
		}

		// 呼叫model
		// 根據model執行結果呼叫view元件

		if (prodaction != null) {
			Integer result = signUpService.insert(bean);

			if (result == null) {
				errors.put("action", "This Email had already been used！");

			} else {
				System.out.println("insert");
				model.addAttribute("insert", result);

				bean = signUpService.selectByEmail(temp1);
				System.out.println("試試看可不可以抓到剛才輸進去的資料" + bean);
				session.setAttribute("memberInfo", bean);

				return "signUp.success";
			}

			return "signUp.error";

		}

		else {
			errors.put("action", "Unknown Action:" + prodaction);
			return "signUp.error";
		}
	}

	// ---------------------------------------------------------------------------------------------------------------------

	@RequestMapping(path = { "/addName.controller" }, method = RequestMethod.POST)
	public String addName(String submitName, Member addName, HttpSession session, Model model,
			@RequestParam("firstName") String temp3, @RequestParam("lastName") String temp4) {

		// 找看看是否已經登入
		
		Member memberLogin = (Member) session.getAttribute("memberInfo");

		System.out.println("------------------有情有義分隔線---------------------------------");
		System.out.println("是否能抓到剛剛的資料："+memberLogin);
		System.out.println("看看addName是甚麼：" + addName);
	

		Map<String, String> errors = new HashMap<>();
		session.setAttribute("errors", errors);// 把error存在model物件裡面，此物件跟Spring要來的

		// 邏輯驗證

		if (memberLogin != null && submitName != null) {
			if (addName != null) {
				if (addName.getFirstName() == null || addName.getFirstName().trim().length() == 0) {
					errors.put("er3", "FisrtName not null");
				}
				if (addName.getLastName() == null || addName.getLastName().trim().length() == 0) {
					errors.put("er4", "LastName not null");
				}

				if (errors != null && !errors.isEmpty()) {
					return "addName.error";
				}

				// 呼叫Service功能進行update

			}
			Member member = signUpService.addName(memberLogin, addName);

			System.out.println("update了名字");
			
			
			session.setAttribute("memberInfo", member);
	        System.out.println("memberInfo:"+memberLogin);//這個會印到上上面的Member memberLogin= ....
	        System.out.println("member"+member);
			
			return "addName.success";

		}

		else {
			return "addName.error";
		}
	}

} // 這個是最大Controller的括弧
