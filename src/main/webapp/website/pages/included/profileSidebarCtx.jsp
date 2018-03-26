<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div style="width:80%;height:10px;margin:10px auto"></div>
	<div style="width: 80%; margin: 0 auto; padding-left: 40px;">
		<div class="leftSideBar"
			style="width: 15%; float: left; background-color: #f3efe0; height:100vh;">
			<div class="sec1" style="background-color: 	#FFF0F5">
			<a href="<c:url value='/website/pages/sideBarCtx/ProfilePersonalProfile.jsp'/>"><div class="sideBtn type1">Personal Information</div></a>
			<a href="<c:url value='/website/pages/Profile/Photo.jsp'/>"><div class="sideBtn type1">Photo</div></a>
			<a href="<c:url value='/website/pages/Profile/Preferences.jsp'/>"><div class="sideBtn type1">Preferences</div></a>
			<a href="<c:url value='/website/pages/Profile/Verifications.jsp'/>"><div class="sideBtn type1">Verification</div></a>
			<a href="<c:url value='/website/pages/Profile/Car.jsp'/>"><div class="sideBtn type1">Car</div></a>
			<a style="display:none" href="<c:url value='/website/pages/Profile/PostalAddress.jsp'/>"><div class="sideBtn type1">Postal Address</div></a>
			</div>
			<div class="sec2" style="background-color: 	#FFF0F5">
				<a href="<c:url value='/website/pages/Profile/RatingReceived.jsp'/>"><div class="sideBtn type1">Ratings Received</div></a>
				<a href="<c:url value='/website/pages/Profile/RatingLeft.jsp'/>"><div class="sideBtn type1">Ratings Left</div></a>
				<a href="<c:url value='/offerRide/myHistory.controller'/>"><div class="sideBtn type1">Rides History</div></a>
			</div>
			
			<div class="sec3" style="background-color: 	#FFF0F5">
				<a style="display:none" href="<c:url value=''/>"><div class="sideBtn type1">Notifications</div></a>
				<a href="<c:url value='/website/pages/Profile/Password.jsp'/>"><div class="sideBtn type1">Password</div></a>
				<a style="display:none" href="<c:url value='/website/pages/Profile/CloseMyAccount.jsp'/>"><div class="sideBtn type1">Close My Account</div></a>
			</div>
		</div>