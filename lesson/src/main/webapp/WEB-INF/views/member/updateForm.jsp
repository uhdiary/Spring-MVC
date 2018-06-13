<!-- directive(지시자) tag : page 지시자, taglib(라이브러리) 지시자, include 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page 지시자 태그는 jsp 파일안에서 한번만 사용함
	  단, import 속성은 분리해서 작성할 수 있음
 -->
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

   //비번 정규식
   $('#user-pwd').change(function () {
	  aaa($(this).val());
      });
});
function aaa(user){
	      var pwd = user;
	      var idchk =/^[a-zA-Z]{1}[a-zA-Z0-9!@#$%^*+=-]{7,11}$/; 
	      if(!idchk.test(pwd)){
	         //정규식에 만족하지 않음
	         $('#pwdLabel').text('영문로 시작하고 문자,숫자,특수문자 총 8 ~ 12자');
	         $("#wwuserpwd").css('border','3px solid red');
	         $("#wwuserpwd").focus();
	      }else{
	         $('#pwdLabel').text('');
	         $("#wwuserpwd").removeAttr('style');
	      }         
}
function memberupDate(){
	aaa();
	var userpwd = $("#wwuserpwd").val();
	var userpwd1 = $("#user-pwd1").val();
	if(userpwd == userpwd1){
		location.href="memberupDate.do";
	}else{
		alert("비밀번호가 서로 일치하지 않습니다.");
		return false;	
	}
} 
</script>
<style type="text/css">
	#joinform{
   width:825px;
   height:630px;
   margin:0 auto;
   }
   #size1{
   width:825px;
   }
    .top{
      height: 60px;
   }
   .f11{
   	border: 0px;
   }
	.h21{background-color:#D8ECF6; text-align:center; padding:10px 0; color: #464543;}
	
	.dataView table{width:100%; border-bottom:2px solid #ccc; border-collapse:collapse;}
   .dataView table th{width:99px; height:44px; border-top:1px solid #ccc; text-align:left;}
   .dataView table tr:first-child td,.dataView table tr:first-child th{border-top:2px solid #ccc;}
   .dataView th label{display:inline-block; width:99px; padding:10px 0 5px 10px;}
   .dataView table td{border-top:1px solid #ccc; padding:5px 10px;} 
   .add input[name="postal"]{width:66px;}
   .add input[name="address"]{width:400px;}
   .mobileNo input[type="text"]{width:170px;}
   .btnCenter{text-align:center; padding-top:5px;}
   .btnCenter input{width:107px; height:30px; font-weight:bold;}
   #zipcode{width:130px; height:30px;}
    .dataView table td p{font-size:12px; color:red;}
    .add{color:black;}
   .all {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	border-top-left-radius:3px;
	border-top-right-radius:3px;
	border-bottom-right-radius:3px;
	border-bottom-left-radius:3px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#000000;
	width:50px; height:50px;
	font-size:12px;
	font-weight:bold;
	text-decoration:none; text-align:center; text-shadow:1px 1px 0px #ffffff;
	}	
	.all:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
	}
</style>
</head>
<body>
 <%@ include file="/common/header.jsp"%>
    <div class="top"></div>
	<center>
	<div id="size1">
		<h1 class="h21">${ loginUser.username }님 정보 수정
		</h1>
		<form action="mupdate.do" id="joinform" onsubmit="return memberupDate();">
			<fieldset class="f11">
				<div class="dataView">
					<table class="to">
						<tbody>
							<tr>
								<th scope="row"><label for="userid">아이디 : </label></th>
								<td>${ loginUser.userid}
								<input type="hidden" name="userid" value="${ loginUser.userid}"></td>
							</tr>
							<tr>
							<th scope="row"><label for="userpwd">비밀번호 : </label></th>
							<td><input id="wwuserpwd" type="password" name="userpwd"
								required maxlength="15" autocomplete="off" placeholder="비밀번호 입력" />
								<p id="pwdLabel"></td>
							</tr>
							<tr>
								<th scope="row"><label for="userpwd1">재확인 </label></th>
								<td><input id="user-pwd1" type="password" name="userpwd1" required maxlength="15" autocomplete="off" placeholder="비밀번호 재입력" /></td>
								
							</tr>
							<tr>
								<th scope="row"><label for="user_name">이 름 : </label></th>
								<td name="username">${ loginUser.username}
								<input type="hidden" name="username" value="${ loginUser.username}"></td>
							</tr>
							<tr>
								<th scope="row"><label for="gender">성 별 : </label></th>
								<td>
									${ (loginUser.gender == 'M') ? "남자" : "여자" }
									<input type="hidden" name="gender" value="${ loginUser.gender}">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="user_no">출생년도 : </label></th>
								<td name="userno">${ loginUser.userno }
								<input type="hidden" name="userno" value="${ loginUser.userno}"></td>
							</tr>
							<tr class="email">
								<th scope="row"><label for="email">이메일</label></th>
								<td><input id="email" type="text" name="email"
									value="${ loginUser.email}" />         
                        <p id="emailLabel"> </td>
							</tr>
							<tr class="mobileNo">
								<th><label for="phone">전화번호 : </label></th>
								<td><input id="phone" type="text" name="phone" value="${ loginUser.phone}" />
								<p id="phoneLabel"></td>
							</tr>
							<tr class="add">
								<th scope="row"><label for="address">주 소 : </label>
								<td><input type="text" name="postal" id="postal" maxlength=5 value="${ loginUser.postal }" readonly> 
								<input type="button" class="all" id="zipcode" onclick="searchZipcode();" value="우편번호 검색"><br>
									<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="Postcode()" alt="접기 버튼">
								</div> 
									<p>
										<input class="add" type="text" name="address" id="address" value="${ loginUser.address }" readonly>
										<input class="add" type="text" name="address_o" id="address" value="${ loginUser.address_o }"></td>
							</tr>
					</table>
				</div>
         <div class="btnCenter">
            <a class="add"><input id="button1" type="submit" value="수  정" onclick="memberupDate()"/></a>
            <a class="add" href="/lesson/memberDetaView.do?userid=${ loginUser.userid }"><input id="button2" type="button" value="수정취소" /></a>
         </div>
			</fieldset>
		</form>
		</div>
	</center>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function searchZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
                

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%'
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 400; //우편번호서비스가 들어갈 element의 width
        var height = 460; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 2; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</body>
</html>