package com.tong.lesson.safepay.controller;

import java.util.HashMap;
import java.util.concurrent.SynchronousQueue;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tong.lesson.safepay.vo.PagingVO;
import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.safepay.service.SafepayService;
import com.tong.lesson.safepay.vo.SafepayRefundVO;
import com.tong.lesson.safepay.vo.SafepayVO;

@Controller
public class SafepayController {
	
	@Resource(name = "safepayService")
	private SafepayService safepayService;
	
	// 안전과외메뉴 - 안전결재란?
	@RequestMapping(value = "safepayinfo.do") 
	public String safepayinfo() { 
		return  "safepay/safepayinfo";
	}
	
	// 안전과외메뉴 - 안전결재 신청
	@RequestMapping(value = "applyforsafepay.do")
	public String applyforsafepay(@RequestParam(value="loginuser", defaultValue="") String loginuser, Model model) {
		if(loginuser==null || loginuser.equals("") ) { return "home";  }
		else { model.addAttribute("user", loginuser);   return "safepay/applyforSafepay"; }
	}
	
	// 안전과외메뉴 - 안전결재 신청 - 선생님 체크 클릭(Azax통신)
	@RequestMapping(value ="teachercheck.do")
	@ResponseBody
	public String teachercheck(@RequestParam HashMap<String, Object> param ) {	
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("teachername", param.get("teachername"));
		hmap.put("spteacherid", param.get("teacherid")); 
		return safepayService.getteachercheck(hmap);
	}
			
	// 안전과외메뉴 - 안전결재 신청 - 신청하기 버튼 클릭(학생만)
	@RequestMapping(value = "safepayinsert.do")
	public String safepayinsert(SafepayVO vo, Model model) {			 
		safepayService.insertSafepay(vo);
		return "redirect:mysafepay.do";
	}
		
	// 안전과외메뉴 - 나의 안전결재(학생,선생님)
	@RequestMapping(value = "mysafepay.do" )
	public String mysafepay( Model model, HttpSession session, PagingVO pagevobysww,HttpServletRequest request , 
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception{

		String id ="";	
		if(request.getParameter("spaskuserid") != null ) {	  id = request.getParameter("spaskuserid");  
		}else { id=((MemberVO)session.getAttribute("loginUser")).getUserid();    }
				
		pagevobysww.setPvid(id);
		pagevobysww.setPvtotalcount( ( Integer.parseInt(safepayService.getMySafepayTotal(id,"")) ) ); 
		pagevobysww.setPvnowpageno(currentPage);
		pagevobysww.setPvurl("mysafepay.do");
		pagevobysww.changePageVOvariable();

		model.addAttribute("list", safepayService.selectMySafepay(pagevobysww)	);
		model.addAttribute("boardPaging", pagevobysww.getPvresult());
		model.addAttribute("currentPage", currentPage);
		return "/safepay/mysafepaylist";
	}
						
	// 안전과외메뉴 - 나의 안전결재(학생,선생님) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기)
	@RequestMapping(value = "changeSafepay.do", method = RequestMethod.GET)
	public String changeSafepay( String  SPASKNO, Model model) {
		model.addAttribute("selectedSafepayVO",safepayService.getSelectedSafepay(SPASKNO));
		return "safepay/mysafepayChange";	 
	}
	
	// 안전과외메뉴 - 나의 안전결재(학생) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 신청취소버튼 클릭
	@RequestMapping(value = "cancleSafepay.do", method = RequestMethod.GET)
	public String cancleSafepay( String  SPASKNO,  Model model) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("SPASKNO", SPASKNO);
		hmap.put("SPPROCESSKIND", "cancleAsk");
		safepayService.updateSafepaystatus(hmap);
		return "redirect:mysafepay.do"; 
	}
	
	// 안전과외메뉴 - 나의 안전결재(학생) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 결재하기버튼 클릭 - 결재완료시
	@RequestMapping(value = "afterpaysucess.do", method = RequestMethod.GET)
	public String afterpaysucess( String  SPASKNO,  Model model) {
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		hmap.put("SPASKNO", SPASKNO);
		hmap.put("SPPROCESSKIND", "afterPay");
		safepayService.updateSafepaystatus(hmap);
		return "redirect:mysafepay.do";
	}
	
