<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="height:90px">
<div style="margin:30px 150px 30px 0">
<div id="st-trigger-effects" class="floatright">
	<button data-effect="st-effect-11">${memberInfo.firstName}</button>
</div>
<div class="floatright" style="margin-right:100px">
	<a href="<c:url value="/website/pages/findRide/findRide.jsp" />"><button>Find a ride</button></a>
	<a href="<c:url value="/website/pages/offerRide/offerSchedule.jsp" />"><button>Offer a ride</button></a>
<div>
</div>
</div>






</div><!-- /main -->
</div><!-- /st-content-inner -->

