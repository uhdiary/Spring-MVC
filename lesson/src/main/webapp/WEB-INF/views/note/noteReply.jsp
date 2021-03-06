<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<style type="text/css">
#menu {
	text-align: center;
	width: 120px;
	height: 120px;
	padding: 20px 0 0 0;
	list-style: none;
	background: #111;
	background: -moz-linear-gradient(#444, #111);
	background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #111),
		color-stop(1, #444));
	background: -webkit-linear-gradient(#444, #111);
	background: -o-linear-gradient(#444, #111);
	background: -ms-linear-gradient(#444, #111);
	background: linear-gradient(#444, #111);
	-moz-border-radius: 5px;
	border-radius: 5px;
	-moz-box-shadow: 0 2px 1px #9c9c9c;
	-webkit-box-shadow: 0 2px 1px #9c9c9c;
	box-shadow: 0 2px 1px #9c9c9c;
}

#menu a {
	color: #999;
	text-transform: uppercase;
	font: bold 14px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}

#menu li:hover>a {
	color: #fafafa;
}

#menu li:hover>ul {
	display: block;
}

/* Sub-menu */
#menu ul a:hover {
	background: #0186ba;
	background: -moz-linear-gradient(#04acec, #0186ba);
	background: -webkit-gradient(linear, left top, left bottom, from(#04acec),
		to(#0186ba));
	background: -webkit-linear-gradient(#04acec, #0186ba);
	background: -o-linear-gradient(#04acec, #0186ba);
	background: -ms-linear-gradient(#04acec, #0186ba);
	background: linear-gradient(#04acec, #0186ba);
}

/* Clear floated elements */
#menu:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
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

#top1{
height: 100px;
}

#notee {
	width: 700px;
	margin: 0 auto;
	font-family: Arial, Helvetica;
	font-size: small;
	margin-top: -80px;
}

#nav_wrap {
	position: relative;
	width: 100px;
	margin-left: 100px;
}

input:focus {
  outline: none;
}
</style>
<title></title>
<%@ include file="/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/noteView/note.css" />
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/noteView/nav_wrap.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div id="top1"></div>
<div id="nav_wrap">
		<ul id="menu">
			<li><a href="sendNote.do">쪽지쓰기</a></li>
			<p>
			<li><a href="noteReceiveList.do">받은 쪽지함</a></li>
			<p>
			<li><a href="noteSendList.do">보낸 쪽지함</a></li>
		</ul>

	</div>
	<div id="notee">
		<ul id="tabs">
			<li><a href="#" name="#tab3">답장 쓰기</a></li>
		</ul>
		<div id="content">
		<div id="tab3">
			<form action="noteWrite.do" method="post">
			<input type="submit" class="myButton" value="보내기"><br>
			<input type="hidden" name="check_no" value="${noteone.note_idx }">
				<input type="hidden" value="${loginUser.userid }" name="sendid">
				<label for="receiveid">&nbsp;&nbsp;&nbsp;&nbsp;받는 사람</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="receiveid" value="${noteone.sendid }" name="receiveid"><br>
				<textarea  style="resize: none; outline: none;" cols="80" rows="10" name="notect">RE : ${noteone.notect }</textarea>
				<input type="file" name="uploadFile">
			</form>
		</div>
		</div>
	</div>
</tbody>
</body>

	<p id="about">

		<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

		<script>
    function resetTabs(){
        $("#content > div").hide(); //Hide all content
        $("#tabs a").attr("id",""); //Reset id's      
    }
    

    var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab

    (function(){
        $("#content > div").hide(); // Initially hide all content
        $("#tabs li:first a").attr("id","current"); // Activate first tab
        $("#content > div:first").fadeIn(); // Show first tab content
        
        $("#tabs a").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("id") == "current"){ //detection for current tab
             return       
            }
            else{             
            resetTabs();
            $(this).attr("id","current"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            }
        });

        for (i = 1; i <= $("#tabs li").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
    })()
  
</script>
<div style="height:100px"></div>
	<%@ include file="/common/footer.jsp"%>
</html>