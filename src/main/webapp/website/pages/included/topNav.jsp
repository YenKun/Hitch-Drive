<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<ul class="nav">
		<li class="tb1"><a href="<c:url value="/website/pages/sideBarCtx/dashboard.jsp" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/dashboard.png"
			alt=""> <span>Dashboard</span></a></li>
			
		<li class="tb2"><a href="<c:url value="/offerRide/myOffers.controller" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/suv.png"
			alt=""> <span>Rides Offered</span></a></li>
			
		<li class="tb3"><a href="<c:url value="/findRide/displayBookings.controller" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/luggage-trolley.png"
			alt=""> <span>Rides Booked</span></a></li>
			
		<li class="tb4"><a href="<c:url value="/website/pages/sideBarCtx/MessageCtx.jsp" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/communication.png"
			alt=""> <span>Messages</span></a></li>
			
		<li class="tb5"><a href="<c:url value="" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/alarm.png"
			alt=""> <span>Ride Alerts</span></a></li>
			
		<li class="tb6"><a href="<c:url value="/website/pages/sideBarCtx/ProfilePersonalProfile.jsp" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/edit-user-female.png"
			alt=""> <span>Profile</span></a></li>
			
		<li class="tb7"><a href="<c:url value="" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/encashment-car.png"
			alt=""> <span>Request My Funds</span></a></li>
			
		<li class="tb8"><a href="<c:url value="" />"><img class="icon"
			src="https://png.icons8.com/small/32/000000/stack-of-money.png"
			alt=""> <span>Payment And Refunds</span></a></li>
	</ul>