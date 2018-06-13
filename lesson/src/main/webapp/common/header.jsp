<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/lesson/resources/js/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
   $(document).ready(function() {
	   
	   $('#tupdate').hide();
	   $('#supdate').hide();
	   
      $("#note").click(function() {
         $("#notificationContainer").fadeToggle(300);
         $("#notification_count").fadeOut("slow");
         return false;
      });//
	
      //Document Click
      $(document).click(function() {
         $("#notificationContainer").hide();
      });//
      //Popup Click
      $("#notificationContainer").click(function() {
         return false
      });//
      
      var a = " ";
      var c = " ";
      $(".teacherin").click(function() {
      
    	 a = $(".login1").val();
    	 c = $('.code').val();
    	 
    	 if(a == null){
    		 alert("로그인한후 사용하세요");
    		 return false;
    	 }
    	 
    	 if(c != 2){
    		 alert(c);
    		 alert("선생님이 아닙니다.");
    		 return false;
    	 }
    	 
 		});//
      
      var loginId =" ";
      var loginCode = " ";
      $(".senrollin").click(function() {
          
        loginId = $(".login1").val();
        loginCode = $('.code').val();
         
         if(loginId == null){
            alert("로그인한후 사용하세요");
            return false;
         }
         
         if(loginCode != 1){
            alert("학생이 아닙니다.");
            return false;
         }
         
        });//
      
      /*아작스 사용해서 코드값이 선생님이고 정보가 널일경우에만 들어가게 하기*/
       var userid = $(".login1").val();
     
       var code = $('.code').val();
       
     	 if(userid != null && code == 2){
     		var count = 0;
  		$.ajax({
  			url : "teacherInOut.do",
  			type : "get",
  			data :  {
  				userid : userid
  			},
  			success : function(data) {
  				
  				if(data!= ""){
  				$('#tupdate').show();
  				$('#tupdate1').hide();
  				}
  				
  			},
  			error : function(request, status, error) {
  				
  				if(count ==1){
  				alert('선생님 정보를 등록하세요');
  				}
  			}

  		});
     	 }//
     	
     	$("#st").click(function(){
     		if("${loginUser.userid}" == "")
     	    		return true;
     	    	if("${loginUser.userco}" == "2"){
     			alert("학생들만 이용가능!!");
     	    		return false;
     	    	}
     	}); //
     	$("#tea").click(function(){
     		if("${loginUser.userid}" == "")
     			return true;
     	  	if("${loginUser.userco}" == "1"){
     			alert("선생님들만 이용가능!!");
     			return false;
     	 	}
     	});//
     	
     	if(userid != null && code == 1){
            var count = 0;
         $.ajax({
            url : "studentInOut.do",
            type : "get",
            data :  {
               userid : userid
            },
            success : function(data) {
               
               if(data!= ""){
               $('#supdate').show();
               $('#senroll').hide();
               }
               
            },
            error : function(request, status, error) {
               
               if(count ==1){
               alert('정보를 등록하세요');
               }
            }

         });
         }//
     	
     	var ggo = $(".login1").val();
     	
		$("#gogo").click(function() {
			
			if (ggo == "" || ggo == null) {
				alert("로그인 후 이용하세요!");
			} else {

				location.href = "noteReceiveList.do";
			}

		});//
		
		$("#gogo1").click(function() {

			if (ggo == "" || ggo == null) {
				alert("로그인 후 이용하세요!");
			} else {

				location.href = "chat.do";
			}

		});//
		
   });//		
		
		
		
		

  
   
   
   
   
   
   
   
   
   
   
   $(function() {
		$(".phone").hide();
		$('input[name="choiceWay"]').change(function() {

			if ($(this).val() == "phone") {

				$(".email").hide();
				$(".phone").show();
				$("#userid").text("");
				$("#emailtest").val("");
				$('#username').val("");
			} else {
				$(".phone").hide();
				$(".email").show();
				$("#userid").text("");
				$("#phonetest").val("");
				$('#username').val("");
			}
		});
		$("#aftersearch").hide();
		$("#aftersear").hide();
	});//


$('#button2').click(function() {
	console.log('asdfasdf');
});//


