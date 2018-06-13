<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 안전결재 내역 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/safepayotherui.css'/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type = "text/javascript" src="/lesson/resources/js/safepayjs.js"  charset='UTF-8'></script> 
<script type = "text/javascript" src="/lesson/resources/js/safepaycssjs.js"  charset='UTF-8'></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div id="mysafepaylistDiv">
    <div id="forBalnksmall"></div>
 	<table  id="table">
 		<thead>
			<tr>
				<th class="tdrow1">신청번호 </th>
				<th class="tdrow2">상태</th>
				<th class="tdrow3">신청일</th>
				<th class="tdrow4">수업시작일</th>
				<th class="tdrow5">수업종료일</th>
				<c:if test="${loginUser.userid=='user21' }">
					<th class="tdrow6">학생</th>
				</c:if>
				<c:if test="${loginUser.userid !='user21' }">
					<th class="tdrow6">선생님</th>
				</c:if>		
			</tr>
		</thead>
		<tbody>
			 <c:choose> 
				 <c:when test="${fn:length(list) > 0}">  
					<c:forEach items="${list}" var="row">
						<tr>
							<td class="tdrow1">${row.SPASKNO }</td>	
							<td class="tdrow2"><a href="changeSafepay.do?SPASKNO=${row.SPASKNO }" >${row.SPPROCESSVALUE }</a></td>	
							<td class="tdrow3"><fmt:formatDate value="${row.SPENROLLDATE }" pattern="yyyy-MM-dd"/></td>
							<td class="tdrow4"><fmt:formatDate value="${row.STARTSTUDYDATE }" pattern="yyyy-MM-dd"/></td>
							<td class="tdrow5"><fmt:formatDate value="${row.ENDSTUDYDATE }" pattern="yyyy-MM-dd"/></td>			
							<c:if test="${loginUser.userid=='user21' }">
								<td class="tdrow6">${row.SPSTUDENTNAME }</td>
							</c:if>
							<c:if test="${loginUser.userid !='user21' }">
								<td class="tdrow6">${row.SPTEACHERNAME }</td>
							</c:if>	
						</tr>
					</c:forEach>
				 </c:when>
				 <c:otherwise>
					<tr>
						<td colspan="6" style="text-align : center;">조회된 결과가 없습니다.</td>
					</tr>
				 </c:otherwise> 
			 </c:choose>	
		</tbody>
 	</table>
 	  <%@ include file="/WEB-INF/include/addedbody.jspf" %>   <br/>   
  <div id="pagingDiv"> ${boardPaging} </div>
  <input type="hidden" id="hiddenCurrentPage" value="${currentPage}"/>
</div> 
<%@ include file="/common/footer.jsp"%>
</body>
</html>