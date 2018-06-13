<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 검색</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/common.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

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
		$("footer").load("common/footer.jsp");
		$(".hed").hide();
		$(".he2").hide();

		$(".he1").click(function() {

			$(".hed").show();
			$(".he1").hide();
			$(".he2").show();

			$(".searchtop").css("height", "620px");

			$(".he2").click(function() {

				$(".hed").hide();
				$(".he1").show();
				$(".he2").hide();

				$(".searchtop").css("height", "330px");

			});
		});
		


	}); 
	
	
</script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

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
	height: 330px;
	width: 270px;
	border: 2px solid #4D4F50;
	float: left;
	border-radius: 3px;
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
	
}

.searchinfo1 {

	margin-left:10px;
	margin-bottom:10px;
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

.button1:HOVER {
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
	display: none;
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
	font-size: 17px;
	table-layout: fixed;
}
.numberpg{
color:black;
font-size: 20px;

}
.no{
border: 1px solid black;
width:60px;
margin-left:5px;
}
.no:HOVER {
	
	background: red;
}
.numberpg:HOVER {
	
	color:white;
	
}
#fotters{
width:100%;
float: left;

}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div style="height: 70px;"></div>

	<section>
		<div class="sebody">
	<form action="teachersearchdetail.do" id="searchform" method="post">	
			<div class="searchtop" align="left">
			
				<div class="searchname" align="center">
					<h3>선생님 검색</h3>
				</div>
				<div style="height: 7px;"></div>
				<div style="padding: 5px;">
					<p>
						<label class="la1">지역 </label>
					</p>
					
						<p>
							<select class="inpu" id="selectbox1" name="lesson_area">
							
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
							<select class="inpu" name="subject">
							
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
								<label class="la1">성별</label>
							</p>
							<p>
								<select class="inpu" name="gender">
									<option value="M">남자</option>
									<option value="F">여자</option>
								</select>
							</p>

							<p>
								<label class="la1">장소</label>
							</p>
							<p>
								<select class="inpu" name="place">
									<option>학생집</option>
									<option>선생님 집</option>
									<option>커피숍</option>
									<option>사무실</option>
									<option>모임공간</option>
								</select>
							</p>


							<p>
								<label class="la1">수업료</label>
							</p>
							<p>
								<input type="number" min="10000" step="10000" class="price1" value="10000" name="wish_price">
							</p>
						</div>
						<input type="submit" class="button1" value="검색">
						<span class="he1">+ 상세검색&nbsp;&nbsp;</span><span class="he2">-
							간편검색&nbsp;&nbsp;</span>
					<input type="hidden" id="toggle" class="toggle" name="toggle" value="1" />
					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</div>
			</div>
</form>
			<div class="searchinfo">
				<div class="searchinfo1">

					<table class="table1">

						<tbody>
							<c:forEach items="${list}" var="row">
								<tr>
									<td
										style="border-top: 3px solid #9ADBEF; border-bottom: 3px solid #9ADBEF;"
										align="center" colspan="4"><span style="float: left;">과외
											스타일 : ${row.LESSON_STYLE}</span><span style="float: right;">
											희망과외비 (시간당) ${row.WISH_PRICE}원 &nbsp;&nbsp;조회수 ${row.TC_COUNT }</span></td>
								</tr>
								<tr>
									<td style="width: 70px; height: 120px;"> 
									<c:choose> 
				 <c:when test="${row.RENAMEFILEPATH==null}">  
					<a href="teacherinfo.do?userid=${row.USERID }"><img src="/lesson/resources/img/teacher/person.png" width=150px, height=150px></a>
				 </c:when>
				<c:otherwise>
					<a href="teacherinfo.do?userid=${row.USERID }"><img src="uploadFiles/${row.RENAMEFILEPATH}" width=150px, height=150px></a> 
				</c:otherwise> 
		 	 </c:choose>
					
									</td>
									<td align="left"><a style="color:black;" href="teacherinfo.do?userid=${row.USERID }">${row.USERID }</a></td>
									<td class="slef1"
										style="width: 600px; font-size: 15px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
										colspan="2">${row.TINF_TITLE}</td>
								</tr>
								<tr>
									<td style="background: #D8ECF6;" colspan="4"><span
										style="float: left;">과외가능지역 : ${row.LESSON_AREA}</span> <span
										style="float: right;">과외경력 : ${row.CAREER} 년
											&nbsp;&nbsp;과목 : ${row.SUBJECT}</span></td>
								</tr>
								<tr style="height: 10px;"></tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center">
					<table id ="paging" >
					<tr>
						<c:set var="page">${map.currentPage }</c:set>
						<c:set var="maxPage">${map.maxPage }</c:set>
						<c:if test="${page > 1}">
							<td>
								<!-- <a href="#" onclick="subPre();">[이전]</a> -->
								<!-- <a href="#" onclick="document.getElementById('searchForm').submit();">[이전]</a> -->
								<div class="no" align="center">
								<a  class="numberpg" href="teachersearch.do?currentPage=${map.currentPage -1}">[이전]</a>
							</div>
							</td>
						</c:if>
						<c:forEach var="a" begin="${map.startPage }" end="${map.endPage }" step="1">
							<td>
							<div class="no" align="center">
							<a class="numberpg" href="teachersearch.do?currentPage=${a }">${a }</a>
							</div>
							</td>
						</c:forEach>
						<c:if test="${page < maxPage}">
							<td>
							<div class="no" align="center">
								<a class="numberpg" href="teachersearch.do?currentPage=${map.currentPage + 1}">[다음]</a>
							</div>
							</td>
						</c:if>
					</tr>
				</table>
				</div>
				
			</div>
		</div>
		</div>
	</section>

	<!-- <div style="height:1500px;"></div> -->
	<div id ="fotters" style="margin-top: 10px;">
	 <%@ include file="/common/footer.jsp"%>
	</div>
</body>
</html>