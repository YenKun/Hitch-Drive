package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Member;
import model.bean.PassDetail;
import model.bean.Ride;
import model.service.MemberService;
import model.service.PassDetailService;
import model.service.RideService;

@Controller
@Scope("session")
public class FindRideController {
	
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
	
	@RequestMapping(
			path={"/findRide/findRide.controller"}
	)
	public String findRide(@RequestParam(name="start") String start,
			@RequestParam(name="pickUpZone") String pickUpZone,
			@RequestParam(name="dest") String dest, 
			@RequestParam(name="dropOffZone") String dropOffZone,
			@RequestParam(name="rideDate") Date rideDate,
			HttpSession session, HttpServletRequest request, Model model) {
		
		//validation
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		//check if required entries are empty
		if (start == null || start.trim().length() == 0) {
			errors.put("start", "Please enter your starting location.");
		}
		if (rideDate == null) {
			errors.put("rideDate", "Please enter your travel date.");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			errors.put("msg", "Sorry, there are no rides available.");
			model.addAttribute("errors", errors);
			return "findRides";
		}
		
		session.setAttribute("date", rideDate);
		
		//check if logged in
		if (session.getAttribute("memberInfo") == null) {
			
		}
		
		//preparing model attributes for response
		List<Member> memberList = new ArrayList<Member>();
		List<Ride> rideList = null;
		if (dest == null || dest.trim().length() == 0) {
			rideList = rideService.select(start, rideDate);
		} else {
			rideList = rideService.select(start, dest, rideDate);
		}
		if (rideList.isEmpty()) {
			errors.put("msg", "Sorry, there are no rides available.");
			model.addAttribute("errors", errors);
			return "findRides";
		}
		
		
		//sort list
		rideList = sortByTime(rideList);
		
		for (Ride ride : rideList) {
			memberList.add(memberService.select(ride.getDriverId()));
		}
		model.addAttribute("members", memberList);
		model.addAttribute("rides", rideList);
		String origin = start;
		if (!"DISTRICT".equals(pickUpZone.toUpperCase())) {
			origin += ", " + pickUpZone;
		}
		model.addAttribute("origin", origin);
		model.addAttribute("start", start);
		model.addAttribute("dest", dest);
		model.addAttribute("pickUpZone", pickUpZone);
		model.addAttribute("dropOffZone", dropOffZone);
		model.addAttribute("rideDate", rideDate);
		
//		bean.setDuration(Time.valueOf("02:00:00"));
//		bean.setDriverId(8);
//		bean.setCarId(880005);
		
		return "displayRides";
	}
	
	//finds 3 random offers
	@RequestMapping(
			path={"/findRide/findRandom.controller"},produces = { "application/json" }
	)
	@ResponseBody
	public String findRandom() {
		List<Ride> rideList = rideService.selectFuture();
		
		String start = null, dest = null, price = null, id = null;
		String ridejson = "{";
		
		if (rideList == null) {
			return null;
		}
		int size = rideList.size();
		Random generator = new Random();
		
		for (int i = 0; i < 3 && size > 0; i++) {
			int randomIndex = generator.nextInt(size);
			Ride ride = rideList.get(randomIndex);
			
			if (ride.getStart().lastIndexOf(" ") < 1) {
				dest = ride.getStart();
			} else {
				start = ride.getStart().substring(0, ride.getStart().lastIndexOf(" "));
			}
			if (ride.getDest().lastIndexOf(" ") < 1) {
				dest = ride.getDest();
			} else {
				dest = ride.getDest().substring(0, ride.getDest().lastIndexOf(" "));
			}
			price = ride.getPrice().toString();
			id = ride.getRideId().toString();
			ridejson += "'ride" + (i+1) + "': {'start':'" + start
					+ "','dest':'" + dest
					+ "','price':'" + price
					+ "','id':'" + id
					+ "'},";
			rideList.remove(randomIndex);
			size = size - 1;
		}
		ridejson = ridejson.substring(0, ridejson.length()-1) + "}";
		
		return ridejson.replaceAll("'", "\"");
	}
	
	
	@RequestMapping(
			path={"/findRide/sortRides.controller"}
	)
	public String sortRides(@RequestParam(name="start") String start,
			@RequestParam(name="pickUpZone") String pickUpZone,
			@RequestParam(name="dest") String dest, 
			@RequestParam(name="dropOffZone") String dropOffZone,
			HttpSession session, HttpServletRequest request, Model model) {
		
		
		//preparing model attributes for response
		List<Member> memberList = new ArrayList<Member>();
		List<Ride> rideList = null;
		if (dest == null || dest.trim().length() == 0) {
			rideList = rideService.select(start, (Date) session.getAttribute("date"));
		} else {
			rideList = rideService.select(start, dest, (Date) session.getAttribute("date"));
		}
		
		//sort list
		if ("price".equals(request.getParameter("sortby"))) {
			rideList = sortByPrice(rideList);
		} else {
			rideList = sortByTime(rideList);
		}
		
		for (Ride ride : rideList) {
			memberList.add(memberService.select(ride.getDriverId()));
		}
		model.addAttribute("members", memberList);
		model.addAttribute("rides", rideList);
		String origin = start;
		if (!"DISTRICT".equals(pickUpZone.toUpperCase())) {
			origin += ", " + pickUpZone;
		}
		model.addAttribute("origin", origin);
		model.addAttribute("start", start);
		model.addAttribute("dest", dest);
		model.addAttribute("pickUpZone", pickUpZone);
		model.addAttribute("dropOffZone", dropOffZone);
		model.addAttribute("rideDate", (Date) session.getAttribute("date"));
		
		return "displayRides";
	}
	
