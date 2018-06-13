<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 상세 정보 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tab-2").hide();
		$("#tab-3").hide();
		$('#writeForm').hide();
		$('.tab1').css("border-top", "5px solid red");
		$(document).on("click", ".tab1", function() {
			$('#tab-1').show();
			$('#tab-2').hide();
			$('#tab-3').hide();
			$('.tab1').css("border-top", "5px solid red");
			
			
			$('.tab2').css("border-top", "none");
			$('.tab3').css("border-top", "none");
		});
		$(document).on("click", ".tab2", function() {
			$('#tab-1').hide();
			$('#tab-2').show();
			$('#tab-3').hide();
			$('.tab2').css("border-top", "5px solid red");
			$('.tab1').css("border-top", "none");
			$('.tab3').css("border-top", "none");
		});
		$(document).on("click", ".tab3", function() {
			$('#tab-1').hide();
			$('#tab-2').hide();
			$('#tab-3').show();
			$('.tab3').css("border-top", "5px solid red");
			$('.tab1').css("border-top", "none");
			$('.tab2').css("border-top", "none");
		});
		
			$(document).on("click", ".tab3", function() {
			var tinf_no = $('#tinf_no').val();
			$.ajax({
				url : "teacherEp.do",
				type : "get",
				data :  {
					tinf_no : tinf_no
				},
				success : function(data) {
				
				 var tabep = document.getElementById("tabep");
				 var content = " ";
				 content += "<table class='table1'>";
				 content += "<tr class='tr'><th>작성자</th><th>리뷰</th><th>평점</th><th>작성일</th></tr>";
					 if(data != null){
		                 for(var i in data){      
		                	 content +=   "<tr><td style='width:20%'>";		     	 
		                	 content += data[i].userid;
		                	 content +=   "</td><td style='width:50%'>";		     	 
		                	 content += data[i].review;
		                	 content +=   "</td><td style='width:10%'>";		     	 
		                	 content += data[i].mark;
		                	 content +=   "</td><td style='width:20%'>";
		                	 content += data[i].t_ep_day;
		                	 content +=   "</td></tr>";
		                	 
		               }
		            }else{ content += "<tr> <td >조회된 결과가 없습니다.</td> </tr>"; } 
				 
				 content +="</table>";
			
				$(tabep).html(content); 
			
				},
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}
				}

			});

			
			});
			var idid= " ";
			var coco=" ";
			$(document).on("click", "#write", function() {
				idid = $('#idid').val();
				coco=$('#code1').val();
				if(idid == ""){
					alert('로그인후 사용하세요.');
					return false;
				}
				if(coco != 1){
					alert('학생만 리뷰작성을 할 수 있습니다.');
					return false;
				}
				
				
				
				
				/* $.ajax({
					url : "teacherEp.do",
					type : "get",
					data :  {
						tinf_no : tinf_no
					},
					success : function(data) {
					
					 var tabep = document.getElementById("tabep");
					 var content = " ";
					 content += "<table class='table1'>";
					 content += "<tr class='tr'><th>작성자</th><th>리뷰</th><th>평점</th><th>작성일</th></tr>";
						 if(data != null){
			                 for(var i in data){      
			                	 content +=   "<tr><td>";		     	 
			                	 content += data[i].userid;
			                	 content +=   "</td><td>";		     	 
			                	 content += data[i].review;
			                	 content +=   "</td><td>";		     	 
			                	 content += data[i].mark;
			                	 content +=   "</td><td>";
			                	 content += data[i].t_ep_day;
			                	 content +=   "</td></tr>";
			                	 
			               }
			            }else{ content += "<tr> <td >조회된 결과가 없습니다.</td> </tr>"; } 
					 
					 content +="</table>";
				
					$(tabep).html(content); 
				
					},
					error : function(request, status, error) {
						if (request.status != '0') {
							alert("code : " + request.status + "\r\nmessage : "
									+ request.reponseText + "\r\nerror : " + error);
						}
					}

				});
				 */
				
				
				
				
				
				
				
				
				
				
				
				
				
				$('#tabep').hide();
				$('#write').hide();
				$('#writeForm').show();
				
			});
			
			
	});
</script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

