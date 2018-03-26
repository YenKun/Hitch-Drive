<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Password</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/website/css/profileSidebar.css"/>" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="<c:url value="/website/css/password.css"/>">
<script src="<c:url value="/website/js/password.js"/>"></script>

</head>
<body>
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/profileSidebarCtx.jsp"></jsp:include>


	<div class="profileCtx" style="width: 85%; float: left; height: 100vh">
		<div class="innerCtx"
			style="width: 95%; margin: 0 auto; height: 100vh; background-color: white">
			<div id="passdiv">
				<form id="form">
					<p id="msg"> &nbsp;</p>   
					<span class="badge badge-secondary">Current password</span> 
					<input type="password" name="oldPswd" class="form-control"><br>
					<span class="badge badge-secondary">New password</span> 
					<input type="password" name="newPswd1" class="form-control"><br>
					<span class="badge badge-secondary">Confirm new password</span>
					<input type="password" name="newPswd2" class="form-control"><br>
					<input id="submit" class="btn btn-primary btn-lg" type="button" value="save">
					<input class="btn btn-primary btn-lg" type="reset" value="reset">
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

			var btn = $(".type1:eq(10)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>