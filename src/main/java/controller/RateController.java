package controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import model.bean.Member;
import model.bean.Rate;
import model.service.RateService;

@RestController
@RequestMapping("/Ratings")
public class RateController {

	@Autowired
	RateService rateService;

	@RequestMapping(path = { "/Photos" }, method = RequestMethod.GET, produces = { "image/*" })
	@ResponseBody
	public byte[] getMemberPhoto(@RequestParam("Mid") Integer Mid) {
		Member bean = rateService.getMember(Mid);
//		System.out.println(bean);
		Blob photo = bean.getPhoto();
		try {
			return IOUtils.toByteArray(photo.getBinaryStream());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(path = "/Left/{mId}.controller", method = RequestMethod.GET, produces = { "application/json" })
	@ResponseBody
	public HashMap<String, List> getLeftRatings(@PathVariable("mId") Integer mId, HttpSession session) {
		Member user = (Member) session.getAttribute("memberInfo");
		if (user != null) {
			return rateService.getLeftRatings(user.getMid());
		}
		return null;
	}

	@RequestMapping(path = "/Received/{mId}.controller", method = RequestMethod.GET, produces = { "application/json" })
	@ResponseBody
	public HashMap<String, List> getReceivedRatings(@PathVariable("mId") Integer mId, HttpSession session) {
		Member user = (Member) session.getAttribute("memberInfo");
		if (user != null) {
			return rateService.getReceivedRatings(user.getMid());
		}
		return null;
	}

	@RequestMapping(method = { RequestMethod.POST }, produces = { "application/json" })
	@ResponseBody
	public HashMap<String, String> rateMember(@RequestBody Rate bean, HttpSession session) {
		HashMap<String, String> msg = new HashMap<String, String>();

		Member user = (Member) session.getAttribute("memberInfo");
		if (user != null) {
			if (bean != null) {
				bean.setFromMid(user.getMid());
 				if (bean.getRideId() == null || bean.getRideId() % 2 != 1) {
					msg.put("ride", "rideIdeErr");
				}
				if (bean.getToMid() == null || bean.getToMid() % 2 != 0) {
					msg.put("Mid", "MidErr");
				}
				if (bean.getStar() == null || bean.getStar() < 1 && 5 < bean.getStar()) {
					msg.put("star", "Must have Rating");
				}
				if (bean.getComment() != null && bean.getComment().length() > Math.pow(2, 31) - 1) {
					msg.put("comment", "Commemt too long");
				}
				if (!msg.isEmpty()) {
					msg.put("rate", "Rate Fail");
					return msg;
				}
				if (rateService.rateMember(bean)) {
					msg.put("rate", "Rate Success");
					return msg;
				} else {
					msg.put("data", "Illegal data");
				}
			} else {
				// Log 非法Request
				msg.put("bean", "bean is null");
			}
		}
		msg.put("rate", "Rate Fail");
		return msg;
	}
}
