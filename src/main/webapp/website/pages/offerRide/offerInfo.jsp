<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Offer information</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
	
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/displaylist/displayfound.css"/>" />

<style>
* {
	margin: auto;
	color: black;
	font-size: 20px;
}

#all {
	padding: 10px;
	width: 1000px;
}

#header {
	padding: 10px;
	height: 140px;
}

#headertitle {
	padding: 10px;
	text-align: center;
	font-size: 20px;
}

#headerprogress {
	font-weight: bold;
	text-align: center;
	padding: 10px;
	height: 40%;
}

#index {
	width: 180px;
	float: left;
}

#schedule {
	padding: 10px;
	padding-left: 50px;
	width: 540px;
	float: left;
}

#scheduleleft {
	float: left;
	padding: 10px;
}

#scheduleright {
	float: right;
	padding: 10px;
}

#scheduledetails {
	padding: 10px;
	clear: both;
}

#schedulebottom {
	padding: 10px;
	border-bottom: 3px solid gray;
}

#memberinfo {
	border-left: 3px solid gray;
	float: right;
	width: 300px;
	padding: 10px;
}

#priceseat {
	height: 150px;
	padding: 10px;
}

.tdcancel {
	float: right;
}
</style>


</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>
	
	<div id="all">
		<div id="header">
			<div id="headertitle"><h2>Offer Information</h2></div>
			<div id="headerprogress">here you can look over the details <br></div>
			<hr>
		</div>
		<div id="schedule">
			<div>
				<h3>
					Ride from ${ride.start}
					<c:if test="${ride.dest != ''}">
			 			to ${ride.dest}
					</c:if>
				</h3>
			</div>
			<div id="scheduleleft">
				<p>Pick-up point </p><br>
				<p>Drop-off point </p><br>
				<p>Date </p><br>
			</div>
			<div id="scheduleright">
				<p>${ride.start}, ${ride.pickUpZone}</p><br>
				<p>${ride.dest}, ${ride.dropOffZone}</p><br>
				<p><fmt:formatDate value="${ride.rideDate}" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${ride.rideTime}" type="time"
								pattern="HH:mm" /></p>estimated time of departure<br>
			</div>
			
			<div id="scheduledetails">
				Driver Name: ${driver.firstName} ${driver.lastName} <br>
				<br>
				
				<p>
				<c:if test="${ride.note == ''}">
					The driver hasn't given any further details about this ride.
				</c:if>
				${ride.note}
				</p>
			</div>
			
			
			
			<div id="schedulebottom">
			Departure Date: <fmt:formatDate value="${ride.rideDate}" pattern="yyyy-MM-dd" /><br>
			Departure time: <fmt:formatDate value="${ride.rideTime}" type="time" pattern="HH:mm" /><br>
			Duration: <fmt:formatDate value="${ride.duration}" type="time" pattern="HH:mm" /><br>
      Price: ${ride.price}<br>
      Capacity: ${ride.capacity}<br>
      Number of luggage allowed: ${ride.lugPref}<br>
      ${openings} available seats
			</div>
			
			<input type="hidden" id="ridedata" value="${ride.rideId}" />
			<div class="tddriver tdcancel">
				Cancel Ride
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	
	
	<script>
		$(".tdcancel").click(function() {
			var result = confirm("Are you sure you want to cancel this offer?");
			if (result) {
				var temp = $(this);
				
				$.post("<c:url value='/offerRide/cancelOffer.controller' />", 
						{"ride": $("#ridedata").val()}, 
						function(data, status){
					if (status == 'success') {
			        	location.href = "<c:url value='/website/pages/offerRide/cancelSuccess.jsp' />";
			        }
			    });
			}
		});
	</script>
</body>
</html>