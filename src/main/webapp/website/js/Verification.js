$(document).ready(function() {
	loadVerify();  
	getAccount();
	
var EmailOK=$("<img alt='verified' src='../../img/ok.png'>") ;
var LicenseOK=$("<img alt='verified' src='../../img/ok.png'>") ;
var ing1 =$("<img alt='verified' src='../../img/loading.gif'>") ;
var ing2=$("<img alt='verified' src='../../img/loading.gif'>") ;
	
function loadVerify() {
	$.ajax({
		url: "/iHitch/verify/getVerify.controller",
		method: 'get',
	    success: function(data)
	    {	  
	    	console.log(data)
	    	if(data.emailVerified==true){
	    		$("#emaildiv>form").remove();
	    		$("#emaildiv span").append(EmailOK);
	    	}
	    	if(data.licenseVerified==true)
	    	{  
	    		$("#licensediv span").append(LicenseOK);
	    	}else if(data.licenseVerified==false) {
	    		$("#licensediv span").text("Verifying").append(ing1);
	    	}
	    	getAccount();
	    },
	 	error:function(){
	 		
	 	}	
	})
}	
	
	function getAccount() {
		$.ajax({
			url: "/iHitch/verify/getAccount.controller",
			method: 'get',
		    success: function(data) 
		    {	       
		    	if(data.currentLv<2){
		    		$("#licensediv span").css("color","red").text("Please complete email verify").parents("#licensediv").find("form").remove();
		    		$("#accountdiv>h1>span").css("color","red").text("Please complete license verify").parents("#accountdiv").find("form").remove();
		    	}
		    	else if(data.currentLv<3)
		    	{   
		    		$("#accountdiv>h1>span").css("color","red").text("Please complete license verify").parents("#accountdiv").find("form").remove();
		    	}
		    	else{
		    		$("#accountdiv>h1>span").text(data.account);
		    	}
		    },
		 	error:function(){
		 		alert("send email fail");
		 	}
		  });	
	}
	
	
	
	
	
//		======================================
	$("#emailSubmit").on("click",function() {
		$("#emailMsg").text("Sending").append(ing2)	
		$.ajax({
			url: "/iHitch/verify/getcode.controller",
			method: 'get',
		    data:"email="+$("#email").val(),
		    success: function(data)
		    {	loadVerify();  
		    	if(data.msg!=null){
		    		$.alert({
		    		    title: 'Success!',
		    		    content: 'Please check your email',
		    		    boxWidth: '500px',
			    	    useBootstrap: false,
		    		});
		    		$("#emailMsg").empty();
		    	}else{
		    		$.alert({
		    		    title: 'Send error!',
		    		    content: 'Please try agian',
		    		    type: 'red',
		    		    boxWidth: '500px',
			    	    useBootstrap: false,
		    		});
		    		$("#emailMsg").empty();
		    	}
		    },
		 	error:function(){
		 		alert("send email fail");
		 		$("#emailMsg").empty();
		 	}
		  });	
		})
// 		======================================
		$("#accountSubmit").on("click",function() {
		$.ajax({
			url: "/iHitch/verify/setAccount.controller",
			method: 'put',
		    data:"account="+$("#account").val(),
		    success: function(data)
		    {	getAccount();
		    	console.log(data);
		    },
		 	error:function(){
		 		$.alert({
	    		    title: 'Edit error!',
	    		    content: 'Please try agian',
	    		    type: 'red',
	    		    boxWidth: '500px',
		    	    useBootstrap: false,
	    		});

		 	}
		  });	
		})
	
	
// 		======================================	
//			$("#uploadLicense").on("click",function(){
//				var datas = new FormData($("#licenseForm")[0]);
//				$.ajax({
//				    url: "/iHitch/edit/uploadlicense.controller",
//				    data: datas,
//				    method: 'post',
//				    processData: false,
//				    contentType: false,
//				    enctype: 'multipart/form-data',
//				    dataType:'json',
//				    success: function(data){
//				    	loadVerify();  
//				    	console.log(data);
//				    },
//				    error:function(data){
//				    	alert("upload fail");
//				    	console.log(data)
//				    }
//				})
//			})
			
			
			
$("#upload").on("click",function(){

		var datas = new FormData();
		var photo ;
		var reader = new FileReader();
		var data;
		     $.confirm({
				    title: 'Upload your license!', 
				    content: "<img id='img1' src=''/>",
				    boxWidth: '800px',
				    useBootstrap: false,
				    buttons: { 
				    	upload:function(){
				    		$("#licensePhoto").click().on("change",function(){
				    			photo = $(this).prop('files')[0];
					    		reader.readAsDataURL(photo);
					    		reader.onload = function () {
					    			$("#img1").attr("src",reader.result)
					    			};
				    		});
				    		return false;
				    	},
				        confirm: function () {
				        	datas.append("licensePhoto",photo);
				        	$.ajax({
							    url: "/iHitch/edit/uploadlicense.controller",
							    data: datas,
							    method: 'post',
							    processData: false,
							    contentType: false,
							    enctype: 'multipart/form-data',
							    dataType:'json',
							    success: function(data){    	
							    	$.alert({
							    		title:"Success",
		    				    	    content: 'upload success!',
		    				    	    boxWidth: '500px',
		    				    	    useBootstrap: false,
		    				    	});
							    	loadVerify(); 
							    	$("#licensePhoto").val("");
							    },
							    error:function(data){
							    	$.alert({
						    		    title: 'Upload fail!',
						    		    content: 'Please try agian',
						    		    type: 'red',
						    		    boxWidth: '500px',
							    	    useBootstrap: false,
						    		});
							    }
							})
				        },
				        cancel: function () { 
				        },
				    }
				});
		
		
	})
//=====================================================		
	})