<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
#joinform{
   width:1100px;
   height:630px;
   margin:0 auto;
   }
   #size1{
   width:1100px;
   }
    .top{
      height: 60px;
   }
   .f11{
   	border: 0px;
   }
	.h21{background-color:#D8ECF6; text-align:center; padding:10px 0; color: #464543;}
	.to{text-align:center;}
	.dataView table{width:100%; border-bottom:2px solid #ccc; border-collapse:collapse;}
   .dataView table th{ height:20px; border-top:1px solid #ccc; text-align:center;}
   .dataView table tr:first-child td,.dataView table tr:first-child th{border-top:2px solid #ccc;}
   .dataView th label{display:inline-block; width:99px; padding:10px 0 5px 10px;}
   .dataView table td{border-top:1px solid #ccc; padding:5px 10px;} 
   .int {
	text-align: center;
	padding-top: 5px;
}
.int #button1{
	width: 50px;
	height: 30px;
	font-weight: bold;
}
#geomsaeg{
	width: 100px;
	height: 30px;
}
#it {
	width: 150px;
	height: 30px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
function searchgogo(){
	var seachword = $("#seachword").val();
	var hiddensearchstandardKind = $("#geomsaeg").val();
	location.href="managergo.do?seachword=" + seachword+"&hiddensearchstandardKind="+hiddensearchstandardKind;
}
</script>


</head>
<body>
<%@ include file="/common/header.jsp"%>
    <div class="top"></div>
    <center>
	<div id="size1">
		<h1 class="h21">회원 관리
		</h1>
		<br/>
		 
					<select id="geomsaeg" name="geomsaeg" title="검색">
                              <option value="userid">ID</option>
                              <option value="username">이름</option>
                              <option value="phone">전화번호</option>
                    </select>&nbsp;&nbsp;<input type="text" id="seachword" name="seachword"> 
                           <input id="button1" type="button" href="" value="검색" onclick="searchgogo();" />
                      <br/>
		<form action="managergo.do" id="joinform" method="post">
			<fieldset class="f11">
				<div class="dataView">
					
					<table class="to" border="1" cellspacing="0">
						<tbody>
   							<tr><th width="6%">아이디</th><th width="6%">비밀번호</th><th width="7%">이름</th><th width="7%">출생년도</th>
  								 <th width="3%">성 별</th><th width="8%">학생/선생님</th><th width="13%">이메일</th><th width="13%">전화번호</th>
  								 <th width="7%">우편번호</th><th width="20%">주소</th><th width="40%">가입일</th></tr>
   <c:forEach var="aaa" items="${list }">
   <tr><td><a href="managerMember.do?userid=${aaa.USERID}">${ aaa.USERID}</a></td>
      <td>${ aaa.USERPWD}</td>
      <td>${ aaa.USERNAME}</td>
      <td>${ aaa.USERNO}</td>
      <td>${ aaa.GENDER}</td> 
      <td>${ (aaa.USERCO == '1') ? "학생" :(aaa.USERCO == '2' ? "선생님" : "관리자")}</td>
      <td>${ aaa.EMAIL}</td>
      <td>${ aaa.PHONE}</td>
      <td>${ aaa.POSTAL}</td>
      <td>${ aaa.ADDRESS}  ${ aaa.ADDRESS_O}</td>
      <td> <fmt:formatDate value="${ aaa.ENROLL_DATE}" pattern="yyyy-MM-dd"/></td>
   </tr>
   </c:forEach>
					</table>
				</div>
			</fieldset>
		</form>
	</div>	
	<div id="pagingDiv">${boardPaging }</div>
	<input type="hidden" id="hiddenCurrentPage" value="${currentPage }"/>
	</center>		
</body>
</html>