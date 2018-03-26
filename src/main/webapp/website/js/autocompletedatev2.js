/**
 * contains functions for find ride autocomplete and datepicker
 */
// creates and set options for datepicker
$("#datepicker").datepicker({
	dateFormat: "yy-mm-dd",
	constrainInput: true,
	minDate: 0,
	changeMonth: true
});


// Autocomplete functions
function autocomplete(ele, arrCity, arrDist) {
	var current = 0;
	
	ele.addEventListener('input', function(e) {
//		console.log($(ele).siblings("select"));
//	    console.log($(ele).siblings("div")[0]);
		var val = this.value.normalize(); // normalize chinese for comparing
		var valLen = val.length;
		var arrLen = arrCity.length;
		var elediv, eleitem;
		
	    /*create a DIV element that will contain the items (values):*/
		elediv = document.createElement("div");
		elediv.setAttribute("id", this.id + "autocomplete-list");
		elediv.setAttribute("class", "autocomplete-items");
		
	    /*close any already open lists of autocompleted values*/
	    closeLists();
	    if (!val) { return false;}
	    current = -1;
	    
	    var docFragment = document.createDocumentFragment();
	    docFragment.appendChild(elediv);

		$(ele).siblings("select").empty();
		optionEle = document.createElement("option");
		optionEle.innerHTML = "district";
		$(ele).siblings("select").append(optionEle);
		
	    for (var i = 0; i < arrLen; i++) {
			
	    	if (arrCity[i].toUpperCase() == val.toUpperCase()) {
				createOptions(arrDist[i]);
	    		return;
	    	}
	    	
	    	if (arrCity[i].substring(0, valLen).toUpperCase() == val.toUpperCase()) {
	    		eleitem = document.createElement("div");
	    		eleitem.innerHTML = "<b>" + arrCity[i].substring(0, valLen) + "</b>";
				eleitem.innerHTML += arrCity[i].substring(valLen);
				eleitem.innerHTML += "<input type='hidden' value='" + arrCity[i] + "'>";
					
				eleitem.addEventListener("click", function(e) {
					ele.value = this.getElementsByTagName("input")[0].value;
					
					for (var k = 0; k < arrLen; k++) {
						if (arrCity[k].toUpperCase() == ele.value.toUpperCase()) {
							createOptions(arrDist[k]);
						}
					}
					closeLists();
		    		return;
				})

				elediv.appendChild(eleitem);
	    	}
	    	
	    	function createOptions(arr) {
	    		$(ele).siblings("select").empty();
	    		
	    		for (var j = 0, len = arr.length; j < len; j++) {
		    		optionEle = document.createElement("option");
		    		optionEle.setAttribute("value", arr[j]);
		    		var optionTxt = document.createTextNode(arr[j].split(" ")[0]);
		    		optionEle.appendChild(optionTxt);
		            
		    		$(ele).siblings("select").append(optionEle);
	    		}
	    	}
		}
	    $(ele).siblings("div").append(docFragment);
	});
	
	ele.addEventListener("keydown", function(e) {
		var x = document.getElementById(this.id + "autocomplete-list");
		if (x) {
			x = x.getElementsByTagName("div");
		}
		if (e.keyCode == 40) {
			current++;
	        /*and and make the current item more visible:*/
			addActive(x);
		} else if (e.keyCode == 38) { //up
	        current--;
	        /*and and make the current item more visible:*/
	        addActive(x);
		} else if (e.keyCode == 13) {
	        /*If the ENTER key is pressed, prevent the form from being submitted,*/
			e.preventDefault();
			if (current > -1) {
	          /*and simulate a click on the "active" item:*/
				if (x) {
					x[current].click();
				}
	        }
		}
	});
	function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (current >= x.length) current = 0;
	    if (current < 0) current = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[current].classList.add("autocomplete-active");
	}
	function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
		for (var i = 0; i < x.length; i++) {
	    	x[i].classList.remove("autocomplete-active");
		}
	}
	function closeLists(element) {
	    /*close all autocomplete lists in the document,
	    except the one passed as an argument:*/
		var x = document.getElementsByClassName("autocomplete-items");
		for (var i = 0; i < x.length; i++) {
			if (element != x[i] && element != ele) {
				x[i].parentNode.removeChild(x[i]);
			}
		}
	}
	document.addEventListener("click", function (e) {
	    closeLists(e.target);
	});
}
