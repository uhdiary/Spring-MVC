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
<meta charset="UTF-8">
<title>welcome</title>
<script type="text/javascript">
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
history.go(1); 
}
</script>
</head>
<body>
<jsp:forward page="main.do"></jsp:forward>
</body>
</html>