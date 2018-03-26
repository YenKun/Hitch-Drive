<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hitch & Drive</title>
<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<style>
.autocomplete {
	float: left;
	position: relative;
	display: inline-block;
}

.submit {
	float: left;
	position: relative;
	display: inline-block;
}

.autocomplete-items {
	position: absolute;
	border: 1px solid #d4d4d4;
	border-bottom: none;
	border-top: none;
	z-index: 99;
	/*position the autocomplete items to be the same width as the container:*/
	top: 100%;
	left: 0;
	right: 0;
}

.autocomplete-items div {
	font-weight: bold;
	color: dodgerblue;
	padding: 10px;
	cursor: pointer;
	background-color: #fff;
	border-bottom: 1px solid #d4d4d4;
}

.autocomplete-items div:hover {
	/*when hovering an item:*/
	background-color: black;
	color: #ffffff;
}

.autocomplete-active {
	/*when navigating through the items using the arrow keys:*/
	background-color: black !important;
	color: #ffffff;
}

.ui-datepicker {
   background: #EEEEEE;
   border: 1px solid #555555;
   color: #333333;
 }
</style>
</head>
<body>
<!-- <body class="animsition"> -->
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<c:if test="${!empty sessionScope.memberInfo}">
		<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	</c:if>
	<c:if test="${empty sessionScope.memberInfo}">
		<jsp:include page="/website/pages/included/headerLoginFail.jsp"></jsp:include>
	</c:if>
	<!-- Content Start Here -->
	<div class="topImg"></div>
	<div class="topSec">
		<div class="setMid">
			<form class="indexForm" action="<c:url value='/findRide/findRide.controller' />" method="GET">
				<div class="autocomplete">
					<input type="text" name="start" id="start" placeholder="Leaving From..."
						autocomplete="off"></input> <select name="pickUpZone">
						<option>district</option>
					</select>
					<div></div>
				</div>
				<div class="autocomplete">	
					<input type="text" name="dest" id="dest" placeholder="Going to..."
						autocomplete="off"></input> <select name="dropOffZone">
						<option>district</option>
					</select>
					<div></div>
				</div>
				<div class="submit">
					<input type="text" id="datepicker" name="rideDate" placeholder="Departure date..."
						autocomplete="off"></input>
					<input type="submit" class="btn"
						value="Find A Ride">
				</div>
			</form>
		</div>
	</div>
	<div class="slogan">
		<div>Go literally anywhere.</div>
		<div>From anywhere.</div>
	</div>
	<div class="promote">
		<div class="col-4">
			<h2>
				<span>S</span>MART
			</h2>
			<p class="text">With access to millions of journeys, you can
				quickly find people nearby travelling your way.</p>
		</div>
		<div class="col-4">
			<h2>
				<span>S</span>imple
			</h2>
			<p class="text">Select who you want to travel with.</p>
		</div>
		<div class="col-4">
			<h2>
				<span>S</span>eamless
			</h2>
			<p class="text">Get to your exact destination, without the
				hassle. Carpooling cuts out transfers, queues and the waiting around
				the station time.</p>
		</div>
	</div>

	<div class="bestPrices">
		<div class="priceContainer">
			<div class="rideTo">Where do you want a ride to?</div>
			
			<div class="col-4 prices">
				<div class="half">
					<form action="<c:url value='/findRide/rideInfo.controller' />" method="GET">
					<input type="hidden" class="randomid" name="ride"/>
					</form>
					<div class="place">Taipei</div>
					<div class="place">Taichung</div>
				</div>
				<div class="half">
					<div class="singlePrice">
						<span>From</span>NT$100
					</div>
				</div>
			</div>

			<div class="col-4 prices">
				<div class="half">
					<form action="<c:url value='/findRide/rideInfo.controller' />" method="GET">
					<input type="hidden" class="randomid" name="ride"/>
					</form>
					<div class="place">Taipei</div>
					<div class="place">Taichung</div>
				</div>
				<div class="half">
					<div class="singlePrice">
						<span>From</span>NT$100
					</div>
				</div>
			</div>
			
			<div class="col-4 prices">
				<div class="half">
					<form action="<c:url value='/findRide/rideInfo.controller' />" method="GET">
					<input type="hidden" class="randomid" name="ride"/>
					</form>
					<div class="place">Taipei</div>
					<div class="place">Taichung</div>
				</div>
				<div class="half">
					<div class="singlePrice">
						<span>From</span>NT$100
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<!-- Content End Here -->
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value="/website/js/autocompletedatev2.js"/>"></script>
	<script>
		var cityArr = [];
		var distArr = [];
		
		$("input:text").focus(function() { $(this).select(); } );
		
		$.getJSON("<c:url value="/website/res/LocationData/taiwan_both.json"/>",{},
				function(datas){
			$.each(datas,function(city, districtArr){
				cityArr.push(city);
				distArr.push(districtArr);
			})
		})
	
		autocomplete(document.getElementById("start"), cityArr, distArr);
		autocomplete(document.getElementById("dest"), cityArr, distArr);
		
		$(document).ready(function(){
			$.get("<c:url value="/findRide/findRandom.controller"/>",{}, function(data){
				var i = 0;
				
				console.log(data);
				$.each(JSON.parse(data), function(key, ride) {
					var places = $(".place");
					var prices = $(".singlePrice");
					var rideids = $(".randomid");
					places[2*i].innerHTML = ride.start;
					places[(2*i)+1].innerHTML = ride.dest;
					prices[i].innerHTML = "<span>From</span>NT$" + ride.price;
					rideids[i].value = ride.id;
					i = i + 1;
				})
			});
			
			$(".prices").on("click", function() {
				$(this).find("form").submit();
			});
		});
	</script>
</body>
</html>