<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 response.setDateHeader("Expires", 0);
 response.setHeader("Pragma", "no-cache");
 if (request.getProtocol().equals("HTTP/1.1")) {
  response.setHeader("Cache-Control", "no-cache");
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트  -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
a{
	text-decoration: none;
}
</style>
<script type="text/javascript">
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
history.go(1); 
}

function noEvent() { // 새로 고침 방지
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;

</script>
</head>
<body>
	<div id="header">
		<%@ include file="/common/header.jsp"%>
	</div>
	<div style="height:200px;"></div>
		<center>
		<h1>성공적으로 완료되었습니다.</h1>
		<h2><a href="/lesson/index.jsp">[메인 페이지로]</a></h2>	
</center>
<div style="height:200px;"></div>

	<%@ include file="/common/footer.jsp"%>
</body>
</html>