<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Ride Offers</title>
<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">

<link rel="stylesheet" href="<c:url value="/website/css/displaylist/displayfound.css"/>">

<style>

</style>

</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>
	<div id="all">
		<div id="schedule">
			<div class="listheader">
				<h3>
					Your current active offers
				</h3>
			</div>
			<table>
				<thead>
					<c:if test="${not empty rides}">
					<form action="<c:url value='/offerRide/myOffers.controller' />" method="GET">
					<input type="hidden" value="${start}" name="start">
					<input type="hidden" value="${dest}" name="dest">
					<input type="hidden" value="${pickUpZone}" name="pickUpZone">
					<input type="hidden" value="${dropOffZone}" name="dropOffZone">
					<input type="hidden" value="time" name="sortby">
					<input type="submit" class="sort btn" value="sort by time">
					</form>
					<form action="<c:url value='/offerRide/myOffers.controller' />" method="GET">
					<input type="hidden" value="${start}" name="start">
					<input type="hidden" value="${dest}" name="dest">
					<input type="hidden" value="${pickUpZone}" name="pickUpZone">
					<input type="hidden" value="${dropOffZone}" name="dropOffZone">
					<input type="hidden" value="price" name="sortby">
					<input type="submit" class="sort btn" value="sort by price">
					</form>
					</c:if>
				</thead>
				<tbody>
					<c:if test="${empty rides}">
						<br><br><h1>You currently are not offering any rides</h1>
					</c:if>
					<c:forEach var="ride" items="${rides}" varStatus="loop">
						<c:url value="/findRide/offerInfo.controller" var="path">
							<c:param name="ride" value="${ride.rideId}" />
						</c:url>
						<tr>
							<td class="tdride" ridedata="${ride.rideId}" >
								<a href="${path}"><div class="left">
									<fmt:formatDate value="${ride.rideDate}" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${ride.rideTime}" type="time"
										pattern="HH:mm" />
									<br> ${ride.start} -> ${ride.dest}<br> &#9672
									${ride.start}, ${ride.pickUpZone}<br> &#9672
									${ride.dest}, ${ride.dropOffZone}
								</div>
								<div class="right">
									NT$ ${ride.price} per passenger<br> <br>
									${ride.capacity} available seats
								</div>
								</a>
							</td>
							<td class="tddriver tdcancel">
								<div>
									Cancel Ride
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	
	<script>
		$(document).ready(function(){
			$(".tb2").addClass("current");
			$(".tb2").removeClass("tb2");
		})
		
		$(".tdcancel").click(function() {
			var result = confirm("Are you sure you want to cancel this offer?");
			if (result) {
				var temp = $(this);
				
				$.post("<c:url value='/offerRide/cancelOffer.controller' />", 
						{"ride": $(temp).prev().attr("ridedata")}, 
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