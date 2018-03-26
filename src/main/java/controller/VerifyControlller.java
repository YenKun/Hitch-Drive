package controller;

import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Car;
import model.bean.Member;
import model.bean.Verification;
import model.service.CarService;
import model.service.MemberService;
import model.service.VerifyService;

@Controller
@RequestMapping(path = { "/verify" })
public class VerifyControlller {
	@Autowired
	VerifyService vs;
	@Autowired
	MemberService ms;
	@Autowired
	CarService cs;

	@ResponseBody
	@RequestMapping(path = { "/getcode.controller" }, method = { RequestMethod.GET }, produces = { "application/json" })
	public Map<String, String> getEmailVerifyCode(String email, HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		Map<String, String> map = new HashMap<>();
		if (memberInfo != null) {
			Member member1 = ms.getMemberInfo(memberInfo.getMid());
			if (member1.getCurrentLv() >= 2) {
				map.put("er", "已經驗證過了");
			} else if (email == null || email.trim().length() == 0) {
				map.put("er", "eamil not null");
			} else if (map.isEmpty()) {
				try {
					vs.SendEmail(email, memberInfo.getMid());
					map.put("msg", "請確認信箱信件");
				} catch (NoSuchAlgorithmException e) {
					map.put("er", "寄送失敗");
				}
			}
			return map;

		} else {
			return null;
		}

	}

	@RequestMapping(path = { "/getEmailVerify.controller" }, method = { RequestMethod.POST, RequestMethod.GET })
	public String getVerify(String email, String verifyCode, HttpSession session) {
		Member member = vs.CheckCode(email, verifyCode);
		if (member.getEmailVerified()) {
			session.setAttribute("memberInfo", member);
			return "backtoindex";
		} else {
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(path = "/getAllList", method = { RequestMethod.GET }, produces = { "application/json" })
	public List<Verification> getAllVerifyList() {
		return vs.getAllList();
	}

	@ResponseBody
	@RequestMapping(path = "/getNotVerifyList", method = { RequestMethod.GET }, produces = { "application/json" })
	public List<Verification> getNotVerifyList() {
		return vs.getAllNotVerify();
	}

	@ResponseBody
	@RequestMapping(path = "/getVerify.controller", method = { RequestMethod.GET }, produces = { "application/json" })
	public Verification getVerify(HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		if (memberInfo != null) {
			System.out.println(vs.getVerifyByMid(memberInfo.getMid()));
			return vs.getVerifyByMid(memberInfo.getMid());
		} else {
			return null;
		}
	}

	@ResponseBody
	@RequestMapping(path = "/setLicenseVerified.controller", method = { RequestMethod.GET }, produces = {
			"application/json" })
	public Boolean setLicenseVerified(Integer mid) {
		if (mid != null) {
			vs.setLicenseVerify(mid);
		} else {
			return false;
		}
		return false;
	}

	
	
	
	@ResponseBody
	@RequestMapping(path= {"/getCarNoVerified.controller"},method= {RequestMethod.GET})
	public List<Car> getNoVerifyCar(){
		List<Car> cars = cs.getAllCarNoVerify();
		for(Car car :cars) {
			car.setCarDocPhoto(null);
		}
		return cars;
	}
	
	
	@ResponseBody
	@RequestMapping(path= {"/setCarVerified.controller"},method= {RequestMethod.GET})
	public Boolean setCarVerify(Integer carId){
		cs.setCarDocVerify(carId);
		return true;
	}
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(path = { "/getCarDocPhoto.controller" }, method = { RequestMethod.GET })
	public byte[] getCarDocPhoto(Integer carId) {

		try {
			Blob blob = cs.getDocPhoto(carId);
			InputStream is = blob.getBinaryStream();
			return IOUtils.toByteArray(is);
		} catch (Exception e) {
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(path = { "/getLicensePhoto.controller" }, method = { RequestMethod.GET })
	public byte[] getLicensePhoto(Integer mid) {
		try {
			Blob blob = ms.getLicensePhtot(mid);
			InputStream is = blob.getBinaryStream();
			return IOUtils.toByteArray(is);
		} catch (Exception e) {
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(path = "/getAccount.controller", method = { RequestMethod.GET }, produces = { "application/json" })
	public Member getAccount(HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");

		if (memberInfo != null) {
			Member member1 = ms.getMemberInfo(memberInfo.getMid());
			Member member = new Member();
			member.setAccount(member1.getAccount());
			member.setCurrentLv(member1.getCurrentLv());
			return member;
		} else {
			return null;
		}
	}

	@ResponseBody
	@RequestMapping(path = { "/setAccount.controller" }, method = { RequestMethod.PUT }, produces = {
			"application/json" })
	public Map<String, String> setAccount(@RequestBody String account, HttpSession session) {
		Member memberInfo = (Member) session.getAttribute("memberInfo");

		Map<String, String> map = new HashMap<String, String>();
		String account1 = account.split("=")[1];
		if (memberInfo != null) {
			Member member1 = ms.getMemberInfo(memberInfo.getMid());
			if (member1.getCurrentLv() < 3) {
				map.put("er", "權限不足");
			} else if (account1 == null || account1.trim().length() == 0) {
				map.put("er", "not null");
			} else if (map.isEmpty()) {
				Member member = ms.setAccount(memberInfo.getMid(), account1);
				session.setAttribute("memberInfo", member);
				map.put("msg", "edit success");
			}
			return map;
		} else {
			return null;
		}

	}

}