$(document).ready(function() {
	$('a.login-window').click(function() {

		//Getting the variable's value from a link 
		var loginBox = $(this).attr('href');

		//Fade in the Popup
		$(loginBox).fadeIn(300);

		//Set the center alignment padding + border see css style
		var popMargTop = ($(loginBox).height() + 24) / 2;
		var popMargLeft = ($(loginBox).width() + 24) / 2;

		$(loginBox).css({
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});

		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);

		return false;
	});
	$(".btn_close").click(function() {
		$('#mask , .login-popup').fadeOut(300, function() {
			$('#mask').remove();
		});

	});

	/* 		// When clicking on the button close or the mask layer the popup closed
	 $('a.close, #mask').live('click', function() { 
	 $('#mask , .login-popup').fadeOut(300 , function() {
	 $('#mask').remove();  
	 }); 
	 return false;
	 }); */
});
function loginok(){
	var id = $("#userid").val();
	var pwd =$("#userpwd").val();
	
	
	$.ajax({
		url : 'loginazax.do',
		method : 'post',
		data : {
			userid : id,
			userpwd : pwd

		},
		error : function(error) {
			
		},
		success : function(data) {
			if(data.userid!="x"){
				var logingoform = document.getElementById("logingoform");
				logingoform.action =  "login.do";           
				logingoform.submit();     
				

			}else{alert("아이디 / 비밀번호를 확인 부탁드립니다.");}
			
		}
	});
	
	
	
	
	
	
}
function loginclick() {
	$("#div-Three").hide();
	$("#div-two").hide();
	$("#aftersearch").hide();
	$("#div-one").show();
}
function showid() {
	$("#aftersearch").hide();
	$("#div-Three").hide();
	$("#div-one").hide();
	$("#div-two").show();
}
function showpassword() {
	$("#aftersearch").hide();
	$("#div-two").hide();
	$("#div-one").hide();
	$("#div-Three").show();
}
function bringId() {

	var username1 = $('#username').val();
	var email1 = $('#emailtest').val();
	var phone1 = $('#phonetest').val();
	var id = "";
	

	$.ajax({
		url : 'idfindin.do',
		method : 'post',
		data : {
			username : username1,
			emailtest : email1,
			phonetest : phone1
		},
		error : function(error) {
			alert("입력 확인 부탁드립니다.");
		},
		success : function(data) {
			$("#div-two").hide();
			$("#aftersearch").show();
			$("#uid").text(data);
		}
	});
}
function pwd() {
	var userpwd1 = $("#user-pwd1").val();
	var userpwd2 = $("#userpwd12").val();
	var userid1 = $("#lchid").val();
	
	if (userpwd1 == userpwd2) {
		location.href = "pwding.do?userid=" + userid1 + "&&userpwd=" + userpwd1;
		alert("비밀번호 변경 성공!!");
	} else {
		alert("비밀번호가 서로 일치하지 않습니다.")
	}
}

function pwdshow(){
	
		var userid1 = $("#swwuserid").val();
		var username1 = $('#swwusername').val();
		var email1 = $('#swwemailtest').val();
		var phone1 = $('#swwphonetest').val();
		var pwd = "";
		$.ajax({
			url : 'pwdfindin.do',
			method : 'post',
			data : {
				userid : userid1,
				username : username1,
				emailtest : email1,
				phonetest : phone1
			},
			error : function(error) {
				alert("입력 확인 부탁드립니다.");
			},
			success : function(data) {
				$("#div-Three").hide();
				$("#aftersear").show();
				$("#lchid").val(data);
				
				
			}
		});

}

</script>
<style type="text/css">

body {
  /*  background-color: #dedede; */
   font-family: arial;
}

#nav {
   list-style: none;
   margin: 0px;
   padding: 0px;
}

#nav li {
   float: left;
   margin-right: 20px;
   font-size: 14px;
   font-weight: bold;
}

#nav li a {
   color: #333333;
   text-decoration: none
}

#nav li a:hover {
   color: #006699;
   text-decoration: none
}

#notification_li {
   position: relative
}

#notificationContainer {
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   background-color: #fff;
   border: 1px solid rgba(100, 100, 100, .4);
   -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
   overflow: visible;
   position: absolute;
   top: 62px;
   margin-left: -185px;
   width: 400px;
   z-index: -1;
   display: none;
}

#notificationContainer:before {
   content: '';
   display: block;
   position: absolute;
   width: 0;
   height: 0;
   color: transparent;
   border: 10px solid black;
   border-color: transparent transparent white;
   margin-top: -20px;
   margin-left: 205px;
}

#notificationTitle {
   z-index: 1000;
   font-weight: bold;
   padding: 8px;
   font-size: 13px;
   background-color: #ffffff;
   width: 398px;
   border-bottom: 1px solid #dddddd;
}

#notificationsBody {
   padding: 33px 0px 0px 0px !important;
   min-height: 300px;
}

#notificationFooter {
   background-color: #e9eaed;
   text-align: center;
   font-weight: bold;
   padding: 8px;
   font-size: 12px;
   border-top: 1px solid #dddddd;
}

