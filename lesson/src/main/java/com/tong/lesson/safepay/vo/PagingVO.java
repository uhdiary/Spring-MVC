package com.tong.lesson.safepay.vo;

import java.io.Serializable;

public class PagingVO implements Serializable{

   private static final long serialVersionUID = 1L;
   private int pvnowpageno; // 현재 페이지 번호
   private int pvhowmanyperonepage; // 1페이지당 보여줄 글 갯수
   private int pvtotalcount; // 총 게시글 수
   private int pvtotalpage; // 총 페이지수
   private String pvid; 
   private int pvstartforselect; // 검색 시작 row값
   private int pvendforselect; // 검색 끝 row값
   private String pvurl; // 페이지 이동할 주소   
   private int pvpageblocksize; // 한번에 보여줄 페이지 수
   private int pvnowpageblock; // 현재 페이지 블럭 값
   private int pvtransferpageno; // 이동할 페이지 번호
   private int pvpageno; // 페이지번호
   private String pvsearchkind; // 보기종류
   private String hiddensearchstandardKind; // 검색기준종류
   private String hiddensearchtextbox1; // 검색 내용
   private String hiddensearchdatestartinput; // 검색 날짜(시작)
   private String hiddensearchdateendinput; // 검색 날짜(종료)
   private StringBuffer pvresult; 
   
   public String getPvsearchkind() {
      return pvsearchkind;
   }

   public void setPvsearchkind(String pvsearchkind) {
      this.pvsearchkind = pvsearchkind;
   }

   public PagingVO(){}

   public PagingVO(int pvnowpageno, int pvhowmanyperonepage, int pvtotalcount, int pvtotalpage, String pvid, int pvstartforselect,
         int pvendforselect, String pvurl, int pvpageblocksize, int pvnowpageblock, int pvtransferpageno, int pvpageno,
         String pvsearchkind,String hiddensearchstandardKind,String hiddensearchtextbox1, 
         String hiddensearchdatestartinput, String hiddensearchdateendinput,  StringBuffer pvresult) {
      super();
      this.pvnowpageno = pvnowpageno;
      this.pvhowmanyperonepage = pvhowmanyperonepage;
      this.pvtotalcount = pvtotalcount;
      this.pvtotalpage = pvtotalpage;
      this.pvid = pvid;
      this.pvstartforselect = pvstartforselect;
      this.pvendforselect = pvendforselect;
      this.pvurl = pvurl;
      this.pvpageblocksize = pvpageblocksize;
      this.pvnowpageblock = pvnowpageblock;
      this.pvtransferpageno = pvtransferpageno;
      this.pvpageno = pvpageno;
      this.pvsearchkind = pvsearchkind;
      this.hiddensearchstandardKind = hiddensearchstandardKind;
      this.hiddensearchtextbox1 = hiddensearchtextbox1;
      this.hiddensearchdatestartinput = hiddensearchdatestartinput;
      this.hiddensearchdateendinput = hiddensearchdateendinput;
      this.pvresult = pvresult;
   }

   public int getPvnowpageno() {
      return pvnowpageno;
   }

   public void setPvnowpageno(int pvnowpageno) {
      this.pvnowpageno = pvnowpageno;
   }

   public int getPvhowmanyperonepage() {
      return pvhowmanyperonepage;
   }

   public void setPvhowmanyperonepage(int pvhowmanyperonepage) {
      this.pvhowmanyperonepage = pvhowmanyperonepage;
   }

   public int getPvtotalcount() {
      return pvtotalcount;
   }

   public void setPvtotalcount(int pvtotalcount) {
      this.pvtotalcount = pvtotalcount;
   }

   public int getPvtotalpage() {
      return pvtotalpage;
   }

   public void setPvtotalpage(int pvtotalpage) {
      this.pvtotalpage = pvtotalpage;
   }

   public String getPvid() {
      return pvid;
   }

   public void setPvid(String pvid) {
      this.pvid = pvid;
   }

   public int getPvstartforselect() {
      return pvstartforselect;
   }

   public void setPvstartforselect(int pvstartforselect) {
      this.pvstartforselect = pvstartforselect;
   }

   public int getPvendforselect() {
      return pvendforselect;
   }

   public void setPvendforselect(int pvendforselect) {
      this.pvendforselect = pvendforselect;
   }

   public String getPvurl() {
      return pvurl;
   }

   public void setPvurl(String pvurl) {
      this.pvurl = pvurl;
   }

   public int getPvpageblocksize() {
      return pvpageblocksize;
   }

