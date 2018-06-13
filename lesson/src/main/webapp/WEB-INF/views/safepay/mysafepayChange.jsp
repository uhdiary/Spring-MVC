<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/safepayotherui.css'/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type = "text/javascript" src="/lesson/resources/js/safepayjs.js"  charset='UTF-8'></script>
<title>내안전결재정보변경</title>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div id="mysafepayChangeDiv">
   <br/><br/><br/>
   <label> [ 현재 상태 : ${ selectedSafepayVO.SPPROCESSVALUE}  ]</label><br/><br/><br/>
 	<table>																		 
 		<tr><td class="td1">신 청 인 :</td><td class="td2"><label>  ${ selectedSafepayVO.SPASKUSERID}  </label></td></tr>
 		<tr><td class="td1">선 생 님 :</td><td class="td2"><input type="text" name="teachername" value=${ selectedSafepayVO.SPTEACHERNAME} size=5  readonly/> <input type="text" value=${ selectedSafepayVO.SPTEACHERID} size=15 readonly/></td></tr>
 		<c:if test="${loginUser.userid==selectedSafepayVO.SPTEACHERID }">								
 		<tr><td class="td1">입금 계좌 :</td><td class="td2"><input type="text" name="bankformoney" size="4" readonly value= "${loginUser.accountname}"  />&nbsp;&nbsp;<input type="text" name="accountformoney"  readonly value= "${loginUser.accountno}"/></td>	</tr>
 		</c:if>	
 		<tr><td class="td1">과 외 비 :</td><td class="td2"><input type="text" id="payprice" name="studyprice" value=${ selectedSafepayVO.STUDYPRICE} size=14 readonly/>원 </td>	</tr>
 		<tr><td class="td1">과 외 횟수 :</td><td class="td2"><input type="text" value=${ selectedSafepayVO.STUDYCOUNT} size=14 readonly/>회 </td>	</tr>
 		<tr><td class="td1">과외시작일 :</td><td class="td2"><input type="date" name="startstudydate" value=${ selectedSafepayVO.STARTSTUDYDATE}  readonly /></td>	</tr>
 		<tr><td class="lasttd1">과외종료일 :</td><td class="lasttd2"><input type="date" name="endstudydate"value=${ selectedSafepayVO.ENDSTUDYDATE}  readonly/></td>	</tr>
 	</table>
 	  <input type="hidden" id="hiddenaskno" name="spaskno"   value="${ selectedSafepayVO.SPASKNO}" />
 	  <input type="hidden" id="loginid"      value="${loginUser.userid}" />
 	  <input type="hidden" id="hiddenemail"   value="${loginUser.email}" />
 	  <input type="hidden" id="hiddenname"    value="${loginUser.username}" />
 	  <input type="hidden" id="hiddenphone"   value="${loginUser.phone}" />
 	  <input type="hidden" id="hiddenaddress" value="${loginUser.address}" />
 	  <input type="hidden" id="hiddenpost"    value="${loginUser.postal}" />
 	  <div id="div1"><br/><br/>
 	  <c:if test="${loginUser.userid eq selectedSafepayVO.spaskuserid}"> 
 	 <c:choose> 
 	  	
		 <c:when test="${ selectedSafepayVO.SPPROCESSVALUE=='신청중'}">  
			 <input type="button" value="결재하기" class="btnCssA" onclick="pay();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="신청취소" class="btnCssA" onclick="canclesafepay();"/>
		 </c:when>
		 <c:when test="${ selectedSafepayVO.SPPROCESSVALUE=='결재완료'}">  
			<input type="button" value="환불신청" class="btnCssA" onclick="gorefund();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="목록으로" class="btnCssA" onclick="golist();" /> 
		 </c:when>
		 <c:when test="${ selectedSafepayVO.SPPROCESSVALUE=='환불신청취소'}">  
			<input type="button" value="환불신청" class="btnCssA" onclick="gorefund();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="목록으로" class="btnCssA" onclick="golist();" /> 
		 </c:when>
		 <c:when test="${ selectedSafepayVO.SPPROCESSVALUE=='환불신청중'}">  
			<input type="button" value="내역보기" class="btnCssA" onclick="registeredrefund();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="목록으로" class="btnCssA" onclick="golist();" /> 
		 </c:when>
		 <c:when test="${ selectedSafepayVO.SPPROCESSVALUE=='환불완료'}">  
			<input type="button" value="내역보기" class="btnCssA" onclick="registeredrefund();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="목록으로" class="btnCssA" onclick="golist();" /> 
		 </c:when>
		<c:otherwise>
			 <input type="button" value="마이페이지" class="btnCssA" onclick="gomypage();"/> &nbsp;&nbsp;&nbsp; <input type="button" value="목록으로" class="btnCssA" onclick="golist();"/> 
		</c:otherwise> 
	  </c:choose>
	  </c:if>
	  	<br/><br/>
	  	</div>		  
 </div>
 <%@ include file="/common/footer.jsp"%>
</body>
</html>