	// 안전과외메뉴 - 나의 안전결재(학생) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 환불신청버튼 클릭 
	@RequestMapping(value = "myRefund.do")
	public String myRefund(String askno, Model model) {	
	    model.addAttribute("selectedSafepayVO",safepayService.getSelectedSafepay(askno));
		return "safepay/myRefund";
	}

	// 안전과외메뉴 - 나의 안전결재(학생) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 환불신청버튼 클릭 - 신청하기버튼 클릭
	@RequestMapping(value = "refundinsert.do")
	public String refundinsert(SafepayRefundVO vo, Model model ) {			 
		safepayService.refundinsert(vo);
		return "redirect:mysafepay.do";
	}
	
	// 안전과외메뉴 - 나의 안전결재(학생,선생님) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 내역보기버튼 클릭 (=환불신청내역) 
	@RequestMapping(value = "registeredrefund.do")
	public String registeredrefund(String SPASKNO, Model model) {	
		model.addAttribute("selectedSafepayVO",safepayService.getSelectedSafepay(SPASKNO));		 
		model.addAttribute("selectedRefundVO",safepayService.getSelectedRefund(SPASKNO));
		return "safepay/myRefund";
	}
	
	// 안전과외메뉴 - 나의 안전결재(학생) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 내역보기버튼 클릭 (=환불신청내역) - 삭제하기버튼 클릭
	@RequestMapping(value = "refunddelete.do")
	public String refunddelete(HttpServletRequest request, Model model) {			  
		safepayService.refunddelete(request.getParameter("refundno"));
		return "redirect:mysafepay.do";
	}
	
	// 안전과외메뉴 - 나의 안전결재(선생님) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 내역보기버튼 클릭 (=환불신청내역) - 승인 버튼 클릭
	@RequestMapping(value = "approverefund.do")
	public String approverefund(HttpServletRequest request, Model model ) {				 
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("loginedid", request.getParameter("loginedid"));
		hmap.put("refundno", request.getParameter("refundno"));
		hmap.put("approveyn", "Y");
		safepayService.approvestatuschange(hmap);		
		return "redirect:mysafepay.do";
	}
	
	// 안전과외메뉴 - 나의 안전결재(선생님) - 조회된 리스트에서 상태 값 클릭(=안전결재상세보기) - 내역보기버튼 클릭 (=환불신청내역) - 승인취소버튼 클릭
	@RequestMapping(value = "cancleapproveR.do")
	public String cancleapproveR(HttpServletRequest request, Model model ) {			 
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("loginedid", request.getParameter("loginedid"));
		hmap.put("refundno", request.getParameter("refundno"));
		hmap.put("approveyn", "N");
		safepayService.approvestatuschange(hmap);		
		return "redirect:mysafepay.do";
	}
		
