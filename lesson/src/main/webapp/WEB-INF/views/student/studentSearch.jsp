<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/lesson/resources/css/common.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#allCheck").change(function(){
				
		if($("#allCheck").prop("checked")){
			/* for(var i = 0; i < rowCnt; i++){
				if(chkObj[i].type=="checkbox")
					chkObj[i].checked = true;
			} */
			$("input[type=checkbox]").prop("checked", true);
		} else {
			/* for(var i=0; i<= rowCnt; i++){
				if(chkObj[i].type=="checkbox"){
					chkObj[i].checked=false;
				}
			} */
			$("input[type=checkbox]").prop("checked", false);
		}
	});
});

	function subPre(){
		document.getElementById('currentPage').value = '${map.currentPage -1}';
		document.getElementById('searchform').submit();
	}
	function subNum(num){
		document.getElementById('currentPage').value = num;
		document.getElementById('searchform').submit();
	}
	function subNext(){
		document.getElementById('currentPage').value = '${map.currentPage +1}';
		document.getElementById('searchform').submit();
	}
		
	$(function() {
		$(".he2").hide();
		$(".hed").hide();  
		
		$(".he1").click(function() {
			$(".hed").show();
			$(".he1").hide();
			$(".he2").show();
			document.getElementById('toggle').value = '2'

			$(".searchtop").css("height", "720px");

		});
		
		$(".he2").click(function() {
			$(".hed").hide();
			$(".he1").show();
			$(".he2").hide();
			document.getElementById('toggle').value = '1'

			$(".searchtop").css("height", "380px");

		});
		
		/* $('.slef1').on('click',function(){
			var a = $('.slef1').text();
			alert(a);
			
		});
		 */
	
	});
	
	function search() {
		document.getElementById('searchform').submit();
	}
	
	function fn_Del(){
		var userid="";
		/* var memberChk= document.getElementByName("RowCheck"); */
		var memberChk = $("[name=RowCheck]");
		var chked = false;
		var indexid = false;
		
		for(i=0; i<memberChk.length;i++){
			if(memberChk[i].checked){
				if(indexid){
					userid = userid +'-';
				}
				userid = userid+memberChk[i].value;
				indexid = true;
			}
		}
		if(!indexid){
			alert("삭제할 사용자를 체크해 주세요");		
			return false;
		}
		document.getElementById('sbuserid').value = userid;
				
		var agree= confirm("삭제 하시겠습니까?");
		if(agree){			
			 document.getElementById('delForm').submit();
		}	
		
}
	
</script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
#footer{
	width:100%;
	float:left;
}

.sebody {
	padding: 10px;
	font-family: 'Nanum Gothic', sans-serif;	
}

.inpu {
	width: 255px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 17px;
}

.searchtop {
	height: 380px;
	width: 270px;
	border: 2px solid #4D4F50;
	float: left;
	border-radius: 3px; 
/* 	background: #EAEAEA; */
}

.la1 {
	font-size: 15px;
}

.searchname {
	background: #7A7A7A;
	color: white;
	height: 70px;
	padding: 0.1px;
	font-weight: bold;
}

.searchinfo {
	height: 800px;
	margin-left:7px;
	float: left;
}

.button1 {
	background: #7A7A7A;
	width: 170px;
	height: 50px;
	color: white;
	font-size: 30px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
	
}

.button2 {
	background: #7A7A7A;
	width: 80px;
	height: 40px;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
	
}
.title{
	width: 70px;
	font-size: 20px;
	color: #7A7A7A;	
}
.button1:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}

.button2:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}


.he1 {
	margin-top: 15px;
	float: right;
}

.he2 {
	margin-top: 15px;
	float: right;
}

.he1:HOVER {
	color: red;
}

.he2:HOVER {
	color: red;
}

.hed {
	display: none
}

.price1 {
	width: 117px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 20px;
}

.inpu:HOVER {
	border: 2px solid #FF4239;
}
td span{
padding: 7px;
}
.table1{
width: 750px;
font-style:oblique;
table-layout: fixed;
}

#table1_td1 td{
height:25px;
/*background-color:#7A7A7A; */
background-color:#dddddd;
font-size: 15px;
/* color:white; */
color: #7A7A7A;
border: 1px solid white; 
}

#table1_td2 td {
background-color:white;
border-top: 1px solid #7A7A7A;
border-bottom: 1px solid #7A7A7A;
color: #7A7A7A;
}
#paging td{
text-align: center;
font-size: 15px;
color:#7A7A7A;
margin: 5px;
padding: 10px;

}

