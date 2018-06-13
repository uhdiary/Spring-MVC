<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>자주하는질문</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.sud_content').slideUp();
	$('#checkbox').click(function() {
    if($(this).is(':checked') == true){
       $('.checkbox').prop('checked', true);
    }else{
       $('.checkbox').prop('checked', false);
    }
 })
 
 
   
})
 
  function chk_values() {
           var chk= new Array();
           
           $('.checkbox:checked').each(function() {
              chk.push($(this).val());
           });

           if(chk.length == 0){
              alert('하나이상 선택이 필요합니다.');
              brack;
           }
             return chk;
        };
        
        function receive_del() {
           $('input[name=check_no]').val(chk_values());
           var form = document.chkform;
            form.action =  'deletefaq.do';
            form.method = "post";
            form.submit();
        };

function gowriteform(){
	location.href="/lesson/faqboardWriteForm.do";
}

$(function(){
	  $('.sud_button').click(function(){
		            $(this).next().slideDown();
	            });
	  
	            $('.sud_content').click(function(){
	                $(this).slideUp();
	            });
	});
	
$("#search_area").on("focus", function(){
	$(this).attr("placeholder", ""); 
}).on("focusout", function(){ 
	$(this).attr("placeholder", "엔터 누르면 자동검색"); 
}).keypress(function (evt) {
	if (evt.keyCode == 13){ // 엔터를 누르면
		var word = $("#search_area").val().trim();
		if(word.length < 1){
			alert("입력값이 없음!!");
			return false;
		}
		$("#searchform").submit();
	}
	});


</script>
<style type="text/css">


#aa{
 border:10px;
 width:780px;
 border-style: outset;
 border-color: orange;
}

#ab{
 border:5px;
 width:780px;
 padding-top:70px;
 padding-bottom:70px;
 border-style: solid;
 border-color: #FC6E2A; 

}

#aa img{
 width: 300px;
}

#button1 {
	background-color:#ce0100;
	border:1px solid #d83526;
	color:#ffffff;
	font-size:13px;
	font-style:normal;
	height:28px;
	width:96px;
	text-align:center;
}
table.ex1 {width:98%; margin:0 auto; text-align:left; border-collapse:collapse}
.ex1 th, .ex1 td {padding:5px 10px}
.ex1 thead th {background:#ABC668; color:#fff; text-align:center; border-right:1px solid #fff}
.ex1 tbody th {text-align:left; width:12%}
.ex1 tbody td.date1 {text-align:center; width:8%}
.ex1 tbody td.desc {text-align:left; width:35%}
.ex1 tbody tr.odd {background:#f9f9f9}
.ex1 tbody tr.odd th {background:#f2f2f2}
.ex1 tbody tr:hover {background:#F3F5BB}
.ex1 tbody tr:hover th {background:#F2F684; color:#1BA6B2}

#ae{
height: 100px; 
background-color: white;

}
</style>

</head>
<body>
	<%@ include file="/common/header.jsp"%><br>
	<br>
	<br>
	<br>	

	<center>
		<img src="${pageContext.request.contextPath}/resources/img/qboard/qboard.png" width="900px"  ><br>
	
		<div id="aa">
			<img src="${pageContext.request.contextPath}/resources/img/qboard/FAQ.png">
			<img src="${pageContext.request.contextPath}/resources/img/qboard/Q&A.png"><br><br>
		</div>	<br>
		
	<form action="faqboardListView.do" method="post">
	<div id="ab">
		 <input type="hidden" value="${loginUser.userid}" id="hiddenloginid">
		 <table class="ex1">
			<thead>
				<tr>
					<th scope="col">번호</th><th scope="col">제목</th><th scope="col">글쓴이</th>
					<c:if test="${loginUser.userid eq 'admin'}">
					<th id="chk" width="1%" scope="col"><input type="checkbox" name="checkAll" id="checkbox" /></th>
					</c:if>
				</tr>
			</thead>
			</div>
			</form>
			
			<form name="chkform">
               <input type="hidden" name="check_no" />
            </form>
            
			<tr class="odd">
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
						<div class="slideupAnddown">
							<tr align="center" class="sud_button">
								<td >${row.FAQBOARDNO}</td>
								<c:url value = "faqboardListView.do" var = "detail">
								<c:param name = "faqboardno" value = "${row.FAQBOARDNO}"/>
        					     </c:url>
        					    
        					    <td id="qcontent" class="choicedtd">${row.FAQBOARDTITLE}</td>
        					    
								<td>${row.FAQBOARDWRITER}</td>
							
								<c:if test="${loginUser.userid eq 'admin'}">
								<td><input type="checkbox" class="checkbox" value = "${row.FAQBOARDNO}"/></td>
								</c:if>
							</tr>
							</div>
							<tr id="content" class="sud_content">
							 <td colspan ="4">${row.FAQBOARDCONTENT}</span></td>
							</tr>
							</div>	
						</c:forEach>
					</c:when>
					
				<c:otherwise>
					<tr align="center">
						<td colspan="5">조회된 결과가 없습니다.</td></tr>
				</c:otherwise>
				</c:choose>
				</tr>
				
				<c:if test="${loginUser.userid eq 'admin'}">
    			<tr align="right">
    				<td id="ae" colspan="5" text-align:right;>
    		  		<input type="button" value="글쓰기" id="button1" onclick="gowriteform();"> 
    		  	    &nbsp;&nbsp;<input type="button" value="삭제하기" id="button1" onclick="receive_del();">
    		  	    </td> 
	 	     	</tr>
				</c:if>
		 </table><br>
		 
		 <form action="faqcerch.do" method="post" id="searchform">
				<input id="search_area" placeholder="엔터 누르면 자동검색" maxlength = "15" name = "keyword" value = "${keyword}">
			</form>
		 </div>
		 
		 
		 
		 <div id="paging">
               <c:if test="${startPage gt 1 }">
                  <a class="atag" href="faqboardListView.do?page=${startPage - 1} }">[이전]
                  </a>
               </c:if>
               <c:if test="${startPage eq 1 }">[이전] </c:if>

               <c:forEach var="num" begin="${startPage }" end="${endPage }"
                  step="1">
                  <c:if test="${num eq currentPage }">
                     <strong><b>${num }</b></strong>&nbsp;
               </c:if>
                  <c:if test="${num ne currentPage }">
                     <a class="atag" href="faqboardListView.do?page=${num }">${num }</a> &nbsp;
               </c:if>
               </c:forEach>

               <c:if test="${endPage lt maxPage }">
                  <a class="atag" href="faqboardListView.do?page=${endPage + 1}">
                     [다음] </a>
               </c:if>
               <c:if test="${endPage eq maxPage }">
               [다음]
            </c:if>
            </div>
		
	</center>
	 <br>
   	<%@ include file="/common/footer.jsp"%>
</body>
</html>