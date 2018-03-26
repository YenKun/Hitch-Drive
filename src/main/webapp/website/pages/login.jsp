<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in to Hitch & Drive</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/normalize.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/register.css"/>" />
<link rel="Shortcut Icon" type="image/jpeg"
	href="<c:url value="/website/img/icon.jpg"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/animsition.min.css"/>" />
<script src="<c:url value="/website/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/website/js/animsition.min.js"/>"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 
$("#account").on("change",function(){
	 
	var lv = $(this).val();
	if(lv==1){
		$("input[name='email']").val("eeit99121@gmail.com");
		$("input[name='password']").val("Eeit99121");
	}
	else if(lv==2){
		//lv2 licensephoto
		$("input[name='email']").val("eeit99122@gmail.com");
		$("input[name='password']").val("Eeit99122");
	}
	else if(lv==3){
		// lv3 offeride
		$("input[name='email']").val("eeit99124@gmail.com");
		$("input[name='password']").val("Eeit99124");
	}
	else if(lv==4){
		//
		$("input[name='email']").val("eeit99130@gmail.com");
		$("input[name='password']").val("Eeit99130");
	}
	else if(lv==5){
		//
		$("input[name='email']").val("eeit99128@gmail.com");
		$("input[name='password']").val("Eeit99128");
	}
})	
})

</script>


<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}

</style>



</head>


<body>
<!-- <body class="animsition"> -->
	<div style="height: 90px">
		<div style="margin: 30px 150px 30px 0"></div>
	</div>





	<div class="resCon">
		<div class="resOpt">How do you want to log in?</div>

	<a href="#" data-toggle="modal" data-target="#login-modal">	<div class="opts" id=1>
			<span>Use my email</span><span style="float: right">&rsaquo;</span>
		</div></a>

		
			<h4 style="color:red; text-align:center">${errors.loginFail}</h4>
		





<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
					<select id="account">
					<option value="0">Choose Account
					<option value="1">New Member:Lv1
					<option value="2">Trevor
					<option value="3">Jacky
					<option value="4">Patrick
					<option value="5">包
					</select>
				  <form action="<c:url value="/pages/login.controller" />" method="post">
					<input type="text" name="email" placeholder="Email">
					<input type="password" name="password" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					
				  </div>
				</div>
			</div>
		  </div>





	<div style="margin-top: 40px">
			Not a member yet?
			<a href="../pages/register/register.jsp">	<span
				style="color: #48a770; margin-left: 10px; cursor: pointer; font-weight: 600">
				Sign up</span></a>
		</div>
	</div>


	<script src="<c:url value="/website/js/pageTransition.js"/>"></script>
</body>
</html>