a:hover {
color: red;
}

</style>

</head>

<body>
	<div id="container">
		
		<div id="header">
		<%@ include file="/common/header.jsp"%>
			<%-- <div id="headertitle">과외 연구소</div>		
			
				<c:forEach items="${list }" var="row">
					<h2>번호 확인 : ${ row.SB_NO} 사용자 : ${row.SB_USERID }</h2>
				</c:forEach>				
			
			<div id="menubutton"><button id="menubtn"></button></div>
			<div id="headermenu" align="center">
				<table id="menutable">
					<tr>
						<td>Home</td>
						<td>Teacher</td>
						<td>Student</td>
						<td>Board</td>
						<td>MyPage</td>						
					</tr>
				</table>
			</div> --%>			
		<div style="height: 30px;"></div>
				
		<div id="mid">
					
			<hr id="hr1" size="400px" width="1px" color="#cc0033">
			
<form id="searchform" name="searchform" action="studentsearchdetail.do">
		<div class="searchtop" align="left">
				<div class="searchname" align="center">
					<h3>학생 검색</h3>
				</div>
				<div style="height: 7px;"></div>
				<div style="padding: 5px;">
					<p>
						<label class="la1">지역</label>
					</p>
					<p>
						<select id="SB_AREA" class="inpu" name ="SB_AREA">
							<c:set var="area">${map.SB_AREA }</c:set>								
							<option value="서울" <c:if test="${area eq '서울'}">selected="selected"</c:if> >서울</option>
							<option value="경기" <c:if test="${area eq '경기'}">selected="selected"</c:if> >경기</option>
							<option value="인천" <c:if test="${area eq '인천'}">selected="selected"</c:if> >인천</option>
							<option value="부산" <c:if test="${area eq '부산'}">selected="selected"</c:if> >부산</option>
							<option value="대구" <c:if test="${area eq '대구'}">selected="selected"</c:if> >대구</option>
							<option value="광주" <c:if test="${area eq '광주'}">selected="selected"</c:if> >광주</option>
							<option value="제주" <c:if test="${area eq '제주'}">selected="selected"</c:if> >제주</option>
						</select>
					</p>
					
					<p>
						<label class="la1" >과목</label>
					</p>
					<p>
						<select class="inpu" name ="SB_SUBJECT">
							<c:set var="subject">${map.SB_SUBJECT }</c:set>
							<option value="수학" <c:if test="${subject eq '수학'}">selected="selected"</c:if>>수학</option>
							<option value="국어" <c:if test="${subject eq '국어'}">selected="selected"</c:if>>국어</option>
							<option value="영어" <c:if test="${subject eq '영어'}">selected="selected"</c:if>>영어</option>
							<option value="사회" <c:if test="${subject eq '사회'}">selected="selected"</c:if>>사회</option>
							<option value="과학" <c:if test="${subject eq '과학'}">selected="selected"</c:if>>과학</option>
							<option value="컴퓨터" <c:if test="${subject eq '컴퓨터'}">selected="selected"</c:if>>컴퓨터</option>
							<option value="예체능" <c:if test="${subject eq '예체능'}">selected="selected"</c:if>>예체능</option>

						</select>
					</p>
					<div class="hed">
						<p>
							<label class="la1">과외 목적</label>
						</p>
						<p>
							<select class="inpu" name="SB_PERPOSE">
								<c:set var="perpose">${map.SB_PERPOSE }</c:set>
								<option value="일반" <c:if test="${perpose eq '일반'}">selected="selected"</c:if>>일반</option>
								<option value="진학" <c:if test="${perpose eq '진학'}">selected="selected"</c:if>>진학</option>
							</select>
						</p>
						
						<p>
							<label class="la1">과외 수준</label>
						</p>
						<p>
							<select class="inpu" name="SB_LEVEL">
								<c:set var="level">${map.SB_LEVEL }</c:set>
								<option value="초급" <c:if test="${level eq '초급'}">selected="selected"</c:if>>초급</option>
								<option value="중급" <c:if test="${level eq '중급'}">selected="selected"</c:if>>중급</option>								
								<option value="고급" <c:if test="${level eq '고급'}">selected="selected"</c:if>>고급</option>
							</select>
						</p>						
				
					<p>
						<label class="la1">과외 형태</label>
					</p>
					<p>
						<select class="inpu" name="SB_STYLE">
							<c:set var="style">${map.SB_STYLE }</c:set>							
							<option value="개인" <c:if test="${style eq '개인'}">selected="selected"</c:if>>개인</option>
							<option value="그룹" <c:if test="${style eq '그룹'}">selected="selected"</c:if>>그룹</option>
						</select>
					</p>

						<p>
							<label class="la1" >과외 비</label>
						</p>
						<p>
							<input type="number" min="10000" step="10000" class="price1" name="SB_PRICE" value="10000">
						</p>
					</div>
					<input type="submit" class = "button1" value="검색">
					
					<!-- <a href="#" onclick="javascript:search()" class = "button1">검색</a> -->

										
					<span class="he1">+ 상세검색&nbsp;</span>
					<span class="he2">- 간편검색&nbsp;</span>

					<input type="hidden" id="toggle" class="toggle" name="toggle" value="1" />
					<input type="hidden" id="currentPage" name="currentPage" value="" />
					<input type="hidden" id="sessionid" name="sessionid" value="${sessionid }" />
					
				</div>
			</div>			