	// 안전과외메뉴 - 관리자 안전결재
	@RequestMapping(value = "managerSafePayList.do")
	public String managerSafePayList(HttpServletRequest request, Model model, PagingVO pagevobysww,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception{
		
		String  kind="necessaryrefund";
		if( request.getParameter("searchkind")!=null) {  kind = request.getParameter("searchkind");  }
		
		pagevobysww.setPvid("admin");
		pagevobysww.setPvtotalcount( ( Integer.parseInt(safepayService.getMySafepayTotal("admin",kind)) ) ); 
		pagevobysww.setPvsearchkind(kind);
		pagevobysww.setPvnowpageno(currentPage);
		pagevobysww.setPvurl("managerSafePayList.do");
		pagevobysww.changePageVOvariable();
	
		model.addAttribute("list", safepayService.selectSafepay( pagevobysww ));
		model.addAttribute("boardPaging", pagevobysww.getPvresult());
		model.addAttribute("currentPage", currentPage);		
		return "/safepay/managerSafePayList";
	}
	
	// 안전과외메뉴 - 관리자 안전결재 - 탭메뉴 변경 1(=환불관련내역) (Azax통신)
	@RequestMapping(value = "managercompleterefund.do")
	@ResponseBody
	public HashMap<String, Object> managercompleterefund(HttpServletRequest request, PagingVO pagevobysww,
				@RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception{

		String kind = "necessaryrefund";
		String hiddensearchtextbox1 = "";	
				
		if( request.getParameter("searchkind")!=null) {  kind = request.getParameter("searchkind");	 }
	
		if( request.getParameter("hiddensearchstandardKind")!=null) {
			pagevobysww.setHiddensearchstandardKind(request.getParameter("hiddensearchstandardKind")); ;		 
		}
		
		if( request.getParameter("hiddensearchtextbox1")!=null) {
			hiddensearchtextbox1 = "%";
			hiddensearchtextbox1 += request.getParameter("hiddensearchtextbox1");
			hiddensearchtextbox1 += "%"; 
			pagevobysww.setHiddensearchtextbox1(hiddensearchtextbox1);
		}
	
		pagevobysww.setPvid("admin");
		pagevobysww.setPvsearchkind(kind);
		pagevobysww.setPvtotalcount(Integer.parseInt(safepayService.getMySafepayTotal(pagevobysww) ));		 
		pagevobysww.setPvnowpageno(currentPage);	
		pagevobysww.setPvurl("managercompleterefund.do");
		pagevobysww.changePageVOvariable();
				
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", safepayService.selectSafepay(pagevobysww ));	
		resultMap.put("boardPaging", pagevobysww.getPvresult());
		resultMap.put("currentPage", currentPage);		
		
		return resultMap;
	}
	
	// 안전과외메뉴 - 관리자 안전결재 - 탭메뉴 변경 2(=안전결재관련내역) (Azax통신)
	@RequestMapping(value = "formanagersafepaytab.do")
	@ResponseBody
	public HashMap<String, Object> formanagersafepaytab(HttpServletRequest request,PagingVO pagevobysww,
				@RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception{

		
		String kind = "necessarydeposite";
		String hiddensearchtextbox = "";
		
		if( request.getParameter("searchkind")!=null) {  kind = request.getParameter("searchkind");	 }
		
		if( request.getParameter("hiddensearchstandardKind")!=null) {
			pagevobysww.setHiddensearchstandardKind(request.getParameter("hiddensearchstandardKind")); ;		 
		}
		

		if( request.getParameter("hiddensearchtextbox1")!=null) {
			hiddensearchtextbox = "%";
			hiddensearchtextbox += request.getParameter("hiddensearchtextbox1");
			hiddensearchtextbox += "%"; 
			pagevobysww.setHiddensearchtextbox1(hiddensearchtextbox);
		}
		
		if( request.getParameter("hiddensearchdatestartinput")!=null) {
			pagevobysww.setHiddensearchdatestartinput( request.getParameter("hiddensearchdatestartinput"));		 
		}
		if( request.getParameter("hiddensearchdateendinput")!=null) {
			pagevobysww.setHiddensearchdateendinput (request.getParameter("hiddensearchdateendinput"));		 
		}
			
		pagevobysww.setPvid("admin");
		pagevobysww.setPvsearchkind(kind);
		pagevobysww.setPvtotalcount(Integer.parseInt(safepayService.getManagerSafepayTabTotal(pagevobysww) ));	
		pagevobysww.setPvnowpageno(currentPage);	
		pagevobysww.setPvurl("formanagersafepaytab.do");
		pagevobysww.changePageVOvariable();
	
		
		System.out.println(pagevobysww.getHiddensearchdateendinput());

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", safepayService.selectSafepayforthetap(pagevobysww));
		resultMap.put("boardPaging", pagevobysww.getPvresult());
		resultMap.put("currentPage", currentPage);					
		
		return resultMap;
	}

	// 안전과외메뉴 - 관리자 안전결재 - 탭메뉴 변경 2(=안전결재관련내역) (Azax통신)
		@RequestMapping(value = "formanagerhandlingdeposit.do")
		@ResponseBody
		public void formanagerhandlingdeposit(
					@RequestParam(value="currentPage", defaultValue="1") int currentPage,
					@RequestParam(value="refundnoarray",defaultValue="nope" ) String refundnoarray,
					@RequestParam(value="safepaynoarray",defaultValue="nonono" ) String safepaynoarray,
					@RequestParam(value="afterresultynarray" ) String afterresultynarray,
					@RequestParam(value="afterprocesskindarray" ) String afterprocesskindarray ) throws Exception{
 
			if(safepaynoarray.equals("nonono")){
			safepayService.setafterdeposit(refundnoarray,afterresultynarray,afterprocesskindarray);	
			}else{
				safepayService.setafterdepositsafepay(safepaynoarray,afterresultynarray,afterprocesskindarray);		
			}
			
		}
	
	
}