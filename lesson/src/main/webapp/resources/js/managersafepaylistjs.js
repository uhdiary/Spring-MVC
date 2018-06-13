$(function(){	

		managertab();
		settingdivsize();
		hideOneDiv();
		$('.tablabel').click(function(){
			  if($(this).text()=='안전결재내역'){ 
				  $("#tablabel2").css("background-color","#e4e4e4"); 
				  $("#tablabel1").css("background-color","#f8f8f8"); 
				  $("#subrefundformanager").hide();
				  $("#subsafepayformanager").show();
				  $("#searchstandardKind2").val('searchsafepayno');
				  $("#alignKind2").val('necessarydeposite');
				  $("#divforsearchenddate").hide();
				  $("#notsearchenddate").show();
				  alignKindChanged2(1);
				  $('input:checkbox[id="allcheck2"]').attr("checked", false);
				  $("#btnchange").val("입금여부변경"); 
			  }else {
				  $("#tablabel1").css("background-color","#e4e4e4"); 
				  $("#tablabel2").css("background-color","#f8f8f8"); 
				  $("#subsafepayformanager").hide();
				  $("#subrefundformanager").show();	
				  $("#searchstandardKind").val('searchrefundno');
				  $("#alignKind").val('necessaryrefund');
				  alignKindChanged(1);
				  $('input:checkbox[id="allcheck"]').attr("checked", false);
				  $("#btnchange").val("처리여부변경"); 

			  }
		});	
});

function managertab(){
	var tabmenu = document.getElementById("tablabel1");
	var tabmenu2 = document.getElementById("tablabel2");
	 if(tabmenu !=null){tabmenu.style.backgroundColor = "#e4e4e4"; 
	 					tabmenu2.style.backgroundColor = "#f8f8f8";}
}

function settingdivsize(){
	var windowWidth = $( window ).width();
	 $("#subsafepayformanager").css("width",windowWidth-500); 
	 $("#subrefundformanager").css("width",windowWidth-500); 
	 $("#tablabeldiv").css("width",windowWidth-500); 
}

function hideOneDiv(){
	$("#subsafepayformanager").hide();
}


function alignKindChanged(currentpage){
	
     $("#hiddensearchstandardKind").val($("#searchstandardKind").val());
	 $("#hiddensearchtextbox1").val($("#searchtextbox1").val());
 	 
	 $.ajax({
         url: "managercompleterefund.do",
         method:"POST",
         async:true,
         data:{       	 
        	 hiddensearchstandardKind: $("#hiddensearchstandardKind").val(),
        	 hiddensearchtextbox1: $("#hiddensearchtextbox1").val(),
        	 spaskuserid: $("#loginid").val(),
        	 searchkind: $("#alignKind").val(),
        	 currentPage : currentpage
         },
         error: function(error){
         },
         success: function(data) {
        	 var refundnotbody =    document.getElementById("refundnotbody");
        	 var tbodycontent = " ";
        	 var paging = " ";
        	 var currentpage = "";
            if(data.list != null){
            	  paging = data.boardPaging;
            	  currentpage = data.currentPage;
            	  for(var i in data.list){       
		                tbodycontent +=  "<tr>";
		                tbodycontent +=  "<td class='tdrow1'><a href='registeredrefund.do?SPASKNO="+ data.list[i].SPASKNO+"'>"+ data.list[i].REFUNDNO +"</a></td>";
		                tbodycontent +=  "<td class='tdrow2'>"+ data.list[i].SPASKNO +"</td>";
		                tbodycontent +=  "<td class='tdrow3'>"+ data.list[i].SPPROCESSVALUE +"</td>";
		                tbodycontent +=  "<td class='tdrow4'>"+ data.list[i].SPASKUSERID +"</td>";
		                tbodycontent +=  "<td class='tdrow5'>"+ data.list[i].TEACHERCONFIRMYN +"</td>";
		                tbodycontent +=  "<td class='tdrow5'  id='"+data.list[i].REFUNDNO +"'>"+ data.list[i].RESULTYN +"</td>";
		                tbodycontent +=  "<td class='tdrow5'><input type='checkbox' name='checkboxesforrefund' value='"+data.list[i].REFUNDNO+"' /></td> ";
		                tbodycontent +=  "</tr>";                             				
					}
            }else{ tbodycontent +=  "<tr> <td colspan='6'>조회된 결과가 없습니다.</td> </tr>"; } 
            $(refundnotbody).html(tbodycontent);   
            $("#pagingDiv").html(paging);
            $("#hiddenCurrentPage").val(currentpage);         
            	tbg();
         }     
      });
	 
	 $('input:checkbox[id="allcheck"]').attr("checked", false);
	
}

