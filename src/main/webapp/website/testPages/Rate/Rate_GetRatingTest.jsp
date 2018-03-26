<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GetRatingsTest</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/website/js/jquery-3.3.1.min.js"></script> 

</head>
<body>

	<!-- 用於測試GetRating功能 -->
	<script type="text/javascript">
	
// 		ShowRate測試按鈕
		$(document).ready(function() {
			var btn = $("<input></input>");
			btn.val("Get Ratings")
				.attr("type","button")
				.on("click",getRatings);
			
			$("body").append(btn,"<br>");
			
			
			function getRatings() {
				//測試用mid
				var mId = 6;
				
				$.get("/iHitch/Ratings/Left/"+mId+".controller",function(data) {
					console.log(data);
					if(data.rates.length==0){
						alert("You haven't left any ratings to other members");
					}else{
						var docFrag = $(document.createDocumentFragment());
						var members = data.memberInfos;
						var rates = data.rates;
						
						for(var i = 0, rMax = rates.length; i<rMax; i++ ){ 
							var row = $("<div></div>");
							var img = $("<img>");
							var name = $("<div></div>");
							var stars = $("<div></div>");
							var comment = $("<div></div>");
							
							row.css({height:"100px"});
							
							img.attr("src","/iHitch/Ratings/Photos.controller?Mid="+rates[i].toMid)
							.css({height:"100px",width:"100px",float:"left"})
							
							name.text( members[i].firstName + " " + members[i].lastName );
							
							for (var s = 0, sMax = rates[i].star; s < 5; s++) {
								var star = $("<img/>");
								star.attr("src", "star.gif").prop("draggable", "false").addClass("star");
								if(s < sMax){
									star.css({"-webkit-filter": "grayscale(0)"});
								}else{
									star.css({"-webkit-filter": "grayscale(1)"});
								}
								stars.append(star);
							}
							comment.text(rates[i].comment);
							row.append(img,name,stars,comment);
							docFrag.append(row);
						}
// 						$("body").text("");
						$("head").append('<link rel="stylesheet" href="star.css">');
						$("body").append("Left");
						$("body").append(docFrag);
					}
					
				},"json")
				
				$.get("/iHitch/Ratings/Received/"+mId+".controller",function(data) {
					if(data.rates.length==0){
					}else{
						var docFrag = $(document.createDocumentFragment());
						var members = data.memberInfos;
						var rates = data.rates;
						
						for(var i = 0, rMax = rates.length; i<rMax; i++ ){ 
							var row = $("<div></div>");
							var img = $("<img>");
							var name = $("<div></div>");
							var stars = $("<div></div>");
							var comment = $("<div></div>");
							
							row.css({height:"100px"});
							
							img.attr("src","/iHitch/Ratings/Photos.controller?Mid="+rates[i].fromMid)
							.css({height:"100px",width:"100px",float:"left"})
							
							name.text( members[i].firstName + " " + members[i].lastName );
							
							for (var s = 0, sMax = rates[i].star; s < 5; s++) {
								var star = $("<img/>");
								star.attr("src", "star.gif").prop("draggable", "false").addClass("star");
								if(s < sMax){
									star.css({"-webkit-filter": "grayscale(0)"});
								}else{
									star.css({"-webkit-filter": "grayscale(1)"});
								}
								stars.append(star);
							}
							comment.text(rates[i].comment);
							row.append(img,name,stars,comment);
							docFrag.append(row);
						}
// 						$("body").text("");
						$("head").append('<link rel="stylesheet" href="star.css">');
						$("body").append("Received");
						$("body").append(docFrag);
					}		
				},"json")
			}
		});
	</script>
</body>
</html>