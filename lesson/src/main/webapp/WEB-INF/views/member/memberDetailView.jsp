<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 정보 보기</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/hotel/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function mdel(){ 
		   // 경고창실행   choicedrefundno 자리에 원하는 문구.   
		   //var choice  =  confirm("삭제하시겠습니까?" )  -> 사용자가 확인 누르면 true 값이 choice에 들어가고 아니면 false가 들어감
		   var con_test = confirm("회원 탈퇴를 하시겠습니까?");
		   if(con_test == true){ 
			   var userid = $("#hiddenuserid").val();
			   location.href= "/lesson/mdel.do?userid=" + userid;
			   alert("회원탈퇴를 성공하셧습니다.");
		   }
		   else if(con_test == false){
		   		alert("회원탈퇴를 취소하셧습니다.");
		   }
}
</script>
<style type="text/css">
	#joinform{
   width:705px;
   height:500px;
   margin:0 auto;
   }
   #size1{
   width:750px;
   }
    .top{
      height: 60px;
   }
.bottom{
height:-20px;
}

   .f11{
   	border: 0px;
   }
	.h21{background-color:#D8ECF6; text-align:center; padding:10px 0; color: #464543; }
	.add{color:black;}
	.dataView table{width:100%; border-bottom:2px solid #ccc; border-collapse:collapse;}
   .dataView table th{width:99px; height:44px; border-top:1px solid #ccc; text-align:left;}
   .dataView table tr:first-child td,.dataView table tr:first-child th{border-top:2px solid #ccc;}
   .dataView th label{display:inline-block; width:99px; padding:10px 0 5px 10px;}
   .dataView table td{border-top:1px solid #ccc; padding:5px 10px;}
    .btnCenter{text-align:center; padding-top:5px;}
   .btnCenter input{width:107px; height:30px; font-weight:bold;}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<center>
		<div class="top"></div>
		<div id="size1">
		<h1 class="h21">내 정보</h1>
		<form id="joinform">
			<fieldset class="f11">
				<div class="dataView">
					<table class="to">
						<tbody>
							<tr>
								<th scope="row">아이디 :</th>
								<td>${loginUser.userid}</td>
							</tr>
							<tr>
								<th scope="row">이 름 :</th>
								<td>${ loginUser.username}</td>
							</tr>
							<tr>
								<th scope="row">성 별 :</th>
								<td>
									${ (loginUser.gender == 'M') ? "남자" : "여자" }
								</td>
							</tr>
							<tr>
								<th scope="row">출생년도 :</th>
								<td>${ loginUser.userno}</td>
							</tr>
							<tr>
								<th scope="row">이메일 :</th>
								<td>${ loginUser.email}</td>
							</tr>
							<tr class="mobileNo">
								<th>전화번호 :</th>
								<td>${ loginUser.phone}</td>
							</tr>
							<tr>
								<th scope="row">주 소 :</th>
								<td>${ loginUser.postal}<p>${ loginUser.address} | ${ loginUser.address_o }		</td>		
							</tr>
					</table>
				</div>
				<div class="btnCenter">
            <a class="add" href="/lesson/memberupDate.do?userid=${ loginUser.userid }"><input id="button1" type="button" value="수정"/></a>
            <a class="add" href="#"><input id="button2" type="button" value="탈퇴" onclick="return mdel();"/></a>
            <input type="hidden" value="${ loginUser.userid }" id="hiddenuserid">
         </div>
			</fieldset>
		</form>
		</div>
	</center>
</body>
</html>