function alignKindChanged2(currentpage){
	
    $("#hiddensearchstandardKind2").val($("#searchstandardKind2").val());
	$("#hiddensearchtextbox2").val($("#searchtextbox2").val());
	$("#hiddensearchdatestartinput").val($("#searchdatestartinput").val()); 
	$("#hiddensearchdateendinput").val($("#searchdateendinput").val()); 
	

	 $.ajax({
        url: "formanagersafepaytab.do",
        method:"POST",
        async:true,
        data:{       	 
       	 hiddensearchstandardKind: $("#hiddensearchstandardKind2").val(),
       	 hiddensearchtextbox1: $("#hiddensearchtextbox2").val(),
         hiddensearchdatestartinput: $("#hiddensearchdatestartinput").val()   ,
       	 hiddensearchdateendinput: $("#hiddensearchdateendinput").val() ,
       	 spaskuserid: $("#loginid").val(),
       	 searchkind: $("#alignKind2").val(),
       	 currentPage : currentpage
        },
        error: function(error){
        	alert("에러?");
        },
        success: function(data) {
        	
       	 var safepaynotbody =    document.getElementById("safepaynotbody");
       	 var tbodycontent = " ";
       	 var paging = " ";
       	 var currentpage = "";
           if(data.list != null){
           	  paging = data.boardPaging;
           	  currentpage = data.currentPage;
           	  for(var i =0 ; i < data.list.length;i++){        
           		  
           		  var SPENROLLDATE = new Date(data.list[i].SPENROLLDATE); 
           		  var STARTSTUDYDATE = new Date(data.list[i].STARTSTUDYDATE); 
           		  var ENDSTUDYDATE = new Date(data.list[i].ENDSTUDYDATE); 

  
		                tbodycontent +=  "<tr>";
		                tbodycontent +=  "<td class='tdrow1'><a href='changeSafepay.do?SPASKNO="+ data.list[i].SPASKNO+"'>"+ data.list[i].SPASKNO +"</a></td>";
		                tbodycontent +=  "<td class='tdrow2'>"+ data.list[i].SPPROCESSKIND +"</td>";
		                tbodycontent +=  "<td class='tdrow3'>"+ data.list[i].SPASKUSERID +"</td>";
		                tbodycontent +=  "<td class='tdrow4'>"+ SPENROLLDATE.getFullYear()+"-"+changedateformat(SPENROLLDATE.getMonth()+1,2)+"-"+ changedateformat(SPENROLLDATE.getDate(),2)+"</td>"; 
		                tbodycontent +=  "<td class='tdrow5'>"+ STARTSTUDYDATE.getFullYear()+"-"+changedateformat(STARTSTUDYDATE.getMonth()+1,2)+"-"+ changedateformat(STARTSTUDYDATE.getDate(),2) +"</td>";
		                tbodycontent +=  "<td class='tdrow6'>"+ ENDSTUDYDATE.getFullYear()+"-"+changedateformat(ENDSTUDYDATE.getMonth()+1,2)+"-"+ changedateformat(ENDSTUDYDATE.getDate(),2) +"</td>";
		                tbodycontent +=  "<td class='tdrow7'>"+ data.list[i].SENDMONEYYNTOTEACHER  +"</td>";
		                tbodycontent += "<td class='tdrow7'><input type='checkbox' name='checkboxesforsafepay' value='"+data.list[i].SPASKNO+"' /></td> ";
		                tbodycontent +=  "</tr>";                             				
					} ; 
           }else{ tbodycontent +=  "<tr> <td colspan='6'>조회된 결과가 없습니다.</td> </tr>"; } 
           $(safepaynotbody).html(tbodycontent);   
           $("#pagingDiv").html(paging);
           $("#hiddenCurrentPage").val(currentpage);         
           	tbg2();
        }     
     });
	
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


//관리자 안전결재 탭 검색기준바꿨을때 
function changedsearchstandardKind(){
	
	// 검색기준이  '수업종료일' 이라면
	if( $("#searchstandardKind2").val()=='searchenddate'){
		 $("#notsearchenddate").hide();
		 $("#divforsearchenddate").show();		
		 $("#blankspan2").css("margin-left","-184px");
	
    // 검색기준이 '안전결재번호'or '신청자아이디' 라면
	}else {
		 $("#divforsearchenddate").hide();
		 $("#notsearchenddate").show();
		 $("#blankspan2").css("margin-left","-8px");
		 
	}
}


function forchangecolor(){
	$(".completeYN").css("background-color","red");	 
	$(".completeYN").css("color","white");	 
}

function canclechangecolor(){
	$(".completeYN").css("background-color","#424242");	 
	$(".completeYN").css("color","#BDBDBD");	 
}


function checkall(){
	if($("#btnchange").val()=="처리여부변경" ){
			$('input:checkbox[name="checkboxesforrefund"]').each(function() {		 
				   if(  $('input:checkbox[id="allcheck"]').is(':checked') == true){ 
					   this.checked = true;
				   }else {
					   this.checked = false;
				   }	     
			});
	}else {	
			$('input:checkbox[name="checkboxesforsafepay"]').each(function() {		 
				   if(  $('input:checkbox[id="allcheck2"]').is(':checked') == true){ 
					   this.checked = true;
				   }else {
					   this.checked = false;
				   }	     
			});
	
	}
}

function changeresultyn(){

	var count =0;
	var refundnoarray = new Array();
	var resultynarray = new Array();
	var afterresultynarray = new Array();
	var afterprocesskindarray = new Array();
	var choicedrefundno="선택하신 ";
	var currentPage = $("#hiddenCurrentPage").val();
	

	if($("#btnchange").val()=="처리여부변경"){
		

			$('input:checkbox[name="checkboxesforrefund"]').each(function() {		 
				   if(  $(this).is(':checked') == true){  
						   	if( this.value != 'thcheckbox'){
						   			count++; 
						   			refundnoarray[count-1] = this.value;
						   			resultynarray[count-1] = $("#"+this.value+"").text();  
						   			choicedrefundno = choicedrefundno+  "[ 환불번호 : "+this.value + " ] ";
						   	}
				   }     
			});
	}else {
			$('input:checkbox[name="checkboxesforsafepay"]').each(function() {		 
				   if(  $(this).is(':checked') == true){  
						   	if( this.value != 'thcheckbox'){
						   			count++; 
						   			refundnoarray[count-1] = this.value;
						   			resultynarray[count-1] = $("#"+this.value+"").text();  
						   			choicedrefundno = choicedrefundno+  "[ 안전번호 : "+this.value + " ] ";
						   	}
				   }     
			});
	}
	
	choicedrefundno += "의 처리여부를 변경하시겠습니까?"
	if( count==0) {  
	  alert("변경을 원하는 항목을 체크해주세요.");	return false;  
	}
	
	var choice = confirm(choicedrefundno);
	if( choice == true){
		if($("#btnchange").val()=="처리여부변경"){
				for( var i=0; i<refundnoarray.length; i++ ){
					if(resultynarray[i]=="N" ){  
						afterresultynarray[i] = "Y";
						afterprocesskindarray[i] ="afterRefund";
					}else {
						afterresultynarray[i] = "N";
						afterprocesskindarray[i] ="askRefund";
					}
				}
						
				// update구문 실행
				for( var i=0; i<refundnoarray.length; i++ ){
					 $.ajax({
					        url: "formanagerhandlingdeposit.do",
					        method:"POST",
					        async:true,
					        data:{       	 
					        	refundnoarray: refundnoarray[i],
					        	afterresultynarray: afterresultynarray[i],
					        	afterprocesskindarray: afterprocesskindarray[i]
					        },
					        error: function(error){
					        	alert("에러?");
					        },
					        success: function(data) {       	
					        	     alignKindChanged(1);
					        }
					     });
				}
		}else{
				for( var i=0; i<refundnoarray.length; i++ ){
					if(resultynarray[i]=="N" ){  
						afterresultynarray[i] = "Y";
						afterprocesskindarray[i] ="completeDeal";
					}else {
						afterresultynarray[i] = "N";
						afterprocesskindarray[i] ="afterPay";
					}
				}
						
				// update구문 실행
				for( var i=0; i<refundnoarray.length; i++ ){
					 $.ajax({
					        url: "formanagerhandlingdeposit.do",
					        method:"POST",
					        async:true,
					        data:{       	 
					        	safepaynoarray: refundnoarray[i],
					        	afterresultynarray: afterresultynarray[i],
					        	afterprocesskindarray: afterprocesskindarray[i]
					        },
					        error: function(error){
					        	alert("에러?");
					        },
					        success: function(data) {       	
					        	     alignKindChanged2(1);
					        }
					     });
				}
		}
	}else { return false;} 	
}

