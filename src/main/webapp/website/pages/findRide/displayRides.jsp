<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rides from ${origin}</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<c:url value="/website/css/displaylist/displayfound.css"/>">

<style>

</style>

</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<div id="all">
		<div id="schedule">
			<div>
				<h3>
					<c:if test="${empty rides}">
					Sorry, there are no  
					</c:if>
					Rides from ${start}
					<c:if test="${dest != ''}">
			 			to ${dest}
					</c:if>
				</h3>
			</div>
			<table>
				<thead>
					<c:if test="${not empty rides}">
					<form action="<c:url value='/findRide/sortRides.controller' />" method="GET">
					<input type="hidden" value="${start}" name="start">
					<input type="hidden" value="${dest}" name="dest">
					<input type="hidden" value="${pickUpZone}" name="pickUpZone">
					<input type="hidden" value="${dropOffZone}" name="dropOffZone">
					<input type="hidden" value="time" name="sortby">
					<input class="sort btn" type="submit" value="sort by time">
					</form>
					<form action="<c:url value='/findRide/sortRides.controller' />" method="GET">
					<input type="hidden" value="${start}" name="start">
					<input type="hidden" value="${dest}" name="dest">
					<input type="hidden" value="${pickUpZone}" name="pickUpZone">
					<input type="hidden" value="${dropOffZone}" name="dropOffZone">
					<input type="hidden" value="price" name="sortby">
					<input class="sort btn" type="submit" value="sort by price">
					</form>
					</c:if>
				</thead>
				<tbody>
					<c:set var="count" value="0" />
					<c:forEach var="ride" items="${rides}" varStatus="loop">
						<c:url value="/findRide/rideInfo.controller" var="path">
							<c:param name="ride" value="${ride.rideId}" />
						</c:url>
						<tr>
							<td class="tddriver">
							<a href="${path}">
								<c:out value="${members[count].firstName} " />
								<c:out value="${members[count].lastName}" /><br>
								<c:if test="${empty members[count].photo}">
								<img class="mphotoicon passImg" alt="" src="<c:url value="/website/img/nomphotoid.jpg" />" />
								</c:if>
								<img class="mphotoicon passImg" alt="" src="<c:url value="/Ratings/Photos.controller?Mid=${members[count].mid}" />" />	
							</a></td>
							<td class="tdride"><a href="${path}">
									<div class="left">
										<fmt:formatDate value="${ride.rideDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${ride.rideTime}" type="time"
											pattern="HH:mm" />
										<br> ${ride.start} -> ${ride.dest}<br> &#9672
										${ride.start}, ${ride.pickUpZone}<br> &#9672
										${ride.dest}, ${ride.dropOffZone}
									</div>
									<div class="right">
										NT$ ${ride.price} per passenger<br>
										<br> ${ride.capacity} available seats
									</div>
							</a></td>
						</tr>
						<c:set var="count" value="${count + 1}" />
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
</body>
</html>