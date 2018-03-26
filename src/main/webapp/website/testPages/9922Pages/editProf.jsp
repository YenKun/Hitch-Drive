<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯個人資料</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../website/js/editProf.js">
</script>
<style type="text/css">
#form{
width:400px;
}
#form span{
font-size:20px;
}
#imgdiv{
width:100px;
height:100px;
}
#imgdiv img{
width:100%;
height:100%;
}
</style>
</head>
<body>
<br>
<div id="imgdiv"><img id="MemberPhoto" src="" /></div>

<form id="profForm" >
<span class="badge badge-secondary" >FirstName</span>
<input class="form-control" id="firstName" type="text" name="firstName" value=""><br>
<span class="badge badge-secondary" >LatstName</span>
<input class="form-control" id="lastName" type="text" name="lastName" value=""><br>
<span class="badge badge-secondary" >出生年</span>
<!-- <input type="date" name="birthYear" ><br> -->
<input id="birthYear" name="birthYear" type="number"  step="1"  /><br>
<span class="badge badge-secondary">性別</span>
<select class="form-control" name="gender"  >
<option value="" selected disabled hidden>
請選擇</option>
<option value="M">男性
<option value="F">女性
<option vlaue="O">其他
</select>
<br>
<p>
<span class="badge badge-secondary">國家</span>
<input class="form-control" id="country" type="text" name="country" value=""><br>
<span class="badge badge-secondary" >手機</span>
<input class="form-control" id="phone" type="text" name="phone" value="">
<span class="badge badge-secondary" >bio</span>
<input class="form-control" id="bio" type="text" name="bio" value="">
<br>
<input id="submit" class="btn btn-primary" type="button" value="確定">
<input class="btn btn-primary" type="reset" value="清除">
</form>
<form action="<c:url value="/edit/editPhoto.controller"/>" method="post" enctype="multipart/form-data">
<input type="file" name="file" accept="image/*">
<input class="btn btn-primary" id="updatePhoto" type="submit" value="確定">
<br>
</form>


</body>
</html>