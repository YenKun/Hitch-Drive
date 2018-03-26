$(document).ready(function() {
	$("#submit").on("click",function(){
		var datas = JSON.stringify($("#form").serializeObject());   
		console.log(datas)
		$.ajax({
			 	url: "/iHitch/edit/changePswd.controller",
			    method: 'put',
			    data:datas,
			    datatype: "json",
			    contentType:'application/json',
			    success: function(data)
			    {	console.log(data);
			    	$("#msg").text(data.er001);
			    	},
			 	error:function(data){
			 		alert("Edit fail");
			 	}
			  });
	});
	
	
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