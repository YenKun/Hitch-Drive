/** Star */
$(document).ready(function(){
	var score = new score();
	score.setLen(5);
	
	$(".star").on("click",score.mClick)
			.on("mouseover",score.mOver)
			.on("mouseout",score.mOut);
	
	function score() {
		this.len;
		this.checked;
		this.point = 0;
		this.setLen = setScoreLen;
		this.setChecked = setChecked;
		this.mOver = mouseOver;
		this.mOut = mouseOut;
		this.mClick = mouseClick;
	}
	
	function setScoreLen(len) {
		this.len = len;
		this.setChecked();
	}
	
	function setChecked() {
		this.checked = new Array(this.len);
		for (var i = 0; i < this.len; i++) {
			this.checked[i] = true;
		}
	}

	
	function turnOn(tr,index) {
		for (var i = 0; i <= index; i++) {
			if (score.checked[i]) {
				$(tr.find("img")[i]).css({"-webkit-filter": "grayscale(0)"});
			}
		}
	}
	
	function turnOff(tr,index) {
		for (var i = 0; i <= index; i++) {
			if (score.checked[i]) {
				$(tr.find("img")[i]).css({"-webkit-filter": "grayscale(1)"});
			}
		}
	}
	
	function mouseOver() {
		var index = $(this).parent("td").prop("cellIndex");
		var tr = $(this).parents("tr");
		turnOn(tr,index);
	}

	function mouseOut() {
		var index = $(this).parent("td").prop("cellIndex");
		var tr = $(this).parents("tr");		
		turnOff(tr,index);
	}

	function mouseClick() {
		var index = $(this).parent("td").prop("cellIndex");
		var tr = $(this).parents("tr");
		var point = tr.children("td:eq(5)");
		
		console.log(point);
		
		if(score.checked[index]){
			turnOn(tr,index);
			check(index);
			point.text(index + 1);
		}else if(index < score.len-1 && !score.checked[index+1] ){
			uncheck(score.len);
			turnOff(tr,score.len);
			turnOn(tr,index);
			check(index);
			point.text(index + 1);
		} else {
			uncheck(score.len);
			turnOff(tr,score.len);
			point.text(0);
		}

		function check(index) {
			for (var i = 0; i <= index; i++) {
				score.checked[i] = false;
			}
		}
		function uncheck(index) {
			for (var i = 0; i < index; i++) {
				score.checked[i] = true;
			}
		}
	}
	
});
