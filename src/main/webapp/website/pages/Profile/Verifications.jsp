<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Verifications</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<script src="<c:url value="/website/js/Verification.js"/>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
#verify h1{
	margin:auto;
	text-align:left;
}
#licensediv{
	width:400px;
	height:200px;
}
#emaildiv{
	width:400px;
	height:200px;
	}
#accountdiv{
	width:400px;
	height:200px;
}
#accountdiv>h1>span{
margin-left:20px;
}
</style>
</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>


		<div class="profileCtx"
			style="width: 85%; float: left;height:100vh">
			<div id="verify" class="innerCtx" style="width:95%;margin:0 auto;height:100vh;background-color:white ">
		<div id="div1">
		<div id="licensediv">
			<h1 style="width:800px">License&nbsp;&nbsp;<span></span></h1>
			<form id="licenseForm">
				<input id="licensePhoto" class="form-control" type="file" name="licensePhoto" accept="image/*" style="display:none;">
				<input id="upload" class="btn btn-primary" type="button" value="upload">
			</form>
		</div>	
		
		<div id="emaildiv">
			<h1>Email &nbsp;&nbsp;<span id="emailMsg"></span></h1>
			<form id="emailForm" style="width:800px">			
				<p >Enter your email</p>
				<input id="email" class="form-control"  type="text" name="email" >
				<input id="emailSubmit" class="btn btn-primary"  type="button" value="submit">
			</form>
		</div>
		  
		<div id="accountdiv" >
			<h1 style="width:800px">Account:&nbsp;&nbsp;<span></span></h1>
				<form id="accountForm">
				<input id="account" class="form-control" name="account" type="text">
				<input type="button" class="btn btn-primary" id="accountSubmit" value="確定">
				</form>
		</div>
			
			</div>
		</div>
	</div>


	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$(".tb6").addClass("current");
			$(".tb6").removeClass("tb6");
			
			var btn = $(".type1:eq(3)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>