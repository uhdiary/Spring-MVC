<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type = "text/javascript" src="/lesson/resources/js/naverLogin_implicit-1.0.2.js"  charset='UTF-8'></script> 
<script type="text/javascript">

</script>
<style type="text/css">

.nel-primary {
    border-color: #3276b1;
}
.panel {
    margin-bottom: 18px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 15px;
    color: inherit;
}

body, div, form, fieldset, button {
    margin: 0;
    padding: 0;
}

h3 {
    display: block;
    font-size: 19px;
    font-weight: 400;
    margin: 20px 0;
    line-height: normal;
}
h1, h2, h3, h4 {
    font-family: "Open Sans",Arial,Helvetica,Sans-Serif;
    font-weight: 300;
    font-family: '나눔고딕',NanumGothic,NG,'돋움',Dotum,'맑은고딕','Malgun Gothic','굴림',Gulim,Helvetica,sans-serif;
    margin: 0 0 0 0;
    line-height: 120%;
}
.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 18px;
    margin-bottom: 9px;
}
h1, h2, h3, h4, h5, h6 {
    font-family: "Open Sans",Arial,Helvetica,Sans-Serif;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
h3 {
    display: block;
    font-size: 1.17em;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
}

.the-price {
    background-color: rgba(220,220,220,.17);
    box-shadow: 0 1px 0 #dcdcdc, inset 0 1px 0 #fff;
    padding: 20px;
    margin: 0;
}
.blueDark {
    background-color: #4c4f53!important;
}
td {
    font-weight: normal;
    line-height: 1.5em;
    /* font-family: "돋움", Dotum, "굴림", Gulim, Arial, AppleGothic, "애플고딕", sans-serif; */
    color: #808080;
}
body, table {
    font-size: 12px;
    line-height: 1.5em;
    font-family: '나눔고딕',NanumGothic,NG,'돋움',Dotum,'맑은고딕','Malgun Gothic','굴림',Gulim,Helvetica,sans-serif;
    color: #808080;
}
.no-padding {
    border-left: none!important;
}
.alert-warning {
    border-color: #dfb56c;
    color: #826430;
    background-color: #efe1b3;
}
.alert {
    margin-bottom: 20px;
    margin-top: 0;
    color: #675100;
    border-width: 0;
    border-left-width: 5px;
    padding: 10px;
    border-radius: 0;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
}
.table>tbody>tr>td {
    padding: 8px 10px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
.active {
    background-color: #ecf3f8;
}
.the-price h1 {
    line-height: 1em;
    padding: 0;
    margin: 0;
}
.panel-footer {
    padding: 10px 15px;
    background-color: #f5f5f5;
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 1px;
    border-bottom-left-radius: 1px;
}
.head {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-right-radius: 1px;
    border-top-left-radius: 1px;
}
.text-align-center {
    text-align: center!important;
}
.nel-primary>.head {
    color: #fff;
    background-color: #3276b1;
    border-color: #3276b1;
}
.row:after {
    clear: both;
    content: " ";
    display: table;
}
.col-6 {
    position: relative;
    min-height: 1px;
    padding-left: 13px;
    padding-right: 13px;
    width: 50%;
    float: left;
}
.no-padding table, .no-padding>table {
    border: none!important;
    margin-bottom: 0!important;
    border-bottom-width: 0!important;
}
.n, a:link, button {
    -webkit-tap-highlight-color: rgba(169,3,41,.5);
}
.btn-success {
    color: #fff;
    background-color: #739e73;
    border-color: #659265;
}
a, a:link {
    text-decoration: none;
    color: #444;
    cursor: pointer;
}
.n {
    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 13px;
    line-height: 1.42857143;
    border-radius: 2px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.n-lg {
    padding: 10px 16px;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 18px;
}
.n, a:link, button {
    -webkit-tap-highlight-color: rgba(169,3,41,.5);
}
.n-primary {
    color: #fff;
    background-color: #3276b1;
    border-color: #2c699d;
}
button {
    border: 0 none;
    background: none;
    cursor: pointer;
    font-family: '나눔고딕',NanumGothic,NG,'돋움',Dotum,'맑은고딕','Malgun Gothic','굴림',Gulim,Helvetica,sans-serif;
}
.btn-group-lg>.btn, .n-lg {
    padding: 10px 16px;
    font-size: 17px;
    line-height: 1.33;
    border-radius: 3px;
}
.visible-xs {
    display: none!important;
}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<p style="height: 40px;">
	<div style="background: #fbfbfb no-repeatcenter top;">
		<div class="main-panel">
			<h1 style="font-weight: 600; padding: 20px 0 10px 20px; color: #000;" class="hidden-xs">회원가입</h1>
			<p style="margin-laft: 20px;" class="hidden-xs">고객님께 해당되는 유형을 선택해 가입해주시기 바랍니다.</p>
			<form id="groupVal-select-form" action="#" data-use-storage="true" onsubmit="return processNext(this)">
			<div class="row aa" style="max-width: 1000px; margin:0 auto; margin-top: 30px;">
				<div class="col-6 col-4 panel">
					<div class="panel nel-primary">
						<div class="head blueDark white">
							<h3 class="title">학생 회원 등록</h3>
						</div>
						<div class="panel-body no-padding text-align-center">
							<div class="the-price">
							<div>
							<img src="${pageContext.request.contextPath}/resources/img/member/join_student_icon.png" style="width: 100px;">
							</div>
							<h1 style="font-size: 16px;padding-top: 8px;">학생 회원</h1>
							</div>
							<table class="table hidden-xs">
								<tbody>
									<tr>
										<td>무료가입 및 연결 수수료 전액무료!</td>
									</tr>
									<tr class="active">
									<td>선생님 정보 열람 & 과외신청 가능</td>
									</tr>
									<tr>
									<td>간편한 찜쪽지 시스템 및 무료 안전과외 시스템 제공</td>
									</tr>
								</tbody>
							</table>
							<table class="table visible-xs">
								<tbody>
									
								</tbody>
							</table>
						</div>
						<div class="panel-footer text-align-center" style="padding: 5px;">
						<a href="enrollView.do?userco=1" class="n btn-success" data-ajax="true" data-target-id="main-container" style="coler: white; width: 90%; height: 50px; padding-top: 14px; font-size:17px;">가입하기</a>
						<button id="facebook-login" class="n n-primary n-lg" style="width:90%;margin-top:5px;background-color: #3b5998;" onclick="return facebookLogin.facebookLogin('lesson');">
								<span class="hidden-xs"><img src="/lesson/resources/img/member/facebook.gif" class="pull-left" style="width: 24px;"> 페이스북으로 가입</span><span class="visible-xs" style="font-size: 12px;"><img src="/lesson/resources/img/member/facebook.gif" class="pull-left" style="width: 1.2em; vertical-align: top;"> 페이스북으로 가입</span>
							</button>
						<button class="n n-primary n-lg naver-login" style="width:90%;margin-top:5px;background-color: #23b200;border:none;" onclick="return naverIdLogin('lesson');">
								<span class="hidden-xs"><img src="/lesson/resources/img/member/naver.gif" class="pull-left" style="width: 20px;"> 네이버 아이디로 가입</span><span class="visible-xs" style="font-size: 12px;"><img src="/lesson/resources/img/member/naver.gif" class="pull-left" style="width: 1.2em; vertical-align: top;"> 네이버로 가입</span>
							</button>
					</div>
					</div>
				</div>
				<div class="col-6 col-4 panel">
					<div class="panel nel-primary">
						<div class="head blueDark white">
							<h3 class="title">선생님 회원 등록</h3>
						</div>
						<div class="panel-body no-padding text-align-center">
							<div class="the-price">
							<div>
								<img src="/lesson/resources/img/member/join_teacher_icon.png" style="width: 100px;">
							</div>
							<h1 style="font-size: 16px; padding-top: 8px">선생님 회원</h1>
						</div>
						<table class="table hidden-xs">
							<tbody>
								<tr>
									<td>무료 회원가입만으로 과외 홍보 기회 부여</td>
								</tr>
								<tr class="active">
									<td>신규 학생 가입시 자동 문자 알림</td>
								</tr>
								<tr>
									<td>커리큘럼 등록가능</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="panel-footer text-align-center" style="padding: 5px;">
						<a href="enrollView.do?userco=2" class="n btn-success" data-ajax="true" data-target-id="main-container" style="coler: white; width: 90%; height: 50px; padding-top: 14px; font-size:17px;">가입하기</a>
						<button id="facebook-login" class="n n-primary n-lg" style="width:90%;margin-top:5px;background-color: #3b5998;" onclick="return facebookLogin.facebookLogin('lesson');">
								<span class="hidden-xs"><img src="/lesson/resources/img/member/facebook.gif" class="pull-left" style="width: 24px;"> 페이스북으로 가입</span>
								<span class="visible-xs" style="font-size: 12px;"><img src="/lesson/resources/img/member/facebook.gif" class="pull-left" style="width: 1.2em; vertical-align: top;"> 페이스북으로 가입</span>
							</button>
						<button class="n n-primary n-lg naver-login" style="width:90%;margin-top:5px;background-color: #23b200;border:none;" onclick="return naverIdLogin('lesson');">
								<span class="hidden-xs"><img src="/lesson/resources/img/member/naver.gif" class="pull-left" style="width: 20px;"> 네이버 아이디로 가입</span>
								<span class="visible-xs" style="font-size: 12px;"><img src="/lesson/resources/img/member/naver.gif" class="pull-left" style="width: 1.2em; vertical-align: top;"> 네이버로 가입</span>
							</button>
					</div>
				</div>
				</div>
			</div>
			<div class="rom" style="padding: 50px 0 20px 0;">
				<div class="col-xs-12">
					<div class="alert alert-warning" style="max-width: 1000px; margin: 0 auto;">
						<h2 style="margin-bottom: 10px;">
							<i class="fa fa-exclamation-triangle"></i>
							회원가입 시 주의사항
						</h2>
						<P style="margin-left: 30px;">
							<i class="fa fa-caret-right"></i>
							학생 또는 선생님 회원으로 가입한 괴외연결업체는 확인 증시 해당 아이디 및 연락처 이용이 영구 정지됩니다.
						</P>
						<p style="margin-left: 30px;">
							<i class="fa fa-caret-right"></i>
							올바른 과외 문화를 만들기 위해 정확한 정보는 필수입니다. 깨끗한 과외 라이프를 선도하는 여러분이 되시길 바랍니다.
						</p>
						<p style="margin-left: 30px;">
							<i class="fa fa-caret-right"></i>
							학력 위조 및 부정확한 정보로 인해 다른 회원으로부터 신고가 들어올 경우 불량 회원으로 등록되오니 주의 바랍니다.
						</p>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>