	@RequestMapping(
			path={"/findRide/rideInfo.controller"}
	)
	public String rideInfo(@RequestParam(name="ride") Integer rideId, Model model) {
		Ride ride = (Ride) rideService.select(rideId);
		Member driver = memberService.select(ride.getDriverId());
		
		List<PassDetail> pdlist = pdService.selectByRide(ride.getRideId());
		List<Member> mlist = new ArrayList<Member>();
		for (PassDetail pd : pdlist) {
			mlist.add(memberService.select(pd.getMid()));
		}
		
		String desc = ride.getStart() + " " + ride.getPickUpZone() + 
				", " + ride.getDest() + " " + ride.getDropOffZone();
		model.addAttribute("openings", ride.getCapacity() - pdlist.size());
		model.addAttribute("passnum", pdlist.size());
		model.addAttribute("passengers", mlist);
		model.addAttribute("desc", desc);
		model.addAttribute("ride", ride);
		model.addAttribute("driver", driver);
		return "rideInfo";
	}
	
	@RequestMapping(
			path={"/findRide/offerInfo.controller"}
	)
	public String offerInfo(@RequestParam(name="ride") Integer rideId, Model model) {
		Ride ride = (Ride) rideService.select(rideId);
		Member driver = memberService.select(ride.getDriverId());
		
		List<PassDetail> pdlist = pdService.selectByRide(ride.getRideId());
		List<Member> mlist = new ArrayList<Member>();
		for (PassDetail pd : pdlist) {
			mlist.add(memberService.select(pd.getMid()));
		}
		
		String desc = ride.getStart() + " " + ride.getPickUpZone() + 
				", " + ride.getDest() + " " + ride.getDropOffZone();
		model.addAttribute("openings", ride.getCapacity() - pdlist.size());
		model.addAttribute("passnum", pdlist.size());
		model.addAttribute("passengers", mlist);
		model.addAttribute("desc", desc);
		model.addAttribute("ride", ride);
		model.addAttribute("driver", driver);
		return "offerInfo";
	}
	
	@RequestMapping(
			path={"/findRide/bookingsuccess.controller"}
	)
	public String bookingSuccess(@RequestParam(name="ride") Integer rideId, 
			HttpServletRequest request, HttpSession session, Model model) {
		
		return displayBookings(request, session, model);
	}
	
	@RequestMapping(
			path={"/findRide/displayBookings.controller"}
	)
	public String displayBookings(HttpServletRequest request, HttpSession session, Model model) {
//		PassDetail bean = new PassDetail();
//		bean.setBookTime(new java.util.Date());
//		bean.setConfirmed(false);
//		bean.setMid(8);
//		bean.setRideId(125);
//		bean.setSeatsBooked(1);
//		pdService.insert(bean);
		
		if (session.getAttribute("memberInfo") == null) {
			return "displayBookings";
		}
		List<PassDetail> pdlist = pdService.selectByMember(
				((Member) session.getAttribute("memberInfo")).getMid());
		List<Ride> rideList = new ArrayList<Ride>();
		
		for (PassDetail pd : pdlist) {
			rideList.add(rideService.select(pd.getRideId()));
		}
		
		if ("price".equals(request.getParameter("sortby"))) {
			rideList = sortByPrice(rideList);
		} else {
			rideList = sortByTime(rideList);
		}
		
		model.addAttribute("rides", rideList);
		model.addAttribute("pdList", pdlist);
		
		return "displayBookings";
	}

	
	@RequestMapping(
			path= {"/offerRide/cancelBooking.controller"}
	)
	public String cancelBooking(@RequestParam(name="pdId") Integer pdId, HttpSession session,
			HttpServletRequest request, Model model) {
		
		if (pdId != null) {
			if (pdService.delete(pdId)) {
				return "cancel.booking";
			}
		}
		return "displayBookings";
		
	}
	
	private static List<Ride> sortByTime(List<Ride> rideList) {
		for (int i = 1; i < rideList.size(); i++) {
			Ride x = rideList.get(i);
			int j = i - 1;
			while (j >= 0 && rideList.get(j).getRideTime().after(x.getRideTime())) {
				rideList.set(j + 1, rideList.get(j));
				j = j - 1;
			}
			rideList.set(j + 1, x);
		}
		return rideList;
	}
	
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
