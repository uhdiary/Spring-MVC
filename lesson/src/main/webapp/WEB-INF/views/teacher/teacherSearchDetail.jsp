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
	margin-bottom: 10px;
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
	margin-left: 10px;
	margin-bottom: 20px;
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
							<c:set var="area">${map.lesson_area }</c:set>	
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
							<label class="la1">과목</label>
						</p>
						<p>
							<select class="inpu" name="subject">
							<c:set var="subject">${map.subject}</c:set>
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
								<label class="la1">성별</label>
							</p>
							<p>
								<select class="inpu" name="gender">
								<c:set var="gender">${map.gender}</c:set>
									<option value="M" <c:if test="${gender eq 'M'}">selected="selected"</c:if>>남자</option>
									<option value="F" <c:if test="${gender eq 'F'}">selected="selected"</c:if>>여자</option>
								</select>
							</p>

							<p>
								<label class="la1">장소</label>
							</p>
							<p>
								<select class="inpu" name="place">
								<c:set var="place">${map.place}</c:set>
									<option value="학생집" <c:if test="${place eq '학생집'}">selected="selected"</c:if>>학생집</option>
									<option value="선생님집" <c:if test="${place eq '선생님집'}">selected="selected"</c:if>>선생님 집</option>
									<option value="커피숍" <c:if test="${place eq '커피숍'}">selected="selected"</c:if>>커피숍</option>
									<option value="사무실" <c:if test="${place eq '사무실'}">selected="selected"</c:if>>사무실</option>
									<option value="모임공간" <c:if test="${place eq '모임공간'}">selected="selected"</c:if>>모임공간</option>
								</select>
							</p>


							<p>
								<label class="la1">수업료</label>
							</p>
							<p>
								<input type="number" min="10000" step="10000" value="10000" class="price1" name="wish_price">
							</p>
						</div>
						<button class="button1">검색</button>
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
									<td style="width: 70px; height: 120px;"> 	<c:choose> 
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
							<div class="no" align="center">
								<a class="numberpg" href="#" onclick="subPre();">[이전]</a>
								<%-- <a href="studentsearchdetail.do?currentPage=${map.currentPage -1}">[이전]</a> --%>
							</div>
							</td>
						</c:if>
						<c:forEach var="a" begin="${map.startPage }" end="${map.endPage }" step="1">
							<c:set var="num">${a }</c:set>
							<td>
							<div class="no" align="center">
							<a class="numberpg" href="#" onclick="subNum('${num}');">${a}</a>
							</div>
							</td>
							<%-- <td><a href="studentsearchdetail.do?currentPage=${a }">${a }</a></td> --%>
						</c:forEach>
						<c:if test="${page < maxPage}">
							<td>
							<div class="no" align="center">
								<a class="numberpg" href="#" onclick="subNext();">[다음]</a>
								<%-- <a href="studentsearchdetail.do?currentPage=${map.currentPage + 1}">[다음]</a> --%>
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

	

	<div id="fotters" style="margin-top: 10px;">
	 <%@ include file="/common/footer.jsp"%>
</div>
</body>
</html>