   public void setPvpageblocksize(int pvpageblocksize) {
      this.pvpageblocksize = pvpageblocksize;
   }

   public int getPvnowpageblock() {
      return pvnowpageblock;
   }

   public void setPvnowpageblock(int pvnowpageblock) {
      this.pvnowpageblock = pvnowpageblock;
   }

   public int getPvtransferpageno() {
      return pvtransferpageno;
   }

   public void setPvtransferpageno(int pvtransferpageno) {
      this.pvtransferpageno = pvtransferpageno;
   }

   public int getPvpageno() {
      return pvpageno;
   }

   public void setPvpageno(int pvpageno) {
      this.pvpageno = pvpageno;
   }
   
   public String getHiddensearchstandardKind() {
      return hiddensearchstandardKind;
   }

   public void setHiddensearchstandardKind(String hiddensearchstandardKind) {
      this.hiddensearchstandardKind = hiddensearchstandardKind;
   }
   
   public String getHiddensearchtextbox1() {
      return hiddensearchtextbox1;
   }

   public void setHiddensearchtextbox1(String hiddensearchtextbox1) {
      this.hiddensearchtextbox1 = hiddensearchtextbox1;
   }

   public String getHiddensearchdatestartinput() {
      return hiddensearchdatestartinput;
   }

   public void setHiddensearchdatestartinput(String hiddensearchdatestartinput) {
      this.hiddensearchdatestartinput = hiddensearchdatestartinput;
   }

   public String getHiddensearchdateendinput() {
      return hiddensearchdateendinput;
   }

   public void setHiddensearchdateendinput(String hiddensearchdateendinput) {
      this.hiddensearchdateendinput = hiddensearchdateendinput;
   }

   public StringBuffer getPvresult() {
      return pvresult;
   }

   public void setPvresult(StringBuffer pvresult) {
      this.pvresult = pvresult;
   }

   @Override
   public String toString() {
      return "PagingVO [pvnowpageno="+ pvnowpageno + ", pvhowmanyperonepage=" + pvhowmanyperonepage + ", pvtotalcount=" + pvtotalcount
            + ", pvtotalpage=" + pvtotalpage + ", pvid=" + pvid + ", pvstartforselect=" + pvstartforselect
            + ", pvendforselect=" + pvendforselect + ", pvurl=" + pvurl + ", pvpageblocksize=" + pvpageblocksize
            + ", pvnowpageblock=" + pvnowpageblock + ", pvtransferpageno=" + pvtransferpageno + ", pvpageno="
            + pvpageno+ ", pvsearchkind=" + pvsearchkind  +", hiddensearchstandardKind="+ hiddensearchstandardKind+
            ", hiddensearchtextbox1="+ hiddensearchtextbox1+ ", hiddensearchdatestartinput="+hiddensearchdatestartinput+
            ", hiddensearchdateendinput="+hiddensearchdateendinput+", pvresult=" + pvresult + "]";
   };
   
