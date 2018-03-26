<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rides History</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<style>
.rbBtn{
	border:2px solid;
	text-align: center;
	font-size:18px;
	border-radius: 20px;
	margin-top: 15px;
	font-weight: 600;
	color:#48a770;
	border-color:#48a770;
}
.rbBtn:hover{
	background-color: #48a770;
	color:#FFF;
	cursor: pointer;
}
.passenger{
float:left;
width:50%;
}
.passImg{
width:30px;
height:30px;
border-radius: 50%;
display:block;
margin:10px auto;
}
.passSec{
float:left;
width:20%;
height:100px;
padding-right:5px;
}
.passName{
width:50%;
margin:0 auto;
font-size: 18px;
font-weight:600;
}

</style>

<!-- ====================Rating================================= -->

<link rel="stylesheet" href="<c:url value='/website/css/chat/ContactsList.css'/>">

<script src="<c:url value='/website/js/rate/RateForm.js'/>"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<!-- ====================Rating================================= -->

	
</head>
<body>
<!-- <body class="animsition"> -->
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>


	<div class="profileCtx" style="width: 85%; float: left; height: 100vh">
		<div class="innerCtx"
			style="width: 95%; margin: 0 auto; height: 110vh; background-color: transparent">
			<!-- Content Start Here -->
			<ul>
				<c:set var="count" value="0" />
				<c:forEach var="passengers" items="${totalPass}">
				<li style="padding: 20px 0;border-bottom:3px solid #d9b300">
					<div class="rideHisRow" style="width: 100%; height: 100px;">
						<input type="hidden" class="rideid" name="rideId" value="${rides[count].rideId}" />
						<div
							style="float:left; width: 20%; background-color:#c2c287; height: 100px; padding: 0 10px;">
							<div
								style="float: left; height: 50px; width: 100%; text-align: left; line-height: 50px; font-size: 18px; font-weight: 600; color: #444">
								${rides[count].start}</div>
							<div
								style="float: right; height: 50px; width: 100%; text-align: right; line-height: 50px; font-size: 18px; font-weight: 600; color: #444">
								${rides[count].dest}</div>
						</div>
						<div
							style="float:left; width: 8%; background-color:		#d6d6ad; height: 100px;line-height: 100px;text-align: center;font-weight: 600">
							${rides[count].price}
						</div>
						<div style="float:left; width: 70%; background-color:	#e8e8d0; height: 100px">
						

							<div class="passSec" style="border:2px solid #467500;">
								<div class="passenger">
									<img style="heigth:24px" alt="" src="<c:url value="/Ratings/Photos.controller?Mid=${drivers[count].mid}" />" class="passImg">
									<div class="passName">${drivers[count].firstName}</div>
								</div>
								<div class="passenger">
									<input type="hidden" class="memberid" name="memberid" value="${drivers[count].mid}" />
<!-- 									<div class="rbBtn rateBtn">Rate</div> -->
<!-- 									<div class="rbBtn Black">Black</div> -->
								</div>
							</div>
							
						<c:forEach var="passenger" items="${passengers}">
							<div class="passSec">
								<div class="passenger">
									<img alt="" src="<c:url value="/Ratings/Photos.controller?Mid=${passenger.mid}" />" class="passImg">
									<div class="passName">${passenger.firstName}</div>
								</div>
								<div class="passenger">
									<input type="hidden" class="memberid" name="memberid" value="${passenger.mid}" />
									<div class="rbBtn rateBtn">Rate</div>
									<div class="rbBtn Black">Black</div>
								</div>
							</div>
						</c:forEach>
						
						</div>
					<c:set var="count" value="${count+1}" />
					<!-- ==== RatingForm放置處 ==== -->
										
					<div id="RatingsForm" style="float:left;width:100%">
					</div>
					
					</div>
				</li>

				</c:forEach>			
			</ul>

		</div>
	</div>
	</div>

	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$(".tb6").addClass("current");
			$(".tb6").removeClass("tb6");

			var btn = $(".type1:eq(8)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
			
			$(".Black").click(function() {
				let temp = $(this);
				/* var form2 = new FormData($("#Bla")); */		
				$.confirm({
					 title: 'Blacklist',
				    content: '' +
				    '<form action="" class="formName">' +
				    '<div class="form-group">' +
				    'reportType :'+
				    '<br>'+
				    '<br>'+
				    '<input type="radio" name="reportType" value="1">'+' '+'Skills'+' '+
				    '<input type="radio" name="reportType" value="2">'+' '+'Attitude'+' '+
				    '<input type="radio" name="reportType" value="3">'+' '+'Breach of contract'+' '+
				    '<input type="radio" name="reportType" value="4">'+' '+'Else'+' '+		    
				    '<br>'+
				    '<br>'+
				    'content :'+
				    '<br>'+
				    '<br>'+
				    '<textarea rows="10" cols="70" name="content" value="${param.content}">'+
				    '</textarea>'+
				    '</div>' +
				    '</form>',
				    boxWidth: '800px',
				    useBootstrap: false,
				    theme:'dark',
				    buttons: {
				    	confirm: function () {
				    		temp.css("visibility","hidden");
	            
			        },
				    cancel: function () {
			            //close
			        },
				    },
				    onContentReady: function () {
				        // bind to events
				        var jc = this;
				        this.$content.find('form').on('submit', function (e) {
				            // if the user submits the form by pressing enter in the field.
				            e.preventDefault();
				            jc.$$formSubmit.trigger('click'); // reference the button and click it
				        });
				    }
				});
				    
			})
		})

	</script>
</body>
</html>