.sebody {
	padding: 10px;
	font-family: 'Nanum Gothic', sans-serif;
}
.tab-1-iner {
	padding: 10px;
}
.tab-1-iner p {
	padding: 5px;
}
.tab-2-iner {
	padding: 10px;
}
.tab-3-iner table{
	margin: 10px;
}
.tab1:HOVER {
	border-top: 5px solid red;
}
.tab2:HOVER {
	border-top: 5px solid red;
}
.tab3:HOVER {
	border-top: 5px solid red;
}
.name1 {
	font-size: 22px;
	font-weight: bold;
}
.name2 {
	font-size: 19px;
}
.table1 {
	width: 70%;
	padding: 10px;
}
ul li a {
	color: black;
}
.table1 {
	font-size: 18px;
}
.table2{
width:80%;
height:500px;
font-size: 20px;


}
.menutap{
margin: 5px;
}
.tr{
border-top:1px solid black;
border-bottom:1px solid black;
}
.button1 {
	background: #7A7A7A;
	width: 110px;
	height: 30px;
	color: white;
	font-size: 20px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
	
}
.button1:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}
.tableEp{
width:500px;
height:300px;

}
.inpu {
	width: 50px;
	height: 30px;
	border: 2px solid #7A7A7A;
	font-size: 17px;
}
.tableEp th{
background: #D8ECF6;
border: 2px solid white;
padding-left: 10px;
}
.tableEp tr{
border-top: 2px solid #D8ECF6;
border-bottom: 2px solid #D8ECF6;
padding-left: 20px;
}
.nocount{
width:50px;
}
#fotters{
width:100%;
float: left;

}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div style="height: 70px;"></div>
<input id="tinf_no" type="hidden"value="${teacher.tinf_no} ">
	<section>
		<div class="sebody">
			<div align="center">
				<table class="table1">
					<tr>
						<td
							style="border-top: 3px solid #4D4F50; border-bottom: 3px solid #4D4F50;"
							align="center" colspan="4"><span style="float: left;">과외
								스타일 : ${teacher.lesson_style}</span><span style="float: right;">
								성별&nbsp;${ (teacher.gender == 'M') ? "남자" : "여자" }
								&nbsp;&nbsp;희망과외비 (시간당) ${teacher.wish_price}원 &nbsp;&nbsp;조회수
								${teacher.tc_count}</span></td>
					</tr>
					<tr>
						<td style="width: 70px; height: 120px;">	<c:choose> 
				 <c:when test="${row.RENAMEFILEPATH==null}">  
					<img src="/lesson/resources/img/teacher/person.png" width=150px, height=150px>
				 </c:when>
				<c:otherwise>
					 <img src="uploadFiles/${row.RENAMEFILEPATH}" width=150px, height=150px> 
				</c:otherwise> 
		 	 </c:choose> </td>
					<td align="center">${teacher.userid }</td>
					<td colspan="2" style="padding-left:5px;width: 200px; height: 120px;">${teacher.tinf_title}<c:if test="${loginUser.userco eq 1}">
						<a style="float: right;" href="applyforsafepay.do?loginuser=${loginUser.userid}">안전결제</a>
						</c:if></td>
						<td>
						</td>
					</tr>
					<tr style="height:40px;">
						<td style="background: #4D4F50; color: white;" colspan="4"><span
							style="float: left;">과외 가능 지역 : ${teacher.lesson_area}</span> <span
							style="float: right;">과외경력 : ${teacher.career} 년</span></td>
					</tr>
					<tr style="height: 10px;"></tr>

				</table>
				<div style="height:50px;"></div>
<div class="menutap">
			<ul class="nav nav-tabs"
				style="margin-left: 0px; border-bottom: 0px solid #dedede;">
				<li class="tab1" style="width: 33.33%; font-size: 16px;"><a
					class="tab-left" href="#tab-1"
					style="width: 100%; font-size: 16px;" data-toggle="tab">프로필</a></li>
				<li class="tab2" style="width: 33.33%; font-size: 16px;"><a
					class="tab-center" href="#tab-2"
					style="width: 100%; font-size: 16px;" data-toggle="tab">상세설명</a></li>
				<li class="tab3" style="width: 33.33%; font-size: 16px;"><a
					class="tab-right" href="#tab-3"
					style="width: 100%; font-size: 16px;" data-toggle="tab">리뷰/후기</a></li>
			</ul>
