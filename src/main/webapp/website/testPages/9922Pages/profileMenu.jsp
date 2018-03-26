<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>個人資料</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#profileList{
width:200px;
}
#form{
width:400px;
}
#form span{
font-size:20px;
}</style>
</head>
<body>
<div class="list-group" id="profileList"> 
<a href="<c:url value="/switch/switchPswd.controller"/>" class="list-group-item list-group-item-action active">更改密碼</a>
<a href="<c:url value="/switch/switchEditProf.controller"/>" class="list-group-item list-group-item-action active">編輯個人資料</a>
<a href="<c:url value="/switch/switchPref.controller"/>" class="list-group-item list-group-item-action active">設定搭乘喜好</a>
<a href="<c:url value="/switch/switchEditCars.controller"/>"  class="list-group-item list-group-item-action active">編輯車輛</a>
<a href="<c:url value="/switch/switchVerification.controller"/>"  class="list-group-item list-group-item-action active">身分驗證</a>

</div>
</body>
</html>