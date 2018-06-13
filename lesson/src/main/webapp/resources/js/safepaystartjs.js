
$(function(){		
	$("#finishedStudyCount").change(function (evt) {
		if($("#finishedStudyCount").val()!="" ||$("#finishedStudyCount").val()!=null ){
			if($("#finishedStudyCount").val() <=0 ) { $("#expectedprice").val($("#tdStudyprice").text()); }
			else {
					var percent = (1-($("#finishedStudyCount").val()/$("#totalStudyCount").val())) ;
					if (percent < 1 && percent > 0.0){ $("#expectedprice").val(parseInt($("#tdStudyprice").text()*percent));}
					else { $("#expectedprice").val("0");}
			}
		}	
	});	
});
