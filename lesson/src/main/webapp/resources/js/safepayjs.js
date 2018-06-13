// 정규식 적용. input type=Number는 !(= 경고) 가 뜬다. 충분히 자바로 커버가능하다.  경고안뜨게 자바로 제어하자.
var checknumberynprice = /^[0-9]{5,7}$/;
var checknumberyncount = /^[0-9]{1,2}$/;
var checkdateyn = /^[1-2]{1}[0-9]{3}[-]{1}[0-1]{1}[0-9]{1}[-]{1}[0-3]{1}[0-9]{1}$/;


function pay(){
	var payprice = 	$('#payprice').val();
	var email = $('#hiddenemail').val();
	var name =  $('#hiddenname').val();
	var phone = $('#hiddenphone').val();
	var address = $('#hiddenaddress').val();
	var postcode = $('#hiddenpost').val();  

	alert("결재금액 : "+ payprice+" 확인 이메일 : "+email+" 이름 : "+name+" 전화 : "+phone+" 주소 : "+address+" 우편번호 : "+postcode);

	 var IMP = window.IMP;  
	 IMP.init('imp64601859');
	 
	 IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : payprice,
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : phone,
		    buyer_addr : address,
		    buyer_postcode : postcode,
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        afterpaysuccess();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});  
}

function approveRefund(){
	if (confirm("정말 승인하시겠습니까? 승인하시면 환불예상금액이 차감되어 지급됩니다.") == true){    //확인
		var id = 	$('#loginid').val();	
		var refundno = $('#refundno').val();	
		location.href="approverefund.do?loginedid="+id+"&&refundno="+refundno;
	}else{   //취소
	    return;
	}
}

function cancleapproveR(){
	if (confirm("승인 취소하시겠습니까? ") == true){    //확인
		var id = 	$('#loginid').val();	
		var refundno = $('#refundno').val();	
		location.href="cancleapproveR.do?loginedid="+id+"&&refundno="+refundno;
	}else{   //취소
	    return;
	}
}

function checknullagain(){

	 if($("#finishedStudyCount").val()=="" ||$("#finishedStudyCount").val()==null ){ 
		 $("#errormessagediv").text("완료 횟수를 입력해주세요");	 return false; }
     if($("#refundreason").val()=="" || $("#refundreason").val()==null ){ 
    	 $("#errormessagediv").text("환불사유를 입력해주세요");	 return false; }
     if( checknumberyncount.test($("#finishedStudyCount").val())== false) { 
    	 $("#errormessagediv").text("1~99회만 가능합니다.");	 return false; }
	 return true;  
}



function cancleRefund(){
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		var id = 	$('#spaskid').val();
		var askno = $('#spaskno').val();
		var refundno = $('#refundno').val();	
		location.href="refunddelete.do?spaskid="+id+"&&spaskno="+askno+"&&refundno="+refundno;
	}else{   //취소
	    return;
	}	
}


// applyforSafepay

function clickcancle(){
	 var spaskuserid = $('#spaskuserid').val();
	 location.href="mysafepay.do?spaskuserid="+spaskuserid;
}


// 선생님 올바른정보인지 에이작스로 확인
function teachercheck(){
	var teachername = $('#teachername').val();
	var teacherid = $('#spteacherid').val();
	
	
	$.ajax({
		url : "teachercheck.do",

		type : "get",
		data :  {
			teachername : teachername,
			teacherid : teacherid
		},
		success : function(returndata) {
			if(returndata == 1) {
				$('#teachercheckdiv').text("");
				$('#teachername').attr("readonly",true);
				$('#spteacherid').attr("readonly",true);
				$('#cehckteacherbtn').attr("disabled",true);
			}else {
				$('#teachercheckdiv').text("일치하는 정보가 없습니다");
			}
			
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status + "\r\nmessage : "
						+ request.reponseText + "\r\nerror : " + error);
			}
		}

	});

}


// safepay 신청시 공백체크랑 유효성 검사하자.
function checkSafepayApply(){

	var result = true;	
	
	var cehckteacherbtn = document.getElementById("cehckteacherbtn");
	
	if( cehckteacherbtn.disabled == false) { alert("선생님 아이디를 체크해주세요"); return false;}
	
	// 하나라도 데이터 이상한거 있으면 submit 안시켜주마.
	 if(	checknullFromElement("teachername") == false  || 
			checknullFromElement("spteacherid") == false  ||
			checknullFromElement("studyprice") == false  || 
			checknullFromElement("studycount") == false  || 
			checknullFromElement("startstudydate") == false  || 
			checknullFromElement("endstudydate") == false  )
	{  result = false;	}
	 
	return result;
}


function checknullFromElement(element){
	var theID = document.getElementById(element).value ;
		
	if(theID == "" || theID == null) { 
		alert("모두 입력해 주세요.");  return false; 
	}else {
			if( element=="studyprice" ) {
				if( checknumberynprice.test(theID) == false ){
					$('#teachercheckdiv').text("금액은 1만원 이상 1000만원 미만만 가능합니다");  return false;
				}
			}else if( element=="studycount" ){	
				if(checknumberyncount.test(theID) == false ){
					$('#teachercheckdiv').text("과외횟수는 1~99회까지만 가능합니다.");  return false;	
				}
			}else if( element=="startstudydate" || element=="endstudydate" ) {
				 if( checkdateyn.test(theID) == false ){
					 $('#teachercheckdiv').text("날짜형식은 2017-01-01 와 같은 형식으로 입력해주세요.");  return false;	
				 }
			}	
	}
	$('#teacherchecklabel').text("");
	return true;
}


// mysafepayChange
function canclesafepay(){
	if (confirm("정말 취소하시겠습니까??") == true){    //확인
		var id = 	$('#hiddenid').val();
		var askno = $('#hiddenaskno').val();
		location.href="cancleSafepay.do?SPASKNO="+askno+"&&spaskuserid="+id;
	}else{   //취소
	    return;
	}
}

function afterpaysuccess(){
	var id = 	$('#hiddenid').val();
	var askno = $('#hiddenaskno').val();
	location.href="afterpaysucess.do?SPASKNO="+askno+"&&spaskuserid="+id;
}

function registeredrefund(){
	var askno = $('#hiddenaskno').val();
	location.href="registeredrefund.do?SPASKNO="+askno;
}

function gorefund(){
	var askno = $('#hiddenaskno').val();
	location.href="myRefund.do?askno="+askno; 
}

function golist(){
	var id = 	$('#loginid').val();
		if(id=='admin'){ location.href="managerSafePayList.do?spaskuserid="+"admin";}
		else{ location.href="mysafepay.do?spaskuserid="+id; }
}

function startRefund(){
	window.open('http://www.ibk.co.kr', '_blank'); 
}


