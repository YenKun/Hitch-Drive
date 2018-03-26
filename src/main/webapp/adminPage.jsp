 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<!--head開頭------------------------------------------------------------------------------------------------------------------>
<head>





<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberInfo</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jumbotron.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	
  
</head>




<!--BODY --------------------------------------------------------------------------------------------------------------->




<body>





<jsp:include page="/finalAdmin/partial/header.html" />
	<main role="main" class="container mt-2">
	
	<div class="row">
		<div class="col-lg-3">
			<jsp:include page="/finalAdmin/partial/nav.html" /></div>
		<div class="col-lg-9">
<!--------------------上面這兩個是從老師那裏挖來的--------------------------------------------->	
	
	

			
			
			
			
	
<!-- 	上面的JQuerry的Selector找到的memeberTable在這邊 -------->
		
<table id="memberTable" class="table table-bordered">   


<!--表單的標題---------------------------------------------------------->
<thead>


<tr>

				
	
							    
						<form name="myForm" action="<c:url value="/adminPage.controller"/>" method="post"> <!--整個那個修改欄位 -->
				
						<!--這個是id欄位，如果沒事的時候是隱藏的，只有在按下修改的時候外面會傳回來給他 -->
						<td><input type="hidden" id="mid" name="mid"><span></span></td>
								
								<!--這個是email欄位-->	
									<td><input type="text" class="form-control"
										id="Email" name="email" placeholder="email"></td>
									
								<!--這個是FirstName欄位-->	
									<td><input type="text" class="form-control"
										id="FirstName" name="firstName" placeholder="firstName"></td>
								
								<!--這個是LastName欄位-->	
									<td><input type="text" class="form-control"
										id="LastName" name="lastName" placeholder="lastName"></td>
										
								<!--這個是mailVRF欄位-->	
									<td><input type="text" class="form-control"
										id="EmailVerified" name="emailVerified" placeholder="mailVRF"></td>
										
								<!--這個是licenseVRF欄位-->	
									<td><input type="text" class="form-control"
										id="LicenseVerified" name="licenseVerified" placeholder="licenseVRF"></td>

								<!--這個是point欄位-->	
									<td><input type="text" class="form-control"
										id="MalPoint" name="malPoint" placeholder="Point"></td>

                                <!--這個是rate欄位-->	
									<td><input type="text" class="form-control"
										id="Rate" name="rate" placeholder="rate"></td>	

								<!--這個是CurrentLV欄位-->	
									<td><input type="text" class="form-control"
										id="CurrentLv" name="currentLv" placeholder="CurrenLv"></td>										
								
								
								
								<!--這個是表單的button，負責修改資料-->	
									<td><button id="buttonUpdate" type="button" name="prodaction" value="Update"
											class="btn btn-success">
											<i class="fas fa-pencil-alt"></i>
										</button></td>
							</tr>
							</form>


	<tr>
		<th>MemberId</th>
		<th>Email</th>
		<th>FirstName</th>
		<th>LastName</th>
		<th>EmailVerified</th>
		<th>LicenseVerified</th>
		<th> Point </th>
		<th> Rate </th>
		<th>CurrentLv</th>
		<th>Manage</th>
		
	</tr>
</thead>
			
			
			<!--表單的內容，以下假資料-------------------------------------------------------->						
			<!--可以看到，前面四個是表單裡面的資料，後面那格塞了兩個東西：編輯和刪除的按鈕-->		
<tbody>

<tr>







								<td>mid</td>
								<td>奕旬</td>
								<td>false</td>
								<td>false</td>
								<td>true</td>
								<td>true</td>
								<td>2</td>
								<td>100</td>
								<td>888</td>
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
<!-- </div> -->

<!--------跟其他頁面完全不同的地方在這裡結束------------------------------------------------------->

</div>
</div>
</main>




	
<!--下面的東西全部都是script語法------------------------------------------------------------------>	

