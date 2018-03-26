<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Car</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/website/css/profileSidebar.css"/>" />
	<script src="<c:url value="/website/js/car.js"/>"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
#carId{
border:0px;
display:none;
}
#carTable button{
width:80px;
height:50px;
background-color:rgb(102, 255, 255);
margin:15px;
}
 #carTable radio{ 
  margin-left:10px 
 }
 #carTable label{ 
 margin-left:10px 
 } 
#carTable td:nth-child(7){
width:100px;
}
#carTable button{
background-color: white;
width:50px;
}
img {
	width:50px;
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
			<h1 id="msg"></h1>
			<table id="carTable" class="table table-bordered">
		<thead>
			<tr>
				<th>
				<th>車牌號碼</th>
				<th>廠牌</th>
				<th>型號</th>
				<th>顏色</th>
				<th>PcF</th>
				<th>管理</th>
				<th>行照</th>
			</tr>
		</thead>
		<tbody></tbody>
		<tfoot id="foot">
			<tr id="formtr">
				<form id="carform">
					<td><input type="text" readonly="readonly" id="carId" name="carId"> </td>
					<td><input type="text" id="carNo" name="carNo" class="form-control"
						><br></td>
					<td><input type="text" id="carBrand" name="carBrand" class="form-control"
						><br></td>
					<td><input type="text" id="carType" name="carType" class="form-control"
						><br></td>
					<td><input type="text" id="color" name="color" class="form-control"
						><br></td>
					<td>
					<div>
					<input type="radio" class="form-check-input" id="pcf0" name="pcFriendly" value="0"> 
						<label for="pcf0" class="form-check-label"  >No</label> 
					</div>
					<div>
					<input type="radio" class="form-check-input" id="pcf1" name="pcFriendly" value="1" >
						<label for="pcf1" class="form-check-label"  >Yes</label></td>
					</div>
					<td><input class="btn btn-primary" id="insert" type="button" value="新增">
						<input class="btn btn-primary" id="update" type="button" value="修改">
					</td>
				</form>
					<td>
					<td> 
			</tr>
		</tfoot>
	</table>
			

			
			
			</div>
		</div>
	</div>

	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$(".tb6").addClass("current");
			$(".tb6").removeClass("tb6");
			
			var btn = $(".type1:eq(4)");
			btn.removeClass("sideBtn");
			btn.removeClass("type1");
			btn.addClass("curBtn");
		})
	</script>
</body>
</html>