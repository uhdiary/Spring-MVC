<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
#msg_panel {
	margin-top: 100px;
	margin-left: 350px;
	width: 800px;
	height: 400px;
	border: 7px solid #494949;
	background: white;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#text {
	margin-top: -20px;
	margin-left: 50px;
	width: 600px;
	height: 280px;
	overflow: auto;
	margin-left: 50px;
}

::-webkit-scrollbar {
	display: none;
}

input:focus {
	outline: none;
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow: inset 0px 1px 0px 0px #f29c93;
	box-shadow: inset 0px 1px 0px 0px #f29c93;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fe1a00
		), color-stop(1, #ce0100));
	background: -moz-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -webkit-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -o-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -ms-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00',
		endColorstr='#ce0100', GradientType=0);
	background-color: #fe1a00;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #d83526;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 12px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #b23e35;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ce0100
		), color-stop(1, #fe1a00));
	background: -moz-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -webkit-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -o-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -ms-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100',
		endColorstr='#fe1a00', GradientType=0);
	background-color: #ce0100;
}

.myButton:active {
	position: relative;
	top: 1px;
}

#button {
	margin: 0 auto;
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your First WebSocket!</title>
<%@ include file="/common/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/lesson/resources/js/note/chat.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//enter event
	jQuery(document).ready(function($) {
		$("input[name=message]").keydown(function(e) {
			if (e.keyCode == 13) {
				e.cancelBubble = true;
				$("#send").click();
				$(':text([id=message])').val('');
				return false;
			}
		});

	});
</script>
</head>
<body>
	<div id="msg_panel">
		<h1 style="text-align: center;">
			과외연구소 채팅방<img src="/lesson/resources/img/note/chatting.png"
				width="50px" />
		</h1>
		<br> <input type="hidden" id="userid"
			value="${loginUser.userid }"> <input type="hidden"
			id="username" value="${loginUser.username }">

		<div id="text"></div>
	</div>
	<div id="button">
	<br>
		<input id="message" name="message" value="님이 입장하셨습니다." size="50"
			autofocus="autofocus" /> <input onclick="sendText()"
			class="myButton" id="send" value="보내기" type="button">
		<!-- <input type="button" value="나가기" onclick="exitchat()" /> -->
	</div>
	<div style="height:100px"></div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
