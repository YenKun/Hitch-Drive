$(document).ready(function() {
	
	loadProfile();
	loadPhoto();
	
	function loadProfile(){
	var option1 = { year: 'numeric', month: 'long', day: '2-digit' };
	var option2 = { year: 'numeric', month: 'long'};  
		$.ajax({    
			url: "/iHitch/edit/getProfile.controller",
		    method: 'GET',
		    dataType:"json",
		    success:function(user){
		    	$("#fName").text(user.firstName);
		    	$("#lName").text(user.lastName);
		    	$("#bio").text(user.bio);
		    	$("#score").before(user.rate);
		    	$("#count").text(user.rateReceived);
		    	$("#regisDate").text(new Date(user.regisDate).toLocaleDateString(option2))
		    	if(user.birthYear!=null){
		    		$("#age").text(new Date().getFullYear()-user.birthYear);
		    	}
		    	$("#lastLog").text(new Date(user.lastLog).toLocaleString(option1))
		       
		    	if(user.emailVerified==true){
		    		$("#eVerify").attr('src', "../../img/ok.png")
		    	}else{
		    		$("#eVerify").attr('src', "../../img/error.png")
		    	}
		    	if(user.licenseVerified==true){
		    		$("#lVerify").attr('src', "../../img/ok.png")
		    	}else{
		    		$("#lVerify").attr('src', "../../img/error.png")
		    	}
		    	
		    	
		    	
		    	
		    	switch(user.prefPaPet)
				{
				case 1:
					$("#pet").attr('src', "../../img/petNo.png").attr("title","123");
				break;
				case 2:
					$("#pet").attr('src', "../../img/pet.png").attr("title","456");;
				break;
				case 3:
					$("#pet").attr('src', "../../img/petYes.png").attr("title","7");;
				break;
				}
		    	
		     	switch(user.prefPaSmoke)
				{
				case 1:
					$("#smoke").attr('src', "../../img/smokeNo.png");
				break;
				case 2:
					$("#smoke").attr('src', "../../img/smoke.png");
				break;
				case 3:
					$("#smoke").attr('src', "../../img/smokeYes.png");
				break;
				}
		     	switch(user.prefPaMusic)
				{
				case 1:
					$("#music").attr('src', "../../img/musicNo.png");
				break;
				case 2:
					$("#music").attr('src', "../../img/music.png");
				break;
				case 3:
					$("#music").attr('src', "../../img/musicYes.png");
				break;
				}
		     	switch(user.prefPaTalk)
				{
				case 1:
					$("#talk").attr('src', "../../img/talkNo.png");
				break;
				case 2:
					$("#talk").attr('src', "../../img/talk.png");
				break;
				case 3:
					$("#talk").attr('src', "../../img/talkYes.png");
				break;
				}
		    	
		    }
			
		})
		
		
	}
	
	function loadPhoto() {
		$.ajax({
		    url: "/iHitch/edit/showPhoto.controller",
		    method: 'GET',
		    success: function(data){
		    if(data.length!=0){
		    	$("#photo").attr('src', "data:image/png;base64,"+data);
		    }else{
		    	$("#photo").attr('src', "../../img/user.png");  
		    }
		   
		    }
		});
	};
	
})