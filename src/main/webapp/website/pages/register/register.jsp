<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up to Hitch & Drive</title>
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
 
 
 <style type="text/css">
 a{text-decoration:none;
 color:black;
 }
 </style>
 
 
</head>
<body class="animsition">
	<div style="height: 90px">
		<div style="margin: 30px 150px 30px 0"></div>
	</div>



	<div class="resCon">
		<div class="resOpt">How do you want to sign up?</div>
		
		<a href="emailPwd.jsp"><div class="opts">
			<span>Sign up with my email</span><span style="float:right">&rsaquo;</span>
		
		</div></a>
		
		


		<div style="margin-top: 40px">
			Already a member?
			
			<a href="../login.jsp"><span
				style="color: #48a770; margin-left: 10px; cursor: pointer;font-weight: 600">
				Log in</span></a>
		</div>
	</div>


	<script src="<c:url value="/website/js/pageTransition.js"/>"></script>
</body>
</html>