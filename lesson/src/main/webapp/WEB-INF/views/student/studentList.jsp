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
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/common.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#allCheck").change(function() {

			if ($("#allCheck").prop("checked")) {
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

	function subPre() {
		document.getElementById('currentPage').value = '${map.currentPage -1}';
		document.getElementById('searchForm').submit();
	}

	$(function() {

		$(".hed").hide();
		$(".he2").hide();

		$(".he1").click(function() {

			$(".hed").show();
			$(".he1").hide();
			$(".he2").show();
			document.getElementById('toggle').value = '2'
			$(".searchtop").css("height", "720px");

			$(".he2").click(function() {

				$(".hed").hide();
				$(".he1").show();
				$(".he2").hide();
				document.getElementById('toggle').value = '1'

				$(".searchtop").css("height", "380px");

			});
		});
		$('.slef1').on('click', function() {
			var a = $('.slef1').text();
			alert(a);
		});
	});

	function fn_Del() {
		var userid = "";
		/* var memberChk= document.getElementByName("RowCheck"); */
		var memberChk = $("[name=RowCheck]");
		var chked = false;
		var indexid = false;

		for (i = 0; i < memberChk.length; i++) {
			if (memberChk[i].checked) {
				if (indexid) {
					userid = userid + '-';
				}
				userid = userid + memberChk[i].value;
				indexid = true;
			}
		}
		if (!indexid) {
			alert("삭제할 사용자를 체크해 주세요");
			return false;
		}
		document.getElementById('sbuserid').value = userid;

		var agree = confirm("삭제 하시겠습니까?");
		if (agree) {
			document.getElementById('delForm').submit();
		}
		else{
			return false;
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
	margin-left: 7px;
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

.title {
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

td span {
	padding: 7px;
}

.table1 {
	width: 750px;
	font-style: oblique;
	table-layout: fixed;
}

#table1_td1 td {
	height: 45px;
	/*background-color:#7A7A7A; */
	background-color: #dddddd;
	font-size: 15px;
	/* color:white; */
	color: #7A7A7A;
	border: 1px solid white;
}

#table1_td2 td {
	height: 45px;
	background-color: white;
	border-top: 1px solid #7A7A7A;
	border-bottom: 1px solid #7A7A7A;
	color: #7A7A7A;
}

#paging td {
	text-align: center;
	font-size: 15px;
	color: #7A7A7A;
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

				<hr id="hr1" size="600px" width="1px" color="#cc0033">
				<form action="studentsearchdetail.do" id="searchForm">
					<input type="hidden" id="sessionid" name="sessionid" value="${sessionid }" />
					<input type="hidden" id="delGroup" name="delGroup" value="" />
					<div id="searchtop" class="searchtop" align="left">
						<div class="searchname" align="center">
							<h3>학생 검색</h3>
						</div>
						<div style="height: 7px;"></div>
						<div style="padding: 5px;">
							<p>
								<label class="la1">지역 </label>
							</p>
							<p>
								<select class="inpu" name="SB_AREA">

									<option>서울</option>
									<option>경기</option>
									<option>인천</option>
									<option>부산</option>
									<option>대구</option>
									<option>광주</option>
									<option>제주</option>
								</select>
							</p>

							<p>
								<label class="la1">과목</label>
							</p>
							<p>
								<select class="inpu" name="SB_SUBJECT">

									<option>수학</option>
									<option>국어</option>
									<option>영어</option>
									<option>사회</option>
									<option>과학</option>
									<option>컴퓨터</option>
									<option>예체능</option>

								</select>
							</p>
							<div class="hed">
								<p>
									<label class="la1">과외 목적</label>
								</p>
								<p>
									<select class="inpu" name="SB_PERPOSE">

										<option>일반</option>
										<option>진학</option>
									</select>
								</p>

								<p>
									<label class="la1">과외 수준</label>
								</p>
								<p>
									<select class="inpu" name="SB_LEVEL">
										<option>초급</option>
										<option>중급</option>
										<option>고급</option>
									</select>
								</p>

								<p>
									<label class="la1">과외 형태</label>
								</p>
								<p>
									<select class="inpu" name="SB_STYLE">

										<option>개인</option>
										<option>그룹</option>
									</select>
								</p>

								<p>
									<label class="la1">과외 비</label>
								</p>
								<p>
									<input type="number" min="10000" step="10000" class="price1"
										name="SB_PRICE" value="10000">
								</p>
							</div>
							<input type="submit" class="button1" value="검색"> <span
								class="he1">+ 상세검색&nbsp;</span><span class="he2">-
								간편검색&nbsp;</span> <input type="hidden" id="toggle" class="toggle"
								name="toggle" value="1" /> <input type="hidden"
								id="currentPage" name="currentPage" value="" />

						</div>
					</div>
				</form>

				<div class="searchinfo">
					<div class="searchname" align="center">
						<h3>학생 리스트</h3>

					</div>
					<div style="height: 10px;"></div>
					<table id="table1" width="700px">

						<form action="adminDelete.do" id="delForm"
							onsubmit="return fn_Del();">
							<tr>
								<td colspan="2" class="title">전체 검색</td>
								<c:set var="sessionid" value="${sessionid }" />
								<c:if test="${sessionid eq 'admin' }">
									<td colspan="8" align="right"><button class="button2"
										id="chkDel" onsubmit="fn_Del();">삭제</button>
									</td>
								</c:if>
							</tr>
							<input type="hidden" id="sbuserid" name="sbuserid" />
						</form>

						<tr id="table1_td1" align="center">
							<%-- <c:if test="${loginuserid eq userid}"><td></td></c:if> --%>
							<td><input id="allCheck" type="checkbox" /></td>
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

							<tr id="table1_td2" align="center">
								<td><input class="checkedBox" name="RowCheck"
									type="checkbox" value="${row.USERID}" /></td>

								<td><c:set var="proImg" value="${row.SB_RENAMEFILE }" /> <c:if
										test="${empty proImg}">
										<img src="/lesson/resources/img/student/profile.png"
											width=40px, height=40px>
									</c:if> <c:if test="${!empty proImg}">
										<img src="uploadFiles/${row.SB_RENAMEFILE}" width=40px,
											height=40px>
									</c:if></td>
								<td><a
									href="studentDetail.do?sbno=${row.SB_NO}&userid=${row.USERID}&sessionid=${sessionid}"
									style="color: black; font-size: 15px;" id="username">${row.USERNAME}</a></td>
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
					<div class="searchinfor">
						<center>
							<table id="paging">
								<tr>
									<c:set var="page">${map.currentPage }</c:set>
									<c:set var="maxPage">${map.maxPage }</c:set>
									<c:if test="${page > 1}">
										<td>
											<!-- <a href="#" onclick="subPre();">[이전]</a> --> <!-- <a href="#" onclick="document.getElementById('searchForm').submit();">[이전]</a> -->
											<a href="studentsearch.do?currentPage=${map.currentPage -1}&sessionid=${sessionid}">[이전]</a>
										</td>
									</c:if>
									<c:forEach var="a" begin="${map.startPage }"
										end="${map.endPage }" step="1">
										<td><a href="studentsearch.do?currentPage=${a }&sessionid=${sessionid}">${a }</a></td>
									</c:forEach>
									<c:if test="${page < maxPage}">
										<td><a
											href="studentsearch.do?currentPage=${map.currentPage + 1}&sessionid=${sessionid}">[다음]</a>
										</td>
									</c:if>
								</tr>
							</table>
						</center>
					</div>
				</div>

			</div>
		</div>
		</div>
	<div id="footer"><%@ include file="/common/footer.jsp"%></div>
</body>
</html>