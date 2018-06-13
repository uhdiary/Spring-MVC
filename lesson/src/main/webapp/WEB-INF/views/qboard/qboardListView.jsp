<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>1:1 문의사항</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function checklogin(){
   var loginuser = $("#hiddenloginid").val()
   if(loginuser == null || loginuser ==""){
      alert("로그인하세요"); 
      location.href="/lesson/loginGo.do";
   }else {location.href="/lesson/qboardWriteForm.do";}
}
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

table.ex1 {width:98%; margin:0 auto; text-align:right; border-collapse:collapse}
.ex1 th, .ex1 td {padding:5px 10px}
.ex1 thead th {background:#ABC668; color:#fff; text-align:center; border-right:1px solid #fff}
.ex1 tbody th {text-align:left; width:12%}
.ex1 tbody td.date1 {text-align:center; width:8%}
.ex1 tbody td.desc {text-align:left; width:35%}
.ex1 tbody tr.odd {background:#f9f9f9}
.ex1 tbody tr.odd th {background:#f2f2f2}
.ex1 tbody tr:hover {background:#F3F5BB}
.ex1 tbody tr:hover th {background:#F2F684; color:#1BA6B2}
</style>
</head>
<body>
   <%@ include file="/common/header.jsp"%><br>
   <br>
   <br>
   <br>   

   <center>
      <img src="${pageContext.request.contextPath}/resources/img/qboard/qboard.png"width="900px" heighe="180px" ><br>
   
      <div id="aa">
         <img src="${pageContext.request.contextPath}/resources/img/qboard/FAQ.png">
         <img src="${pageContext.request.contextPath}/resources/img/qboard/Q&A.png"><br><br>
      </div>   <br>
   <form action="qboardListView.do" method="post">
       <div id="ab">
       <input type="hidden" value="${loginUser.userid}" id="hiddenloginid">
       <table class="ex1">
         <thead>
            <tr>
               <th scope="col">번호</th><th scope="col">게시글번호</th><th scope="col">제목</th><th scope="col">글쓴이</th>
               <th scope="col">등록일</th>
            </tr>
         </thead>
         </form>
         
         <tr class="odd">
            <c:choose>
               <c:when test="${fn:length(list) > 0}">
                  <c:forEach items="${list}" var="row">
                     <tr align="center">
                        <td>${row.RNUM}</td>
                        <td>${row.QBOARDNO}</td>
                        <c:url value = "qboardDetailViewagain.do" var = "detail">
                        <c:param name = "qboardno" value = "${row.QBOARDNO}"/>
                            </c:url>
                           <td><a href = "${detail}">${row.QBOARDTITLE}
                           				
                           			<c:if test="${row.ANSWERYN eq 'Y'}"> [답글]
                           			</c:if>
                            </a></td>
                        <td>${row.QBOARDWRITER}</td>
                        <td><fmt:formatDate value="${row.QBOARDDATE }" pattern="yyyy-MM-dd"/></td>
                     </tr>
                  </c:forEach>
               </c:when>
               
            <c:otherwise>
               <tr align="center">
                  <td colspan="5">조회된 결과가 없습니다.</td></tr>
            </c:otherwise>
            </c:choose>
       </table><br>
       
       <div id="paging">
               <c:if test="${startPage gt 1 }">
                  <a class="atag" href="qboardListView.do?page=${startPage - 1} }">[이전]
                  </a>
               </c:if>
               <c:if test="${startPage eq 1 }">[이전] </c:if>

               <c:forEach var="num" begin="${startPage }" end="${endPage }"
                  step="1">
                  <c:if test="${num eq currentPage }">
                     <strong><b>${num }</b></strong>&nbsp;
               </c:if>
                  <c:if test="${num ne currentPage }">
                     <a class="atag" href="qboardListView.do?page=${num }">${num }</a> &nbsp;
               </c:if>
               </c:forEach>

               <c:if test="${endPage lt maxPage }">
                  <a class="atag" href="qboardListView.do?page=${endPage + 1}">
                     [다음] </a>
               </c:if>
               <c:if test="${endPage eq maxPage }">
               [다음]
            </c:if>
            </div>
       
          <div align="right">
            <input type="button" value="글쓰기" id="button1" onclick="checklogin();"> 
            </div>
   </center>
   <br>
   	<%@ include file="/common/footer.jsp"%>
</body>
</html>