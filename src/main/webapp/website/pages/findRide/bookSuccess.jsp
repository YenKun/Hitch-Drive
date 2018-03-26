<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ride Successfully Booked</title>
<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">

<style>
* {
	font-family: 'Patua One', cursive;
	margin: auto;
}

#all {
	width: 900px;
	padding: 50px;
}

</style>
</head>
<body>
	<div id="all">
		<h2>Your Booking is complete</h2>
		<br><hr><br><br><hr>
		Please wait a few seconds to be redirected...
		<br>
	</div>

	<script src="<c:url value="/website/js/jquery-3.3.1.min.js"/>"></script>
	<script>
	$(document).ready(function () {
		window.setTimeout(function () {
	        location.replace("<c:url value='/findRide/displayBookings.controller' />");
	    }, 1500);
	});
	</script>
</body>
</html>