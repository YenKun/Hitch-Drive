<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Verifycation</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<h1>駕照上傳</h1>
<form action="<c:url value="/edit/uploadlicense.controller"/>" method="post" enctype="multipart/form-data">
<input type="file" name="licensePhoto" accept="image/*">
<input type="submit" value="確定">
</form>
<form action="<c:url value="/verify/getcode.controller"/>" method="get">
<h1>Email驗證(同Session下)</h1>
<p>請輸入Email</p>
<input type="text" name="email" >
<input type="submit">
</form>
</body>
</html>