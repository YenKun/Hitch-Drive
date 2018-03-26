<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搭乘喜好設定</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#form{
width:400px;
}
#form span{
font-size:20px;
}</style>
</head>
<body>
<div id="form">
<form action="<c:url value="/edit/editPref.controller"/>" method="post"> 
<h1>乘客</h1>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">寵物</span>  
<input type="radio" class="form-check-input" id="pet1" name="prefPaPet" value="1">
<label for="pet1" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="pet2" name="prefPaPet" value="2">
<label for="pet2" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="pet3" name="prefPaPet" value="3">   
<label for="pet3" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">吸菸</span>  
<input type="radio" class="form-check-input" id="smoke1" name="prefPaSmoke" value="1">
<label for="smoke1" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="smoke2" name="prefPaSmoke" value="2">
<label for="smoke2" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="smoke3" name="prefPaSmoke" value="3">   
<label for="smoke3" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">音樂</span>  
<input type="radio" class="form-check-input" id="music1" name="prefPaMusic" value="1">
<label for="music1" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="music2" name="prefPaMusic" value="2">
<label for="music2" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="music3" name="prefPaMusic" value="3">   
<label for="music3" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">聊天</span>  
<input type="radio" class="form-check-input" id="talk1" name="prefPaTalk" value="1">
<label for="talk1" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="talk2" name="prefPaTalk" value="2">
<label for="talk2" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="talk3" name="prefPaTalk" value="3">   
<label for="talk3" class="form-check-label">接受</label> 
</div>
<h1>司機</h1>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">寵物</span>  
<input type="radio" class="form-check-input" id="pet4" name="prefDrPet" value="1">
<label for="pet4" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="pet5" name="prefDrPet" value="2">
<label for="pet5" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="pet6" name="prefDrPet" value="3">   
<label for="pet6" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">吸菸</span>  
<input type="radio" class="form-check-input" id="smoke4" name="prefDrSmoke" value="1">
<label for="smoke4" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="smoke5"  name="prefDrSmoke" value="2">
<label for="smoke5" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="smoke6" name="prefDrSmoke" value="3">   
<label for="smoke6" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">音樂</span>  
<input type="radio" class="form-check-input" id="music4" name="prefDrMusic" value="1">
<label for="music4" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="music5" name="prefDrMusic" value="2">
<label for="music5" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="music6" name="prefDrMusic" value="3">   
<label for="music6" class="form-check-label">接受</label> 
</div>
<div class="form-check form-check-inline">
<span class="badge badge-secondary">聊天</span>  
<input type="radio" class="form-check-input" id="talk4" name="prefDrTalk" value="1">
<label for="talk4" class="form-check-label" >不接受</label>
<input type="radio" class="form-check-input" id="talk5" name="prefDrTalk" value="2">
<label for="talk5" class="form-check-label">普通</label>
<input type="radio" class="form-check-input" id="talk6" name="prefDrTalk" value="3">   
<label for="talk6" class="form-check-label">接受</label> 
</div>
<br> 
<input class="btn btn-primary" type="submit" value="確定">
</form>
</div>
</body>
</html>