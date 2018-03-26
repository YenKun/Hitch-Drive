<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>變更密碼</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit").on("click",function(){
		var datas = JSON.stringify($("#form").serializeObject());   
		console.log(datas)
		$.ajax({
			 	url: "/iHitch/edit/changePswd.controller",
			    method: 'put',
			    data:datas,
			    datatype: "json",
			    contentType:'application/json',
			    success: function(data)
			    {	console.log(data);
			    	},
			 	error:function(data){
			 		alert("Edit fail");
			 	}
			  });
	});
	
	
	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
	
})
</script>
<style type="text/css">
#form{
width:400px;
}
#form span{
font-size:20px;
}</style>
</head>
<body>
<div>
<form id="form">
<span class="badge badge-secondary">請輸入舊密碼</span>
<input type="password" name="oldPswd" class="form-control">
<br>
<span class="badge badge-secondary">請輸入新密碼</span>
<input type="password" name="newPswd1" class="form-control">
<br>
<span class="badge badge-secondary">請再輸入一次新密碼</span>
<input type="password" name="newPswd2" class="form-control">
<br>
<input id="submit" class="btn btn-primary" type="button" value="確定">
<input class="btn btn-primary" type="reset" value="清除">
</form>
</div>
</body>
</html>