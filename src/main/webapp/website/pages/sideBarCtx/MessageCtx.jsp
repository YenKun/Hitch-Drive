   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Car</title>

<jsp:include page="/website/pages/included/importTop.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/topNav.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/website/css/profileSidebar.css"/>" />
<!-- =========================================== -->
<!-- Msg -->

<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="/iHitch/website/css/chat/ContactsList.css">
<link rel="stylesheet" href="/iHitch/website/css/chat/ChatBox.css">

<script type="text/javascript">
// Chat Function
$(function() {
	
//================= For Massage Page Start =======================
	$("#contacts").on("click",getChatContacts);
	$("#blockList").on("click",getChatContacts);
	init();
	
	function init() {
		getChatContacts();
	}
	
	function getChatContacts() {
		var showBlock = false;
		if (this.id == "blockList" ){
			showBlock = true;
		}
		$.get("/iHitch/Chats/Contacts.controller", 
			function(data) {
				if(data.ContactInfos.length	== 0 ){
					$("#ChatContacts").text("You don't have any contacts");
				}else{
					showChatContacts(data,showBlock);
				}
			}, "json")
	}
	
	function showChatContacts(data,showBlock) {

		console.log(data);
		var msgs = data.Messages;
		var contacts = data.ContactInfos;
		
		var contextPath = "/" + $(location).attr('pathname').split("/")[1];
		var docFrag = $(document.createDocumentFragment());
		
		for (var i = 0, max = contacts.length; i < max; i++) {
			
			if (!!contacts[i].isBlocked == !!showBlock) {

				//聯絡人Row外框
				var div = $("<div></div>");
				div.addClass("container");
				//聯絡人Id
				div.append($("<span style='display:none'>" + parseInt(contacts[i].Mid) + "</span>"));
				//聯絡人頭像
				var contactsPhoto = $("<img></img>");
				contactsPhoto.attr("src", contextPath +"/Ratings/Photos.controller?Mid="+ parseInt(contacts[i].Mid))	
					.css({height:"60px"})
	 			div.append(contactsPhoto);
				//聯絡人姓名
				div.append($("<span>" + " "
						+ contacts[i].firstName + " "
						+ contacts[i].lastName + " " 
						+ "</span>"));
				//對話內容(純文字or圖片)
				if (msgs[i].content != null) {
					div.append("<p>"+ msgs[i].content + "</p>");
				} else {
					div.append("<p>You received a picture!</p>");
				}
				//對話日期與時間
				var date = new Date(msgs[i].chatDateTime);
				var time = $("<span></span>")
					time.addClass("time-right").text(date.toLocaleString());	
				div.append(time);
				
				//已讀標示
				var isRead = $("<img></img>");
				isRead.attr("src", contextPath +"/website/img/chat/newMsg.png")
					.css({width:"30px", display:"none"});
				if (msgs[i].isRead == false && parseInt(contacts[i].Mid) == msgs[i].fromMid) {
					isRead.css({display:"inline"});
				}
				div.append(isRead);
				
				//unBlock/unBlock功能icon
				var blocked = $("<img></img>");
				blocked.attr("src", contextPath +"/website/img/chat/ban.png")
						.css({width : "30px"})
						
				if (showBlock) {	
					blocked.on("click",unBlockContact);
				}else{
					blocked.on("click",blockContact);
				}	
				div.append(blocked);
				
				div.on("click", openChatBox);
				docFrag.append(div);
			}
		}
		
		$("#ChatContacts").html(docFrag);
	}
	
	function blockContact(e) {
		e.stopPropagation();
		var temp = $(this).parent("div");
		$.ajax({
			url : "/iHitch/Chats/Block.controller",
			method : "POST",
			contentType : "application/json",
			data : JSON.stringify({
						"toMid" : temp.children("span:eq(0)").text()
					}),
			dataType : "json",
			success : function(data) {
					temp.css({display:"none"});
				}
		})
	}
	
	function unBlockContact(e) {
		e.stopPropagation();
		var temp = $(this).parent("div");
		$.ajax({
			url : "/iHitch//Chats/UnBlock.controller",
			method : "DELETE",
			contentType : "application/json",
			data : JSON.stringify({
						"toMid" : temp.children("span:eq(0)").text()
					}),
			dataType : "json",
			success : function(data) {
					temp.css({display:"none"});
				}
		})
	}
//================= For Massage Page End =======================

//================= For Chat Box Start =======================
// 	啟動對話視窗
	function openChatBox() {
		cancelChatPolling();
		var contextPath = "/" + $(location).attr('pathname').split("/")[1];
		
		var contactId = $(this).children("span:eq(0)").text();
		var contactName = $(this).children("span:eq(1)").text();
		
		$(this).children("img:eq(1)").css({display:"none"});
		
		$('#chatBox').addClass('popup-box-on');
		
		$("#headContactImg").attr("src",contextPath + "/Ratings/Photos.controller?Mid=" + contactId);
		$("#headContactName").text(contactName);
		$("#headContactId").text(contactId);
		$("#errMsgSendFail").text("");
		$("#status_message").val("");
		$("#chatImg").val("");
		$("#uploadPic").attr("src", contextPath + "/website/img/chat/upload_ImgSelect.png");
		
		getChatHistory();

		chatPolling();
	}
	
	//CloseChatBox        
	$("#removeClass").click(function () {
		$('#chatBox').removeClass('popup-box-on');
		cancelChatPolling();
	});
	
	//Polling
	var pollingId;
	function chatPolling() {
		pollingId = setInterval(getChatNewMsg, 1000);
	}
	function cancelChatPolling() {
		clearInterval(pollingId);
	}
	
	//確認是否有新訊息
	function getChatNewMsg() {
		
		var contextPath = "/" + $(location).attr("pathname").split("/")[1];
		var contactId = $("#headContactId").text();

		$.ajax({
			url : contextPath + "/Chats/NewMsg.controller",
			method : "GET",
			contentType : "application/json",
			data : {
				"toMid" : contactId 
			},
			dataType : "json",
			success : function(data) {
				if(data.length != 0){
					getChatHistory();
				}
			}
		})
	} 
	
	
	function showChatNewMsg(data) {
		
		console.log("刷新對話紀錄");
		
		var contextPath = "/" + $(location).attr("pathname").split("/")[1];
		
		var contactName = $("#headContactName").text();
		var contactMid = $("#headContactId").text();

		var chats = $(document.createDocumentFragment());
		
		for (var i = 0,max = data.length; i < max; i++) {
			
			//單則對話
			var chat = $("<div></div>");
			chat.addClass("direct-chat-msg doted-border");
			//聯絡人姓名&頭象
			if ( data[i].fromMid == contactMid ) {
				var cName = $("<span></span>");
					cName.text(contactName).addClass("direct-chat-name pull-left");
				var divName = $("<div></div>");
					divName.append(cName).addClass("direct-chat-info clearfix");
				var cImg = $("<img></img>");
					cImg.attr("src", contextPath + "/Ratings/Photos.controller?Mid=" + contactMid)
					.addClass("direct-chat-img");
				chat.append(divName,cImg);
			}
			var msg = $("<div></div>");
				msg.addClass("direct-chat-text-right");
			if( data[i].fromMid == contactMid ){
				msg.addClass("direct-chat-text");
			}
			//對話內容(純文字or圖片)
			if (data[i].content != null) {
				msg.text(data[i].content);
			} else {
				var photo = $("<img></img>");
				photo.attr("src", contextPath +"/Chats/Photos.controller?chatId="+data[i].chatId);
				photo.css({width:"100px"})
				msg.append(photo);
			}
			chat.append(msg);
			
			//對話日期與時間
			var divDetail = $("<div></div>");
				divDetail.addClass("direct-chat-info clearfix");
			
			var date = new Date(data[i].chatDateTime);
			var timestamp = $("<span></span>");
				timestamp.addClass("direct-chat-timestamp pull-right")
				.text(date.toLocaleString());
			divDetail.append(timestamp);
				
			//顯示訊息已讀標示
			if ( data[i].fromMid != contactMid && data[i].isRead == true) {
				var isRead = $("<span></span>");
				isRead.addClass("direct-chat-read")
				.text("Read");
				divDetail.append(isRead);
			}
			chat.append(divDetail)
			
			//單則訊息加至對話歷史中
			chats.append(chat);
		}
		var chatBlock = $(".direct-chat-messages");
		chatBlock.append(chats);
		
	}
	
	//取得歷史對話紀錄
	function getChatHistory() {
		
		var contextPath = "/" + $(location).attr("pathname").split("/")[1];
		var contactId = $("#headContactId").text();

		$.ajax({
			url : contextPath + "/Chats/History.controller",
			method : "GET",
			contentType : "application/json",
			data : {
				"toMid" : contactId 
			},
			dataType : "json",
			success : function(data) {
				showChatHistory(data);
			}
		})
	} 
	
	function showChatHistory(data) {
		
		console.log("顯示對話紀錄");
		
		var contextPath = "/" + $(location).attr("pathname").split("/")[1];
		
		var contactName = $("#headContactName").text();
		var contactMid = $("#headContactId").text();

		var chats = $(document.createDocumentFragment());
		
		for (var i = 0,max = data.length; i < max; i++) {
			
			//單則對話
			var chat = $("<div></div>");
			chat.addClass("direct-chat-msg doted-border");
			//聯絡人姓名&頭象
			if ( data[i].fromMid == contactMid ) {
				var cName = $("<span></span>");
					cName.text(contactName).addClass("direct-chat-name pull-left");
				var divName = $("<div></div>");
					divName.append(cName).addClass("direct-chat-info clearfix");
				var cImg = $("<img></img>");
					cImg.attr("src", contextPath + "/Ratings/Photos.controller?Mid=" + contactMid)
					.addClass("direct-chat-img");
				chat.append(divName,cImg);
			}
			var msg = $("<div></div>");
				msg.addClass("direct-chat-text-right");
			if( data[i].fromMid == contactMid ){
				msg.addClass("direct-chat-text");
			}
			//對話內容(純文字or圖片)
			if (data[i].content != null) {
				msg.text(data[i].content);
			} else {
				var photo = $("<img></img>");
				photo.attr("src", contextPath +"/Chats/Photos.controller?chatId="+data[i].chatId);
				photo.css({width:"100px"})
				msg.append(photo);
			}
			chat.append(msg);
			
			//對話日期與時間
			var divDetail = $("<div></div>");
				divDetail.addClass("direct-chat-info clearfix");
			
			var date = new Date(data[i].chatDateTime);
			var timestamp = $("<span></span>");
				timestamp.addClass("direct-chat-timestamp pull-right")
				.text(date.toLocaleString());
			divDetail.append(timestamp);
				
			//顯示訊息已讀標示
			if ( data[i].fromMid != contactMid && data[i].isRead == true) {
				var isRead = $("<span></span>");
				isRead.addClass("direct-chat-read")
				.text("Read");
				divDetail.append(isRead);
			}
			chat.append(divDetail)
			
			//單則訊息加至對話歷史中
			chats.append(chat);
		}
		var chatBlock = $(".direct-chat-messages");
		chatBlock.empty();
		chatBlock.append(chats);

		//調對話框
		var scroll = $(".popup-messages");
		scroll[0].scrollTop = chatBlock[0].scrollHeight
		
	}
	
	
	//事件	變更上傳圖示
	$("#chatImg").on("change",function(){
		$("#uploadPic").attr("src","/iHitch/website/img/chat/upload_ImgReady.png");
	})
	
	//事件	發送訊息
	$("#sendMsg").on("click",function(){
		if($("#chatImg").val() != 0){
			console.log("sendPhoto");
			sendPhoto();
		}else{
			console.log("sendText");
			sendText();
		}	
	})

	function sendText() {
		var contextPath = "/" + $(location).attr('pathname').split("/")[1];
		var contactId = $("#headContactId").text();
		var chatMsg = $("#status_message").val();		
		
		$.ajax({
			url : contextPath + "/Chats/Texts.controller",
			method : "POST",
			contentType : "application/json",
			data : JSON.stringify({
				"toMid" : contactId,
				"content" : chatMsg
			}),
			dataType : "json",
			success : function(data) {
				console.log(data);
				if(data.msg == "Send Failed"){
					$("#errMsgSendFail").text("Message Failed to Send!");
				}else if(data.msg == "Send Successed"){
					$("#errMsgSendFail").text("");
					$("#status_message").val("");
					$("#chatImg").val("");
					$("#uploadPic").attr("src", contextPath + "/website/img/chat/upload_ImgSelect.png");
					getChatHistory();
				}
			}
		})	
	}
			
	function sendPhoto() {
		var contextPath = "/" + $(location).attr('pathname').split("/")[1];
		var contactId = $("#headContactId").text();
		var chatImg = $("#chatImg").prop("files")[0];
		
		var formData = new FormData();
		formData.set("file",chatImg);
		formData.set("toMid",contactId);
		console.log(formData);
		
		$.ajax({
			url : contextPath + "/Chats/Photos.controller",
			method : "POST",
//		 	contentType : "multipart/form-data",
			data : formData,
		    processData: false,
		    contentType: false,
		    enctype: 'multipart/form-data',
//		 	processData:false;
			dataType : "json",
			success : function(data, textStatus,jqXHR) {
				console.log(data);
				console.log(textStatus);
				console.log(jqXHR);
				if(data.msg == "Send Failed"){
					$("#errMsgSendFail").text(data.msg);
				}else if(data.msg == "Send Successed"){
					//刷新控制項
					$("#errMsgSendFail").text("");
					$("#status_message").val("");
					$("#chatImg").val("");
					$("#uploadPic").attr("src", contextPath + "/website/img/chat/upload_ImgSelect.png");
					getChatHistory();
				}
			}
		})
	}
//================= For Chat Box End =======================
	
})
</script>
<!-- Msg -->
<!-- =========================================== -->
</head>