#notification_count {
   padding: 3px 7px 3px 7px;
   background: #cc0000;
   color: #ffffff;
   font-weight: bold;
   margin-left: 77px;
   border-radius: 9px;
   position: absolute;
   margin-top: -11px;
   font-size: 11px;
}


#nav {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

#nav li {
	float: left;
	margin-right: 20px;
	font-size: 14px;
	font-weight: bold;
}

#nav li a {
	color: #333333;
	text-decoration: none
}

#nav li a:hover {
	color: #006699;
	text-decoration: none
}

#notification_li {
	position: relative
}

#notificationContainer {
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	background-color: #fff;
	border: 1px solid rgba(100, 100, 100, .4);
	-webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
	overflow: visible;
	position: absolute;
	top: 62px;
	margin-left: -185px;
	width: 400px;
	z-index: -1;
	display: none;
}

#notificationContainer:before {
	content: '';
	display: block;
	position: absolute;
	width: 0;
	height: 0;
	color: transparent;
	border: 10px solid black;
	border-color: transparent transparent white;
	margin-top: -20px;
	margin-left: 205px;
}

#notificationTitle {
	z-index: 1000;
	font-weight: bold;
	padding: 8px;
	font-size: 13px;
	background-color: #ffffff;
	width: 398px;
	border-bottom: 1px solid #dddddd;
}

#notificationsBody {
	padding: 33px 0px 0px 0px !important;
	min-height: 300px;
}

#notificationFooter {
	background-color: #e9eaed;
	text-align: center;
	font-weight: bold;
	padding: 8px;
	font-size: 12px;
	border-top: 1px solid #dddddd;
}

#notification_count {
	padding: 3px 7px 3px 7px;
	background: #cc0000;
	color: #ffffff;
	font-weight: bold;
	margin-left: 77px;
	border-radius: 9px;
	position: absolute;
	margin-top: -11px;
	font-size: 11px;
}

/* Mask for background, by default is not display */
#mask {
	display: none;
	background: #000;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
	opacity: 0;
	z-index: 999;
}

/* You can customize to your needs  */
.login-popup {
	display: none;
	background: #333;
	padding: 10px;
	border: 2px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%;
	left: 50%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
	-webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px; /* Firefox */
	-webkit-border-radius: 3px; /* Safari, Chrome */
}

.forgot {
	text-decoration: none;
	color: #00c6ff;
	font-size: 14px;
}

img.btn_close {
	float: right;
	margin: -28px -28px 0 0;
}

.textbox {
	border: none;
}

form.signin .textbox label {
	display: block;
	padding-bottom: 7px;
}

form.signin .textbox span {
	display: block;
}

form.signin p, form.signin span, .table, form.signin {
	color: #999;
	font-size: 11px;
	line-height: 18px;
}

form.signin .textbox .input {
	background: #666666;
	border-bottom: 1px solid #333;
	border-left: 1px solid #000;
	border-right: 1px solid #333;
	border-top: 1px solid #000;
	color: #fff;
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	font: 13px Arial, Helvetica, sans-serif;
	padding: 6px 6px 4px;
	width: 200px;
}

form.signin input:-moz-placeholder {
	color: #bbb;
	text-shadow: 0 0 2px #000;
}

form.signin input::-webkit-input-placeholder {
	color: #bbb;
	text-shadow: 0 0 2px #000;
}

.button {
	background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
	background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3),
		to(#dddddd));
	background: -o-linear-gradient(top, #f3f3f3, #dddddd);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3',
		EndColorStr='#dddddd');
	border-color: #000;
	border-width: 1px;
	border-radius: 4px 4px 4px 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	color: #333;
	cursor: pointer;
	display: inline-block;
	padding: 6px 6px 4px;
	margin-top: 10px;
	font: 12px;
	width: 214px;
}

.button:hover {
	background: #ddd;
}

.ema, #uid {
	color: #999;
	font-size: 11px;
}
#uid{
	text-align: center;
}













</style>