</form>			

		<div class="searchinfo" >	
				<div class="searchname" align="center">
					<h3>학생 리스트</h3></div>	
			<table id="table1" width="700px" >
			<div style="height:10px;"></div>	
			<form action="adminDelete.do" id="delForm" onsubmit="return fn_Del();">
				<tr>
					<td colspan="2" class = "title">검색 결과</td>
					<c:set var="sessionid" value="${sessionid }" />
								<c:if test="${sessionid eq 'admin' }">
									<td colspan="8" align="right"><button class="button2"
										id="chkDel" onsubmit="fn_Del();">삭제</button>
									</td>
								</c:if>
								</tr>
					<input type="hidden" id="sbuserid" name="sbuserid" />	
			</form>	
			
		
				<tr id = "table1_td1" align="center" >
					<td><input id = "allCheck" type="checkbox"/></td>
					<td>사진</td>
					<td>이름</td>
					<td>분류</td>
					<td>과목</td>
					<td>지역</td>
					<td>장소</td>
					<td>희망 요일</td>
					<td>희망 시간</td>
					<td>희망 가격</td>
				</tr>
				<tr height="5px;"></tr>
				<c:forEach items="${list }" var="row">
				
				<tr id = "table1_td2" align="center" style="height:15px;">
					<td>
						<input class="checkedBox" name="RowCheck" type="checkbox" value="${row.USERID}"/>
					</td>	
					
					<td><c:set var="proImg" value="${row.SB_RENAMEFILE }"/>
						<c:if test="${empty proImg}">
							<img src="/lesson/resources/img/student/profile.png" width=40px, height=40px>
						</c:if> 
						<c:if test="${!empty proImg}">
							<img src="uploadFiles/${row.SB_RENAMEFILE}" width=40px, height=40px>
						</c:if>
					</td>	
					<td ><a href="studentDetail.do?sbno=${row.SB_NO}&userid=${row.USERID}&sessionid=${sessionid}" style="color:black; font-size:15px;" id="username">${row.USERNAME}</a></td>
					<td>${row.SB_SORT }</td>
					<td>${row.SB_SUBJECT}</td>
					<td>${row.SB_AREA}</td>
					<td>${row.SB_LOCATION}</td>
					<td>${row.SB_WEEK_DAY}</td>
					<td>${row.SB_CLASSTIME}:00</td>
					<td>${row.SB_PRICE}</td>
				</tr>	
				</c:forEach>				
			</table>
			<div class = "searchinfor">
			<center>
				<table id ="paging" >
					<tr>
						<c:set var="page">${map.currentPage }</c:set>
						<c:set var="maxPage">${map.maxPage }</c:set>
						<c:if test="${page > 1}">
							<td>
								<a href="#" onclick="subPre();">[이전]</a>
								<%-- <a href="studentsearchdetail.do?currentPage=${map.currentPage -1}">[이전]</a> --%>
							</td>
						</c:if>
						<c:forEach var="a" begin="${map.startPage }" end="${map.endPage }" step="1">
							<c:set var="num">${a }</c:set>
							<td><a href="#" onclick="subNum('${num}');">${a }</a></td>
							<%-- <td><a href="studentsearchdetail.do?currentPage=${a }">${a }</a></td> --%>
						</c:forEach>
						<c:if test="${page < maxPage}">
							<td>
								<a href="#" onclick="subNext();">[다음]</a>
								<%-- <a href="studentsearchdetail.do?currentPage=${map.currentPage + 1}">[다음]</a> --%>
							</td>
						</c:if>
					</tr>
				</table>
				</center>
			</div>
		</div>
			
		</div>		
	</div>
	<div id="footer"><%@ include file="/common/footer.jsp"%></div>
</body>
</html>