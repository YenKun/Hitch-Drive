<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Preferences</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" /> 
<script type="text/javascript" src="<c:url value="/website/js/Preferences.js"/>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<style type="text/css"> 
#prefForm input[type="radio"]{ 
 display:none;
 }    
#drDiv{
width:50%;
float:left;    
}   
#paDiv{
width:50%;
float:left;  
}
#prefForm{
height:750px;
}
p{ 
text-align:center;
font-size:30px;
}
img{
margin-left:20%;  
}
#submit{
text-align:center;
margin-left:40%; 
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
			<div class="innerCtx" style="width:95%;margin:0 auto;height:100vh;background-color:white ">
			
			
<div id="form">
	<form id="prefForm"> 
		<div id="paDiv">
			<h1  >Passenger</h1>
				<div  class="form-check form-check-inline"> 
				<p>Pet</p>
				<span >     
					<input type="radio" class="form-check-input" id="pet1" name="prefPaPet" value="1">
					<label for="pet1" class="form-check-label" ><img alt="" src="../../img/petNo.png"></label>
				</span>
				<span >
					<input type="radio" class="form-check-input" id="pet2" name="prefPaPet" value="2">
					<label for="pet2" class="form-check-label"><img alt="" src="../../img/pet.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="pet3" name="prefPaPet" value="3">   
					<label for="pet3" class="form-check-label"><img alt="" src="../../img/petYes.png"></label> 
				</span>
				</div>

				<div class="form-check form-check-inline">
				<p>Smoke</p>   
				<span>  
					<input type="radio" class="form-check-input" id="smoke1" name="prefPaSmoke" value="1">
					<label for="smoke1" class="form-check-label" ><img alt="" src="../../img/smokeNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="smoke2" name="prefPaSmoke" value="2">
					<label for="smoke2" class="form-check-label"><img alt="" src="../../img/smoke.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="smoke3" name="prefPaSmoke" value="3">   
					<label for="smoke3" class="form-check-label"><img alt="" src="../../img/smokeYes.png"></label> 
				</span>
				</div>

				<div class="form-check form-check-inline">
				<p>Music</p>  
				<span>
					<input type="radio" class="form-check-input" id="music1" name="prefPaMusic" value="1">
					<label for="music1" class="form-check-label" ><img alt="" src="../../img/musicNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="music2" name="prefPaMusic" value="2">
					<label for="music2" class="form-check-label"><img alt="" src="../../img/music.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="music3" name="prefPaMusic" value="3">   
					<label for="music3" class="form-check-label"><img alt="" src="../../img/musicYes.png"></label> 
				</span>
				</div>
				
				<div class="form-check form-check-inline">
				<p>Talk</p>  
				<span>
					<input type="radio" class="form-check-input" id="talk1" name="prefPaTalk" value="1">
					<label for="talk1" class="form-check-label" ><img alt="" src="../../img/talkNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="talk2" name="prefPaTalk" value="2">
					<label for="talk2" class="form-check-label"><img alt="" src="../../img/talk.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="talk3" name="prefPaTalk" value="3">   
					<label for="talk3" class="form-check-label"><img alt="" src="../../img/talkYes.png"></label> 
				</span>
				</div>
		</div>


		<div id="drDiv">
			<h1>Driver</h1>
				<div class="form-check form-check-inline">
				<p>Pet</p>  
				<span>
					<input type="radio" class="form-check-input" id="pet4" name="prefDrPet" value="1">
					<label for="pet4" class="form-check-label" ><img alt="" src="../../img/petNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="pet5" name="prefDrPet" value="2">
					<label for="pet5" class="form-check-label"><img alt="" src="../../img/pet.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="pet6" name="prefDrPet" value="3">   
					<label for="pet6" class="form-check-label"><img alt="" src="../../img/petYes.png"></label> 
				</span>
				</div>

				<div class="form-check form-check-inline">
				<p>Smoke</p>  
				<span>
					<input type="radio" class="form-check-input" id="smoke4" name="prefDrSmoke" value="1">
					<label for="smoke4" class="form-check-label" ><img alt="" src="../../img/smokeNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="smoke5"  name="prefDrSmoke" value="2">
					<label for="smoke5" class="form-check-label"><img alt="" src="../../img/smoke.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="smoke6" name="prefDrSmoke" value="3">   
					<label for="smoke6" class="form-check-label"><img alt="" src="../../img/smokeYes.png"></label> 
				</span>
				</div>
				
				<div class="form-check form-check-inline">
				<p>Music</p>  
				<span>
					<input type="radio" class="form-check-input" id="music4" name="prefDrMusic" value="1">
					<label for="music4" class="form-check-label" ><img alt="" src="../../img/musicNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="music5" name="prefDrMusic" value="2">
					<label for="music5" class="form-check-label"><img alt="" src="../../img/music.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="music6" name="prefDrMusic" value="3">   
					<label for="music6" class="form-check-label"><img alt="" src="../../img/musicYes.png"></label> 
				</span>
				</div>
				
				<div class="form-check form-check-inline">
				<p>Talk</p>  
				<span>
					<input type="radio" class="form-check-input" id="talk4" name="prefDrTalk" value="1">
					<label for="talk4" class="form-check-label" ><img alt="" src="../../img/talkNo.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="talk5" name="prefDrTalk" value="2">
					<label for="talk5" class="form-check-label"><img alt="" src="../../img/talk.png"></label>
				</span>
				<span>
					<input type="radio" class="form-check-input" id="talk6" name="prefDrTalk" value="3">   
					<label for="talk6" class="form-check-label"><img alt="" src="../../img/talkYes.png"></label> 
				</span>
				</div>
		</div>    
	</form>
	<div>
	<input id="submit" class="btn btn-primary" type="button" value="確定">
	</div>
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
			
			var btn = $(".type1:eq(2)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>