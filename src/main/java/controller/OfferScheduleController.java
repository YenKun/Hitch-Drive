package controller;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.bean.Car;
import model.bean.Member;
import model.service.CarService;
import model.service.MemberService;
import model.service.RideService;

@Controller
@Scope("session")
public class OfferScheduleController {
	
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
	private CarService carService;
	
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(
		path={"/offerRide/offerSchedule.controller"}
	)
	public String submit(@RequestParam(name="start") String start, 
			@RequestParam(name="dest") String dest,
			@RequestParam(name="pickUpZone") String pickUpZone,
			@RequestParam(name="dropOffZone") String dropOffZone,
			@RequestParam(name="rideDate") Date rideDate,
			HttpSession session, HttpServletRequest request, Model model) {
		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if (start == null || start.trim().length() == 0) {
			errors.put("origin", "Please enter the origin");
		}
		if (dest == null || dest.trim().length() == 0) {
			errors.put("destination", "Please enter the destination");
		}
		if (rideDate == null) {
			errors.put("rideDate", "Please enter the ride date");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			errors.put("msg", "Please fill out all the information");
			model.addAttribute("errors", errors);
			return "offerSchedule";
		}
		
		if (session.getAttribute("memberInfo") == null) {
			return "login.fail";
		}
		List<Car> carList = carService.selectByMember(
				((Member) session.getAttribute("memberInfo")).getMid());
		
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");
		
		session.setAttribute("start", start);
		session.setAttribute("pickUpZone", pickUpZone);
		session.setAttribute("dest", dest);
		session.setAttribute("dropOffZone", dropOffZone);
		session.setAttribute("rideDate", rideDate);
		session.setAttribute("hour", hour);
		session.setAttribute("minute", minute);
		session.setAttribute("time", Time.valueOf(hour + ":" + minute + ":00"));
		session.setAttribute("cars", carList);
		
		
		return "offerDetails";
	}
	
}
