
$(document).ready(function() {
	var lv;
	getLv();
	

//讀取車輛資訊
function loadCars() {
var loadCarId; 
var tbody =$('#carTable>tbody');  
var doc = $(document.createDocumentFragment());
var url = '/iHitch/editCar/showCar.controller'
	$.getJSON(url,function(cars){

//	 判斷car verify 移除fileinput
//	  if(){}
//	 取出資料放入tbody
  $.each(cars,function(idx,car){
	var ok = $("<img alt='edit' src='../../img/ok.png'>");
	var no = $("<img alt='edit' src='../../img/error.png'>");
	var editicon = $("<img alt='edit' src='../../img/edit.png'>");
	var deleteicon = $("<img alt='delete' src='../../img/delete.png'>");
	var button1 =$("<button ></button>").append(editicon);
	var button2 =$("<button ></button>").append(deleteicon);
	var td0 =$("<td style='display:none'></td>").text(car.carId); 
	var td1 =$("<td></td>");
	var td2 =$("<td></td>").text(car.carNo);
	var td3 =$("<td></td>").text(car.carBrand);
	var td4 =$("<td></td>").text(car.carType);
	var td5 =$("<td></td>").text(car.color);
	if(car.pcFriendly==true){
		var td6 =$("<td></td>").append(ok);
	}else{
		var td6 =$("<td></td>").append(no);
	}
	if(car.carDocVerified==null){
	
		var fileinput =$("<input type='file' name='file' accept='image/*' style='display:none;'  >");
		var button3 =$("<input class='btn btn-primary' type='button' value='upload'>");
		var button4 =$("<input class='btn btn-primary' type='button' value='save'>");
		var td7 =$("<td></td>").append([button1,button2]);
		var td8 =$("<td></td>").append([fileinput,button3,button4]);
		var tr1 = $("<tr></tr>").append([td0,td1,td2,td3,td4,td5,td6,td7,td8]);
	}
	else if(car.carDocVerified==false){
		var Verifying=$("<img alt='verified' src='../../img/loading.gif'>")
		var td7 =$("<td></td>").append([button1,button2]);
		var span = $("<span></span>").css({"color":"#33ccff","font-size":"35px"}).text("Verifing");
		var td8 =$("<td></td>").append(span).append(Verifying);
		var tr1 = $("<tr></tr>").append([td0,td1,td2,td3,td4,td5,td6,td7,td8]);
		}
	else {
		var verified=$("<img alt='verified' src='../../img/ok.png'>")
		var td7 =$("<td></td>").append([button1,button2]);
		var td8 =$("<td></td>").append(verified);
		var tr1 = $("<tr></tr>").append([td0,td1,td2,td3,td4,td5,td6,td7,td8]);
		}
	doc.append(tr1);
	});  
		tbody.html(doc);
		
//上傳按鈕榜定		
$("#carTable td:nth-child(9) input:nth-child(2)").on("click",function(){
//	console.log($(this))
	$(this).parent("td").children("input:nth-child(1)").click()
})	
$("#carTable td:nth-child(9) input:nth-child(3)").on("click",function(){
	var docphoto = $(this).parent("td").children("input:nth-child(1)").prop('files')[0];
	var carid = $(this).parents("tr").children("td:nth-child(1)").text();
	var form = new FormData();
	form.append("carDocPhoto",docphoto);
	form.append("carId",carid);
	$.ajax({
	    url: "/iHitch/editCar/uploadDocPhoto.controller",
	    data: form,
	    method: 'post',
	    processData: false,
	    contentType: false,
	    enctype: 'multipart/form-data',
	    dataType:'json',
	    success: function(data){
	    	console.log(data);
	    	loadCars();
	    },
	    error:function(data){
	    	alert("upload fail");
	    	console.log(data)
	    }
	})
})		
// 刪除按鈕及動作
$("#carTable>tbody").on('click','tr>td:nth-child(8)>button:nth-child(2)',function() {
	var carId= $(this).parents("tr").find("td:nth-child(1)").text();
	$.ajax({
	    url: "/iHitch/editCar/deleteCar.controller",
	    data: "carId="+carId,
	    method: 'DELETE',
	    dataType:'json',
	    success: function(){
	    	loadCars();
	    }
	})
	});

//上傳按鈕及動作
$("button[name='upload']").on("click",function(){
	var datas = new FormData($("#docForm")[0]);
	datas.append("carId",$(this).parents("tr").children("td:nth-child(1)").text());
	datas.append("carDocPhoto",$(this).parent("td").children("input").prop("files")[0])
//	console.log($(this).parent("td").children("input").prop("files")[0])
	$.ajax({
	    url: "/iHitch/editCar/uploadDocPhoto.controller",
	    data: datas,
	    method: 'post',
	    processData: false,
	    contentType: false,
	    enctype: 'multipart/form-data',
	    dataType:'json',
	    success: function(data){
	    	loadCars();
//	    	console.log(data);
	    },
	    error:function(data){
//	    	console.log();
	    }
	})
})

//讀取表單資料
$("#carTable>tbody").on('click','tr>td button:nth-child(1)',function() {
	var carId=$(this).parents("tr").children("td:nth-child(1)").text();
	var carNo=$(this).parents("tr").children("td:nth-child(3)").text();
	var carBrand=$(this).parents("tr").children("td:nth-child(4)").text();
	var carType=$(this).parents("tr").children("td:nth-child(5)").text();
	var color=$(this).parents("tr").children("td:nth-child(6)").text();
	var pcFriendly = $(this).parents("tr").children("td:nth-child(7)").text();
	$("#carId").val(carId);     
	$("#carNo").val(carNo);
	$("#carBrand").val(carBrand);
	$("#carType").val(carType);
	$("#color").val(color);
	$("#pcFriendly").prop("checked",pcFriendly);
	$("#update").on("click",function () { 
		   
		$.ajax({
		    url: "/iHitch/editCar/updateCar.controller",
		    data: new FormData($("#carform")[0]),
		    method: 'post',
		    processData: false,
		    contentType: false,
		    enctype: 'multipart/form-data',
		    dataType:'json',
		    success: function(data){
		    	loadCars();
		    }
		})
	})
	
	});
//----------------------------------------
})
;}        

//新增 
$("#insert").on("click",function(){
	var datas = new FormData($("#carform")[0]);
	$.ajax({
	    url: "/iHitch/editCar/insertCar.controller",
	    data: datas,
	    method: 'post',
	    processData: false,
	    contentType: false,
	    enctype: 'multipart/form-data',
	    dataType:'json',
	    success: function(data){
	    	loadCars()
//	    	console.log(data);
	    },
	    error:function(data){
//	    	console.log();
	    }
	})
})


function getLv() {
		$.ajax({
			url: "/iHitch/verify/getAccount.controller",
			method: 'get',
		    success: function(data) 
		    {	 
			if(data.currentLv==3){
				loadCars();
			}
			else{   
				$("#carTable").remove();
				// 權限不夠的訊息
				$("#msg").css("color","red").text("Please complete license verify");
			}
		    },
		 	error:function(){
		 	}
		  });	
	}

});