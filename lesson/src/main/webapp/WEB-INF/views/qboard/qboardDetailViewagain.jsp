<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function deleteqboard(){
	var qboardno = $("#qboardno").val();
	location.href="deleteqboard.do?qboardno="+qboardno ;
}

function updateqboard(){
	if($("#btnupdate").val()=='수정'){
		$("#btnupdate").val('수정하기');
		$("#textarea").attr("readonly",false);
		
	}
	var qboardno = $("#qboardno").val();
	var btntext = $("#btnupdate").val();
	if(btntext == '수정하기'){
		 $("#btnupdate").val('수정완료');
		 $("#textarea").focus();
	}else{
		var qboardcontent = $("#textarea").val();
		if(qboardcontent == null || qboardcontent == ''){
			return false;
		}
		location.href="updateqboard.do?qboardno="+qboardno + "&&qboardcontext="+qboardcontent;
	}
}


function replyinsert(){
   var onelevelrepltxt = $("#onelevelrepltxt").val();
   var tdqboardno = $("#qboardno").val();
   var qboardwriter = $("#qboardwriter").val();
   

   $.ajax({
        url: "replyinsert.do",
        method:"POST",
        async:true,
        data:{           
           onelevelrepltxt: onelevelrepltxt,
           tdqboardno: tdqboardno,
           qboardwriter : qboardwriter
        },
        error: function(error){
           alert("에러");
        },
        success: function(data) {    
       
        	changeansweryn($("#qboardno").val());
            var divreplyjsp =    document.getElementById("divDetailquestiontopAnswer");
            var tbodycontent = " ";
            var tdqboardno = $("#qboardno").val();
            for(var i =0 ; i < data.list.length;i++){  
             var QBOARDDATE = new Date(data.list[i].QBOARDDATE); 
            tbodycontent +=  "<table style='border: solid 1px;  margin-left:28px;' >";
            tbodycontent += "<tr>"                   
            tbodycontent += "<td >" + data.list[i].QBOARDWRITER+"</td> <td style='width:300px;'></td>";
            tbodycontent += "<td style='width:300px;'>"+ QBOARDDATE.getFullYear()+"-"+changedateformat(QBOARDDATE.getMonth()+1,2)+"-"+ changedateformat(QBOARDDATE.getDate(),2)+"</td><td style='width:58px;'>";
            tbodycontent += "<a onclick='deletedetailreply("+ data.list[i].QBOARDNO +","+tdqboardno+");'>삭제</a></td></tr>";   
            tbodycontent += "<tr  height='50px'><td colspan='4'>"+data.list[i].QBOARDCONTENT +"</td></tr>";

            tbodycontent += "</table>";     
            }
                       
            $(divreplyjsp).html(tbodycontent);
            $("#onelevelrepltxt").val("");
            $("#divDetailquestionanswer1").hide();
           
             
        }     
     });
}

function changeansweryn(no){
	    
	   

	   $.ajax({
	        url: "changeansweryn.do",
	        method:"POST",
	        async:true,
	        data:{           
	            
	           qboardno: no 
	        },
	        error: function(error){
	           alert("에러");
	        },
	        success: function(data) {       
	        }     
	     });
	}


function goqboardlist(){

	location.href="qboardListView.do";
}



function replydelete(no, no2){
   $.ajax({
        url: "replydelete.do",
        method:"POST",
        async:true,
        data:{           
           tdqboardno: no,
           detailboardno :no2
        },
        error: function(error){
           alert("에러");
        },
        success: function(data) {    
            var divreplyjsp = document.getElementById("divDetailquestiontopAnswer");
            var tbodycontent = " ";
            var tdqboardno = $("#qboardno").val();
            for(var i =0 ; i < data.list.length;i++){  
            var QBOARDDATE = new Date(data.list[i].QBOARDDATE); 

            tbodycontent +=  "<table style='border: solid 1px; margin-left:28px;' >";
            tbodycontent += "<tr>"
            tbodycontent += "<td >" + data.list[i].QBOARDWRITER+"</td> <td style='width:300px;''></td>";

            tbodycontent += "<td style='width:300px;'>"+ QBOARDDATE.getFullYear()+"-"+changedateformat(QBOARDDATE.getMonth()+1,2)+"-"+ changedateformat(QBOARDDATE.getDate(),2)+"</td><td style='width:58px;'>";

            tbodycontent += "<a onclick='deletedetailreply("+ data.list[i].QBOARDNO +","+tdqboardno+");'>삭제</a></td></tr>";   
            tbodycontent += "<tr  height='50px'><td colspan='4'>"+data.list[i].QBOARDCONTENT +"</td></tr>";

            tbodycontent += "</table>";     
            }           
            $(divreplyjsp).html(tbodycontent);
            $("#onelevelrepltxt").val(""); 
            $("#divDetailquestionanswer1").show();
        }     
     });
}

