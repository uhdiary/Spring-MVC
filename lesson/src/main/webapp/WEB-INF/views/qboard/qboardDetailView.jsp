<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의사항 내용</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
function deleteqboard(){
	var qboardno = $("#qboardno").val();
	location.href="deleteqboard.do?qboardno="+qboardno ;
}

function updateqboard(){
	var qboardno = $("#qboardno").val();
	var btntext = $("#btnupdate").val();
	if(btntext == '수정하기'){
		 $("#btnupdate").val('수정완료');
		 $("#textarea").focus();
	}else{
		var qboardcontent = $("#textarea").val();
		if(qboardcontent == null || qboardcontent == ''){
			return false;
		}

		location.href="updateqboard.do?qboardno="+qboardno + "&&qboardcontext="+qboardcontent;
	}
}


</script>
<style type="text/css">

.button1 {
	background-color:#ce0100;
	border:1px solid #d83526;
	color:#ffffff;
	font-size:13px;
	font-style:normal;
	height:28px;
	width:96px;
	text-align:center;
}


table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 caption {
    padding: 10px;
    text-align:left;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    
    
}
table.type09 tbody th {
    width: 250px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #424242;
}
table.type09 td {
  
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.hh{
 width: 200px;
 color: #BDBDBD;
 text-align: center;
}

#textarea{
	width: 530px;
	height: 300px;
}

#textarea2{
	width: 530px;
	height: 100px;
}


table.type09 .thstyle1{
width:60px;}
table.type09 .thstyle2{
width:90px;}

table.type09 .foralign{
text-align:center;}

.reply{
    font-weight: bold;
    color: #369;
}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%><br>
	<br>
	<br>

	<center>
		<input type="hidden" id="qboardno" value="${qboard.qboardno}"/>
		<table style="width: 600px;" class="type09">

			<caption style="font-size: 25px">문의사항글</caption>

			<tr>
				<th class="hh thstyle1">번호</th>
				<td class="foralign">${qboard.qboardno}</td>
				<th class="hh thstyle2">작성자</th>
				<td>${qboard.qboardwriter }</td>
				<th class="hh thstyle2">등록일</th>
				<td>${qboard.qboarddate }</td>
			</tr>

			<tr>
				<th class="hh thstyle1">제목</th>
				<td colspan="3">${qboard.qboardtitle}</td>
			
			</tr>	

			<tr>
				<th height="300px;" class="hh thstyle1">내용</th>
				<td colspan="5"><textarea id="textarea">${qboard.qboardcontent}</textarea></td>
			</tr>
		</table><br/><br/>
		
		<lable class="reply">답글</lable><br/>
		<textarea style="width:500px; height:100px;"></textarea>
		
		<br/>
	
		<c:if test="${qboard.qboardwriter eq loginUser.userid }"><br> <input class="button1" id="btnupdate" type="button" value="수정하기" onclick="updateqboard();"></c:if>
		<c:if test="${qboard.qboardwriter eq loginUser.userid || loginUser.userid eq 'admin'  }"><br> <input class="button1" type="button" value="삭제하기" onclick="deleteqboard();"></c:if>
		<c:if test="${loginUser.userid eq 'admin'}"><br> <input class="button1" id="btnreply" type="button" value="답글" onclick=""();"></c:if>
			<input class="button1" type=button value="취소" onclick="javascript:history.back(-1)">
		
		</center>
</body>
</html>