<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>


$(document).ready(function() {
	loadAllMember();
	
//讀取所有MEMBER
	
	function loadAllMember(){
		var doc = $(document.createDocumentFragment());
		var tbody = $("#memberTable>tbody");   //選取id為memberTable裡面的tbody元素)
		$.getJSON("/iHitch/getMemberList.controller",function(members){  //取出controller產生的json檔案,他的function是?????
			  $.each(members,function(idx,member){    //idx表示 陣列的索引值　member表示陣列裡的數值
				var td0 =$("<td></td>").text(member.mid);
				var td1 =$("<td></td>").text(member.email);
				var td2 =$("<td></td>").text(member.firstName);
				var td3 =$("<td></td>").text(member.lastName);
				var td4 =$("<td></td>").text(member.emailVerified);
				var td5 =$("<td></td>").text(member.licenseVerified);
				var td6 =$("<td></td>").text(member.malPoint);
				var td7 =$("<td></td>").text(member.rate);
				var td8 =$("<td></td>").text(member.currentLv);
				var td9=$("<td></td>").html('<button class="btn btn-info"><i class="fas fa-edit"></i></button>');
 				//先把每個值先讀出來塞在td(標準單元)裡面
				//再用append(在元素內部加入新元素)，所以下面這行就是把剛剛存的所有值都塞到下面的表格
				//<tr>是代表HTML中的行，裡面可以有<td><th>，所以下面的是在<tr>這個大行裡，一個個塞進上面那堆東西
 				
				var tr1= $("<tr></tr>").append([td0,td1,td2,td3,td4,td5,td6,td7,td8,td9]);
				doc.append(tr1);
				});  
				tbody.html(doc); 
	})
		}
	
	
	
	

	//修改產品，這個是原本名單裡，右邊那個修改按鈕的功能		    
			$("#memberTable>tbody").on('click','tr>td:nth-child(10)>button',
		
					function() {
						console.log($(this))
						//先取得原先的資料
												var mid = $(this).parents('tr').find("td:nth-child(1)").text();
												var Email = $(this).parents('tr').find("td:nth-child(2)").text();
												var FirstName = $(this).parents('tr').find("td:nth-child(3)").text();
												var LastName = $(this).parents('tr').find('td:nth-child(4)').text();
												var EmailVerified = $(this).parents('tr').find('td:nth-child(5)').text();
												var LicenseVerified = $(this).parents('tr').find('td:nth-child(6)').text();
												var MalPoint = $(this).parents('tr').find('td:nth-child(7)').text();
												var Rate = $(this).parents('tr').find('td:nth-child(8)').text();
												var CurrentLv = $(this).parents('tr').find('td:nth-child(9)').text();
												
										console.log(Email);
									
												
												//丟到下面的表格
												$('#mid').val(mid).next('span').text(mid);
												$('#Email').val(Email);
												$('#FirstName').val(FirstName);
												$('#LastName').val(LastName);
												$('#EmailVerified').val(EmailVerified);
												$('#LicenseVerified').val(LicenseVerified);
												$('#MalPoint').val(MalPoint);
												$('#Rate').val(Rate);
												$('#CurrentLv').val(CurrentLv);

											}									
			
			)
	
	
												//更新產品，這個是最下面button的作用
							$('#buttonUpdate').click(
									function() {

										var datas = $('form[name="myForm"]').serialize();
										console.log(datas)
										$.post('/iHitch/adminPage.controller', datas,
												function(data) {
													alert(data);
													loadAllMember()
													
													$('#Mid').val('').next('span').text('');
													$('#Email').val('');
													$('#FirstName').val('');
													$('#LastName').val('');
													$('#EmailVerified').val('');
													$('#LicenseVerified').val('');
													$('#MalPoint').val('');
													$('#Rate').val('');
													$('#CurrentLv').val('');
													
													
												});
									});




	})


</script>
</body>
</html>
