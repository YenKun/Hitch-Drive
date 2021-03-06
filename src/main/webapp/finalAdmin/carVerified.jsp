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



<body>
<jsp:include page="partial/header.html" />
	<main role="main" class="container mt-2">
	
	<div class="row">
		<div class="col-lg-3">
			<jsp:include page="partial/nav.html" /></div>
		<div class="col-lg-9">
<!---------------------------------------上面是共通頁面----------------------------------------------->


<table id="veifiedTable" class="table table-bordered"> 

<!-- 下面是表單內容 -->


<thead>


<tr>



	<tr>
		<th>MemberId</th>
		<th>CarId</th>
		<th>CarNo</th>
		<th>CarPhoto</th>
		<th>CarVerified</th>
	
	</tr>
</thead>
			

			<!--表單的內容，以下假資料-------------------------------------------------------->						
			<!--可以看到，前面四個是表單裡面的資料，後面那格塞了兩個東西：編輯和刪除的按鈕-->		
<tbody>

<tr>




								<td>888</td>
								<td>1</td>
								<td></td>
								<td><button class="btn btn-info"><!--修改用的-->
										<i class="fas fa-edit"></i>
									</button></td>								
								<td>
									<button class="btn btn-info"><!--修改用的-->
										<i class="fas fa-edit"></i>
									</button>
								</td>
							</tr>
</tbody>



<!--表單的內容到此結束--------------------------------------------------------------------------------------------->



<tfoot>

						</tfoot>

</table>
<!--中間那個product的表單(table)到這裡結束的----------------------------------------------------->


</div>


</div>
</div>
</main>


<!--下面的東西全部都是script語法------------------------------------------------------------------>	

<!--下面的東西全部都是script語法------------------------------------------------------------------>	

<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<!-- 	<script src="js/bootstrap.min.js"></script> -->
	
	
	
	
	<script>

	$(document).ready(function() {
		loadCarNoVerified();
		
	//讀取所有MEMBER
		
		function loadCarNoVerified(){
			var doc = $(document.createDocumentFragment());
			var tbody = $("#veifiedTable>tbody");   //選取id為memberTable裡面的tbody元素)
			$.getJSON("/iHitch/verify/getCarNoVerified.controller",function(cars){  //取出controller產生的json檔案,他的function是?????
				  $.each(cars,function(idx,car){    //idx表示 陣列的索引值　member表示陣列裡的數
					var td0 =$("<td></td>").text(car.mid);
					var td1 =$("<td></td>").text(car.carId);
					var td2 =$("<td></td>").text(car.carNo);
					var td3 =$("<td></td>").append('<button class="btn btn-link">Photo Link</button>')
					var td4 =$("<td></td>").append('<button class="btn btn-info"><i class="fas fa-edit"></i></button>');
					var tr1= $("<tr></tr>").append([td0,td1,td2,td3,td4]);
					doc.append(tr1);
					});  
					tbody.html(doc); 
		})
			}
		
		
		
		

		//查照片		    
				$("#veifiedTable>tbody").on('click','tr>td:nth-child(4)>button',
			
						function() {
							console.log($(this))
							//先取得原先的FK Mid
								var carId = $(this).parents('tr').find("td:nth-child(2)").text();
								var carNo= $(this).parents('tr').find("td:nth-child(3)").text();				
											console.log(carId);
								
											
				//圖片的那個功能--------------------------------------------------------------------------------
								
								
											$.confirm({
											    title: 'CarNumber:'+carNo,
											    content: "<img src='"+"/iHitch/verify/getCarDocPhoto.controller?carId="+carId+"'/>",
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				//圖片的那個功能-----------------------------------------------------------------------------------
				
				}	)
		
		
												
//改CurrentLv		    
				$("#veifiedTable>tbody").on('click','tr>td:nth-child(5)>button',
		
			
	function() {
		var carId = $(this).parents('tr').find("td:nth-child(2)").text();
	
	$.confirm({
	    title: 'YOU SURE??',
	    content: '要認證行照？該使用者將被升級！',
	    buttons: {
	        confirm: function () {
	          							$.get("/iHitch/verify/setCarVerified.controller", "carId="+carId,
													function(carId){
								loadCarNoVerified();
											});
	        },
	        cancel: function () {
	           
	        },
	    }
  });
});
	
	
//下面那個是最大最大的function()	
	})


	</script>


</body>
</html>