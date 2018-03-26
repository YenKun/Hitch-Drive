/**
 * Using jQuery
 */

function run() {
	initRateBtn("body");
}

// 可用location參數指定想append的位置
function initRateBtn(location, method) {
	var btn = $("<input/>")
	btn.attr("type", "button").css("display", "inline").val("Rate").on("click",
			showRateForm)
	if (location != null) {
		if ("append" == method || undefined == method) {
			location.append(btn);
		} else if ("after" == method) {
			location.after(btn);
		}
	}
}

function showRateForm() {
	var form = $("<form></form>");
	form.css({
		"border" : "1px solid rgb(0,0,0)"
	});

	var toMid = $("<div></div>");
	toMid.text("To: " + passDetail.name);

	var stars = $("<tr></tr>").appendTo("<table></table>");
	for (var i = 0; i < 5; i++) {
		var td =$("<td></td>");
		var star = $("<img/>");
		star.attr("src", "star.gif").addClass("star").prop("draggable", "false");
		stars.append(td.append(star));
	}
	var comment = $("<input/>");
	var submit = $("<input/>");
	submit.attr("type", "button").val("submit").on("click", submitRate);
	form.append(toMid, stars, comment, submit);
	$(this).after("<br>", form).prop("disabled", "true");
	$("head").append('<script src="star.js" />');
	$("head").append('<link rel="stylesheet" href="star.css" />');

}

function submitRate() {

	var rateComment = $(this).parent().children("input")[0].value;
	var star = 2;
	$.ajax({
		type : "POST",
		url : "/iHitch/Ratings.controller",
		contentType : "application/json",
		dataType : "json",
		data : JSON.stringify({
			"fromMid" : passDetail.passMId,
			"toMid" : ride.driverId,
			"star" : star,
			"comment" : rateComment,
			"rideId" : ride.rideId,
		}),
		success : function(data, textStatus,jqXHR) {
			console.log(data);
			console.log(textStatus);
			console.log(jqXHR);
		}
	})
}
