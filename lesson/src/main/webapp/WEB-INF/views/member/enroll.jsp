<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#genderm").click(function() {
    	$("#fieldsetm").css("background-color","#D8ECF6");
    	$("#fieldsetf").css("background-color","White");
    });  
    $("#genderf").click(function() {
    	$("#fieldsetf").css("background-color","#D8ECF6");
    	$("#fieldsetm").css("background-color","White");
    });
    for(i=2017; i>1917; i--){
        $("select").append("<option>" + i + "</option>");
    } 
    
  //아이디 정규식
    $('#user-id').change(function () {
       var id = $(this).val();
       var idchk =/^[a-zA-Z]{1}[a-zA-Z0-9]{3,14}$/;  
       if(!idchk.test(id)){
          //정규식에 만족하지 않음
          $('#idLabel').text('첫글자는 영문으로  영문,숫자 최소 4글자 최대 15글자');
          $(this).css('border','1px solid red');
          $(this).focus();
       }else{
          $('#idLabel').text('');
          $(this).css('border','1px solid black');
       }         
    });
    
    //비번 정규식
    $('#user-pwd').change(function () {
       var pwd = $(this).val();
       var idchk =/^[a-zA-Z0-9!@#$%^*+=-]{8,12}$/; 
       if(!idchk.test(pwd)){
          //정규식에 만족하지 않음
          $('#pwdLabel').text('특수문자 포함 문자,숫자,특수문자 총 8 ~ 12자');
          $(this).css('border','1px solid red');
          $(this).focus();
       }else{
          $('#pwdLabel').text('');
          $(this).css('border','1px solid black');
       }         
    });
  	
    //이름 정규식
    $('#username').change(function () {
       var name = $(this).val();
       var idchk =/^[가-힣]{1}[가-힣]{1,3}$/; 
       if(!idchk.test(name)){
          //정규식에 만족하지 않음
          $('#nameLabel').text('한글 이름 2자~ 4자');
          $(this).css('border','1px solid red');
          $(this).focus();
       }else{
          $('#nameLabel').text('');
          $(this).css('border','1px solid black');
       }         
    });
 });
function checkDupId(){
	var id = $("#user-id").val();
	
	 $.ajax({
         url : 'idcheck.do',
         method : 'post',
         data : {
         	userid : id,
               },  
               error:function(error){
             	alert("에러");  
               },
         success : function(data) {
        	 
        	if(data != ""){
		            	alert("이미 아이디 사용중 입니다.")
        	}   	
        	
        	
		            	
		               } 
         });
	
}

function pwd(){
	var userpwd = $("#user-pwd").val();
	var userpwd1 = $("#user-pwd1").val();
	var userid1 = $("#user-id").val();
	
	if(userpwd == userpwd1){
		location.href="pwding.do?userid=" + userid +"&& userpwd=" + userpwd;
	}else{
		alert("비밀번호가 서로 일치하지 않습니다.");
	}
} 
</script>
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="estilos.css">
<style type="text/css">
#joinform {
	width: 415px;
	height: 620px;
	margin: 0 auto;
}

input[type=radio] {
	width: 30px;
	border: 3px;
	display: none;
}
.ii{
	border: 1px solid black;
}
 .tt{
	position:relative;
	top:12px;
	left: 10px;
}

input[type=image] {
	float: right;
	width: 55px;
	min-height: 65%;
	border: 1px solid;
}

input[type=image]:HOVER{
	border: 2px solid red;
}
.f1 {
	border: none;
	width: 100%;
}
.dataView table {
	width: 100%;
	border-collapse: collapse;
}

.dataView input{
	height: 40px;
	font-weight: bold;
}
.ta{
	width: 390px;
	
}

img{width:40px; height:40px;}

.dataView .ge {
	width: 50px;
	height: 45px;
	margin: 0 auto;
	border: 1px solid;
}

