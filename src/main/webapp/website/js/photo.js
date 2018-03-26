$(document).ready(function() {
	loadPhoto();
	
	
//	讀取
	function loadPhoto() {
		$.ajax({
		    url: "/iHitch/edit/showPhoto.controller",
		    method: 'GET',
		    success: function(data){
		    if(data.length!=0){
		    	$("#MemberPhoto").attr('src', "data:image/png;base64,"+data);
		    }else{
		    	$("#MemberPhoto").attr('src', "../../img/user.png");  
		    }
		   
		    }
		});
	};
	
//	上傳
//	$("#upload").on("click" , function() {
//		$("#photo").click();
//	})
	
	
//	var check = true;
//	$('#photo').on('change', function() {
//		var size = this.files[0].size;
//		var length = this.files.length;
//		var type =this.files[0].type.split("/")[1];
//		
//		if(size>2097152){
//			alert("file size <2mb");
//			this.check=false;
//		}
//		else if(length>1){
//			alert("only one img");
//			this.check=false;
//		}
//		else if(type!="jpg" && type!="gif" && type!="jpeg" && type!="png")
//		{
//			alert("file type:jpg gif png jpeg");
//			this.check=false;
//		}	
//
//		});
//	
	
	$("#upload").on("click",function(){

		var datas = new FormData();
		var photo = $(this).parent("div").children("input:file").prop('files')[0]
		var reader = new FileReader();
		var data;
		     $.confirm({
				    title: 'Upload your photo!', 
				    content: "<img id='img1' src=''/>",
				    boxWidth: '800px',
				    useBootstrap: false,
				    buttons: { 
				    	upload:function(){
				    		$("#photo").click().on("change",function(){
				    			photo = $(this).prop('files')[0];
					    		reader.readAsDataURL(photo);
					    		reader.onload = function () {
					    			$("#img1").attr("src",reader.result)
					    			};
				    		});
				    		return false;
				    	},
				        confirm: function () {
				        	datas.append("file",photo);
				        	$.ajax({
							    url: "/iHitch/edit/editPhoto.controller",
							    data: datas,
							    method: 'post',
							    processData: false,
							    contentType: false,
							    enctype: 'multipart/form-data',
							    dataType:'json',
							    success: function(data){    	
							    	$.alert({	    
		    				    	    content: 'upload success!',
		    				    	    boxWidth: '500px',
		    				    	    useBootstrap: false,
		    				    	});
							    	loadPhoto();
							    	$("#photo").val("");
							    },
							    error:function(data){
							    	$.alert({
		    				    	    title:"Fail!",
		    				    	    content: 'Uploads fail!',
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
})