function deletedetailreply(no , no2){
   replydelete(no, no2);
}

//날짜타입 변경
function changedateformat(n, setlength){
    var zero = '';
     n = n.toString();

     if (n.length < setlength) {
       for (i = 0; i < setlength - n.length; i++)
         zero += '0';
     }
     return zero + n;
}

</script>
<style type="text/css">
 #divDetailquestiontop {
 width:650px; height:350px;  margin:auto; margin-top:70px; 
 }
 
 #divDetailquestionanswer1 {
 width:600px; height:120px;  margin:auto; margin-top:20px;
 }
 
 #divDetailquestiontopAnswer{
  width:600px;margin:auto; margin-top:30px;
 }
 
 
.button1 {
	margin-top: 10px;
	background-color:#494949;
	
	color:#ffffff;
	font-size:13px;
	font-style:normal;
	height:28px;
	width:96px;
	text-align:center;
} 

table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
  	margin-left: 20px;

}

table.type09 caption {
    padding: 10px;
    text-align:left;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    
    
}

table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #494949;
}

.hh{

 color: #BDBDBD;
 text-align: center;
}

table.type09 .thstyle1{
width:60px;}

#tdqboardno{
text-align: center;
width: 100px;
}

#click{
margin-left : 20px;
}
 
</style>
</head>
<body>
<div id="divsurface"  >
   <%@ include file="/common/header.jsp"%>
    
   <div id="divDetailquestiontop" >
      <input type="hidden" id="qboardno" value="${qboard.qboardno}"/>
      <input type="hidden" id="qboardwriter" value="${loginUser.userid }"/>
      <table style="width: 600px;" class="type09">
         <caption style="font-size: 20px">문의사항글</caption>
         <tr>
            <th class="hh thstyle1">번호</th>
            <td id="tdqboardno">${qboard.qboardno}</td>
            <th class="hh">작성자</th>
            <td>${qboard.qboardwriter }</td>
            <th class="hh">등록일</th>
            <td>${qboard.qboarddate }</td>
         </tr>

         <tr>
            <th class="hh thstyle1">제목</th>
            <td colspan="3">${qboard.qboardtitle} </td>      
         </tr>   

         <tr >
            <th class="hh thstyle1"  rowspan="2">내용</th>
            <td colspan="5" ><textarea id="textarea" style="width:540px; height:180px;"readonly>${qboard.qboardcontent}</textarea></td>
         </tr>
         
         
      </table>
      <table id="click">
      <tr>
            <td><c:if test="${qboard.qboardwriter eq loginUser.userid }">
                        <input id="btnupdate"  class="button1" type="button" value="수정" onclick="updateqboard();">
               </c:if>
           
               <c:if test="${qboard.qboardwriter eq loginUser.userid || loginUser.userid eq 'admin'  }"> 
                         <input  class="button1" type="button" value="삭제" onclick="deleteqboard();">
               </c:if>
           </td>
               
               <td colspan="4"><label style="width:300px;"></label> 
                     <input class="button1" type="button"  value="리스트" onclick="goqboardlist();">
               </td>
         </tr>
         </table>
   </div>

  <c:if test="${loginUser.userid == 'admin' }">
   <div id="divDetailquestionanswer1">
     <table>
         <tr><td class="hh thstyle1">${loginUser.userid }</td><td style="width:360px;"></td></tr>
         <tr ><td colspan="3">&nbsp;<textarea id="onelevelrepltxt" style="width:550px; height:60px; margin-left:20px;"></textarea></td></tr>
         <tr><td colspan="2"></td><td><input class="button1" type="button" value="등록" onclick="replyinsert();"></td></tr>
      </table>
   </div>
  </c:if>
   
   <div id="divDetailquestiontopAnswer" >
          <c:choose> 
             <c:when test="${fn:length(qboardreply) > 0}">  
            
               <c:forEach items="${qboardreply}" var="row">   
                   <table style="border: solid 1px; margin-left:28px;">               
                  <tr>
                     <td>${row.QBOARDWRITER }</td>  <td style='width:300px;'></td>  <td>${row.QBOARDDATE } </td>   
                     <td style="width:58px;" ><a class="button1" onclick="deletedetailreply(${row.QBOARDNO },${qboard.qboardno});">삭제</a>
                     </td>
                  </tr>
                  <tr  height="50px">
                     <td colspan='4'>${row.QBOARDCONTENT }</td>   
                     
                  </tr>
              
              
                  <tr>
                     <td colspan='4'><br/></td>
                  </tr>   
                   </table>
               </c:forEach>
            
             </c:when>
             <c:otherwise>
             </c:otherwise> 
          </c:choose>
   </div>

</div>
 <br>
   	<%@ include file="/common/footer.jsp"%>

</body>
</html>