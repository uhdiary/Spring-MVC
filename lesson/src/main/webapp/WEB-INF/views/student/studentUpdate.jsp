<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정</title>

<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

function validate(){
	var classtime = $("#classtime").val();
	var numtimes = $("#numtimes").val();	
	var weekday1 = $("#weekday1").val();
	var weekday2 = $("#weekday2").val();
	var intro = $("#SB_INTRODUCE").text();
		
	var weekday = weekday1 +", "+ weekday2;
	
	
	if(!classtime){
		alert("과외 시간을 입력해 주세요");
		return false;
	}
	if(!chk(/^([1][0-9]|2[0-2])$/, classtime)){
		alert("10에서 22사이의 숫자를 넣어주세요");
		$("#classtime").val("");
		return false;
	}
	
	if(!numtimes){
		alert("과외 시간을 입력해 주세요");
		return false;
	}
	if(!chk(/[1-7]$/, numtimes)){
		alert("1에서 7사이의 숫자를 넣어주세요");
		$("#numtimes").val("");
		return false;
	}
	if(intro==null){
		alert("자기소개를 넣어주세요");		
		return false;
	}
	if(document.getElementById("SB_INTRODUCE").value.length > 20){
		alert("글자수를 20자 이하로 입력해주세요");		
		return false;
	}
	if(weekday1 == weekday2)
	{
		alert("서로 다른 요일을 선택해 주세요");		
		return false;
	}
	else{
		document.getElementById('weekval').value = weekday;
		return true;
	}
}

function chk(re, e) {
	
    if (re.test(e)) {
        return true;
    }        
    else{
    	return false;
    }
}
</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
#classtime{
	p}
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
	width:100px;
}

.searchname {
	background: #7A7A7A;
	color: white;
	height: 70px;
	padding: 0.1px;
	font-weight: bold;
}

.searchinfo {
	height: 1000px;
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
background-color:#7A7A7A;
font-size: 20px;
color:white;
border: 1px solid white; 
}

#table1_td2 td{
border: 1px solid #7A7A7A;
}

#paging td{
text-align: center;
font-size: 15px;
color:#7A7A7A;
margin: 5px;
padding: 10px;

}
#enrolldiv{
padding-left: 40px;
}
</style>

</head>
<body>	
<div id="header">
	<%@ include file="/common/header.jsp"%>
</div>
<div style="height: 70px;"></div>
	<h2>정보 수정</h2>
	<HR>
	<form action="studentUpdate.do" method="POST" enctype="multipart/form-data" onsubmit="return validate();" >
		<input type="hidden" id="SB_USERID" name="SB_USERID" value="${userid}"/>
		<input type="hidden" id="SB_NO" name="SB_NO" value="${sbno}" />
			<div id="enrolldiv">			
				<p>	
					<label class="la1">과외 시간</label>
					<input type="number" min="10" max="22" step="1" id="classtime" class="price1" name="SB_CLASSTIME" value="" placeholder="10 ~ 22">
				</p>
				<span style="height:10px;">&nbsp;</span>
				
				<!-- 	<label class="la1">과외 횟수</label> -->
						<input type="hidden" id="numtimes" class="price1" name="SB_NUM_TIMES" value="2">
				
				<span style="height:10px;">&nbsp;</span>
				<p>		
						<input type = "hidden" id ="weekval" name="SB_WEEK_DAY"/>
						<label class="la1">희망 요일</label>
						<select class="inpu" id="weekday1">	
							<option>월</option>
							<option>화</option>
							<option>수</option>
							<option>목</option>
							<option>금</option>
							<option>토</option>
							<option>일</option>
						</select>
						
						<select class="inpu" id="weekday2" >	
							<option>월</option>
							<option>화</option>
							<option>수</option>
							<option>목</option>
							<option>금</option>
							<option>토</option>
							<option>일</option>
						</select>
				</p>
				<span style="height:10px;">&nbsp;</span>
				<p>
						<label class="la1">과외 기간</label>
						<select class="inpu" name ="SB_PERIOD">
							
							<option>1개월</option>
							<option>2개월</option>
							<option>3개월 이상 6개월 이하</option>
							<option>6개월 이상 1년 이하</option>
							<option>1년이상 2년이하</option>
							<option>2년 이상</option>
						</select>
				</p>
				<span style="height:10px;">&nbsp;</span>
				<p>
						<label class="la1">과외 지역</label>
						<select class="inpu" name ="SB_AREA">
							<option>서울</option>
							<option>경기</option>
							<option>인천</option>
							<option>부산</option>
							<option>대구</option>
							<option>광주</option>
							<option>제주</option>
						</select>
				</p>	
				<span style="height:10px;">&nbsp;</span>
				<p>
						<label class="la1">과외 형태</label>
						<select class="inpu" name ="SB_STYLE">
							
							<option>개인</option>
							<option>그룹</option>
						</select>
				</p>
				<span style="height:10px;">&nbsp;</span>
				<p>
						<label class="la1">과외 과목</label>
						<select class="inpu" name ="SB_SUBJECT">
							
							<option>수학</option>
							<option>국어</option>
							<option>영어</option>
							<option>사회</option>
							<option>과학</option>
							<option>컴퓨터</option>
							<option>예체능</option>

						</select>
					</p>
					<span style="height:10px;">&nbsp;</span>
					<p>
						<label class="la1">과외 목적</label>
						<select class="inpu" name ="SB_PERPOSE">
							
							<option>일반</option>
							<option>진학</option>
						</select>
				</p>
				<span style="height:10px;">&nbsp;</span>
				<p>
							<label class="la1">과외 수준</label>
							<select class="inpu" name="SB_LEVEL">
								<option>초급</option>
								<option>중급</option>								
								<option>고급</option>
							</select>
						</p>
						<span style="height:10px;">&nbsp;</span>
						<p>
							<label class="la1">분류</label>
							<select class="inpu" name="SB_SORT">
								<option>초등학생</option>
								<option>중학생</option>								
								<option>고등학생</option>
								<option>대학생</option>
								<option>일반</option>
							</select>
						</p>
						<span style="height:10px;">&nbsp;</span>
						<p>
							<label class="la1">희망 장소</label>
							<select class="inpu" name="SB_LOCATION">
								<option>자택</option>
								<option>도서관</option>								
								<option>카페</option>
								<option>상관없음</option>
							</select>
						</p>
						<span style="height:10px;">&nbsp;</span>
						<p>
							<label class="la1" >과외 비</label>
							<input type="number" min="10000" step="10000" class="price1" name="SB_PRICE" value="10000">
						</p>
						<span style="height:10px;">&nbsp;</span>
						<p>
							<label class="la1" >자기 소개</label>							
						</p>
							<label class="la1" ></label>		
							<textarea rows="5" cols="34" id="SB_INTRODUCE" name="SB_INTRODUCE" style="resize:none;">
							</textarea>						
						<span style="height:10px;">&nbsp;</span>
						<p>
							<label class="la1" >사진 등록</label>
							
							<input type ="file" name="uploadFile"/>
						</p>
						<span style="height:10px;">&nbsp;</span>
						<input type="submit" class = "button1" value="수정"><br/><br/>
			</div>	
		
	</from>
	<div sytle="height:20px;"></div><div>
	<%@ include file="/common/footer.jsp"%></div>
	
</body>
</html>