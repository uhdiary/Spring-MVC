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
<script type = "text/javascript" src="/lesson/resources/js/safepayjs.js"  charset='UTF-8'></script> 
<script type = "text/javascript" src="/lesson/resources/js/safepaycssjs.js"  charset='UTF-8'></script> 
<script type = "text/javascript" src="/lesson/resources/js/managersafepaylistjs.js"  charset='UTF-8'></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>관리자 안전결재 신청내역 리스트 페이지</title>
</head>
<body>
<%@ include file="/common/header.jsp"%>

 <div id="managersafepaylistDiv">
 <br/>
 
 <div id="tablabeldiv"><label id="tablabel1" class="tablabel">환불관련내역</label><label id="tablabel2" class="tablabel">안전결재내역</label>
 	<input type="button" id="btnchange" value="처리여부변경" onmouseover="forchangecolor();" onmouseout="canclechangecolor();" 
 	onclick="changeresultyn();"/></div>
 	
 <input type="hidden" id="loginid" value="${loginUser.userid}">
 <div id="subrefundformanager">
	  <div  ><br/><br/>
	    <div id="divformargin">
	    <select id="searchstandardKind" name="searchstandardKind">
		    <option value="searchrefundno">환불신청번호</option>
		    <option value="searchsafepayno">안전결재번호</option>
		    <option value="searchapplyid">신청자아이디</option>	 
		</select></div>
	    <input type="text" size="20" id="searchtextbox1"> <input type="button" value="검색" onclick="alignKindChanged();"> 
	    <input type="hidden" size="20" id="hiddensearchstandardKind"><input type="hidden" size="20" id="hiddensearchtextbox1">
	    <span id="blankspan"><label id="labelchoiceview">보기선택 </label>&nbsp;  </span>
		<select id="alignKind" name="alignKind" onchange="alignKindChanged();">
		    <option value="necessaryrefund">환불진행 필요</option>
		    <option value="completerefund">환불진행 완료</option>
		    <option value="allofrefund">환불신청 전체</option>	    
		</select>
	  </div>
    <br/>     
 	<table id="table">
 		<thead>
			<tr>
				<th class="tdrow1">환불 신청번호</th>
				<th class="tdrow2">안전결재 신청번호</th>
				<th class="tdrow3">현재상태</th>
				<th class="tdrow4">신청자아이디</th>
				<th class="tdrow5">담당선생님<br/>승인여부</th>
				<th class="tdrow5 completeYN">처리여부</th>
				<th class="tdrow5"><input type="checkbox" id="allcheck" value="thcheckbox" name="checkboxesforrefund" onclick="checkall();"/> 선 택</th>
			</tr>
		</thead>
		<tbody id="refundnotbody">
			 <c:choose> 
				 <c:when test="${fn:length(list) > 0}">  
					<c:forEach items="${list}" var="row">
						<tr>			
							<td class="tdrow1"><a href="registeredrefund.do?SPASKNO=${row.SPASKNO }">${row.REFUNDNO }</a></td>
							<td class="tdrow2">${row.SPASKNO }</td>
							<td class="tdrow3">${row.SPPROCESSVALUE }</td>
							<td class="tdrow4">${row.SPASKUSERID }</td>
							<td class="tdrow5">${row.TEACHERCONFIRMYN }</td>
							<td class="tdrow5" id="${row.REFUNDNO }">${row.RESULTYN }</td>
							<td class="tdrow5"><input type="checkbox" name="checkboxesforrefund" value="${row.REFUNDNO }" /></td>
						</tr>
					</c:forEach>
				 </c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise> 
			 </c:choose>	
		</tbody>
 	</table>
 	</div>   
 	<div id="subsafepayformanager">
 	<div ><br/><br/>
 	<div id="divformargin2">
	    <select id="searchstandardKind2" name="searchstandardKind" onchange="changedsearchstandardKind();" >
		    <option value="searchsafepayno">안전결재번호</option>
		    <option value="searchsafepayaskid">신청자아이디</option>
		    <option value="searchenddate">수업 종료일</option>	 
		</select></div>
		<div id="notsearchenddate"> <input type="text" size="20" id ="searchtextbox2">  <input type="button" value="검색" onclick="alignKindChanged2();" class="searchbtn2" >  </div>
		<div id="divforsearchenddate"> <input type="date" id ="searchdatestartinput"/> ~ <input type="date" id ="searchdateendinput"/> 
		<input type="button" value="검색" onclick="alignKindChanged2();" class="searchbtn2" > 
		 </div>
	     
	     <input type="hidden" size="20" id="hiddensearchstandardKind2"><input type="hidden" size="20" id="hiddensearchtextbox2">
	     <input type="hidden" size="20" id="hiddensearchdatestartinput"><input type="hidden" size="20" id="hiddensearchdateendinput">
	    <span id="blankspan2"><label id="labelchoiceview2">보기선택 </label>&nbsp;  </span>
		<select id="alignKind2" name="alignKind" onchange="alignKindChanged2();">
			<option value="necessarydeposite">입금진행 필요</option>	    
		    <option value="allofsafepay">안전결재 전체</option>
		    <option value="cancledsafepay">신청취소 항목</option>
		    <option value="completesafepay">최종완료 항목</option>
		    
		</select>
	  </div>
    <br/>     
 	<table id="table2">
 		<thead>
			<tr>
				<th class="tdrow1">안전결재 신청번호</th>
				<th class="tdrow2">현재상태</th>
				<th class="tdrow3">신청자아이디</th>
				<th class="tdrow4">신청일</th>
				<th class="tdrow5">수업시작일</th>
				<th class="tdrow6">수업종료일</th>
				<th class="tdrow7 completeYN">입금여부</th>
				<th class="tdrow7"><input type="checkbox" id="allcheck2" value="thcheckbox2" name="checkboxesforsafepay" onclick="checkall();"/> 선 택</th>
			</tr>
		</thead>
		<tbody id="safepaynotbody">			
		</tbody>
 	</table>	
 	</div>
 	
 	<%@ include file="/WEB-INF/include/addedbody.jspf" %>     
   <div id="pagingDiv"> ${boardPaging} </div>
	<input type="hidden" id="hiddenCurrentPage" value="${currentPage}"/>


 </div>

<%@ include file="/common/footer.jsp"%>
</body>
</html>