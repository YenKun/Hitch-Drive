<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ride Information</title>

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

#terms {
	padding: 10px;
}

.bookingbtn {
	background-color: #777777;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
    position: relative;
    top: 50%;
    left: 50%;
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
}

.driverinfo {
	border-top: 3px solid gray;
	padding: 10px;
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
			<div id="headertitle"><h2>Ride Information</h2></div>
			<div id="headerprogress">here you can look over the details <br></div>
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
			Departure Date: ${ride.rideDate}<br>
      Departure time: ${ride.rideTime}<br>
      duration: ${ride.duration}<br>
      price: ${ride.price}<br>
      capacity: ${ride.capacity}<br>
      Number of luggage allowed: ${ride.lugPref}<br>
      ${openings} available seats
			</div>
			
			
			
		</div>
		<div id="memberinfo">
			<div id="priceseat">
				
				<p>price per seat: ${ride.price}<br>
				
				${passnum} passengers</p>
				<p><c:forEach var="passenger" items="${passengers}" varStatus="loop">
					${passenger.firstName} ${passenger.lastName}
				</c:forEach></p>
			</div>
			
			
			<div id="terms">
				<button id="reqBook" class="bookingbtn">Request Booking</button>
				
				<form id="formWebATM" method="post" accept-charset="UTF-8"
				 action="https://payment-stage.opay.tw/Cashier/AioCheckOut/V5" target="_blank">
				<div style="display:none">
				MerchantID 商店代號:
				<input type="text" name="MerchantID" value="2000132" /><br />
				
				MerchantTradeNo 商店交易編號: 
				<input type="text" id="tradeNo" name="MerchantTradeNo" value="" /><br />
				
				MerchantTradeDate 商店交易時間: 
				<input type="text" id="date" name="MerchantTradeDate" value="" /><br />
				
				PaymentType 交易類型: 
				<input type="text" name="PaymentType" value="aio" /><br />
				
				TotalAmount 交易金額: 
				<input type="text" id="price" name="TotalAmount" value="${ride.price}" /><br />
				
				TradeDesc 交易描述: 
				<input type="text" id="desc"name="TradeDesc" value="${desc}" /><br />
				
				ItemName 商品名稱: 
				<input type="text" name="ItemName" value="Hitch&Drive" /><br />
				
				ReturnURL 付款完成通知回傳網址: 
				<input type="text" name="ReturnURL" value="https://developers.opay.tw/AioMock/MerchantReturnUrl" /><br />
				
				ChoosePayment 預設付款方式: 
				<input type="text" name="ChoosePayment" value="ALL" /><br />
				
				會員商店代碼: 
				<input type="text" name="StoreID" value="" /><br />
				
				ChooseSubPayment 預設子付款方式: 
				<input type="text" name="ChooseSubPayment" value="" /><br />
				
				ClientBackURL Client端返回廠商網址: 
				<input type="text" name="ClientBackURL" value="https://developers.opay.tw/AioMock/MerchantClientBackUrl" /><br />
				
				CheckMacValue 簽章類型: 
				<input type="text" name="EncryptType" value="1" /><br />
				
				CheckMacValue 檢查碼: 
				<input type="text" id="sha" name="CheckMacValue" value="" /><br />
				</div>
				<div id="bookRide" style="display:none">
				<button type="submit" class="bookingbtn" value="Submit Booking">Submit Booking</button>
				</div>
				</form>
			</div>
			
			<div class="driverinfo">
			${driver.firstName} ${driver.lastName}<br>
			<img class="mphotoicon passImg" alt=""
			src="<c:url value="/Ratings/Photos.controller?Mid=${driver.mid}" />" />
      phone:  <br>
      email verified: <br>
      ${driver.prefDrPet} pets yes<br>
      ${driver.prefDrSmoke} smoking no<br>
      ${driver.prefDrTalk} talking yes<br>
      ${driver.prefDrMusic} music yes<br>
      register date: ${driver.regisDate}<br>
      
      last time logged in: <fmt:formatDate value="${driver.lastLog}" pattern="yyyy-MM-dd" /><br>
      ${driver.ridesOffered} rides offered<br>
      
			</div>
		</div>
	</div>
	
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	
	
	<script>
		$("#reqBook").click(function(){
			$(this).hide();
			$("#bookRide").css("display", "block");
			
			$.get("<c:url value="/oPay.controller"/>", 
					{"rideprice": $("#price").val(),"ridedesc": $("#desc").val()},
					function(datas){

				data = JSON.parse(datas);
				$("#price").val(data.price);
				$("#date").val(data.date);
				$("#tradeNo").val(data.tradeNo);
				$("#desc").val(data.desc);
				$("#sha").val(data.sha);
				$("#bookRide").css("display","block");
			})
			
	
		});
	</script>
</body>
</html>