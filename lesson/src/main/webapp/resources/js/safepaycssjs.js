$(function(){	
	tbg();
});

//list 꾸미기
function tbg(){
  var t = document.getElementById("table").getElementsByTagName("tr");
  if(t !=null){
	    for(var i=0; i<t.length;i++){
	        if(i%2) t[i].style.backgroundColor = "#ffffff";
	        else t[i].style.backgroundColor = "#e9e9e9";
	    }
  }
}

function tbg2(){
	  var t2 = document.getElementById("table2").getElementsByTagName("tr");
	  if(t2 !=null){
		    for(var i=0; i<t2.length;i++){
		        if(i%2) t2[i].style.backgroundColor = "#ffffff";
		        else t2[i].style.backgroundColor = "#e9e9e9";
		    }
	  }
	}

