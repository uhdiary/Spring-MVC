<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page  pageEncoding="utf-8"%>
<% 
 response.setDateHeader("Expires", 0);
 response.setHeader("Pragma", "no-cache");
 if (request.getProtocol().equals("HTTP/1.1")) {
  response.setHeader("Cache-Control", "no-cache");
 }
%>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
history.go(1); 
}

var userid = "";
function enrollteacher(){
	
	
	var a = $(".login1").val();
	var c = $('.code').val();

		
	 if(c != 2 && a != null){
		 alert("선생님이 아닙니다.");
		 return false;
	 }
	 
	 
	 userid = $(".login1").val();
	 
	 if(userid != null || userid != "" && c == 2){
		 
	 $.ajax({
			url : "teacherInOut.do",
			type : "get",
			data :  {
				userid : userid
			},
			success : function(data) {
			
				if(data == null || data == ""){
					location.href="teacherEnrollPg.do";
					
				}else{
					alert('이미 정보를 등록 하였습니다.');
					return false;
				}
				
			},
			error : function(request, status, error) {
				alert('선생님 정보를 등록하세요');
			}

		});
	 }
	 
	
	 
	if(userid == "" || userid == null){
		 alert('로그인 하세요.');
		return false;
	}
	
}
	function fn_studentEnroll(){
	      var loginId = $(".login1").val();
	      var loginCode = $(".code").val();
	      if(loginId==null){
	         alert("로그인한후 사용하세요");
	         return false;
	      }
	      else if(loginCode != 1){
	         alert("학생 아이디로 로그인 하세요");
	         return false;
	      }
	      else{
	          $.ajax({
	                  url : "studentInOut.do",
	                  type : "get",
	                  data :  {
	                     userid : userid
	                  },
	                  success : function(data) {   
	                     alert('이미 정보를 입력하였습니다.');                  
	                     return false;
	                  },
	                  error : function(request, status, error) {
	                     location.href = "studentEnroll.jsp";
	                     return;
	                  }

	               });
	      }
	   }
</script>
<style type="text/css">
.one3 {
	background: #333333;
	height: 200px;
}

.one {
	float: left;
	width: 34%;
	padding: 15px;
}

.one1 {
	float: right;
	width: 34%;
	padding: 15px;
}

.one2 {
	padding: 15px;
}

.child1 {
	color: white;
	font-size: 30px;
}

.child2 {
	color: white;
	font-size: 30px;
}

.child3 {
	color: white;
	font-size: 30px;
}

.child4 {
	color: white;
	font-size: 30px;
}

.button1 {
	background: #7A7A7A;
	width: 200px;
	height: 50px;
	color: white;
	font-size: 30px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
}

.button2 {
	background: white;
	width: 200px;
	color: #7A7A7A;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 30px;
	font-weight: bold;
}

.button1:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}

.button2:HOVER {
	border: 2px solid #FF4239;
	color: #FF4239;
}

.bo {
	display: inline;
}

.inpu {
	width: 400px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 20px;
}

.no1 {
	display: inline;
}

.inpu:HOVER {
	border: 2px solid #FF4239;
}

.ui {
	display: none;
}

@media screen and (max-width:480px) {
	.ui {
		display: block;
	}
	.one {
		width: auto;
	}
	.one1 {
		float: none;
		width: auto;
	}
	.one2 {
		float: none;
		width: auto;
	}
	.bo {
		display: block;
	}
	.button1 {
		width: 100%;
	}
	.button2 {
		width: 100%;
	}
	.no1 {
		display: block;
		width: 100%;
	}
}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<section>
	<c:if test="${user.userid!=null}">  
					 <input type="hidden" id="useridhidden"  value="${user.userid}" class="login1">
				<input type="hidden"  value="${user.userco}" class="code">
				 </c:if>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox" align="center" style="background:#7A7A7A;">
				<div class="item active" align="center">
					<img  style="width: 65%;" class="first-slide"
						src="/lesson/resources/img/main/4.jpg" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>1시간 부터, 4주까지</h1>
						</div>
					</div>
				</div>
				<div class="item">
					<img style="width: 65%;" class="second-slide"
						src="/lesson/resources/img/main/23.png" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>편리한 수업예약</h1>
						</div>
					</div>
				</div>
				<div class="item">
					<img style="width: 65%;" class="third-slide"
						src="/lesson/resources/img/main/66.png" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>지금 바로 시작하세요!</h1>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->

		<div style="height: 20px;"></div>
		<div align="center">
		<form action="teachersearchdetail.do">
			<p class="no1">
				<select class="inpu" id="subjectid" name="subject">
							<option value="수학">수학</option>
							<option value="국어">국어</option>
							<option value="영어">영어</option>
							<option value="사회">사회</option>
							<option value="과학">과학</option>
							<option value="컴퓨터">컴퓨터</option>
							<option value="예체능">예체능</option>

					</select>
			</p>
			<p class="no1">
				<select class="inpu" id="selectbox1" name="lesson_area">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="제주">제주</option>
							</select>
			</p>
			<input type="hidden" name="toggle" value="1">
			<input type="submit" style="position: relative; top: 2px;"
				class="button1" value="선생님 검색">
				
				</form>
		</div>

		<div style="height: 50px;"></div>
		<div class="one">
			<div align="center">
				<img style="width: 70px; height: 70px;"
					src="/lesson/resources/img/main/clock.svg">
			</div>
			<h2 align="center">과외 연구소가 다른점</h2>
			<h4>실제 과외가 연결되기 전에는 어떠한 비용도 들지 않으며, 과외연구소 메시지를 자유롭게 교환할 수 있습니다.</h4>
		</div>

		<div class="one1">
			<div align="center">
				<img style="width: 70px; height: 70px;"
					src="/lesson/resources/img/main/zoom.svg">
			</div>
			<h2 align="center">투명한 과외 연구소</h2>
			<h4>실제 수업한 학생의 리뷰를 확인할 수 있습니다.</h4>
		</div>

		<div class="one2">
			<div align="center">
				<img style="width: 70px; height: 70px;"
					src="/lesson/resources/img/main/lock.svg">
			</div>
			<h2 align="center">안전한 과외 연구소</h2>
			<h4>안전결제 시스템으로 과외연구소만의 수업료 보호 서비스는 학생, 선생님 모두에게 유리합니다.</h4>
		</div>
		<div style="height: 90px;"></div>

		<div align="center" class="buttonma">
			<div class="bo">
			<input type="button" id="teacheren" class="button1" value="선생님 등록" onClick="enrollteacher();">
			</div>
		
			&nbsp;&nbsp;<input type="button" class="button2" value="학생 등록" onClick="fn_studentEnroll();">
		</div>
		<div style="height: 50px;"></div>
	</section>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>
