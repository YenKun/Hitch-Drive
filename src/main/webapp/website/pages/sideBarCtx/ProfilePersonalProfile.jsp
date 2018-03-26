<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<script src="<c:url value="/website/js/ProfilePersonalProfile.js"/>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
p{
 font-size:24px;
}
#profForm input {
	width:30%;
}  
input[type="text"]
{
    font-size:24px;
}
input[type="number"]
{
    font-size:24px;
}
#submit
{	
    font-size:24px;
}
input[type="reset"]
{
    font-size:24px;
}
option
{
    font-size:24px;
}
select[name="gender"] 
{	width:30%;  
    font-size:24px;
    height:1em;line-height:30px;
}     
</style>
</head>
<body >
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>


		<div class="profileCtx"
			style="width: 85%; float: left;height:100vh">
			<div class="innerCtx" style="width:95%;margin:0 auto;height:100vh;background-color:white ">
		<div >
			<form id="profForm" >
				<span class="badge badge-success" style="font-size:30px;" >FirstName</span>
				<input class="form-control" id="firstName" type="text" name="firstName" value=""><br>
				<span class="badge badge-success" style="font-size:30px;" >LatstName</span>
				<input class="form-control" id="lastName" type="text" name="lastName" value=""><br>
				<span class="badge badge-success" style="font-size:30px;" >Birth Year</span>
				<div id="birthdiv">
				<input id="birthYear" style="height:50px;" name="birthYear" type="number"  step="1"  /><br>
				</div>
				<span class="badge badge-success" style="font-size:30px;">Gender</span>
				<div id="genderdiv">   
				<select id="gender" class="form-control" style="height:50px;"  name="gender"  >
				<option value="" selected disabled hidden>Gender</option>
				<option value="M">Male
				<option value="F">Female
				<option vlaue="O">Other
				</select>
				</div>
				<span class="badge badge-success" style="font-size:30px;">Country</span>
				<div id="countrydiv">
				<input class="form-control" id="country" type="text" name="country" value=""><br>
				</div>    
				<span class="badge badge-success" style="font-size:30px;" >Phone</span>
				<input class="form-control"  id="phone" type="number" max="9999999999" name="phone" value="">
				<span class="badge badge-success" style="font-size:30px;" >bio</span>
				<input class="form-control" id="bio" type="text" name="bio" value="">
				<br>     
				<input id="submit" class="btn btn-primary" style="width:10%" type="button" value="submit">
				<input class="btn btn-primary" style="width:10%" type="reset" value="clear">   
				</form> 
				<button id="info" class="btn btn-primary">info</button> 
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
			
			var btn = $(".type1:eq(0)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>