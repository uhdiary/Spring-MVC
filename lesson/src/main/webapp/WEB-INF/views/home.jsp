<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
<meta charset="utf-8" >
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/safepayotherui.css'/>" />
<title>Home</title>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<div id="mainCenterDiv"> 
	<div id="forBlank"></div>
	<form action="login.do" method="post">
	아 이 디 : <input type="text" name="userid"><br>
	암 &nbsp;&nbsp;호 &nbsp; : <input type="password" name="userpwd"><br><br>
	<input type="submit" value="로그인">
	</form>
</div>
<%@ include file="/WEB-INF/include/bottomarea.jspf"%>
</body>
</html>
