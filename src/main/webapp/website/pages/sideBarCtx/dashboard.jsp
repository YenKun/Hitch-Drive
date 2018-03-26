<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />

<script src="<c:url value="/website/js/dashboard.js"/>"></script>

<style type="text/css">
#profile {
	float: left;
	width: 40%;
	background-color: white;
	height: 900px;
}

#photo {
	width: 250px;
}

#fName {
	padding-left: 50px;
	margin-top: 30px;
	font-size: 30px;
}

#lName {
	font-size: 30px;
}

#photo {
	width: 80%;
	height: 50%;
	float: left;
}

#div1 {
	float: none;
	font-size: 25px;
	padding-top: 500px;
}

#profdiv {
	background-color: white;
	margin-top: 30px;
	margin-left: 500px;
	width: 100%;
	height: 900px;
}

#prefdiv {
	border-bottom: 2px gray solid;
	border-top: 2px gray solid;
	float: none;
}

#verifydiv span {
	font-size: 40px;
}

#verifydiv {
	border-bottom: 2px gray solid;
}

#history span {
	font-size: 30px;
}

#prefdiv img {
	padding-left: 50px;
}

#namespan {
	padding-left: 50px;
}

#bio {
	color: black;
	padding-bottom: 10px;
}

#member {
	width: 60%;
	height: 100%;
	flaot:left
}

#all {
	width: 70%;
	height: 1000px;
	margin:0 auto
}
</style>
</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>


	<div id="all">
		<div id="profile">
			<div id="rating">
				<h1>Rating</h1>
				<p style="font-weight: bold; font-size: 30px;">
					Average score:&nbsp;<span id="score">/5.0</span>
				</p>
				<p style="font-weight: bold; font-size: 30px;">
					Rating rateReceived:&nbsp;<span id="count"></span>
				</p>
			</div>

			<div id="prefdiv">
				<h1 style="text-align: center;">Preferences</h1>
				<img id="pet" alt="" src=""> <img id="smoke" alt="" src="">
				<img id="music" alt="" src=""> <img id="talk" alt="" src="">
			</div>
			<div id="verifydiv">
				<h1>Verification</h1>
				<img id="eVerify" alt="" src=""> <span
					style="font-weight: bold;">Email</span> <br> <img id="lVerify"
					alt="" src=""> <span style="font-weight: bold;">License</span>
			</div>
			<div id="history">
				<span style="font-weight: bold;">Member since:</span><span
					id="regisDate"></span> <br> <span style="font-weight: bold;">Last
					Log:</span><span id="lastLog"></span>
			</div>
		</div>

		<div id="member">
			<div id="profdiv">
				<img id="photo" alt="photo" src="">
				<div id="div1">
					<span style="font-weight: bold; font-size: 50px; margin-left: 16%">Hello!&nbsp;
					</span><span id="fName" style="font-size: 40px"></span><span id="lName" style="font-size: 40px"></span> <br> <span
						id="agespan"
						style="font-size: 50px; padding-left: auto; font-weight: bold;; margin-left: 16%">Age:&nbsp;</span><span
						id="age" style="font-size: 40px"></span> <br> <span
						style="font-weight: bold; font-size: 50px;">About me:</span>
					<p id="bio"
						style="line-height: 15px; font-size: 24px; margin: auto;"></p>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$(".tb1").addClass("current");
			$(".tb1").removeClass("tb1");
		})
	</script>
</body>
</html>