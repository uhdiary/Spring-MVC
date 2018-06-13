<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
#menu {
	text-align: center;
	width: 120px;
	height: 120px;
	padding: 20px 0 0 0;
	list-style: none;
	background: #111;
	background: -moz-linear-gradient(#444, #111);
	background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #111),
		color-stop(1, #444));
	background: -webkit-linear-gradient(#444, #111);
	background: -o-linear-gradient(#444, #111);
	background: -ms-linear-gradient(#444, #111);
	background: linear-gradient(#444, #111);
	-moz-border-radius: 5px;
	border-radius: 5px;
	-moz-box-shadow: 0 2px 1px #9c9c9c;
	-webkit-box-shadow: 0 2px 1px #9c9c9c;
	box-shadow: 0 2px 1px #9c9c9c;
}

#menu a {
	color: #999;
	text-transform: uppercase;
	font: bold 14px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}

#menu li:hover>a {
	color: #fafafa;
}

#menu li:hover>ul {
	display: block;
}

/* Sub-menu */
#menu ul a:hover {
	background: #0186ba;
	background: -moz-linear-gradient(#04acec, #0186ba);
	background: -webkit-gradient(linear, left top, left bottom, from(#04acec),
		to(#0186ba));
	background: -webkit-linear-gradient(#04acec, #0186ba);
	background: -o-linear-gradient(#04acec, #0186ba);
	background: -ms-linear-gradient(#04acec, #0186ba);
	background: linear-gradient(#04acec, #0186ba);
}

/* Clear floated elements */
#menu:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

#top1 {
	height: 100px;
}

#notee {
	width: 700px;
	margin: 0 auto;
	font-family: Arial, Helvetica;
	font-size: small;
	margin-top: -80px;
}

#nav_wrap {
	position: relative;
	width: 100px;
	margin-left: 100px;
}

.listtable {
	width: 650px;
}

#paging {
	clear: both;
	font: 12px, Gulim, AppleGothic;
	padding: 15px 0px 0px 0px;
	text-align: center;
	height: 28px;
	white-space: nowrap;
}

#paging a {
	border: 1px solid #ccc;
	height: 28px;
	color: #000000;
	text-decoration: none;
	padding: 4px 7px 4px 7px;
	margin-left: 3px;
	line-height: normal;
	vertical-align: middle;
	outline: none;
	select-dummy: expression(this.hideFocus = true);
}

#paging a:hover, a:active {
	border: 1px solid #ccc;
	color: #6771ff;
	vertical-align: middle;
	line-height: normal;
}

#paging .curBox {
	border: 1px solid #e28d8d;
	background: #fff;
	color: #cb3536;
	font-weight: bold;
	height: 28px;
	padding: 4px 7px 4px 7px;
	margin-left: 3px;
	line-height: normal;
	vertical-align: middle;
}

#paging .numBox {
	border: 1px solid #ccc;
	height: 28px;
	font-weight: bold;
	text-decoration: none;
	padding: 4px 7px 4px 7px;
	margin-left: 3px;
	line-height: normal;
	vertical-align: middle;
}

span.centerImage {
   display: block;
    position: relative;
    right: -25%;
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow: inset 0px 1px 0px 0px #f29c93;
	box-shadow: inset 0px 1px 0px 0px #f29c93;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fe1a00
		), color-stop(1, #ce0100));
	background: -moz-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -webkit-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -o-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: -ms-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background: linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00',
		endColorstr='#ce0100', GradientType=0);
	background-color: #fe1a00;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #d83526;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 10px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #b23e35;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ce0100
		), color-stop(1, #fe1a00));
	background: -moz-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -webkit-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -o-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: -ms-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background: linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100',
		endColorstr='#fe1a00', GradientType=0);
	background-color: #ce0100;
}

.myButton:active {
	position: relative;
	top: 1px;
}

