<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 페이지</title>
<%@ include file="/common/header.jsp"%>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
#realtitle {
	font-size: 100px;
	font-family: 'Hanna', sans-serif;
	margin-top: 56px;
}
.menu{
	background: red;
	width: 50px;
	color: white;
	border-radius: 5px;
}
#main td:nth-child(3n+1){background:#DED8F3;}
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
	width:77px;
	border-radius:7px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" 
 href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"
  type="text/css">
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
$(function(){
	$("#write").click(function(){
		$("#gowrite").submit();
	});
});
</script>
<body>
<c:choose>
<c:when test = "${check == 1}">
<c:set var = "action" value = "insertsuda.do"/>
<c:set var = "ts" value = "${table_sort}"/>
</c:when>
<c:otherwise>
<c:set var = "action" value = "updatesuda.do"/>
<c:set var = "ts" value = "${suda.table_sort}"/>
</c:otherwise>
</c:choose>
<h2 id = "realtitle" align = "center">글쓰기</h2>
<form action = "${action}" id = "gowrite" method = "post">
<input type = "hidden" value = "${loginUser.userid}" name = "userid">
<input type = "hidden" value = "${suda.table_no}" name = "table_no">
<input type = "hidden" value = "${ts}" name = "table_sort">
<table align = "center" id = "main" border = "6px" width = "36.5%">
<tr><td align = "center" width = "15%">제  목</td>
<td><input maxlength = "30" size = "47%" border = "0px solid white"
id = "title" name = "title" value = "${suda.title}">
</td></tr><tr><td align = "center">내  용</td><td>
<textarea rows = "20" cols = "49" style = "resize:none"
id = "story" name = "story">
${suda.story}</textarea></td></tr>
</table></form>
<c:choose>
<c:when test="${suda.table_sort == 1 || table_sort == 1}">
<c:set var = "url" value = "teasuda.do"/>
</c:when>
<c:when test="${suda.table_sort == 2 || table_sort == 2}">
<c:set var = "url" value = "stsuda.do"/>
</c:when>
<c:otherwise>
<c:set var = "url" value = "allsuda.do"/>
</c:otherwise>
</c:choose>
<table align = "center" style = "width:40%"><tr align = "center">
<td><c:choose>
<c:when test="${check == 1}">
<input type = "button" value = "작성하기" id = "write" class = "but">
</c:when>
<c:otherwise>
<input type = "button" value = "수정하기" id = "write" class = "but">
</c:otherwise>
</c:choose></td>
<td><input type = "button" value = "목록으로" class = "but"
onclick = "location.href = '${url}'"></td></tr></table><p/>
<%@ include file="/common/footer.jsp"%>
</body>
</html>