.btnCenter {
	text-align: center;
	padding-top: 5px;
}
.dataView .ge, .it{float: left; }
.btnCenter input{
	width: 107px;
	height: 30px;
	font-weight: bold;
}
.userno{
	width: 390px;
	height: 40px;
}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<p style="height: 60px;">
	<form action="minsert.do" id="joinform" method="post" onsubmit="return enroll();">
	<input type="hidden" value="${userco}" name="userco" >
		<fieldset class="f1">
			<legend>
				<span class="span1">기본 정보</span>
			</legend>
			<div class="dataView">
				<table summary="아이디, 비밀번호, 재확인, 이름, 출생년도 등의 정보를 입력합니다.">
					<tbody>
						<tr>
							<th><label for="userid"><img src="/lesson/resources/img/member/NAME.jpg"></label></th>
							<td class="in-line" colspan="2"><input style="width: 335px;" class="it ii" id="user-id" type="text"name="userid" required maxlength="15" placeholder="아이디" />
							<input type=image src="/lesson/resources/img/member/Search.jpg"  onclick="checkDupId();" /></td>
						</tr>
						<tr>
							<th>
							<label for="userpwd"><img src="/lesson/resources/img/member/PWD.jpg"></label></th>
							<td scope="row"><input class="ta it ii" id="user-pwd" type="password" name="userpwd" required maxlength="15" autocomplete="off" placeholder="비밀번호" />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="userpwd1"><img src="/lesson/resources/img/member/PWD.jpg"></label></th>
							<td><input class="ta it ii" id="user-pwd1" type="password" name="useripwd1" required maxlength="15" autocomplete="off" placeholder="비밀번호 확인" />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="user_name"><img src="/lesson/resources/img/member/NAME.jpg"></label></th>
							<td scope="row" >
							<input style="width: 290px;" id="username" class="it ii" type="text" name="username" required maxlength="15" placeholder="이름" />
								<fieldset class="ge" id="fieldsetm">
									<input type="radio" class="genderm" id="genderm" name="gender" checked="checked" value="M">
									<label class="tt" for="genderm"class="btn">남자</label>
								</fieldset>
								<fieldset class="ge" id="fieldsetf">
									<input type="radio" id="genderf" name="gender" value="F">
									<label class="tt" for="genderf" class="btn" id="labelf">여자</label>
								</fieldset>
								</td>
						</tr>
						<tr>
							<th class="row"><label for="user_no">
							<img src="/lesson/resources/img/member/DATE.jpg"></label></th>
							<td><select class="userno it ii" name="userno" id="userno">
                                            <option value="">출생년도</option>                                 
                                            </select>
								</td>
						</tr>
						<tr class="add">
							<th scope="row"><label for="address"><img src="/lesson/resources/img/member/address.jpg"></label>
							<td class="in-line" style="cell-spacing:0px;"><input style="width: 260px;" class="it ii" type="text" id="address" name="address" readonly >
							<input style="width: 75px;" type="text" name="postal" id="postal" class="it ii" readonly >
							<input type="image" src="/lesson/resources/img/member/Search.jpg" onClick="use();return false;" />
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="Postcode()" alt="접기 버튼">
								</div> 
								</td>
						</tr>
						<tr>
							<th scope="row"><label for="address_o"><img src="/lesson/resources/img/member/address.jpg"></label>
							<td><input class="ta it ii" type="text" name="address_o" id="address_o"placeholder="상세주소" />
								</td>
						</tr>
						<tr class="email">
							<th scope="row"><label for="email"><img src="/lesson/resources/img/member/Email.jpg"></label></th>
							<td><input class="ta it ii" id="email" type="text" name="email" placeholder="이메일" />
								</td>
						</tr>
						<tr class="mobileNo">
							<th><label for="phone"><img src="/lesson/resources/img/member/phone.jpg"></label></th>
							<td><input class="ta it ii" id="phone" type="text" name="phone" maxlength="20" placeholder="휴대전화" />
								</td>
						</tr>
						<tr class="bank">
							<th><label for="accountname"><img src="/lesson/resources/img/member/Bank.jpg"></label></th>
							<td><input class="ta it ii" id="accountname" type="text" name="accountname" placeholder="은행명" />
								</td>
						</tr>
						<tr class="account">
							<th><label for="accountno"><img src="/lesson/resources/img/member/account.jpg"></label></th>
							<td><input class="ta it ii" id="accountno" type="text" name="accountno" placeholder="계좌번호" />
								</td>
						</tr>
					</tbody>
				</table>
			</div>
		</fieldset>
		<br />
		<div class="gon123"></div>
		<div class="btnCenter">
			<input id="button1" type="button" href="enrollmenyu.do" value="< 이전" OnClick="openNew()" />
			<input id="button2" type="submit" value="회원가입 > " onclick="pwd();"/>
		</div>
	</form>
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

    function use() {
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