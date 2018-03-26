
	$(document).ready(function () {
		getLevel();
		getPreferences();	
		
//	 	click 
		$("input:radio").on("click",function(){
			$(this).parent("span").parent("div").find("img").css("border","none")
			$(this).parent("span").find("img").css("border","2px blue solid")
		})
		
//	 	修改
		$("#submit").on("click",function(){
			var datas = new FormData($("#prefForm")[0]);
			console.log($("#prefForm input:radio"))
			$.ajax({
			    url: "/iHitch/edit/editPref.controller",
			    data: datas,
			    method: 'post',
			    processData: false,
			    contentType: false,
			    enctype: 'multipart/form-data',
			    dataType:'json',
			    success: function(data){
			    	$.alert({
			    	    title: 'Success!',
			    	    content: 'change Prefrences success!',
			    	    boxWidth: '300px',
			    	    useBootstrap: false,
			    	});
			    },
			    error:function(data){
			    	console.log();
			    }
			})
			
		})
//	 	讀喜好
		function getPreferences(){
			$.ajax({
				url:"/iHitch/edit/getPerferences.controller",
				method:"get",
				dataType:"json",
				success:function(data){
					switch(data.prefPaPet)
					{
					case 1:
						$("#pet1").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#pet2").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#pet3").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefPaSmoke)
					{
					case 1:
						$("#smoke1").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#smoke2").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#smoke3").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefPaMusic)
					{
					case 1:
						$("#music1").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#music2").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#music3").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefPaTalk)
					{
					case 1:
						$("#talk1").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#talk2").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#talk3").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefDrPet)
					{
					case 1:
						$("#pet4").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#pet5").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#pet6").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefDrSmoke)
					{
					case 1:
						$("#smoke4").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#smoke5").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#smoke6").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefDrMusic)
					{
					case 1:
						$("#music4").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#music5").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#music6").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					
					switch(data.prefDrTalk)
					{
					case 1:
						$("#talk4").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 2:
						$("#talk5").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					case 3:
						$("#talk6").prop("checked",true).parents("span").find("img").css("border","2px blue solid");
					break;
					}
					getLevel();
				}
				
			})
			
			
		}
		
		
//	 	查詢會員等級
		function getLevel() {
			$.ajax({
				url: "/iHitch/verify/getAccount.controller",
				method: 'get',
			    success: function(data) 
			    {	 
			    	console.log(data.currentLv)
			    	if(data.currentLv==2){
			    		$("#drDiv").remove();
			    		
			    	}else if(data.currentLv<2)  {
			    		$("#form> ").remove()
			    	var h1=	$("<h1></h1>").append("Please complete email verify").css("color","red")
			    		$("#form").append(h1);
			    	}
			    },
			 	error:function(){
			 	}
			  });	
		}
	})
