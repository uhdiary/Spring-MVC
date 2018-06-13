<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<html>
 <head>
  <meta charset="UTF-8">
  <title>목록 페이지</title>
  <%@ include file="/common/header.jsp"%>
  </head>
  <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.first {
	border-radius: 5px;
}

.but:hover {
	background: #00AEF0;
}

.but:active {
	position: relative;
	top: 2px;
	left: -1px;
}

.but {
	background: #464543;
	color: white;
	height: 30px;
	border: 0px;
	width:70px;
	border-radius:7px;
}

#mtitle {
	font-size: 100px;
	font-family: 'Hanna', sans-serif;
	margin-top: 60px;
	background: ${color};
	margin-left: auto;
	margin-right: auto;
	width: 70%;
	color: white;
	border-radius: 3px;
}

.bg {
	background: linear-gradient(to top, #F4F2FB, #DED8F3);
	color: #2C4162;
	box-shadow: 0 15px 20px rgba(0, 0, 0, 0.2);
	transform: translate(0, -4px);
}

#main {font-size: 20px;}
.ui-widget-header{ 
	background:linear-gradient(to right, #00AEF0, #DED8F3);
	color:white;
}  
section{color:#464543;}
.page{
	border:1px solid #EAEAEA;
	font-size:20px;
}
.page:hover{
	border:1px solid ${color};
	cursor:pointer;
	text-decoration:underline;
}
#count{
	font-size : 15px;
	color : red;
}
</style>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("table#main tr:eq(0)").css("background", "#464543")
		.css("color",	"white");
		$("table#main tr:gt(0)").not("#empty").css("color", "#464543")
		.css("font-size", "20px").hover(function() {
			$(this).addClass("bg");
		}, function() {
			$(this).removeClass("bg");
		});
		$("[class$=2]").hide();
		$("[class$=3]").hide();
		$("#page1").click(function(){
			$("[class$=2]").hide();
			$("[class$=1]").show();
			$("[class$=3]").hide();
		});
		$("#page2").click(function(){
			$("[class$=1]").hide();
			$("[class$=2]").show();
			$("[class$=3]").hide();
		});
		$("#page3").click(function(){
			$("[class$=1]").hide();
			$("[class$=2]").hide();
			$("[class$=3]").show();
		});
	    $("#search_area").on("focus", function(){
	    	$(this).attr("placeholder", ""); 
	    }).on("focusout", function(){ 
	    	$(this).attr("placeholder", "엔터 누르면 자동검색"); 
	    }).keypress(function (evt) {
	    	if (evt.keyCode == 13){ // 엔터를 누르면
	    		var word = $("#search_area").val().trim();
	    		if(word.length < 1){
	    			alert("입력값이 없음!!");
	    			return false;
	    		}
	    		$("#searchform").submit();
	    	}
	  	});
	});
</script>
<body>
<c:choose>
<c:when test="${fn:length(list) % 10 == 0}">
<c:set var = "maxpage" value = "${fn:length(list) / 10}" />
</c:when>
<c:otherwise>
<fmt:parseNumber var = "maxpage" integerOnly = "true" 
value = "${fn:length(list) / 10 + 1}"/>
</c:otherwise>
</c:choose>
<c:choose>
<c:when test="${loginUser.userco == 3}">
<h1 align="center" id="mtitle">관리자님 어서오세요!!</h1></c:when>
<c:otherwise>
<h1 align="center" id="mtitle">${tit}</h1>
</c:otherwise>
</c:choose>
<table align="center" width="70%" id="main">
	<tr align="center">
		<td width="7%" class="first">번호</td>
		<td class="first">제 목</td>
		<td class="first">아이디</td>
		<td width="12%" class="first">날 짜</td>
		<td width="7%" class="first">조회수</td>
	</tr>
	<c:choose>
	<c:when test="${fn:length(list) > 0}">
	<c:forEach items="${list}" var="row" varStatus="status">
	<fmt:parseNumber var = "pag" integerOnly = "true" 
		value = "${status.count/11+1}"/>
	<tr align="center" class = "data${pag}">
		<td>${row.TABLE_NO}</td>
		<c:url value = "sudaDetail.do" var = "detail">
		<c:param name = "tno" value = "${row.TABLE_NO}"/>
		</c:url>
		<td><a href = "${detail}">${row.TITLE}<label id = "count">
			+${comment[status.index]}</label></a>
		</td>
		<td>
		<c:choose>
		<c:when test = "${tit == '통합 수다방'}">
		${row.USERID}
		</c:when>
		<c:otherwise>익  명</c:otherwise>
		</c:choose>
		</td>
		<td><fmt:formatDate value="${row.TABLE_DATE}"/></td>
		<td>${row.SUDA_READCOUNT}</td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<tr align="center" id = "empty">
		<td colspan="5">조회된 결과가 없습니다.</td></tr>
	</c:otherwise>
</c:choose>
</table><br/>
<form action="/lesson/sudasearch.do" 
	id = "searchform" method = "post">
<input type = "hidden" name = "table_sort" value = "${table_sort}">
<table width="70%" align="center">
	<tr><td colspan="5" align="right">
		<input id="search_area" placeholder="엔터 누르면 자동검색"
		 maxlength = "15" name = "keyword" value = "${keyword}">
		<c:url value = "gotosudawrite.do" var = "write">
		<c:param name = "table_sort" value = "${table_sort}"/>
		</c:url>
		<input type="button" value="글쓰기" id="write" class = "but"
		onclick = "location.href = '${write}'"></td>
	</tr></table></form>
<table align = "center"><tr align = "center">
<c:forEach var = "page" begin = "1" end = "${maxpage}">
<td class = "page" width = "30px" id = "page${page}">${page}</td><td></td>
</c:forEach></tr>
</table><p/>
<%@ include file="/common/footer.jsp"%>
</body>
</html>