   public void changePageVOvariable(){   
      pvhowmanyperonepage = 10;  // 1페이지당 게시글을 10개만 보여주자.
      int totalpage = 0;
      if(pvtotalcount > 0) {
         if(pvtotalcount % pvhowmanyperonepage == 0)
            totalpage = pvtotalcount/pvhowmanyperonepage;
         else
            totalpage = pvtotalcount/pvhowmanyperonepage+1;
      }      
      this.pvtotalpage = totalpage;
      pvstartforselect = (pvnowpageno-1)*pvhowmanyperonepage+1;   
      pvendforselect = pvnowpageno*pvhowmanyperonepage;   
      pvresult = new StringBuffer();
      pvpageblocksize = 10;  //한번에 보여줄 페이지 수 = 페이지 블록 크기

      // 실행시킬 서블릿 또는 페이지명에  ? 가 있다면(= 파라미터로 넘길값이 이미 있다면)  & 을 추가하여  또다른 파라미터를 추가 할 수 있게 하고 
      if(pvurl.indexOf("?")!=-1) {  pvurl+="&";  }
      else {  pvurl+="?";  }   //  ? 가 없다면 ?를 추가하여 파라미터를 추가 할 수 있게 한다.
                             
      // 현재 페이지 블록값설정.  위에서 한번에 보여줄 페이지 수를 10으로 설정했다.  따라서 이경우에는
      //  pvnowpageblock 의 값은 1page에서 10page 까지는 0 .  11page에서 20page까지는 10.   21page에서 30page까지는 20.
      pvnowpageblock = (pvnowpageno/pvhowmanyperonepage)*pvhowmanyperonepage;
      
      if(pvnowpageno%pvhowmanyperonepage==0)
         pvnowpageblock = pvnowpageblock-pvpageblocksize;

      // 페이징 처리 태그에 스타일을 조정함.
      pvresult.append("<style type='text/css'>");
      pvresult.append("#pagingDiv {clear:both;font:12px,Gulim,AppleGothic;padding:15px 0px 0px 0px;text-align:center;height:28px;white-space:nowrap;}");
      pvresult.append("#pagingDiv a {border:1px solid #ccc;height:28px;color:#000000;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;outline:none; select-dummy: expression(this.hideFocus=true);}");
      pvresult.append("#pagingDiv a:hover, a:active {border:1px solid #ccc;color:#6771ff;vertical-align:middle; line-height:normal;}");
      pvresult.append("#pagingDiv .curBox {border:1px solid #e28d8d; background: #fff; color:#cb3536; font-weight:bold;height:28px;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
      pvresult.append("#pagingDiv .numBox {border:1px solid #ccc;height:28px;font-weight:bold;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
      pvresult.append("</style>");
      
      pvresult.append("<div id='paginate'>"); // 페이징 처리 태그들이 들어갈 div
      
      //pvtransferpageno = 이동 페이지 설정.   현재 페이지를 기준으로 1개의 페이지블록(한번에 보여줄 페이지 수 = pvpageblock=10페이지) 이전 페이지로 이동시킴.
      pvtransferpageno = pvnowpageno - pvpageblocksize; 
      
      if(pvtotalpage > pvpageblocksize && pvnowpageblock > 0) {  
      // 전체페이지가   페이지블록 (=한번에 보여줄 페이지 수) 보다 크고 현재 페이지 블록이 처음이 아닐 경우.
      //  pvnowpageblock 의 값은 1page에서 10page 까지는 0 .  11page에서 20page까지는 10.   21page에서 30page까지는 20...   
            if(pvsearchkind !="" && pvsearchkind !=null ){
               
               if( pvurl.equals("formanagersafepaytab.do?" )){ 
                  pvresult.append("<a id="+1+ " href='#' onclick='alignKindChanged2(1);' >맨앞</a>");
                  pvresult.append("<a id="+pvtransferpageno+ " href='#' onclick='alignKindChanged2("+pvtransferpageno+");'  >10page이전</a>");         
               }else{
            	   
            	   	if(pvurl.equals("managergo.do?" )){
            	   		pvresult.append("<a id="+1+ " href='"+pvurl+"currentPage="+pvnowpageno +"'  >맨앞</a>");
                        pvresult.append("<a id="+pvtransferpageno+ " href='"+pvurl+"currentPage="+pvtransferpageno +"'   >10page이전</a>");  
            	   	}
            	   	else{
                  pvresult.append("<a id="+1+ " href='#' onclick=alignKindChanged(1); >맨앞</a>");
                  pvresult.append("<a id="+pvtransferpageno+ " href='#' onclick=alignKindChanged("+pvtransferpageno+");  >10page이전</a>");      
            	   	}
               }
            }else{
               pvresult.append("<a id="+1+ " href='"+pvurl+"currentPage=1' >맨앞</a>");
               pvresult.append("<a id="+pvtransferpageno+ " href='"+pvurl+"currentPage="+pvtransferpageno+"'  >10page이전</a>");
            }   
      }
         
      // 현재 페이지 블록의 시작page를 찾음. 
      pvpageno = pvnowpageblock+1;
      
      
     
     String ataghiddensearchtextbox1="";
     
     if(hiddensearchtextbox1!=null){
     ataghiddensearchtextbox1=hiddensearchtextbox1.replaceAll("%", "");
     }
      
      
      
      // 현재 페이지 블록의 시작page가 최종페이지보다 작고 현재페이지블록의 마지막 page보다 작을 때까지 반복
      while(pvpageno <= pvtotalpage && pvpageno <= (pvnowpageblock+pvpageblocksize)) {
         
         if(pvpageno == pvnowpageno ) {  // 현재 페이지가 현재 페이지 블록의 첫 페이지라면 링크 없이 현재 페이지 표기.
            pvresult.append("<span class='curBox'>"+pvpageno+"</span>");    
         } else { // 아니라면 페이지 번호 표기하고 링크 검.  2, 3, 4, 5 ... 와 같이
            
            if(pvsearchkind !="" && pvsearchkind !=null ){
               
               // 관리자안전결재보기두번째탭이라면(=안전결재내역)
               if( pvurl.equals("formanagersafepaytab.do?" )){ 
                  pvresult.append("<a href='#' currentPage="+pvpageno+ " class='numBox' onclick='alignKindChanged2("+pvpageno+");' class='numBox' >"+pvpageno+"</a>");   
               }else { //관리자안전결재보기첫번째탭이라면(=환불관련내역)
		            	   if(pvurl.equals("managergo.do?" )){
		            		   pvresult.append("<a href='"+pvurl+"currentPage="+pvpageno+"&seachword="+ataghiddensearchtextbox1+"&hiddensearchstandardKind="+hiddensearchstandardKind  +"' class='numBox' >"+pvpageno+"</a>");
		           	   	 
		           	   	}else{
		                  pvresult.append("<a href='#' currentPage="+pvpageno+ " class='numBox' onclick=alignKindChanged("+pvpageno+"); class='numBox' >"+pvpageno+"</a>");
		           	   	}
               }
            }else{
            
            	pvresult.append("<a href='"+pvurl+"currentPage="+pvpageno+"' class='numBox'  >"+pvpageno +"</a>");    }
            
         }                                      
         pvpageno++;  // < 1 > 찍고 < 2 > 찍고 < 3 > 이런식으로 page수 변화를 줘야 하므로 증가.
      }
      
      //pvtransferpageno = 이동 페이지 설정.   현재 페이지를 기준으로 1개의 블록(한번에 보여줄 페이지 수 = pvpageblocksize=10페이지) 을 지난 페이지로 이동시킴.
      pvtransferpageno = pvnowpageno +pvpageblocksize ;
      
      if(pvtransferpageno > pvtotalpage)  pvtransferpageno = pvtotalpage;
      // 만약 이동페이지가 최종페이지보다 커질 경우 이동페이지를 최종페이지로 설정. ( 총페이지가 23페이지일 경우 19페이지에서  + 10페이지할 경우 29페이지로
      // 최종페이지보다 커지므로 그럴 경우에는 마지막 페이지로 이동시킴.
      
      if(pvtotalpage - pvnowpageblock > pvpageblocksize) {
      //  pvnowpageblock 의 값은 1page에서 10page 까지는 0 .  11page에서 20page까지는 10.   21page에서 30page까지는 20.
       // 전체 페이지에서  현재페이지 블록값을 뺀 결과가   pvpageblocksize(=10 = 한번에 보여줄 페이지 수)보다 클 경우.  즉  다음 페이지 블록이 있을 경우에만 아래 태그 추가.
         
         if(pvsearchkind !="" && pvsearchkind !=null ){
               if( pvurl.equals("formanagersafepaytab.do?" )){ 
                  pvresult.append("<a id="+pvtransferpageno+ " href='#'  onclick=alignKindChanged2("+pvtransferpageno+"); >10페이지뒤로</a>");  // 한번에 보여줄 페이지 수를 numPerBlock=10 단위로 해두었으므로
                  pvresult.append("<a id="+pvtotalpage+" href='#' onclick=alignKindChanged2("+ pvtotalpage +");  >맨끝</a>");   
               }else {
            	   
            	   if(pvurl.equals("managergo.do?" )){
            		   pvresult.append("<a id="+pvtransferpageno+ " href='"+pvurl+"currentPage="+pvtransferpageno+"' >10페이지뒤로</a>");  // 한번에 보여줄 페이지 수를 numPerBlock=10 단위로 해두었으므로
                       pvresult.append("<a id="+pvtotalpage+" href='"+pvurl+"currentPage="+ pvtotalpage+"' >맨끝</a>");
                       
            		  
           	   	
                         
           	   	}else{
                  pvresult.append("<a id="+pvtransferpageno+ " href='#'  onclick=alignKindChanged("+pvtransferpageno+"); >10페이지뒤로</a>");  // 한번에 보여줄 페이지 수를 numPerBlock=10 단위로 해두었으므로
                  pvresult.append("<a id="+pvtotalpage+" href='#' onclick=alignKindChanged("+ pvtotalpage+");  >맨끝</a>");
           	   	}
               }       
         }else{
            pvresult.append("<a id="+pvtransferpageno+ " href='"+pvurl+"currentPage="+pvtransferpageno+"'  >10페이지뒤로</a>");  // 한번에 보여줄 페이지 수를 numPerBlock=10 단위로 해두었으므로
            pvresult.append("<a id="+pvtotalpage+" href='"+pvurl+"currentPage="+pvtotalpage+"'  >맨끝</a>");
         }
      }
      pvresult.append("</div>");   
   }
}