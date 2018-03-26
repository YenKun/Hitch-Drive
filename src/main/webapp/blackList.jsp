
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Verified</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jumbotron.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>





<!-- -------------------------------------------------------------------------------- -->

<body>



<jsp:include page="/finalAdmin/partial/header.html" />
	<main role="main" class="container mt-2">
	
	<div class="row">
		<div class="col-lg-3">
			<jsp:include page="/finalAdmin/partial/nav.html" /></div>
		<div class="col-lg-9">


<!---------------------------------------上面是共通頁面----------------------------------------------->


<table id="blockTable" class="table table-bordered"> 

<!-- 下面是表單內容 -->


<thead>


<tr>



	<tr>
		<th>BlackListId</th>
		<th>FromMid</th>
		<th>ToMid</th>
		<th>ReportType</th>
		<th>Content</th>
		<th>isDealed</th>
			
	</tr>
</thead>
			

			<!--表單的內容，以下假資料-------------------------------------------------------->						
			<!--可以看到，前面四個是表單裡面的資料，後面那格塞了兩個東西：編輯和刪除的按鈕-->		
<tbody>



<tr id="1">	
		<td>440000</td>
		<td>02</td>
		<td>88</td>
		<td>Skills</td>
　　		<td><button class="btn btn-info" ><i class="fas fa-edit"></i></button></td>								
		<td><button class="btn btn-info" id="clean1"><i class="fas fa-edit"></i></button></td>
</tr>



<tr id="2">	
		<td>440001</td>
		<td>24</td>
		<td>66</td>
		<td>else</td>
　　		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>								
		<td><button class="btn btn-info" id="clean2"><i class="fas fa-edit"></i></button></td>
</tr>



<tr id="3">	
		<td>440008</td>
		<td>98</td>
		<td>204</td>
		<td>attitude</td>
　　		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>								
		<td><button class="btn btn-info"id="clean3"><i class="fas fa-edit"></i></button></td>
<tr>




<tr id="4">	
		<td>440009</td>
		<td>122</td>
		<td>124</td>
		<td>breach of contract</td>
　　		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>								
		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>
<tr>



<tr id="5">	
		<td>440010</td>
		<td>74</td>
		<td>60</td>
		<td>else</td>
　　		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>								
		<td><button class="btn btn-info"><i class="fas fa-edit"></i></button></td>
<tr>












</tbody>



<!--表單的內容到此結束--------------------------------------------------------------------------------------------->



<tfoot>

						</tfoot>

</table>
<!--中間那個product的表單(table)到這裡結束的----------------------------------------------------->


</div>


</div>

</main>





<!--下面的東西全部都是script語法------------------------------------------------------------------>	

<!--下面的東西全部都是script語法------------------------------------------------------------------>	
<script>


$(document).ready(function() {


$("#blockTable>tbody").on('click','tr>td:nth-child(6)>button',
			
						function() {
	
 
    $(this).parents('tr').remove();
  });

//----------------------------------------------------------------------------------------


$("#1 button:nth-child(1)").on('click',
			
						function() {
								console.log($(this));
											$.confirm({
											    title: 'Content:',
											    content: 'Driver\'s driving skill sucks! Ran the red light in the whole journey.',
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)




//---------------------------------------------------------------------------------------------

$("#2 button:nth-child(1)").on('click',
			
						function() {
								console.log($(this));
											$.confirm({
											    title: 'Content:',
											    content: 'lkadflksf  andflnl  naldkjsfa as dflnj',
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)




//---------------------------------------------------------------------------------------------

$("#3 button:nth-child(1)").on('click',
			
						function() {
								console.log($(this));
											$.confirm({
											    title: 'Content:',
											    content: 'The passenger kept yelling all the way, even if i asked him to stop.',
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)




//---------------------------------------------------------------------------------------------

$("#4 button:nth-child(1)").on('click',
			
						function() {
								console.log($(this));
											$.confirm({
											    title: 'Content:',
											    content: 'Didn\'t arrived on time, didn\'t drop me at the right place.',
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)




//---------------------------------------------------------------------------------------------


$("#5 button:nth-child(1)").on('click',
			
						function() {
								console.log($(this));
											$.confirm({
											    title: 'Content:',
											    content: 'bad',
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)




//---------------------------------------------------------------------------------------------



























})


</script>









</body>
</html>