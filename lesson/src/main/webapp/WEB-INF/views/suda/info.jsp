<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>상세정보 페이지</title>
 </head>
 <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
#title {
	font-size: 45px;
	font-family: 'Hanna', sans-serif;
	margin-top: 56px;
}
.button{
	background:#464543;
	height:40px;
	width:70px;
	border-radius:7px;
	color:white;
	border:0px;
	font-size:15px;
}
.button:active {
	position: relative;
	top: 2px;
	left: -1px;
}
div#all{
	width:50%;
	margin-left:auto;
	margin-right:auto;
}
#sub td:nth-child(2n+1){background:#EAEAEA;}
#img{vertical-align:top;}
#date{
	font-size : 11px;
	color : #A5EDF9;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#comment_area").on("focus", function(){
    	$(this).attr("placeholder", ""); 
    }).on("focusout", function(){ 
    	$(this).attr("placeholder", "엔터 누르면 댓글입력"); 
    }).keypress(function (evt) {
    	if (evt.keyCode == 13){ // 엔터를 누르면
    		var word = $("#comment_area").val().trim();
    		if(word.length < 1){
    			alert("입력값이 없음!!");
    			return false;
    		}
    		$("#enc").submit();
    	}
  	});
});
</script>
 <body>
 <%@ include file="/common/header.jsp"%>
 <h2 id = "title" align = "center">${suda.title}</h2>
 <div id = "all"><h4>
 <table style = "width:35%" id = "sub" cellspacing = "2">
 <tr align = "center"><td align = "center">작 성 자</td><td> 
  <c:choose>
  <c:when test="${suda.table_sort == 3}">
  ${suda.userid}
  </c:when>
  <c:otherwise>익  명</c:otherwise></c:choose></td></tr>
  <tr align = "center"><td>작성날짜</td><td>${suda.table_date}</td></tr>
  <tr align = "center"><td>조  회</td><td>${suda.suda_readcount}회</td></tr>
  <tr align = "center"><td>댓  글</td><td>${fn:length(comment)}개</td>
  </tr></table><hr/>${suda.story}<hr/>댓글 목록<p/>
  <table width = "100%">
  <c:choose><c:when test="${fn:length(comment) > 0}">
  <c:forEach items="${comment}" var="row">
  <tr><td width = "10%"><c:choose>
  <c:when test="${suda.table_sort == 3}">
  ${row.USERID}</c:when>
  <c:otherwise>익  명</c:otherwise></c:choose></td>
  <td>${row.STORY}  <label id = "date">${row.COMMENT_DATE}</label>
  <c:url value = "deletecomment.do" var = "dc">
  <c:param name = "comment_no" value = "${row.COMMENT_NO}"/>
  <c:param name = "table_no" value = "${suda.table_no}"/>
  </c:url>
  <c:if test = "${loginUser.userid == row.USERID || loginUser.userco == 3}">
  <a href = "${dc}">  
  <img src="/lesson/resources/img/suda/delete.jpg" id = "img">
  </a></c:if></td></tr>
  </c:forEach></c:when><c:otherwise><tr><td colspan = "2">댓글없음
  </td></tr></c:otherwise></c:choose></table><br/>
  <form action = "entercomment.do" id = "enc">
  <input name = "comment" size = "67.8%" placeholder="엔터 누르면 자동입력"
		 maxlength = "30" id = "comment_area" autofocus>
  <input type = "hidden" name = "userid" value = "${loginUser.userid}">
  <input type = "hidden" name = "table_no" value = "${suda.table_no}">
  </form></h4>
  <c:url value = "sudaDetail.do" var = "detail">
  <c:param name = "tno" value = "${suda.table_no-1}"/>
  </c:url>
  <table width = "100%"><tr><td><c:if test="${suda.table_no != 1}">
  <input type = "button" value = "이전글" class = "button"
  onclick = "location.href = '${detail}'"></c:if>
  <c:url value = "sudaDetail.do" var = "detail2">
  <c:param name = "tno" value = "${suda.table_no+1}"/>
  </c:url>
  <input type = "button" value = "다음글" class = "button"
  onclick = "location.href = '${detail2}'"></td>
  <c:url value = "gotosudaupdate.do" var = "update">
  <c:param name = "table_no" value = "${suda.table_no}" />
  </c:url>
  <td align = "right">
  <c:if test = "${loginUser.userid == suda.userid || loginUser.userco == 3}">
  <input type = "button" value = "수정"
   class = "button" onclick = "location.href = '${update}'">
  <c:url value = "deletesuda.do" var = "delete">
  <c:param name = "table_no" value = "${suda.table_no}" />
  <c:param name = "table_sort" value = "${suda.table_sort}" />
  </c:url>
  <input type = "button" value = "삭제" class = "button"
  onclick = "location.href = '${delete}'"></c:if>
<c:choose>
<c:when test="${suda.table_sort == 1}">
<c:set var = "url" value = "teasuda.do"/>
</c:when>
<c:when test="${suda.table_sort == 2}">
<c:set var = "url" value = "stsuda.do"/>
</c:when>
<c:otherwise>
<c:set var = "url" value = "allsuda.do"/>
</c:otherwise>
</c:choose>
<input type = "button" value = "목록" class = "button"
onclick = "location.href = '${url}'">
<c:url value = "gotosudawrite.do" var = "write">
<c:param name = "table_sort" value = "${suda.table_sort}"/>
</c:url>
<input type = "button" value = "글쓰기" class = "button"
onclick = "location.href = '${write}'"></td>
</tr></table><br/></div>
  <%@ include file="/common/footer.jsp"%>
 </body>
</html>