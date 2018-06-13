/**
 * 
 */
/**
 * 
 */

$(function() {
	var userid = $('#userid').val();
	console.log(userid);
	var wsuri = "ws://192.168.20.123:8800/lesson/tong"; // 서버주소 tong 핸들러위치
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendText();
	}
	websocket.onmessage = function(event) {
		msg = JSON.parse(event.data);
		if (msg.command == "message") {
			switch (msg.type) {
			case "event": {
				var text = msg.id + " : " + msg.message
				writeToScreen(text);
				$('#text').scrollTop($('#text')[0].scrollHeight);
				break;
			}
			}
		}
	}
	
})

// Send text to all users through the server
function sendText() {
	// Construct a msg object containing the data the server needs to process
	// the message from the chat client.
	/*var id = "<div id='my'>" + $('#username').val() + " : " + $('#message').val() + "</div>";
	writeToScreen(id);*/

	var msg = {
		type : "message",
		text : $('#message').val(),
		id : $('#username').val(),
		date : Date.now()
	};
	console.log(msg.type);
	console.log(msg.id)
	console.log($('#userid').val());
	// Send the msg object as a JSON-formatted string.
	websocket.send(JSON.stringify(msg));
	$('#message').val("");
	$('#text').scrollTop($('#text')[0].scrollHeight); 
	console.log('서버로 메시지 전송');
	// Blank the text input element, ready to receive the next line of text from
	// the user.
	/* $('#text').val(""); */
}

function writeToScreen(message) {
	var pre = document.createElement("p");
	console.log(pre);
	pre.style.wordWrap = "break-word";
	pre.innerHTML = message;

	text.appendChild(pre);
}
function exitchat() {
	console.log('나가기');
	websocket.close();
}
