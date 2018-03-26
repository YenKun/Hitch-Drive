<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>editCars</title>
<!-- bootstrap 4.x is supported. You can also use the bootstrap css 3.3.x versions -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/piexif.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/purify.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/fileinput.min.js"></script>
<script src="../website/js/editCars.js"></script>
<script type="text/javascript" src="../website/js/datatable.min.js"></script>
<style type="text/css">
#carId{
border:0px;
display:none;
}
#carTable td{
width:5em; 
}
</style>
</head>
<body>
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
				<form id="carform"
					action="<c:url value="/editCar/insertCar.controller"/>"
					method="post">
					<td><input type="text" readonly="readonly" id="carId" name="carId"> </td>
					<td><input type="text" id="carNo" name="carNo" class="form-control"
						placeholder="請輸入車牌號碼"><br></td>
					<td><input type="text" id="carBrand" name="carBrand" class="form-control"
						placeholder="請輸入車輛廠牌"><br></td>
					<td><input type="text" id="carType" name="carType" class="form-control"
						placeholder="請輸入車輛型號"><br></td>
					<td><input type="text" id="color" name="color" class="form-control"
						placeholder="請輸入車輛顏色"><br></td>
					<td>
					<input type="radio" class="form-check-input" id="pcf0" name="pcFriendly" value="0"> 
						<label for="pcf0" class="form-check-label"  >No</label> 
					<input type="radio" class="form-check-input" id="pcf1" name="pcFriendly" value="1" >
						<label for="pcf1" class="form-check-label"  >Yes</label></td>
					<td><input class="btn btn-primary" id="insert" type="submit" value="新增">
						<input class="btn btn-primary" id="update" type="button" value="修改">
					</td>
				</form>
					<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Upload</button>
					<td> 
			</tr>
		</tfoot>
	</table>
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">請上傳行照圖片</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="file-loading">
        <form id="docForm">				
          <input id="input-b9" name="carDocPhoto" multiple type="file">
          </form>	
        </div>
        <div id="kartik-file-errors"></div>
      </div>
      <div class="modal-footer">
        <button id="close" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="save" title="Your custom upload logic">Save</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>