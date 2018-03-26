<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Offer Ride Details</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
	
<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/website/css/findoffer/offermap.css"/>">

<style>


</style>

</head>
<body class="animsition">
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<c:if test="${!empty sessionScope.memberInfo}">
		<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.memberInfo}">
		<jsp:include page="/website/pages/included/headerLoginFail.jsp"></jsp:include>
	</c:if>
	
<div class="container">
	<div class="all-33">
		<div id="header">
			<div id="headertitle">Offer a Ride on your next journey</div>
		</div>
		<div id="resulterror">
			Schedule your offer
		</div>
		
		<hr class="major" />
		
		<form action="<c:url value='/offerRide/offerDetails.controller' />"
			method="POST" name="offerDetailsForm">
		<div id="col1">
			<div class="autocomplete">
				<div class="field">price: <span>$NT</span>
				<input type="number" id="pricefd" name="price">
				<br>The lower the price, the easier it is to fill seats.
				</div>
				<br> <br>
			</div>
			
			<div class="autocomplete">
				<div class="field">Maximum number of seats offered: 
				<select id="capacity" name="capacity">
					<c:forEach var="i" begin="1" end="4">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 
				</div>
				<br> <br>
			</div>
			
			<div class="autocomplete">
				<div class="field">Ride Details</div>
				<div>
					<textarea cols="60" rows="6" id="notes" name="note"></textarea>
					<div class="field-rd">
						Do not give out personal information here. 
						Flexible about where and when to meet? 
						Have any information that passengers should know? 
						Preferences and details about the ride go here.
					</div>
				</div>
			</div>
			<br><hr><br>
			<div class="autocomplete">
				<div class="field">Car: </div>
					<select id="pickCar" name="carId">
						<c:forEach var="car" items="${cars}">
							<option value="${car.carId}">${car.carType}</option>
						</c:forEach>
					</select>
				<br> <br> 
				<div class="field">luggage preference: </div>
				<select id="luggage" name="lugPref">
					<c:forEach var="i" begin="0" end="2">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 
			</div>
			<br><br>
			<hr>
			<div class="autocomplete terms">
				<br> <br> <input type="checkbox" required name="accept"
					value="accepted"> I accept the Terms&Conditions and
				Privacy Policy, <br> and certify that I hold a driving
				license and have valid car insurance.<br> <br> <br>
			</div>
			
		</div>
		
		<div id="col2">
			<div class="summarytitle">My Ride Summary</div>
			<br>
			<div id="map"></div>
			<br>
			<div class="summaryfields">
				<p>Pick-up time: </p><br>
				Distance: <br>
				Driving time: <br>
			</div>
			<div class="summarytext">
				<p><fmt:formatDate value="${sessionScope.rideDate}" type="date" dateStyle = "long" />
				&nbsp;-&nbsp;<fmt:formatDate value="${sessionScope.time}" type="time" pattern="H:mm" /></p>
				<br>
			</div>
			
			
			<input type="hidden" id="start" value="${sessionScope.start}">
			<input type="hidden" id="pickUpZone"
				value="${sessionScope.pickUpZone}"> <input type="hidden"
				id="dest" value="${sessionScope.dest}"> <input type="hidden"
				id="dropOffZone" value="${sessionScope.dropOffZone}">
		</div>
		
		<div class="submit">
			<input type="submit" class="btn" id="submit" value="Offer the Ride">
		</div>
		</form>
		
		
	</div>
</div>


	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		var map, delayCalc;
		var start = $("#start").val();
		var end = $("#dest").val();
		var pick = $("#pickUpZone").val();
		var drop = $("#dropOffZone").val();
		var origin1 = [];
		var destinationA = [];
		origin1[0] = start;
		destinationA[0] = end;
		var baseprice = 0;
		
		if (pick != "district") {
			start += ", " + pick;
		}
		if (drop != "district") {
			end += ", " + drop;
		}

		$("#submit").click(function(e) {
			var result = confirm("Are you sure the information is all correct? \n" + 
					"The offer information cannot be modified once it is posted.");
			if (!result) {
				e.preventDefault();
			}
		});
		
		$("input:text").focus(function() {
			$(this).select();
		});
		
		$("#pricefd").on("change", function() {
			
			if ($(this).val() < 0) {
				$(this).val(0);
			}
			if ($(this).val() > baseprice+40) {
				$(this).val(baseprice + 40);
			}
			if ($(this).val() < baseprice-40) {
				$(this).val(baseprice - 40);
			}
		});

		function initMap() {
			var directionsService = new google.maps.DirectionsService();
			var directionsDisplay = new google.maps.DirectionsRenderer();
			var distService = new google.maps.DistanceMatrixService();

			var initpos = {
				lat : 25.032,
				lng : 121.52
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 8,
				center : initpos,
			    disableDefaultUI: true
			});
			directionsDisplay.setMap(map);
			calcRoute(directionsService, directionsDisplay);
			distService.getDistanceMatrix({
				origins : origin1,
				destinations : destinationA,
				travelMode : 'DRIVING',
				unitSystem : google.maps.UnitSystem.METRIC,
				avoidHighways : false,
				avoidTolls : false,
			}, callbackfn);
		}

		function calcRoute(directionsService, directionsDisplay) {
			var request = {
				origin : start,
				destination : end,
				travelMode : 'DRIVING'
			};
			directionsService.route(request, function(result, status) {
				if (status == 'OK') {
					directionsDisplay.setDirections(result);
				}
			});
		}
		
		function callbackfn(response, status) {
			if (status == 'OK') {
				var origins = response.originAddresses;
				var destinations = response.destinationAddresses;

				for (var i = 0; i < origins.length; i++) {
					var results = response.rows[i].elements;
					for (var j = 0; j < results.length; j++) {
						var element = results[j];
						var distance = element.distance.text;
						var duration = element.duration.text;
						var from = origins[i];
						var to = destinations[j];
						$(".summarytext").append(distance +
								"<br>" + duration);
						price = parseInt(distance);
						$("input[type='number']").attr("min", (price-40));
						$("input[type='number']").attr("max", (price+40));
						$("input[type='number']").attr("value", (price));
						
						baseprice = price;
					}
				}
			}
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDeuimzXA3BTt4WxyjtIhXxNIIuVxPHyY&callback=initMap">
		
	</script>
</body>
</html>