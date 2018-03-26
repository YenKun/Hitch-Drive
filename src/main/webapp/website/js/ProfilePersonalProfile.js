$(document).ready(function() {
	loadProf();
	setBirthYear();
	
	
	

	$("#info").on("click",function(){
		console.log($(this))
		$("#firstName").val("Kenny");
		$("#lastName").val("McCormick");
		$("#birthYear").val("1995");
		$("#phone").val("0987456123");
		$("#bio").val("hello!");
		$("#country").val("USA");
		$("#gender").val('M');
	})
	
// 	設定出生年屬性
	function setBirthYear(){
		var date = new Date();
		var year = date.getFullYear();
		$("#birthYear").prop('max',year).prop('min',(year-100)).val(year);
	}
// 	讀取個人資料
	function loadProf() {
		$.ajax({
		    url: "/iHitch/edit/showProfile.controller",
		    method: 'GET',
		    dataType:"json",
		    success: function(member){
		    	var genderdiv =$("#genderdiv");
		    	var birthdiv = $("#birthdiv");
		    	var countrydiv = $("#countrydiv")
		    	if(member.gender!==null){
		    		genderdiv.find("*").remove();
		    		genderdiv.append($("<p></p>").text(member.gender));
		    	}if(member.birthYear!==null)
		    	{
		    		birthdiv.find("*").remove()
		    		birthdiv.append($("<p></p>").text(member.birthYear));
		    	}if(member.country!==null){
		    		countrydiv.find("*").remove()
		    		countrydiv.append($("<p></p>").text(member.country));
		    	}
		    		$("#firstName").val(member.firstName);
					$("#lastName").val(member.lastName);
					$("#phone").val(member.phone);
					$("#bio").val(member.bio);
		    }
		});
	}
// 	修改資料
	$("#submit").on("click",function(){
		var form = $("#profForm").serializeObject();
		var p = $(this).parents("form").find("p");
		//如果第一次修改 Gender、BirthYear、Country
		if(p[0]==null || p[1]==null || p[2]==null)
			{
			$.confirm({
			    title: 'Edit!',
			    content: 'Gender、BirthYear、Country can only be modified once !',
			    boxWidth: '500px',
			    useBootstrap: false,
			    buttons: {
			        confirm: function () {
			    		if(p[1]!=null){
			    			form.gender=p[1].textContent;
			    		}
			    		if(p[2]!=null){
			    			form.country=p[2].textContent;
			    		}
			    		if(p[0]!=null)
			    			{
			    			form.birthYear=p[0].textContent;
			    			}
			    		if(form.phone.length==10){
			    			var datas = JSON.stringify(form);
			    			$.ajax({
			    				 	url: "/iHitch/edit/editProfile.controller",
			    				    method: 'put',
			    				    data:datas,
			    				    datatype: "json",
			    				    contentType:'application/json',
			    				    success: function(data)
			    				    {	
			    				    	loadProf();
			    				    	$.alert({
			    				    	    title:"success",
			    				    	    content: 'Edit success!',
			    				    	    boxWidth: '500px',
			    				    	    useBootstrap: false,
			    				    	});

			    				    },
			    				 	error:function(){
			    				 		$.alert({
			    				    	    title:"Fail!",
			    				    	    content: 'Edit fail!',
			    				    	    boxWidth: '500px',
			    				    	    useBootstrap: false,
			    				    	});
			    				 	}
			    				  });
			    		}
			    		else{
			    			$.alert({
    				    	    title:"Fail!",
    				    	    content: 'Edit fail!',
    				    	    boxWidth: '500px',
    				    	    useBootstrap: false,
    				    	});
			    			}
			        	
			            
			        },
			        cancel: function () {  
			        },
			    }
			});
			}
//		一次性欄位已修改
		else{
				$.confirm({
				    title: 'Edit profile',
				    content: 'confirm ?',
				    boxWidth: '500px',
				    useBootstrap: false,
				    buttons: {
				        confirm: function () {
				    		if(p[1]!=null){
				    			form.gender=p[1].textContent;
				    		}
				    		if(p[2]!=null){
				    			form.country=p[2].textContent;
				    		}
				    		if(p[0]!=null)
				    			{
				    			form.birthYear=p[0].textContent;
				    			}
				    		if(form.phone.length==10){
				    			var datas = JSON.stringify(form);
				    			$.ajax({
				    				 	url: "/iHitch/edit/editProfile.controller",
				    				    method: 'put',
				    				    data:datas,
				    				    datatype: "json",
				    				    contentType:'application/json',
				    				    success: function(data)
				    				    {	
				    				    	loadProf();
				    				    	$.alert({
				    				    	    
				    				    	    content: 'Edit success!',
				    				    	    boxWidth: '500px',
				    				    	    useBootstrap: false,
				    				    	});

				    				    },
				    				 	error:function(){
				    				 		alert("Edit fail");
				    				 	}
				    				  });
				    		}
				    		else{alert("phone")}
				        	
				            
				        },
				        cancel: function () {
				            
				        },
				    }
				});
			}
		
		
		
		

	});
	
// 	=================轉換=================
	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
	
})