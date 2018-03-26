package controller;

import java.io.UnsupportedEncodingException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.bean.Member;
import model.bean.PassDetail;
import model.bean.Ride;
import model.service.MemberService;
import model.service.PassDetailService;
import model.service.RideService;

@Controller
public class OfferSubmitController {
	
	@InitBinder
	public void initializer(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@Autowired
	private RideService rideService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PassDetailService pdService;
	
	@Autowired
	private ApplicationContext context;
	
	//submit the ride offer
	@RequestMapping(
		path={"/offerRide/offerDetails.controller"}
	)
	public String submit(@SessionAttribute("rideDate") Date rideDate, Ride bean, BindingResult bindingResult,
			HttpSession session, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		
		
		if(bindingResult!=null && bindingResult.hasErrors()) {
			System.out.println("binding error");
			return "offerDetails";
		}
		
		bean.setStart((String) session.getAttribute("start"));
		bean.setPickUpZone((String) session.getAttribute("pickUpZone"));
		bean.setDest((String) session.getAttribute("dest"));
		bean.setDropOffZone((String) session.getAttribute("dropOffZone"));
		bean.setRideDate(rideDate);
		bean.setRideTime((Time) session.getAttribute("time"));
		bean.setDuration(Time.valueOf("02:00:00"));
		if (session.getAttribute("memberInfo") == null) {
			return "login.fail";
		}
		
		bean.setDriverId(((Member)session.getAttribute("memberInfo")).getMid());
		
		Integer result = rideService.insert(bean);
		
		if (result == null) {
			System.out.println("failed");
			return "offerDetails";
		} else {
			model.addAttribute("insert", bean);
			
			return "insert.success";
		}
	}
	
	//cancel the ride offer, removing it from the database
	@RequestMapping(
			path= {"/offerRide/cancelOffer.controller"}
	)
	public String cancelOffer(@RequestParam(name="ride") Integer rideId, HttpSession session,
			HttpServletRequest request, Model model) {
		
		if (rideId != null) {
			if (rideService.delete(rideId)) {
				return "cancel.success";
			}
		}
		return "displayOffers";
		
	}
	
	
	//current active ride offers
	@RequestMapping(
			path={"/offerRide/myOffers.controller"}
	)
	public String myCurrentOffers(HttpServletRequest request, HttpSession session, Model model) {
		Member current = null;
		List<Ride> rideList = null;
		
		if (session.getAttribute("memberInfo") != null) {
			current = (Member) session.getAttribute("memberInfo");
			rideList = rideService.selectCurrent(current.getMid());
		}
		
		if ("price".equals(request.getParameter("sortby"))) {
			rideList = sortByPrice(rideList);
		} else {
			rideList = sortByTime(rideList);
		}
		
		model.addAttribute("rides", rideList);
		
		return "displayOffers";
	}
	
	
	
	//Gives Completed Rides History
	@RequestMapping(
			path={"/offerRide/myHistory.controller"}
	)
	public String offerHistory(HttpServletRequest request, HttpSession session, Model model) {

		List<PassDetail> pdList = null;
		List<Member> driverList = new ArrayList<Member>();
		
		List<List<Member>> ridesPassengers = new ArrayList<List<Member>>();
		List<Member> passengers = new ArrayList<Member>();
		
		Member current = (Member) session.getAttribute("memberInfo");
		List<Ride> rideList = rideService.selectHistory(current.getMid());
		if ("price".equals(request.getParameter("sortby"))) {
			rideList = sortByPrice(rideList);
		} else {
			rideList = sortByTime(rideList);
		}
		for (Ride ride : rideList) {
			driverList.add(memberService.select(ride.getDriverId()));
			pdList = pdService.selectByRide(ride.getRideId());
			for (PassDetail pd : pdList) {
				passengers.add(memberService.select(pd.getMid()));
			}
			ridesPassengers.add(passengers);
		}
		
		model.addAttribute("drivers", driverList);
		model.addAttribute("totalPass", ridesPassengers);
		model.addAttribute("rides", rideList);
		
		return "displayHistory";
	}
	
	
	//sort by time function
	private static List<Ride> sortByTime(List<Ride> rideList) {
		for (int i = 1; i < rideList.size(); i++) {
			Ride x = rideList.get(i);
			int j = i - 1;
			while (j >= 0 && rideList.get(j).getRideDate().after(x.getRideDate())) {
				rideList.set(j + 1, rideList.get(j));
				j = j - 1;
			}
			rideList.set(j + 1, x);
		}
		return rideList;
	}
	
	//sort by price function
	private static List<Ride> sortByPrice(List<Ride> rideList) {
		for (int i = 1; i < rideList.size(); i++) {
			Ride x = rideList.get(i);
			int j = i - 1;
			while (j >= 0 && rideList.get(j).getPrice() > x.getPrice()) {
				rideList.set(j + 1, rideList.get(j));
				j = j - 1;
			}
			rideList.set(j + 1, x);
		}
		return rideList;
	}
	
}
