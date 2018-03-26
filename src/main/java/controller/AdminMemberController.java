package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Member;
import model.dao.superInterface.MemberDAO;
import model.service.AdminMemberService;

@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private MemberDAO memberDao;

	@Autowired
	private ApplicationContext context;

	@ResponseBody
	@RequestMapping(path = { "/adminPage.controller" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String method(String prodaction, Member bean, String email, Model model, HttpSession session,
			@RequestParam("email") String temp, @RequestParam("mid") String mid) {
		System.out.println("測試是否可以接到訊息");
		System.out.println("使用者輸入的資訊為：" + "mid=" + mid + "，" + "email=" + email);
		System.out.println("bean有這些：" + bean);

	
		// 這部份是要更新會員資料用的
		
			Member result = adminMemberService.update(bean);
				
		String su = "更改成功！";
		return su;
	}

	
	
	
	// 用jQuery這樣寫就可以了
		@ResponseBody
		@RequestMapping(path = "/getMemberList.controller", produces = "application/json")
		public List<Member> getMemberList() {
			List<Member> members = adminMemberService.selectAll();
			//現在有個一整個陣列的資料叫做members，member就是代表這個members陣列裡從頭到尾的每一個值
			//members的屬性是啥，前面就是要啥
			for (Member member : members) {    
				member.setPhoto(null);
				member.setLicensePhoto(null);
			}

			return members;
		}
	
	
	
//	@RequestMapping(path = { "/AdminEditMember.controller"}, method = { RequestMethod.GET, RequestMethod.POST })
//	
//	public String method(String prodaction, Member bean, String email, Model model, HttpSession session,
//			
//			
//	public Member memberUpdate() {
//		Member result = adminMemberService.update(bean);
//		
//			
//			member;
//	}
	
	
	
	
	
	

}
