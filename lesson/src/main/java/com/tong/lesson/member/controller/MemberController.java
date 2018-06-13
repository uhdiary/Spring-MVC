package com.tong.lesson.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.tong.lesson.member.service.MemberService;
import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.safepay.vo.PagingVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	//로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		vo = memberService.selectMember(vo);
		
		if(vo != null){
			session.setAttribute("loginUser", vo);
			mv.addObject("user", vo);
			mv.setViewName("member/loginSuccess");		
			return mv;
		}
		else{
			mv.setViewName("main");
			return mv;
		}		

	}
	
	
	@RequestMapping(value = "loginazax.do", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO loginazax(@RequestParam HashMap<String, String> param, HttpSession session){
		MemberVO mvo = memberService.selectMemberazax(param);
		if(mvo != null){
			
			return mvo;
		}
		else{
			MemberVO mvo2 = new MemberVO() ;
			mvo2.setUserid("x");
			return mvo2;
		}		
	}
	
	@RequestMapping(value = "loginGo.do")
	public String loginGo(){
	
		return "home";
	}
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session){
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		
		mv.setViewName("main");
		return mv;
				
	}
	//회원가입 폼
	@RequestMapping(value="enrollView.do")
	public ModelAndView login( HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("member/enroll");
		mav.addObject("userco", request.getParameter("userco"));
		return mav;
	}
	//회원가입 선생 학생
	@RequestMapping(value="enrollmenyu.do")
	public ModelAndView enrollmenyu(MemberVO vo) {
		return new ModelAndView("member/menyu");
	}
	//회원가입
	@RequestMapping(value = "minsert.do", method = RequestMethod.POST)
	public ModelAndView minsert(MemberVO vo){
		ModelAndView mv = new ModelAndView();
		int insert = memberService.insertMember(vo);
		
		if(insert != 0){
			mv.setViewName("main");
			mv.addObject("good", "insertgaib");
		}
		else{
			mv.setViewName("member/enroll");
		}
		return mv;
	}
	//마이페이지
	@RequestMapping("memberDetaView.do")
	public ModelAndView memberDetaview(@RequestParam("userid") String userid) throws Exception{
	ModelAndView mv = new ModelAndView("member/memberDetailView");
	//MemberVO mvo = memberService.selectMember((MemberVO)session.getAttribute("loginUser"));
	MemberVO mvo = memberService.managerMember(userid);
	mv.addObject("loginUser", mvo);
	return mv;
	   }
	//회원정보 상세페이지
	@RequestMapping("managerMember.do")
	public ModelAndView managerMember(@RequestParam("userid") String userid) throws Exception{
	ModelAndView mv = new ModelAndView("member/memberDetailView");
	MemberVO mvo = memberService.managerMember(userid);
	mv.addObject("loginUser", mvo);
	return mv;
	   }
	//수정화면
	@RequestMapping("memberupDate.do")
	public ModelAndView memberupDate(HttpSession session,@RequestParam("userid") String userid,MemberVO mvo) throws Exception{
	ModelAndView mv = new ModelAndView("member/updateForm");
	//MemberVO mvo = memberService.selectMember((MemberVO)session.getAttribute("loginUser"));

	mvo= memberService.selectMember(userid);
	mv.addObject("loginUser", mvo);
	return mv;
	   }
	//수정페이지
	@RequestMapping("mupdate.do")
	public String mupdate(MemberVO vo,HttpSession session){
		
		int insert = memberService.membermupdate(vo);
		vo=(MemberVO)session.getAttribute("loginUser");
		if(vo.getUserid().equals("admin")){return "redirect:managergo.do";   }
		else{
		return "redirect:memberDetaView.do?userid="+vo.getUserid();
		}
	}
	//회원탈퇴
	@RequestMapping("mdel.do")
	public ModelAndView mdel(MemberVO vo) throws Exception{
	ModelAndView mv = new ModelAndView("main");
	int mvo = memberService.mdel(vo);
	return mv;
	}
	//아이디 찾기 폼
	@RequestMapping("idfind.do")
	public ModelAndView idfind() throws Exception{
		ModelAndView mv = new ModelAndView("member/idFind");
		return mv;
	}
	//아이디 찾기 기능
	@RequestMapping("idfindin.do")
	@ResponseBody
	public String idfindin(HttpServletRequest request, MemberVO vo, HashMap map) throws Exception{
	vo.setUsername(request.getParameter("username"));
	vo.setEmail(request.getParameter("emailtest"));
	vo.setPhone(request.getParameter("phonetest"));
	String userid = memberService.idfindin(vo);
	
	/*map.put("username", request.getParameter("username"));*/
		return userid;
	}
	//비밀번호 찾기 폼
	@RequestMapping("pwdfind.do")
	public ModelAndView pwdfind() throws Exception{
		ModelAndView mv = new ModelAndView("member/pwdFind");
		return mv;
	}
	//비밀번호 찾기 기능
		@RequestMapping("pwdfindin.do")
		@ResponseBody
		public String pwdfindin(HttpServletRequest request, MemberVO vo) throws Exception{
			vo.setUserid(request.getParameter("userid"));
			vo.setUsername(request.getParameter("username"));
			vo.setEmail(request.getParameter("emailtest"));
			vo.setPhone(request.getParameter("phonetest"));
			String userid = memberService.pwdfindin(vo);
			return userid;
		}
	//비밀번호 변경 기능
		@RequestMapping("pwding.do")
		@ResponseBody
		public ModelAndView pwding(HttpServletRequest request, MemberVO vo) throws Exception{
			vo.setUserid(request.getParameter("userid"));
			vo.setUserpwd(request.getParameter("userpwd"));
			memberService.pwding(vo);
			ModelAndView mv = new ModelAndView("main");
			return mv;
			
		}
	//아이디 중복 체크
		@RequestMapping("idcheck.do")
		@ResponseBody
		public String idcheck(HttpServletRequest request, MemberVO vo) throws Exception{
			vo.setUserid(request.getParameter("userid"));
			return memberService.idcheck(vo);
		}
	//회원관리 정보
		@RequestMapping("managergo.do")
		public ModelAndView managergo(MemberVO vo, ModelAndView mv, PagingVO page,
				@RequestParam(value="currentPage", defaultValue="1") int currentPage,
				HttpServletRequest request) throws Exception{
			
			 String makeseachword ="";
			 String hiddensearchstandardKind="USERID";
			 if(request.getParameter("hiddensearchstandardKind")!=null){

				 hiddensearchstandardKind =request.getParameter("hiddensearchstandardKind");
				 }
			 
			 
			
			 makeseachword +="%";
			 if(request.getParameter("seachword")!=null){
				// if(request.getParameter("seachword").split("%").length=)
				
			 makeseachword +=request.getParameter("seachword");
			 }
			 makeseachword +="%";
			 
			 HashMap<String,String> hmap = new HashMap<String,String>();
			 hmap.put("seachword", makeseachword);
			 hmap.put("hiddensearchstandardKind", hiddensearchstandardKind);
			 
			  page.setPvsearchkind("managermember");
			  page.setHiddensearchstandardKind(hiddensearchstandardKind);
		      page.setPvtotalcount( ( Integer.parseInt(memberService.getmemberTotal(hmap)) ) ); 
		      page.setPvnowpageno(currentPage);
		      page.setPvurl("managergo.do");
		      page.setHiddensearchtextbox1(makeseachword);
		      page.changePageVOvariable();
		      
		      
		      List<Map<String, Object>> list = memberService.managergo(page);

			mv.addObject("list", list);
			mv.addObject("boardPaging",page.getPvresult());
			mv.addObject("currentPage", currentPage);
			mv.setViewName("member/manager");
			return mv;
		}
		//관리자수정
		@RequestMapping("memberupDateAdmin.do")
		public ModelAndView memberupDateAdimin(@RequestParam("userid") String userid) throws Exception{
		ModelAndView mv = new ModelAndView("member/updateForm");
		MemberVO mvo = memberService.selectMember("userid");
		mv.addObject("loginUser", mvo);
		return mv;
		   }
}