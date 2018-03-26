$(function(){
	var temp;
	bindRateBtn();
})

function bindRateBtn(){
	$(".rateBtn").on("click",showRateForm);
}

function showRateForm() {
	
	temp = $(this)

	var docFrag = $(document.createDocumentFragment());
	var contextPath = "/" + $(location).attr('pathname').split("/")[1];
	
	// Rating外框
	var ratingForm = $("<div></div>");
		ratingForm.addClass("container");
	
	// RideId
	var rideId = temp.parents(".rideHisRow").children("input:eq(0)").val();
	ratingForm.append($("<span style='display:none'>" + rideId + "</span>"));
	
	// Rating對象Id
	var toMid = temp.parent().children("input:eq(0)").val();
	ratingForm.append($("<span style='display:none'>" + toMid + "</span>"));
	
	// Rating對象頭像
	var targetPhoto = $("<img></img>");
		targetPhoto.attr("src", contextPath +"/Ratings/Photos.controller?Mid="+ toMid)	
		.css({height:"60px"})
	
	// Rating對象姓名
	var name = temp.parents(".passSec").find(".passName").text();
	var targetName = $("<span></span>");
		targetName.text(name);
		
	// 評分用星星
	var stars = $("<tr></tr>").appendTo("<table></table>");
	for (var i = 0; i < 5; i++) {
		var td =$("<td></td>");
		var star = $("<img/>");
		star.attr("src", contextPath + "/website/img/rate/star.gif")
			.addClass("star")
			.prop("draggable", "false")
			.css({margin:"5px 0px", "float":"none",width:"30px","-webkit-filter": "grayscale(1)"});
		stars.append(td.append(star));
	}
	// 星星分數
	stars.append($("<td style='display:none'>" + 0 + "</td>"));
	
	// 評論內容
	var comment = $("<input/>");
	
	// 送出按鈕
	var submit = $("<input/>");
	submit.attr("type", "button").val("submit").on("click", submitRate);
	
	// 關閉按鈕
	var close = $("<img></img>");
	close.attr("src", contextPath + "/website/img/chat/shutdown.png")	
		.css({width:"24px",margin:"0px",float:"right"})
		.on("click",function(){
			$("#RatingsForm").empty();
		})
	
	ratingForm.append(targetPhoto, targetName, close, stars, comment, submit);
	docFrag.append(ratingForm);
	
	$(this).prop("disabled", "true");
	$("#RatingsForm").empty();
	$("#RatingsForm").append("<br>",docFrag);
	$("head").append('<script src="/iHitch/website/js/rate/star.js"></script>');
}

function submitRate() {
	
	
	var contextPath = "/" + $(location).attr('pathname').split("/")[1];
	
	var parent = $(this).parent();
	
	var toMid = temp.parent().children("input:eq(0)").val();
	var star = parent.find("td:eq(5)").text();
	var comment = parent.children("input")[0].value;
	var rideId = temp.parents(".rideHisRow").children("input:eq(0)").val();
	
	console.log($(this).parent());
	console.log(comment);
	console.log(star);
	if(	star == 0 ){
		err("You should give at least one star");
		return;
	}
	
	$.ajax({
		type : "POST",
		url : contextPath + "/Ratings.controller",
		contentType : "application/json",
		dataType : "json",
		data : JSON.stringify({
			"toMid" : toMid,
			"star" : star,
			"comment" : comment,
			"rideId" : rideId
		}),
		success : function(data, textStatus,jqXHR) {
			if(data.rate == "Rate Fail"){
				err("Failed to send rating");
			}else{
				$.confirm({
				    title: 'Success!',
				    boxWidth: '500px',
				    animation: 'scale',
				    useBootstrap: false,
				    buttons: {
				        tryAgain: {
				            text: 'OK',
				            btnClass: 'btn-blue',
				            action: function(){
				            	temp.css("visibility","hidden");
				            	$("#RatingsForm").empty();
				            }
				        },
				        close: function () {
				        	$("#RatingsForm").empty();
				        }
				    }
				});
			}
		},
		error : function(){
			err("Failed to send rating");
		}
	})
	
	function err(content){
		$.confirm({
		    title: 'Encountered an error!',
		    content: content,
		    type: 'red',
		    boxWidth: '500px',
		    animation: 'scale',
		    useBootstrap: false,
		    buttons: {
		        tryAgain: {
		            text: 'Try again',
		            btnClass: 'btn-red',
		            action: function(){
		            }
		        },
		        close: function () {
		        }
		    }
		});
	}
}

