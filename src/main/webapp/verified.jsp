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
<jsp:include page="/finalAdmin/partial/header.html" />
	<main role="main" class="container mt-2">
	
	<div class="row">
		<div class="col-lg-3">
			<jsp:include page="/finalAdmin/partial/nav.html" /></div>
		<div class="col-lg-9">
<!---------------------------------------上面是共通頁面----------------------------------------------->


<table id="veifiedTable" class="table table-bordered"> 

<!-- 下面是表單內容 -->


<thead>


<tr>

				


	<tr>
		<th>MemberId</th>
		<th>EmailVerified</th>
		<th>LicenseVerified</th>
		<th>LicensePhoto</th> <!--用一個button，點了show圖 -->
		<th>VerifiedButton</th>
		
		
	</tr>
</thead>
			

			<!--表單的內容，以下假資料-------------------------------------------------------->						
			<!--可以看到，前面四個是表單裡面的資料，後面那格塞了兩個東西：編輯和刪除的按鈕-->		
<tbody>

<tr>
								<td>123</td>
								<td>123</td>
								<td>123</td>
								<td><button class="btn btn-link">PhotoLink</button></td>								
								<td>
									<button class="btn btn-info">
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

</main>


<!--下面的東西全部都是script語法------------------------------------------------------------------>	

<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<!-- 	<script src="js/bootstrap.min.js"></script> -->
	
	
	
	
	<script>

	$(document).ready(function() {
		loadNotVMember();
		
	//讀取還沒有驗證的Member
		
		function loadNotVMember(){
			var doc = $(document.createDocumentFragment());
			var tbody = $("#veifiedTable>tbody");   //
			$.getJSON("/iHitch/verify/getNotVerifyList.controller",function(v){  //取出controller產生的json檔案,他的function是?????
				  $.each(v,function(idx,veri){    //idx表示 陣列的索引值　member表示陣列裡的數
					var td0 =$("<td></td>").text(veri.mid);
					var td1 =$("<td></td>").text(veri.email);
					var td2 =$("<td></td>").text(veri.licenseVerified);
					
					var td3 =$("<td></td>").append('<button class="btn btn-link" name="photoLink">Photo Link</button>')
					var td4 =$("<td></td>").append('<button class="btn btn-info"><i class="fas fa-edit"></i></button>');
					var tr1= $("<tr></tr>").append([td0,td1,td2,td3,td4]);
					doc.append(tr1);
					});  
					tbody.html(doc); 
		})
			}
		
		
		
		

		//查照片上傳之後		    
				$("#veifiedTable>tbody").on('click','tr>td:nth-child(4)>button',
			
						function() {
							console.log($(this))
							//先取得原先的FK Mid
								var mid = $(this).parents('tr').find("td:nth-child(1)").text();
													
											console.log(mid);
											

											
											$.confirm({
											    title: 'Mid:'+mid,
											    content: "<img src='"+"/iHitch/verify/getLicensePhoto.controller?mid="+mid+"'/>",
											    boxWidth: '500px',
											    useBootstrap: false,
											    buttons: {
											        close: function () {
											            
											        },
											    }
											});
				
				}	)
		
		
											
											
	
												
//改CurrentLv		    
				$("#veifiedTable>tbody").on('click','tr>td:nth-child(5)>button',
			
										
						function() {
							console.log($(this))//先取得原先的資料
									
							
								var mid = $(this).parents('tr').find("td:nth-child(1)").text();
								
							console.log(mid);
										
							$.get("/iHitch/verify/setLicenseVerified.controller", "mid="+mid,
													function(mid){
								loadNotVMember()
											});
											
				
				});

									
				
	//	     --------------------------------------------------------          -->

		
	
	
	
	}) //這個是最大的那個function()

		
		
		
		
		

	</script>










</body>
</html>