</head>
<body>
<c:if test="${loginUser!=null}">  
					 <input type="hidden"  value="${loginUser.userid}" class="login1">
				<input type="hidden"  value="${loginUser.userco}" class="code">
				 </c:if>

  <nav class="navbar navbar-inverse navbar-fixed-top">
  
        <div class="container">
        
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <div style="float: left;top:-2px;">
           <a class="navbar-brand" href="main.do"><img src="/lesson/resources/img/main/로고완성.png" width=35px, height=30px style="position:relative; top:-3px;"></a>
          </div>
          <div style="float: left; position: relative; ">
           <a class="navbar-brand" href="main.do">과외 연구소</a>
          </div>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
    
              <li class="dropdown"><c:choose>
							<c:when test="${ sessionScope.loginUser.userco == null}">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-expanded="false">로그인 /회원가입<span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#login-box" class="login-window"
										id="beforelogin" onclick="loginclick();">로그인</a></li>
									<li><a href="enrollmenyu.do">회원가입</a></li>
								</ul>
							</c:when>
							<c:when test="${ loginUser.userco == 1 || loginUser.userco == 2}">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-expanded="false">마이 페이지 /로그아웃<span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="memberDetaView.do?userid=${loginUser.userid}" class="my">마이 페이지</a></li>
									<li><a href="logout.do" id="gomysafepay"> 로그아웃 </a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-expanded="false">관리자 페이지 /로그아웃<span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="memberDetaView.do" class="my">마이 페이지</a></li>
									<li><a href="managergo.do" class="my">관리자 페이지</a></li>
									<li><a href="logout.do" id="gomysafepay"> 로그아웃 </a></li>
								</ul>
								</c:otherwise>
						</c:choose>
              
              
              
              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">선생님 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li id="tupdate1"><a href="teacherEnrollPg.do" class="teacherin">선생님 등록</a></li>
                  <li id ="tupdate"><a href="teacherUpdate.do?userid=${loginUser.userid}" class="teacherin1">선생님 수정</a></li>
                  <li><a href="teachersearch.do">선생님 검색</a></li>
                  
                </ul>
              </li>
                <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">학생 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li id="senroll"><a href="studentenroll.do?userid=${loginUser.userid}" class ="senrollin">학생 등록</a></li>
                  <li id="supdate"><a href="studentUpdateForm.do?userid=${loginUser.userid}">학생 수정</a></li>
                  <li id="ssearch"><a href="studentsearch.do?sessionid=${loginUser.userid}">학생 검색</a></li>
                </ul>
              </li>
                  <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">수다방<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a id = "tea" href = "/lesson/teasuda.do">선생님</a></li>
				  <li><a id = "st" href = "/lesson/stsuda.do">학생</a></li>
  				  <li><a id = "all" href = "/lesson/allsuda.do">통합</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">안전과외<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
	                 <li><a href="safepayinfo.do">▶ 안전결재란?</a></li> 
	                
	                 <c:if test="${ loginUser ne null}">  
	                 		<c:choose> 
						    <c:when test="${ loginUser.userid ne 'admin'}"> 
						    <c:if test="${loginUser.userco eq 1}"> 
						 		<li><a href="applyforsafepay.do?loginuser=${loginUser.userid}">▶ 안전결재 신청</a></li> 
								</c:if>
								<li><a href="mysafepay.do" id="gomysafepay">▶ 나의 안전결재</a></li>  
					 		</c:when>
							<c:otherwise>
							    <li><a href="managerSafePayList.do">▶ 관리자 안전결재</a></li> 
							</c:otherwise>
							</c:choose> 
					 </c:if>     
                </ul>
              </li>

              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="faqboardListView.do">자주 묻는 질문</a></li>
                  <li><a href="qboardListView.do">1대1 문의하기 </a></li>
                </ul>
              </li>
              
              <a href="#" id="gogo"><img alt="" src="/lesson/resources/img/note/notee.png" style="width: 49px;"></a>
					<a href="#" id="gogo1"><img alt="" src="/lesson/resources/img/note/mainchat.png" style="width: 35px;"></a>
             
                </ul>
     
          </div><!--/.nav-collapse -->
        </div>
      </nav>
      
      <div id="login-box" class="login-popup">
		<a href="#" class="close"><img
			src="/lesson/resources/img/member/button.png" class="btn_close"
			title="Close Window" alt="Close" /></a>
		<form class="signin" method="POST" id="logingoform">
			<fieldset class="textbox" id="div-one">
				<label class="userid"> <span>ID</span> <input class="input"
					id="userid" name="userid" value="" type="text" autocomplete="on"
					placeholder="아이디">
				</label> <label class="userpwd"> <span>Password</span> <input
					class="input" id="userpwd" name="userpwd" value="" type="password"
					placeholder="비밀번호">
				</label>
				<button class="button" id="button2" type="button" onclick="loginok();">Log in</button>
				<br>
				<p>
					<a class="forgot" href="#" onclick="showid();">ID 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a class="forgot" href="#" onclick="showpassword();">password 찾기</a><br>
					<a class="forgot" href="enrollmenyu.do">회원가입</a>
				</p>
			</fieldset>
		</form>
		<div class="textbox" >
			 <form class="signin">
			<fieldset class="textbox" id="div-two">
				<table>
					<tr>
						<td class="ema"><input class="email-a" type="radio"
							name="choiceWay" id="ch1" value="email" checked>이메일 <input
							class="phone-a" type="radio" name="choiceWay" id="ch2"
							value="phone">전화번호</td>
					</tr>
				</table>
				<label class="username"> <span>name</span> <input
					class="input" id="username" name="username" value="" type="text"
					autocomplete="on" placeholder="이름"></label> <label class="email">
					<span>email</span> <input class="input email" id="emailtest" name="email"
					value="" type="text" placeholder="이메일">
				</label> <label class="phone"> <span>phone</span> <input
					class="input phone" id="phonetest" name="phone" value="" type="text"
					placeholder="전화번호"></label>

				<input class="button" id="button2" type="button" value="ID 찾기" onclick="bringId();" >
				<br>
				<p>
					<a href="#login-box" class="login-window forgot" id="beforelogin" onclick="loginclick();">로그인</a><br>
					<a class="forgot" href="#" onclick="showpassword();">password찾기</a><br>
					<a class="forgot" href="enrollmenyu.do">회원가입</a>
				</p>
				</fieldset>
				</form>
			 
		</div>
		<div class="dataView" align="center" id="aftersearch">
			<form class="signin">
			<fieldset class="textbox">
				<table>
					<tr>
						<td><label class="userpwd"><span>조회된 아이디</span></label></td>
					</tr>
					<tr>
						<td colspan="3" class="rom" id="uid"></td>
					</tr>
					<tr>
						<td colspan="2" class="labelButtonTd1"><label id="foundId"></label></td>
					</tr>
				</table>
				</fieldset>
				<button class="button" id="button1" type="button" onclick="loginclick();">로그인</button>
				<br>
					<p>
						<a class="forgot" href="#" onclick="showpassword();">password찾기</a><br>
						<a class="forgot" href="enrollmenyu.do">회원가입</a>
					</p>
			</form>
		</div>

		<div class="textbox" id="wow">
			<form class="signin" method="post">
			<fieldset class="textbox" id="div-Three">
				<table>
					<tr>
						<td class="ema"><input class="email-a" type="radio"
							name="choiceWay" id="ch1" value="email" checked>이메일 <input
							class="phone-a" type="radio" name="choiceWay" id="ch2"
							value="phone">전화번호</td>
					</tr>
				</table>
				<label class="userid"> <span>ID</span> <input class="input"
					id="swwuserid" name="userid" value="" type="text"
					autocomplete="on" placeholder="아이디"></label> <label
					class="username"> <span>name</span> <input class="input"
					id="swwusername" name="username" value="" type="text"
					autocomplete="on" placeholder="이름"></label> <label class="email">
					<span>email</span> <input class="input email" id="swwemailtest" name="email"
					value="" type="text" placeholder="이메일">
				</label> <label class="phone"> <span>phone</span> <input
					class="input phone" id="swwphonetest" name="phone" value="" type="text"
					placeholder="전화번호"></label>

				<input class="button" id="button2" type="button" value="비밀번호 찾기" onclick= "pwdshow();">
				<br>
				<p>
					<a href="#login-box" class="login-window forgot" id="beforelogin" onclick="loginclick();">로그인</a><br>
					<a class="forgot" href="#" onclick="showid();">ID찾기</a><br>
					<a class="forgot" href="enrollmenyu.do">회원가입</a>
				</p>
				</fieldset>
				</form>
			 
		</div>
		<div class="dataView" align="center" id="aftersear">
		<input type="hidden" id="lchid" value="${ loginUser.userid}">
			<form action="#" class="signin" method="post">
			<fieldset class="textbox">
				<table>
					<tr>
						<td><label class="userpwd"><span>비민번호 변경</span></label></td>
					</tr>

					<tr>
						<td colspan="3" class="rom"><input type="password"
							name="userpwd" id="user-pwd1" class="UserInfo" size="20" /></td>
					</tr>
					<tr>
						<td colspan="3" class="rom"><input type="password"
							name="userpwd1" id="userpwd12" class="UserInfo" size="20" /></td>
					</tr>
					<tr>
						<td colspan="2" class="labelButtonTd1"><label id="foundId"></label></td>
					</tr>
				</table>
				<br>
				<input class="button" type="button" value="비밀번호 변경" onclick="pwd();"> 
				<br>
				<p>
					<a class="forgot" href="#" onclick="showpassword();">password찾기</a><br>
					<a class="forgot" href="enrollmenyu.do">회원가입</a>
				</p>
				</fieldset>
			</form>
		</div>

	</div>
      
</body>
</html>