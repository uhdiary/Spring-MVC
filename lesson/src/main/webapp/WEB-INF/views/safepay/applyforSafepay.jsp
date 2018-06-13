<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>안전결재 신청 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/safepayotherui.css'/>" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type = "text/javascript" src="/lesson/resources/js/safepayjs.js"  charset='UTF-8'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div id="applyforSafepayDiv">
	
	<div id ="safepayimgdiv"></div>
	<div id="safepayblankdiv"></div>
	<div id="applysafepayformdiv">
	<br/><br/><br/>
	
	<div id="teachercheckdiv"></div>
	
	
	<form action="safepayinsert.do" onsubmit="return checkSafepayApply();">
 	<table>		
 		<tr><td class="td1">신 청 인 :</td><td class="td2"><input type="hidden" name="spaskuserid" id="spaskuserid" value=${sessionScope.loginUser.userid}>${sessionScope.loginUser.username}</td></tr>
 		<tr><td class="td1">선 생 님 :</td><td class="td2"><input type="text" placeholder="이름" size=5 id="teachername" /> <input type="text" placeholder="아이디" size=15 name="spteacherid" id="spteacherid"/> <input type="button" value="체크" id="cehckteacherbtn" onclick="teachercheck();"/></td></tr>
 		<tr><td class="td1">과 외 비 :</td><td class="td2"><input type="text" placeholder="숫자만 입력하세요" size=14 name="studyprice" id="studyprice"/>원 </td>	</tr>
 		<tr><td class="td1">과 외 횟수 :</td><td class="td2"><input type="text" placeholder="10" size=14 name="studycount" id="studycount" />회 </td>	</tr>
 		<tr><td class="td1">과외시작일 :</td><td class="td2"><input type="date" name="startstudydate" id="startstudydate"/></td>	</tr>
 		<tr><td class="lasttd1" >과외종료일 :</td><td class="lasttd2"><input type="date" name="endstudydate" id="endstudydate"/></td>	</tr>
 	</table>
 	 <div><br/><br/> <input type="submit" value="신청하기" class="btnCssA"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소하기" class="btnCssA" onclick="clickcancle();"/></div>
 	</form>
 
 	</div>
</div>
<%@ include file="/common/footer.jsp"%>
</body>
</html>