<body>
<!-- <body class="animsition"> -->
	<jsp:include page="/website/pages/included/sideBarEffectTop.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/headerLoginOk.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/topNav.jsp"></jsp:include>
	<div style="width:80%;height:10px;margin:10px auto"></div>
	<div style="width: 80%; margin: 0 auto; padding-left: 40px;">
		<div class="leftSideBar"
			style="width: 15%; float: left; background-color: #f3efe0; height:100vh;">
			<div class="sec1" style="background-color: 	#FFF0F5">
			<div id="contacts" class="sideBtn type1">Contacts</div>
			<div id="blockList" class="sideBtn type1">Block List</div>
			</div>
		</div>
		<div class="profileCtx"
			style="width: 85%; float: left;height:100vh">
			<div class="innerCtx" style="width:95%;margin:0 auto;height:100vh;background-color:transparent">
			<!-- Content Start Here -->
<!-- =========================================== -->
<!-- Msg -->
<!-- ==== ChatContacts放置處 ==== -->
<div id="ChatContacts">
</div>

<!-- ==== ChatBox Start ==== -->
<div id="MessageContent">
<div class="popup-box chat-popup" id="chatBox">
<!-- ==固定不動  Head、Footer== -->
    <div class="popup-head">
		<div class="popup-head-left pull-left">
			<img id="headContactImg" src="" style="height:44px"> 
			<span id="headContactName"></span>
			<span id="headContactId" style="display:none"></span>
			<!-- ContactName -->
		</div>
		<div class="popup-head-right pull-right">
			<img id="removeClass"  src="/iHitch/website/img/chat/shutdown.png" >
   		</div>
	</div>
