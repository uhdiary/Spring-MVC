<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/safepayotherui.css'/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type = "text/javascript" src="/lesson/resources/js/safepayjs.js"  charset='UTF-8'></script> 
<script type = "text/javascript" src="/lesson/resources/js/safepaystartjs.js"  charset='UTF-8'></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div id="myRefundDiv">

 	<form action="refundinsert.do" onsubmit="return checknullagain();">	
 	<table  style="border: solid 1px;">
 	<div id="errormessagediv"></div>
 	    <thead>신청자 : ${ selectedSafepayVO.SPASKUSERID}
 	    <c:if test="${loginUser.userid=='admin' }">
 	         <c:if test="${selectedRefundVO.TEACHERCONFIRMYN =='Y'}">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btnCssC"  value="환불진행 " onclick="startRefund();" />
			 </c:if>
		</c:if><br/><br/></thead> 
 	    
		<tbody>
			<tr>
				<td class="tdrow1 colortd">신청번호</td>
				<td class="tdrow4 colortd">수업시작일</td>
				<td class="tdrow5 colortd">수업종료일</td>
			    <td class="tdrow6 colortd">선생님</td>		
			</tr>
			<tr>
				<td class="tdrow1" id="tdaskno">${ selectedSafepayVO.SPASKNO} </td>
				<td class="tdrow3"><fmt:formatDate value="${ selectedSafepayVO.STARTSTUDYDATE}" pattern="yyyy-MM-dd"/></td>
				<td class="tdrow4"><fmt:formatDate value="${ selectedSafepayVO.ENDSTUDYDATE}" pattern="yyyy-MM-dd"/></td> 
				<td class="tdrow6">${ selectedSafepayVO.SPTEACHERNAME}</td>	 
			</tr>
			<tr>
				<td class="tdrow1 colortd">결재금액  </td>
				<td class="tdrow2  colortd">&nbsp;&nbsp;&nbsp;<label id="tdStudyprice">${ selectedSafepayVO.STUDYPRICE}</label>원			
				<td class="tdrow3 colortd"> 승인여부 </td>
				<td  class="tdrow6 colortd">
					<c:if test="${selectedRefundVO.SPPROCESSKIND=='askRefund' }">
						<c:choose> 
							 <c:when test="${selectedRefundVO.TEACHERCONFIRMYN =='Y'}">
							 	<c:if test="${loginUser.userid==selectedSafepayVO.SPTEACHERID }">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"   value="승인취소" onclick="cancleapproveR();" />
								</c:if>
								<c:if test="${loginUser.userid!=selectedSafepayVO.SPTEACHERID }">
									 <label class="approveyn">선생님 승인완료</label> 
								</c:if>	
							 </c:when> 
							 <c:otherwise>
								<c:if test="${loginUser.userid==selectedSafepayVO.SPTEACHERID }">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"   value="승인하기" onclick="approveRefund();" />
								</c:if>
								<c:if test="${loginUser.userid!=selectedSafepayVO.SPTEACHERID }">
									 <label class="approveyn">선생님 승인필요</label>
								</c:if>
							</c:otherwise> 
						</c:choose>
					</c:if>
			  		<c:if test="${selectedRefundVO.SPPROCESSKIND!='askRefund' }">
			  		진행완료
			  		</c:if>
				</td> 
			</tr>
			<tr>
				<td class="tdrow1">진행정도</td>
				<td class="tdrow3"> 	
					<c:choose> 
						 <c:when test="${selectedRefundVO.COMPLETESTUDYCOUNT != null}">
							<input type="text" id="finishedStudyCount" size="4" name="completestudycount"  readonly value="${selectedRefundVO.COMPLETESTUDYCOUNT}" />
						 </c:when> 
						 <c:otherwise>
							<input type="text" id="finishedStudyCount" size="4" name="completestudycount" />
						</c:otherwise> 
					</c:choose>	
				    /<input type="text" id="totalStudyCount" name="TOTALSTUDYCOUNT" value="${ selectedSafepayVO.STUDYCOUNT}" size="4" readonly>회</td>
				<td class="tdrow4">환불예상금액</td>
				<td class="tdrow6">
				     <c:choose> 
						 <c:when test="${selectedRefundVO.REFUNDPRICE != null}">
							<input type="text" id="expectedprice" name="refundprice" size="8" readonly value="${selectedRefundVO.REFUNDPRICE}" />원
						 </c:when> 
						 <c:otherwise>
							<input type="text" id="expectedprice" name="refundprice" size="8" readonly/>원
						</c:otherwise> 
					</c:choose>		
				</td>	  
			</tr>
			<tr>
				<td class="tdrow1 colortd">환불사유</td>
				<td class="tdrow3" colspan="3">
					<c:choose> 
						 <c:when test="${selectedRefundVO.REFUNDREASON != null}">
							<textarea  id="refundreason"  name="refundreason"  readonly  >${selectedRefundVO.REFUNDREASON}</textarea>
						 </c:when> 
						 <c:otherwise>
							<textarea  id="refundreason"  name="refundreason" ></textarea>
						</c:otherwise> 
					</c:choose>		
				</td>
			</tr>	 
		</tbody>
 	</table> <br/> 	
 	<input type="hidden" name="loginid" id="loginid" value="${ loginUser.userid}" />
 	<input type="hidden" name="spaskuserid" id="spaskid" value="${selectedSafepayVO.SPASKUSERID}" />
 	<input type="hidden" name="spaskno" id="spaskno" value="${selectedSafepayVO.SPASKNO}" />
 	<input type="hidden" name="studyprice" value="${selectedSafepayVO.STUDYPRICE}" />
 	<input type="hidden" id="refundno" value="${selectedRefundVO.REFUNDNO}" />
	<div>
		<c:choose> 
			 <c:when test="${selectedRefundVO.SPPROCESSKIND == 'askRefund'}">
			  <c:if test="${selectedSafepayVO.SPASKUSERID == loginUser.userid}">
				 <input type="button" class="btnCssA" value="삭제하기" onclick="cancleRefund();"/>
				 </c:if>
				 <input type="button" class="btnCssA" value="목록으로" onclick="golist();"/>		
			 </c:when> 
			 <c:when test="${selectedRefundVO.SPPROCESSKIND == 'afterRefund'}">
				 <input type="button" class="btnCssA" value="목록으로" onclick="golist();"/> 
			 </c:when>
			 <c:when test="${selectedRefundVO.SPPROCESSKIND == 'completeDeal'}">
			 <input type="button" class="btnCssA" value="목록으로" onclick="golist();"/> 
			 </c:when>
			 <c:otherwise>
				 <input type="submit" class="btnCssA" value="신청하기" />     
				 <input type="button" class="btnCssA" value="목록으로" onclick="golist();"/>
			</c:otherwise> 
		</c:choose>	
	 </div>	
 	</form>	
</div>
<%@ include file="/common/footer.jsp"%>
</body>
</html>