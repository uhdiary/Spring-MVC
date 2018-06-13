<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기페이지</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function insertfaq(){
	location.href="/lesson/insertfaq.do";
}
</script>

<style type="text/css">
#button1 {
	background-color:#ce0100;
	border:1px solid #d83526;
	color:#ffffff;
	font-size:13px;
	font-style:normal;
	height:28px;
	width:96px;
	text-align:center;
}

table.write {
	width: 70%;
}

table.write th {
	height: 40px
}

#boardContent {
	margin-left: 5px;
}

table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 80px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #424242;
}
table.type09 td {
    width: 500px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
#faqboardTitle{
	border:none;
}

#faqboardWrite{
	border:none;
}

#faqboardContent{
	border:none;
}

.hh{
 color: #BDBDBD;
 text-align: center;
}

</style>
</head>
<body>
<%@ include file="/common/header.jsp"%><br>
	<br>
	<br>
	<br>	
	
		<center>
		<form  name="faqboardWriteForm" action="insertfaq.do" method="post">

		<table class="type09">
			<thead>
				<tr>
					<th style="font-size:25px" scope="cols" colspan="2">글쓰기</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<th scope="row" class="hh">제목</th>
					<td><input type="text" id="faqboardTitle" name="faqboardtitle"
						size="80px" style="height: 37px; text-align: center;"></td>
				</tr>
				<tr>
					<th scope="row" class="hh">작성자</th>
				<td><input type="text" id="faqboardWrite" name="faqboardWrite"
						size="80px" style="height: 27px; text-align: center;"
						value="관리자" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="hh">내용</th>
					<td id="con"><textarea id="faqboardContent" name="faqboardcontent" rows="20" cols="50"
					    style="width: 97%; height: 97%;"></textarea></td>
				</tr>
				
			</tbody>
		</table>

		<br> <input id="button1" type="submit" value="등록" onclick="insertfaq();">
		<tr>
			<input id="button1" type=button value="취소"
				OnClick="javascript:history.back(-1)">
		</tr>
		</form>
		 <br>
   	<%@ include file="/common/footer.jsp"%>
</body>
</html>