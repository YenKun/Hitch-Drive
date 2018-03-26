<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RatingReceived</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
	
<!-- Rating -->
<link rel="stylesheet" href="/iHitch/website/css/chat/ContactsList.css">

<script type="text/javascript">
//====================Rating=================================
$(function(){
	
	init();

	function init() {
		getRatingReceived();
	}

	function getRatingReceived() {
		$.get("/iHitch/Ratings/Received/.controller",function(data) {
			console.log(data);
			if ( data.rates.length == 0 ) {
				$("#RatingsReceived").append("You haven't received any ratings from other members");
			} else {
				showRatingLeft(data);
			}
		},"json")
	}

	function showRatingLeft(data) {

		var members = data.memberInfos;
		var rates = data.rates;
	
		var docFrag = $(document.createDocumentFragment());
		var contextPath = "/" + $(location).attr('pathname').split("/")[1];
	
		for (var i = 0, rMax = rates.length; i < rMax; i++) { 
		
			//Rating外框
			var ratingRow = $("<div></div>");
				ratingRow.addClass("container");
		
			//Rating對象Id
			ratingRow.append($("<span style='display:none'>" + rates[i].toMid + "</span>"));
		
			//Rating對象頭像
			var targetPhoto = $("<img></img>");
				targetPhoto.attr("src", contextPath +"/Ratings/Photos.controller?Mid="+ rates[i].toMid)	
				.css({height:"60px"})
		
			//Rating對象姓名
			var targetName = $("<span></span>");
				targetName.text( members[i].firstName + " " + members[i].lastName );
			
			//Rating評分
			var stars = $("<div></div>");
			for (var s = 0, sMax = rates[i].star; s < 5; s++) {
				var star = $("<img/>");
				star.attr("src", "/iHitch/website/img/rate/star.gif").prop("draggable", "false").css({margin:"5px 0px", "float":"none",width:"30px"});
				if(s < sMax){
					star.css({"-webkit-filter": "grayscale(0)"});
				}else{
					star.css({"-webkit-filter": "grayscale(1)"});
				}
				stars.append(star);
			}
			
			//Rating評語
			var comment = $("<div></div>");
			comment.text(rates[i].comment);
			
			//Rating日期與時間
			var date = new Date(rates[i].rateDate);
			var time = $("<span></span>")
				time.addClass("time-right").text(date.toLocaleString());	
		
			ratingRow.append(targetPhoto,targetName,stars,comment,time);
			docFrag.append(ratingRow);
		}
		$("#RatingsReceived").append(docFrag);
	}
	
})
//====================Rating=================================
</script>

</head>
<body>
<!-- <body class="animsition"> -->
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>


		<div class="profileCtx"
			style="width: 85%; float: left;height:100vh">
			<div class="innerCtx" style="width:95%;margin:0 auto;height:100vh;background-color:transparent">
			<!-- Content Start Here -->
			<!-- Remember to change the background-color -->
				<!-- ==== ChatContacts放置處 ==== -->
				<div id="RatingsReceived">
				</div>

			</div>
		</div>


	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$(".tb6").addClass("current");
			$(".tb6").removeClass("tb6");
			
			var btn = $(".type1:eq(6)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>