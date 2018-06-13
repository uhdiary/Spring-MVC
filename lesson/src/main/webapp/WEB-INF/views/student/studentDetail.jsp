<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--
구글 맵 api 
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBO9MYaN90wy08loI5GoKZORYf8Q4fznTw"></script>
 -->

<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3c0a6f104349718aace6c309d343880a"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("#tab-2").hide();
		$('.tab1').css("border-top", "5px solid #7A7A7A");
		$(document).on("click", ".tab1", function() {
			$('#tab-1').show();
			$('#tab-2').hide();
			$('.tab1').css("border-top", "5px solid #7A7A7A");
			
			
			$('.tab2').css("border-top", "none");
		});
		$(document).on("click", ".tab2", function() {
			$('#tab-1').hide();
			$('#tab-2').show();
			$('.tab2').css("border-top", "5px solid #7A7A7A");
			$('.tab1').css("border-top", "none");
		});		
		
		
		/* var co1 = ${co1};
		var co2 = ${co2};
	
		var container = document.getElementById('map'); 
		var options = { 
			center: new daum.maps.LatLng(co1+0.008, co2-0.02),
			
			level: 5 
		};
		
		var map = new daum.maps.Map(container, options); 
		
		
		var markerPosition  = new daum.maps.LatLng(co1, co2); 

		
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		
		marker.setMap(map); */
	});
	
	/* function geocode(){
		var address="";
		address = document.getElementById("address").value;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({'address': address,'partialmatch':true}, geocodeResult);
	}
	
	function geocodeResult(result, status){
		if(status == 'OK' && results.length>0){
			alert(results[0].geometry.loction.lat());
			alert(results[0].geometry.loction.lng());
		}else{
			alert("Geocode was not successful : " + status);
		}
			
	}
	 */
	/* function initialize() {
		var co1 = ${co1};
		var co2 = ${co2};
	
		
        var mapLocation = new google.maps.LatLng(co1, co2); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng(co1, co2); // 마커가 위치할 위도와 경도
         
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 17, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               
             //  icon: image, // 마커로 사용할 이미지(변수)
							// info: '말풍선 안에 들어갈 내용',
               title: '이곳이다.' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "이곳이 그곳이다"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });        
      }
      google.maps.event.addDomListener(window, 'load', initialize); */
	
</script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

.sebody {
	
	width:80%;
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
	padding: 5px;
}

.tab1:HOVER {
	border-top: 5px solid #7A7A7A;
}
.tab2:HOVER {
	border-top: 5px solid #7A7A7A;
}
.tab3:HOVER {
	border-top: 5px solid red;
}
.name1 {
	font-size: 19px;
	font-weight: bold;
}
.name2 {
	font-size: 16px;
}
.table1 {
	width: 900px;
	padding: 8px;
}
ul li a {
	color: black;
}
.table1 {
	font-size: 18px;
}
.table2{
width:600px;
height:400px;
font-size: 15px;


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
	font-size: 15px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
	
}
.button1:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}

#sendNote {
	background: #7A7A7A;
	width: 170px;
	height: 50px;
	color: white;
	font-size: 30px;
	font-weight: bold;
	border: 2px solid #7A7A7A;
	
}
#sendNote:HOVER {
	background: #FF4239;
	border: 2px solid #FF4239;
}

#btn {
	color: #FF4239;
	font-size: 20px;
	font-weight: bold;
	
}

</style>
</head>

<body>
<div id="header">
	<%@ include file="/common/header.jsp"%>