</div>
			<div id="tab-1">
				<div class="tab-1-iner" align="left">
					<p class="name1">자기소개</p>
					<p class="name2">${teacher.self}</p>
					<p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/Bank.svg">&nbsp;&nbsp;학교
					</p>
					<p class="name2">${teacher.university}대학교</p>
					<p class="name2">${teacher.major}</p>
					<p class="name2">${teacher.university_state}</p>
					<p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/Folder.svg">&nbsp;&nbsp;수업과목
					</p>
					<p class="name2">${teacher.subject}</p>
					<p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/Tags.svg">&nbsp;&nbsp;수업료(시간당)
					</p>
					<p class="name2">${teacher.time_price}원</p>
					<p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/Stopwatch.svg">&nbsp;&nbsp;수업
						가능 시간대
					</p>
					<p class="name2">${teacher.possibility_time}</p>
			<div style="height:50px;"></div>		
					
			<c:choose>	
			<c:when test="${loginUser.userid == teacher.userid}">
				
				<c:if test="${teacher.c_originalfilepath ==null}">
				<div>
				<form action="curri.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${loginUser.userid}" name="userid">
				<input type="hidden" value="${teacher.tinf_no}" name="tinf_no">
				<p class="name1" style="font-size: 25px;"><p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/curr.png">
					</p><p class="name1">커리큘럼 등록</p><br><br>
				<input type ="file" style="float: left; height:70px; font-size: 20px;" name="uploadFile" >
				&nbsp;<button style="float: left; height:40px; width:80px; font-size: 15px;">등록</button>
				</form>
				</div>
			</c:if>
			<c:if test="${teacher.c_originalfilepath !=null}">
			<div>
				<form action="curriup.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${loginUser.userid}" name="userid">
				<input type="hidden" value="${teacher.tinf_no}" name="tinf_no">
				<p class="name1" style="font-size: 25px;"><p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/curr.png">
					</p><p class="name1">커리큘럼 수정</p><br><br>
				<input type ="file" style="float: left; height:70px; font-size: 15px;" name="uploadFile">
				&nbsp;<button style="float: left;height:40px; width:80px; font-size: 15px; ">수정</button>
				</form>
				</div>
			
			</c:if>
			</c:when>
			<c:otherwise>
			<table>
			<tr><td style="font-size: 20px;"><p class="name1">
						<img alt="" src="/lesson/resources/img/teacher/curr.png">
					</p><span class="name1">커리큘럼 보기</span>&nbsp;&nbsp;</td>
   <td  style="font-size: 20px;">
	<c:if test="${empty teacher.c_originalfilepath }">
	커리큘럼 없음</c:if>
	<c:if test="${!empty teacher.c_originalfilepath }">
	<c:url var="downfile" value="teacherfile.do">
		<c:param name="rfile" value="${teacher.c_renamefilepath }" />
		<c:param name="ofile" value="${teacher.c_originalfilepath }" />
		
	</c:url>
	<a href="${downfile }">${teacher.c_originalfilepath }</a></c:if>   
   </td>
</tr>
			</table>
			
			</c:otherwise>
			</c:choose>
			</div>
			<div style="height:70px;"></div>
				</div>
			</div>
			<div id="tab-2">
				<div class="tab-2-iner">
				<table class="table2">
				<tr><th>시간당 과외비 </th> <td>${teacher.time_price} 원</td></tr>
				<tr><th>희망 과외비</th> <td>${teacher.wish_price} 원</td></tr>
				<tr><th>과외 스타일</th> <td> ${teacher.lesson_style}</td></tr>
				<tr><th>과외 장소</th> <td>${teacher.place}</td></tr>
				<tr><th>수업료 협의 가능 여부</th> <td>${teacher.price_check}</td></tr>
				<tr><th>무료수업 가능 여부</th> <td> ${teacher.free_check}</td></tr>
				</table>
				</div>
			</div>
			<div id="tab-3">
			<div style="height:20px;"></div>
				<div class="tab-3-iner" align="center" id="tabep">
				</div>
				<div align="center" style="padding: 5px;">
				<div style="height:10px;"></div>
				<input type="button" class="button1" id="write" value="리뷰작성">
			</div>
			</div>
			<div id="writeForm" align="center">
			
			<div align="center">
<h1>선생님 리뷰 작성</h1>
<div style="height:10px;"></div>
<form action="tEpWrite.do" method="post">
<input type="hidden" value="${loginUser.userid}" name="userid" id="idid">
<input type="hidden" value="${loginUser.userco}" id="code1">
<input type="hidden" value="${teacher.tinf_no}" name="tinf_no">
<input type="hidden" value="${teacher.userid}" name="teacher_id">

<table class="tableEp">

<tr><th>작성자</th><td>&nbsp;&nbsp;${loginUser.userid}</td> <th class="nocount">평점</th> 
<td>&nbsp;&nbsp;
<select class="inpu" name="mark">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
</select>

</td></tr>
<tr><th>리뷰</th><td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="50" rows="10" name="review"></textarea></td></tr>

</table>
<div style="height:30px;"></div>
<button class="button1" id ="rew">리뷰 작성</button>&nbsp;&nbsp;<input type="button" id="cencle" class="button1" value="취소">
</form>
</div>
			
	</div>
		</div>
	</section>
<%@ include file="/common/footer.jsp"%>
</body>
</html>