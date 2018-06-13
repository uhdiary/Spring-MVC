<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 상세 정보 지원</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		/*지역값 변경에 따른 옵션값 변경*/
		var seoul = [ '전지역', '종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구',
				'성북구', '강북구', '도봉구', '노원구', '은평구', '서대문구', '마포구', '양천구', '강서구',
				'구로구', '금천구', '영등포구', '동작구', '관악구', '서초구', '강남구', '송파구', '강동구' ];
		var gyunggi = [ '전지역', '수원시', '수원시 장안구', '수원시 권선구', '수원시 팔달구',
				'수원시 영통구', '성남시', '성남시 수정구', '성남시 중원구', '성남시 분당구', '의정부시',
				'안양시', '안양시 만안구', '안양시 동안구', '부천시', '광명시', '평택시', '동두천시',
				'안산시', '안산시 상록구', '안산시 단원구', '고양시', '고양시 덕양구', '고양시 일산동구',
				'고양시 일산서구', '과천시', '구리시', '남양주시', '오산시', '시흥시', '군포시', '의왕시',
				'하남시', '용인시', '용인시 처인구', '용인시 기흥구', '용인시 수지구', '파주시', '이천시',
				'안성시', '김포시', '화성시', '광주시', '양주시', '포천시', '여주시', '연천군', '가평군',
				'양평군' ];
		var incheon = [ '전지역', '중구', '동구', '남구', '연수구', '남동구', '부평구', '계양구',
				'서구', '강화군', '옹진군' ];
		var busan = [ '전지역', '중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구',
				'북구', '해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군' ];
		var daegu = [ '전지역', '중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군' ];
		var Gwangju = [ '전지역', '동구', '서구', '남구', '북구', '광산구' ];
		var daejeon = [ '전지역', '동구', '중구', '서구', '유성구', '대덕구' ];
		var jeju = [ '전지역', '제주시', '서귀포시' ];

		$('#selectbox1').change(
				function() {
					var sel = $(this).val();
					$('#s1').empty();

					if (sel == '서울') {
						$.each(seoul, function(i, item) {
							$('#s1').append(
									'<option value="서울 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '인천') {
						$.each(incheon, function(i, item) {
							$('#s1').append(
									'<option value="인천 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '경기') {
						$.each(gyunggi, function(i, item) {
							$('#s1').append(
									'<option value="경기 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '부산') {
						$.each(busan, function(i, item) {
							$('#s1').append(
									'<option value="부산 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '대구') {
						$.each(daegu, function(i, item) {
							$('#s1').append(
									'<option value="대구 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '광주') {
						$.each(Gwangju, function(i, item) {
							$('#s1').append(
									'<option value="광주 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '대전') {
						$.each(daejeon, function(i, item) {
							$('#s1').append(
									'<option value="대전 '+ item + '">' + item
											+ '</option>');
						});
					} else if (sel == '제주') {
						$.each(jeju, function(i, item) {
							$('#s1').append(
									'<option value="제주 '+ item + '">' + item
											+ '</option>');
						});
					}

				});

		/*과목 div에 추가*/
		var count2 = 0;
		var countout2 = 0;
		$('.subjectlabel').hide();
		$('#subjectid').change(function() {
			$('.subjectlabel').show();
			var subject1 = $(this).val();
			var subject2 = $('.subject').text();

			countout2 = count2 + 1;
			var content2 = " ";
			if (countout2 < 4) {

				if (subject2.search(subject1) == -1) {

					$('.subject').append(subject1 + " ");
					count2 = count2 + 1;
					content2 = $('.subject').text();
					$('#subjecttext').val(content2);

				} else if (subject2.search(subject1) == 0) {
					alert('이미 선택 되었습니다.');
				}
			} else {

				alert("과목은 3개까지 선택가능 합니다.");
			}
		});

		/*과외스타일 div에 추가*/
		var countout1 = 0;
		var count1 = 0; //카운트
		$('.lesson_stylelabel').hide();
		$('#lesson_styleid1').change(function() {
			$('.lesson_stylelabel').show();
			var lesson_style1 = $(this).val();
			var lesson_style2 = $('#lesson_styleid').text();

			countout1 = count1 + 1;
			var content1 = " ";

			if (countout1 < 4) {

				if (lesson_style2.search(lesson_style1) == -1) {

					$('#lesson_stylediv').append(lesson_style1 + " ");
					content1 = $('#lesson_stylediv').text();
					count1 = count1 + 1;
					$('#lesson_styleid').val(content1);
				} else if (subject2.search(subject1) == 0) {
					alert('이미 선택 되었습니다.');
				}

			} else {
				alert("과외 스타일은 3개이상 추가하지 못합니다.");

			}

		});

		/*지역 div에 추가*/
		var count = 0;
		var countout = 0;
		$('#locallable').hide();
		$('#s1').change(function() {

			$('#locallable').show();

			var local1 = $(this).val();

			var local2 = $('#localdiv').text();

			countout = count + 1;
			var content3 = " ";
			if (countout < 4) {
				if (local2.search(local1) == -1) {

					$('#localdiv').append(local1 + " ");
					count = count + 1;
					content3 = $('#localdiv').text();
					$('#localtext').val(content3);
				} else if (subject2.search(subject1) == 0) {
					alert('이미 선택 되었습니다.');
				}
			} else {
				alert("지역을 더 이상 추가 할 수 없습니다.");
			}

		});

		/*과외대상 div에 추가*/
		var count3 = 0; //카운트
		var countout3 = 0;
		$('#tagetlable').hide();
		$('#taget').change(function() {
			$('#tagetlable').show();
			var taget1 = $(this).val();
			var taget2 = $('#tagetdiv').text();

			countout3 = count3 + 1;
			var content5 = " ";
			if (countout3 < 4) {

				if (taget2.search(taget1) == -1) {

					$('#tagetdiv').append(taget1 + " ");
					content5 = $('#tagetdiv').text();
					count3 = count3 + 1;
					$('#targettext').val(content5);
				} else if (subject2.search(subject1) == 0) {
					alert('이미 선택 되었습니다.');
				}
			} else {
				alert("과외대상은 3개까지 선택 가능합니다.");

			}
		});

		/*과외 장소 선택*/
		var count7 = 0; //카운트
		var countout7 = 0;
		$('#placelable').hide();
		$('#placeselect').change(function() {
			$('#placelable').show();
			var place1 = $(this).val();
			var place2 = $('#placediv').text();

			countout7 = count7 + 1;
			var content7 = " ";
			if (countout7 < 3) {

				if (place2.search(place1) == -1) {

					$('#placediv').append(place1 + " ");
					content7 = $('#placediv').text();
					count7 = count7 + 1;
					$('#placetext').val(content7);
				} else if (subject2.search(subject1) == 0) {
					alert('이미 선택 되었습니다.');
				}
			} else {
				alert("과외장소는 2개까지 선택 가능합니다.");

			}
		});

		/*시간 테이블 색상 변경*/
		$(document).on("click", ".timetd", function() {

			var time = $('.timetd').val();

			$(time).css("background", "gray");

		});
		var con1 = " ";
		var con2 = " ";
		var con3 = " ";
		var con4 = " ";
		var con5 = " ";
		var con6 = " ";
		var con7 = " ";
		var con8 = " ";
		var con9 = " ";
		var con10 = " ";
		var con11 = " ";
		var con12 = " ";
		var con13 = " ";
		var con14 = " ";
		var con15 = " ";
		var con16 = " ";
		var con17 = " ";
		var con18 = " ";
		var con19 = " ";
		var con20 = " ";
		var sel_type = null;
		var sel_type1 = null;
		var sel_type2 = null;
		var sel_type3 = null;
		$(document).on(
				"click",
				"#submit1",
				function() {
					con1 = $('#tinf_titletext').val();
					con2 = $('#subjecttext').val();
					con3 = $('#wish_pricetext').val();
					con4 = $('#time_pricetext').val();
					con5 = $('#academicselect').val();
					con6 = $('#university_stateselect').val();
					con7 = $('#universitytext').val();
					con8 = $('#majortext').val();

					/* con9 = $('#careertext').val(); */

					con10 = $('#careertext').val();
					con11 = $('#lesson_styleid').val();
					con12 = $('#localtext').val();
					con13 = $('#call_timeselect').val();
					con14 = $('#targettext').val();
					con15 = $('#placetext').val();

					con16 = document.getElementsByName('place_check');

					for (var i = 0; i < con16.length; i++) {
						if (con16[i].checked == true) {
							sel_type = con16[i].value;
						}
					}

					con17 = document.getElementsByName('price_check');

					for (var i = 0; i < con17.length; i++) {
						if (con17[i].checked == true) {
							sel_type1 = con17[i].value;
						}
					}

					con18 = document.getElementsByName('free_check');

					for (var i = 0; i < con18.length; i++) {
						if (con18[i].checked == true) {
							sel_type2 = con18[i].value;
						}
					}

					con19 = document.getElementsByName('img_check');

					for (var i = 0; i < con19.length; i++) {
						if (con19[i].checked == true) {
							sel_type3 = con19[i].value;
						}
					}

					con20 = $('.textarea1').val();
					
					
					
					
					if (con1 == "" || con2 == "" || con3 == "" || con4 == ""
							|| con5 == "" || con6 == "" || con7 == ""
							|| con8 == "" || con9 == "" || con10 == ""
							|| con11 == "" || con12 == "" || con13 == ""
							|| con14 == "" || con15 == "" || con16 == ""
							|| con17 == "" || con18 == "" || con19 == ""|| con20 == "") {
						$('.thclass').css("color","black");
						if (con1 == "") {
							$('#cont1').css("color", "red");
						}
						if (con2 == "") {

							$('#cont2').css("color", "red");
						}
						if (con3 == "") {
							$('#cont3').css("color", "red");
						}
						if (con4 == "") {
							$('#cont4').css("color", "red");
						}
						if (con5 == "") {
							$('#cont5').css("color", "red");
						}
						if (con6 == "") {
							$('#cont6').css("color", "red");
						}
						if (con7 == "") {
							$('#cont7').css("color", "red");
						}
						if (con8 == "") {
							$('#cont8').css("color", "red");
						}
						/* if (con9 == "") {
							$('#cont9').css("color", "red");
						} */
						if (con10 == "") {
							$('#cont10').css("color", "red");
						}
						if (con11 == "") {
							$('#cont11').css("color", "red");
						}
						if (con12 == "") {
							$('#cont12').css("color", "red");
						}
						if (con13 == "") {
							$('#cont13').css("color", "red");
						}
						if (con14 == "") {
							$('#cont14').css("color", "red");
						}
						if (con15 == "") {
							$('#cont15').css("color", "red");
						}
						if (sel_type == null) {
							$('#cont16').css("color", "red");
						}
						if (sel_type1 == null) {
							$('#cont17').css("color", "red");
						}
						if (sel_type2 == null) {
							$('#cont18').css("color", "red");
						}
						if (sel_type3 == null) {
							$('#cont19').css("color", "red");
						}
						if (con20 == "") {
							$('#cont20').css("color", "red");
						}
						if(parseInt(con3) < 10000){
							alert('희망 과외비는 만원부터 입력이 가능합니다.');
						}
						if(parseInt(con4) < 10000){
							alert('시간당 과외비는 만원부터 입력이 가능합니다.');
						}
						

						alert('입력되지 않은 값이 있습니다.');
						return false;
					}
					
				});

	});
</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

.sebody {
	padding: 10px;
	font-family: 'Nanum Gothic', sans-serif;
}
.table1{
/* border: 1px solid #4D4F50; */
width:750px;
}
.thclass {
	padding: 5px;
	background: #D8ECF6;
	color:#4D4F50;
	border-top: 1px solid white;
	border-bottom: 2px solid white;
	padding-left: 10px;
}

.table1 td {
	padding-left: 20px;
	padding-top:20px;
	padding-bottom: 20px;
	border-top: 2px solid #4D4F50;
	border-bottom: 2px solid #4D4F50;
}

.paddinno{
padding:0px;
}

.select1 {
	width: 255px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 17px;
}

.inpu {
	width: 255px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 17px;
}

input {
	width: 255px;
	height: 50px;
	border: 2px solid #7A7A7A;
	font-size: 17px;
}

.check1, .check2, .check3, .check4 {
	width: 20px;
	height: 20px;
}

.place1 {
	width: 20px;
	height: 20px;
}

.textarea1 {
	border: 2px solid #7A7A7A;
	font-size: 17px;
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

.checkboxfont {
	font-size: 20px;
	padding: 15px;
}

.filediv {
	height: 10px;
}

label {
	font-size: 20px;
	font-weight: lighter;
	
}

.subject {
	display: inline;
	font-size: 17px;
	color: red;
}

.subjectlabel {
	color: black;
}

.divup {
	display: inline;
	font-size: 17px;
	color: red;
}

.timetable tr td {
	border: 1px solid red;
}
.nameh1{
width: 750px;
/* background:#CAD2DB; */
border:7px solid #CAD2DB;
/* border-top:7px solid #CAD2DB; */
color:#7A7A7A;

}
.nameh1 span{
font-size: 35px;
font-weight: bold;
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
	<div class="sebody" align="center">
	<div class="nameh1">
		<span>선생님 상세 정보 입력</span>
		</div>
		<div style="height: 20px;"></div>
		<form action="teacherInsert.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginUser.userid}">
			<table class="table1">
				<tr>
					<th class="thclass" id="cont1">제목</th>
					<td><input type="text" id="tinf_titletext" name="tinf_title"
						required="required"></td>
				</tr>
				<tr>
					<th class="thclass" id="cont2">과외 과목</th>
					<td><select class="select1" id="subjectid">

							<option value="수학">수학</option>
							<option value="국어">국어</option>
							<option value="영어">영어</option>
							<option value="사회">사회</option>
							<option value="과학">과학</option>
							<option value="컴퓨터">컴퓨터</option>
							<option value="예체능">예체능</option>

					</select> &nbsp;&nbsp;<label class="subjectlabel">선택 과목 :</label>&nbsp;&nbsp;
						<div class="subject" id="subject">
							<input type="hidden" id="subjecttext" name="subject">
						</div></td>
				</tr>
				<tr>
					<th class="thclass" id="cont3">희망 과외비</th>
					<td><input type="number" id="wish_pricetext" min="10000"
						step="10000" name="wish_price">&nbsp;&nbsp;<label>원</label></td>
				</tr>
				<tr>
					<th class="thclass" id="cont4">시간당 과외비</th>
					<td><input type="number" id="time_pricetext" min="10000"
						step="10000" name="time_price">&nbsp;&nbsp;<label>원</label></td>
				</tr>
				<tr>
					<th class="thclass" id="cont5">학력</th>
					<td><select class="select1" id="academicselect"
						name="academic">
							<option>고등학생</option>
							<option>방통대</option>
							<option>대학교</option>
							<option>대학원</option>
					</select></td>
				</tr>
				<tr>
					<th class="thclass" id="cont6">학력상태</th>
					<td><select class="select1" id="university_stateselect"
						name="university_state">
							<option>재학</option>
							<option>휴학</option>
							<option>졸업</option>
					</select></td>
				</tr>
				<tr>
					<th class="thclass" id="cont7">대학명</th>
					<td><input type="text" id="universitytext" name="university">&nbsp;&nbsp;<label>대학교</label></td>
				</tr>
				<tr>
					<th class="thclass" id="cont8">전공</th>
					<td><input type="text" id="majortext" name="major">&nbsp;&nbsp;<label>전공</label></td>
				</tr>
			
				<tr>
					<th class="thclass" id="cont10">과외경력</th>
					<td><input type="number" min="1" id="careertext" name="career">&nbsp;&nbsp;<label>년</label></td>
				</tr>
				<tr>
					<th class="thclass" id="cont11">과외 스타일</th>
					<td><select class="select1" id="lesson_styleid1">
							<option>진실한</option>
							<option>성실한</option>
							<option>센스있는</option>
							<option>책임감있는</option>
							<option>체계적인</option>
							<option>자상한</option>
							<option>창의적인</option>
							<option>자유로운</option>
					</select> &nbsp;&nbsp;<label class="lesson_stylelabel">과외스타일 : </label>
						<div class="divup" id="lesson_stylediv">
							<input type="hidden" id="lesson_styleid" name="lesson_style">
						</div></td>
				</tr>
				<tr>
					<th class="thclass" id="cont12">과외가능 지역</th>
					<td>
						<p>
							<label class="la1">지역 </label>
						</p>
						<p>
							<select class="inpu" id="selectbox1">
								<option>전지역</option>
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
						<p>
							<label class="la1" id="localid">세부지역 </label>
						</p>
						<p>
							<select class="inpu" id="s1">
								<option>지역선택</option>
							</select>
						</p> <label id="locallable">선택 지역 : </label>
						<div class="divup" id="localdiv">
							<input type="hidden" id="localtext" name="lesson_area">
						</div>
					</td>
				</tr>


				<tr>
					<th class="thclass" id="cont13">연락가능시간</th>
					<td><select class="select1" id="call_timeselect"
						name="call_time">
							<option>시간관계없음</option>
							<option>오전</option>
							<option>오후</option>
							<option>저녁</option>
					</select></td>
				</tr>
				<tr>
					<th class="thclass" id="cont14">과외대상</th>
					<td><select class="select1" id="taget">
							<option>미취학</option>
							<option>초등학생</option>
							<option>고등학생</option>
							<option>대학생</option>
							<option>일반</option>
							<option>입시</option>
							<option>자격증</option>
							<option>취미</option>
					</select> <label id="tagetlable">선택 대상 : </label>
						<div class="divup" id="tagetdiv">
							<input type="hidden" id="targettext" name="lesson_target">
						</div></td>
				</tr>

				<tr>
					<th class="thclass" id="cont15">과외장소</th>
					<td><select class="select1" id="placeselect">
							<option>학생집</option>
							<option>선생님집</option>
							<option>카페</option>
							<option>사무실</option>
							<option>모임공간</option>
					</select> <label id="placelable">선택 장소 : </label>
						<div class="divup" id="placediv">
							<input type="hidden" id="placetext" name="place">
						</div></td>
				</tr>
				<tr>
					<th class="thclass" id="cont16">과외장소 대상 여부</th>
					<td>
						<div class="checkboxfont">
							<input class="check1" type="radio" name="place_check" value="가능">
							&nbsp;<label>가능</label>&nbsp;&nbsp;<input class="check1" type="radio"
								name="place_check" value="불가능">&nbsp;<label>불가능</label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="thclass" id="cont17">수업료 협의 가능 여부</th>
					<td>

						<div class="checkboxfont">
							<input class="check2" type="radio" name="price_check" value="가능">
							&nbsp;<label>가능</label>&nbsp;&nbsp;<input class="check2" type="radio"
								name="price_check" value="불가능">&nbsp;<label>불가능</label>
						</div>

					</td>
				</tr>
				<tr>
					<th class="thclass" id="cont18">무료시험 과외 가능 여부</th>
					<td>
						<div class="checkboxfont">
							<input class="check3" type="radio" name="free_check" value="가능">
							&nbsp;<label>가능</label>&nbsp;&nbsp;<input class="check3" type="radio"
								name="free_check" value="불가능">&nbsp;<label>불가능</label>
						</div>
					</td>
				</tr>

				<tr>
					<th class="thclass" id="cont">사진업로드</th>
					<td><div class="filediv"></div> <input type="file"
						style="border: none;" name="uploadFile" required="required"></td>
				</tr>
				
				<tr>
					<th class="thclass" id="cont20">자기소개</th>
					<td class="paddinno"><textarea class="textarea1" name="self" rows="10"
							cols="50"></textarea></td>
				</tr>
			</table>
			<div style="height:40px;"></div>
			<button id="submit1" class="button1">정보 입력</button>
		</form>
	</div>
	<div style="height:50px;"></div>
<div id ="fotters">
	 <%@ include file="/common/footer.jsp"%>
	</div>
</body>
</html>