</div>
<div style="height: 60px;"></div>
		<section>
			<div class="sebody">
			<input type="hidden" id="address" value="${studentInfo.address}"/>
				<div align="center">
					<table class="table1">
						<tr>
							<td></td>			
							<td></td>
							<c:set var="sessionid" value="${sessionid }"/>		
							<c:set var="userid" value="${studentDetail.SB_USERID }"/>					
							<c:if test="${sessionid eq userid or sessionid eq 'admin'}">
								<td align="right" id="btn">								
									
									<c:if test="${sessionid eq userid}">
										<a href="studentUpdateForm.do?sbno=${studentDetail.SB_NO }">수정</a>
											&nbsp;&nbsp;&nbsp;&nbsp;
										
									</c:if>
									<a href="studentDelete.do?sbno=${studentDetail.SB_NO }">삭제</a>
										&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${empty proImg}">
								<td style="width: 60px; height: 60px; border-top: 2px solid #4D4F50; border-bottom: 2px solid #4D4F50;">
								<img src="/lesson/resources/img/student/profile.png" width=70px, height=100px>
								</td>
							</c:if>
							<c:if test="${!empty proImg}">
								<td style="width: 60px; height: 60px; border-top: 2px solid #4D4F50; border-bottom: 2px solid #4D4F50;">
								<img src="uploadFiles/${studentDetail.SB_RENAMEFILE}" width=70px, height=100px>
								</td>
							</c:if>
							
							<td	style="border-top: 2px solid #4D4F50; border-bottom: 2px solid #4D4F50; " align="center"  >
								<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp; ${studentInfo.username }</span>	<br/><br/>
							<c:set var="intro" value="${studentDetail.SB_INTRODUCE }" />
							<c:if test="${empty intro }">
								<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp; 안녕하세요. 잘부탁 드립니다~  </span>
							</c:if>	
							<c:if test="${!empty intro }">
								<span style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp; ${ intro}  </span>
							</c:if>
							</td >		
							<c:if test="${sessionid != '1'}">
								<td style="border-top: 2px solid #4D4F50; border-bottom: 2px solid #4D4F50; " align="center">
									<a href="sendNote.do?number=${loginUser.userid }" id="sendNote">쪽지 보내기</a>
								</td>
							</c:if>
						</tr>					
						
						<tr style="height: 10px;"></tr>
	
					</table>
				</div>
	<div class="menutap">
				<ul class="nav nav-tabs"
					style="margin-left: 0px; border-bottom: 0px solid #dedede;">
					<li class="tab1" style="width: 33.33%; font-size: 16px;">
					<a	class="tab-left" href="#tab-1"
						style="width: 100%; font-size: 16px;" data-toggle="tab">기본정보</a></li>
					<li class="tab2" style="width: 33.33%; font-size: 16px;"><a
						class="tab-center" href="#tab-2"
						style="width: 100%; font-size: 16px;" data-toggle="tab">상세설명</a></li>					
				</ul>
	</div>
				<div id="tab-1">
					<div class="tab-1-iner">
						<p class="name1">
							<img alt="" src="/lesson/resources/img/student/Folder.svg">&nbsp;&nbsp;수업과목
						</p>
						<p class="name2">&nbsp;&nbsp;&nbsp;&nbsp;${studentDetail.SB_SUBJECT}</p><br/>
						
						<p class="name1">
							<img alt="" src="/lesson/resources/img/student/Location-Pin.svg">&nbsp;&nbsp;수업 장소(지역)
						</p>						
						<p class="name2">&nbsp;&nbsp;&nbsp;&nbsp;${studentDetail.SB_AREA}</p><br/>
						
						<p class="name1">
							<img alt="" src="/lesson/resources/img/student/Bank.svg">&nbsp;&nbsp;수업료(시간당)
						</p>
						<p class="name2">&nbsp;&nbsp;&nbsp;&nbsp;${studentDetail.SB_PRICE}원</p><br/>
						
						<p class="name1">
							<img alt="" src="/lesson/resources/img/student/Stopwatch.svg">&nbsp;&nbsp;수업 시간대
						</p>
						<p class="name2">&nbsp;&nbsp;&nbsp;&nbsp;${studentDetail.SB_CLASSTIME}:00시</p><br/>
						
						<p class="name1">
							<img alt="" src="/lesson/resources/img/student/Tags.svg">&nbsp;&nbsp;희망 과외 수준
						</p>
						<p class="name2">&nbsp;&nbsp;&nbsp;&nbsp;${studentDetail.SB_LEVEL}</p><br/>
					</div>
					
				</div>
				<div id="tab-2">
					<div class="tab-2-iner">
					<table class="table2">
					<tr><th>이름</th> <td>${studentInfo.username} </td></tr>					
					<tr><th>성별</th> <td>${(studentInfo.gender=='M')?'남자':'여자'}</td></tr>
					<tr><th>분류</th> <td>${studentDetail.SB_SORT}</td></tr>	
					<tr><th>이메일</th> <td>${studentInfo.email}</td></tr>										
					<tr><th>전화 번호</th> <td>${studentInfo.phone}</td></tr>
					<tr><th>상세 주소</th> <td>${studentInfo.address}</td></tr>
					<tr><th><th></th>
					<tr><th>과외 스타일</th> <td> ${studentDetail.SB_STYLE}</td></tr>
					<tr><th>과외 지역</th> <td> ${studentDetail.SB_AREA}</td></tr>
					<tr><th>과외 장소</th> <td> ${studentDetail.SB_LOCATION}</td></tr>
					<tr><th>과외 목적</th> <td>${studentDetail.SB_PERPOSE}</td></tr>
					<tr><th>과외 시간</th> <td>${studentDetail.SB_CLASSTIME}:00시</td></tr>					
					<tr><th>과외 요일</th> <td>${studentDetail.SB_WEEK_DAY}</td></tr>
					<tr><th>과외 횟수(주)</th> <td> ${studentDetail.SB_NUM_TIMES}회</td></tr>
					<tr><th>시간당 과외비 </th> <td>${studentDetail.SB_PRICE} 원</td></tr>
					</table>
					</div>
					<!-- <br/>
					<h2>약도</h2>
					<br/>
					<div id="map-canvas" style="width:500xp; height:400px;">					
					</div> -->
					<!-- <br/>
					<h2>약도</h2>
					<br/>
					<div id="map" style="width:500xp; height:400px;">					
					</div>
					<div style="height:50px;">
					</div> -->
				</div>
			</div>
		</section>	
		<%@ include file="/common/footer.jsp"%>
	
</body>
</html>