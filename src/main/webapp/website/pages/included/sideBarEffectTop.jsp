<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="st-container" class="st-container">
	<nav class="st-menu st-effect-11" id="menu-11">
		 <h2 class="icon icon-lab">Hi, ${memberInfo.firstName}</h2>
		<ul>
			<li><a class="	fa fa-dashboard" href="<c:url value="/website/pages/sideBarCtx/dashboard.jsp" />">&nbspDashboard</a></li>
			<li><a class="	fa fa-car" href="<c:url value="/offerRide/myOffers.controller" />">&nbspRides offered</a></li>
			<li><a class="	fa fa-thumbs-o-up" href="<c:url value="/findRide/displayBookings.controller" />">&nbspRides booked</a></li>
			<li><a class="	fa fa-comments-o" href="<c:url value="/website/pages/sideBarCtx/MessageCtx.jsp" />">&nbspMessages</a></li>
			<li><a class="	fa fa-bell-o" href="<c:url value="" />">&nbspRide alerts </a></li>
			<li><a class="	fa fa-folder-open-o" href="<c:url value="/website/pages/sideBarCtx/ProfilePersonalProfile.jsp" />">&nbspProfile</a></li>
			<li><a class="	fa fa-cc-visa" href="<c:url value="" />">&nbspRequest my funds</a></li>
			<li><a class="	fa fa-calculator" href="<c:url value="" />">&nbspPayment and refunds</a></li>
			<li><a class="	fa fa-sign-out" href="<c:url value="/pages/logout.controller" />">&nbspLog out</a></li>
		</ul>
	</nav>
	<div class="st-pusher">
		<div class="st-content">
			<!-- this is the wrapper for the content -->
			<div class="st-content-inner">
				<!-- extra div for emulating position:fixed of the menu -->
				<div class="main clearfix">