<!-- Msg刷新區	-->
	<div class="popup-messages">
		<div class="direct-chat-messages">
		</div>
	</div>
<!-- 切換即刷新 -->
	<div class="popup-messages-footer">
		<div style="text-align: right;vertical-align:middle;height:36px">
			<label id="errMsgSendFail" style="color:red;float:left;margin:12px 10px 6px 10px ;font-size:12px"></label>
			<label class="file">
				<img id="uploadPic" src="" style="width:30px">
				<input id="chatImg" name="file" type="file" style="display:none;">
			</label>
			<label class="file">
				Send
				<input id="sendMsg" type="button" style="display:none;">
			</label>
		</div>
		<textarea id="status_message" name="chatMsg" placeholder="Type a message..." rows="10" cols="40" ></textarea>		
	</div>
</div>		
</div>
<!-- ==== ChatBox End ==== -->
<!-- Msg -->	
<!-- =========================================== -->
			
			</div>
		</div>
	</div>

	<jsp:include page="/website/pages/included/restDiv.jsp"></jsp:include>
	<jsp:include page="/website/pages/included/importBot.jsp"></jsp:include>
<!-- sideBar -->
	<script>
		$(document).ready(function() {
			//top Nav
			$(".tb4").addClass("current");
			$(".tb4").removeClass("tb4");
			
			
			//sidebar
			var contacts = $("#contacts");
			var blockList = $("#blockList");		
			b_c();
			
			contacts.click(function(){
				b_c();			
			})
			
			blockList.click(function(){
				c_b();		
			})
			
			function c_b(){
				blockList.removeClass("sideBtn");
				blockList.removeClass("type1");
				blockList.addClass("curBtn");
				
				contacts.removeClass("curBtn");
				contacts.addClass("sideBtn");
				contacts.addClass("type1");
			}
			
			function b_c(){
				contacts.removeClass("sideBtn");
				contacts.removeClass("type1");
				contacts.addClass("curBtn");
				
				blockList.removeClass("curBtn");
				blockList.addClass("sideBtn");
				blockList.addClass("type1");
			}
			
		})
	</script>
</body>
</html>