#select{height:25px;}
</style>
<title></title>
<%@ include file="/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/noteView/note.css" />
<link rel="stylesheet" type="text/css"
	href="/lesson/resources/css/noteView/nav_wrap.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="top1"></div>
	<div id="nav_wrap">
		<ul id="menu">
			<li><a href="sendNote.do">쪽지쓰기</a></li>
			<p>
			<li><a href="noteReceiveList.do">받은 쪽지함</a>
				<p>
			<li><a href="noteSendList.do">보낸 쪽지함</a></li>
		</ul>
	</div>
	<div id="notee">
		<ul id="tabs">
			<li><a href="#" name="#tab1">받은 쪽지함</a></li>
		</ul>
		<div id="content">
			<div id="tab1">
				<form name="chkform">
					<input type="hidden" name="check_no" />
				</form>
				<input type="hidden" id="selectid" value="${select}" />
				<form action="noteReceiveList.do" method="post">
					<input type="hidden" value="${loginUser.userid }" name="loginid">
					<select id="select" name="select">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="cont">내용</option>
					</select> <input type="search" id="search" name="search" value="${search}" />
					<input type="submit" class="myButton" value="찾기" />
					<input type="button" class="myButton" value="삭제" onclick="receive_del()" />
				</form>
				<table class="listtable">

					<tbody>
					<thead>
						<tr style="background-color:#e6e6e6;">
							<th id="chk" width="1%"><input type="checkbox"
								name="checkAll" id="checkbox" /></th>
							<th width="5%"><label>받는 사람</label></th>
							<th width="15%"><label>내용</label></th>
							<th width="8%"><label>받은 시간</label></th>
							<th width="3%"><label>첨부파일</label></th>
						</tr>
						<c:forEach var="note" items="${list }">
							<tr>
								<th><input type="checkbox" class="checkbox"
									value="${note.NOTE_IDX }" /></th>
								<th>${note.USERNAME }</th>
								<th><a href="noteDetail.do?no=${note.NOTE_IDX}">${note.NOTECT }</a></th>
								<th><fmt:formatDate value="${note.SENDDT }" pattern="yyyy-MM-dd" /></th>
								<th><c:if test="${empty note.NOTE_ORIGINAL_FILENAME }"> 파일없음 </c:if> 
								<c:if test="${not empty note.NOTE_ORIGINAL_FILENAME }">
										<span class="centerImage"><img src="/lesson/resources/img/note/file.png" class="file" width="18px" /></span>
									</c:if>
								</th>
							</tr>
						</c:forEach>
					</thead>
					</tbody>

				</table>

				<div id="paging">
					<!-- <a class="atag" href="noteReceiveList.do?page=1">[처음] </a> -->

					<%-- <c:if test="${startPage gt 1 }">
						<a class="curBox" href="noteReceiveList.do?page=${startPage - 1} }">[이전]
						</a>
					</c:if>
					<c:if test="${startPage eq 1 }">[이전] </c:if> --%>

					<c:forEach var="num" begin="${startPage }" end="${endPage }"
						step="1">
						<c:if test="${num eq currentPage }">
							<a class="numBox">${num }</a>
					</c:if>
						<c:if test="${num ne currentPage }">
							<a class="numBox" href="noteReceiveList.do?page=${num }">${num }</a>
					</c:if>
					</c:forEach>

					<%-- 	<c:if test="${endPage lt maxPage }">
						<a class="curBox" href="noteReceiveList.do?page=${endPage + 1}">
							[다음] </a>
					</c:if>
					<c:if test="${endPage eq maxPage }">
					[다음]
				</c:if> --%>

					<%-- <a class="atag" href="noteReceiveList.do?page=${maxPage}">
						[마지막]</a> --%>
				</div>
			</div>


		</div>
	</div>
	<p id="about">

		<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

		<script>
    function resetTabs(){
        $("#content > div").hide(); //Hide all content
        $("#tabs a").attr("id",""); //Reset id's      
    }

    var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab

    (function(){
        $("#content > div").hide(); // Initially hide all content
        $("#tabs li:first a").attr("id","current"); // Activate first tab
        $("#content > div:first").fadeIn(); // Show first tab content
        
        $("#tabs a").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("id") == "current"){ //detection for current tab
             return       
            }
            else{             
            resetTabs();
            $(this).attr("id","current"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            }
        });

        for (i = 1; i <= $("#tabs li").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
        
        $('#checkbox').click(function() {
    		if($(this).is(':checked') == true){
    			$('.checkbox').prop('checked', true);
    		}else{
    			$('.checkbox').prop('checked', false);
    		}
    	})
    	
    })()
    
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
        	 form.action =  'receivedel.do';
        	 form.method = "post";
        	 form.submit();
        };
  
</script>
<div style="height:100px"></div>
	<%@ include file="/common/footer.jsp"%>
</html>