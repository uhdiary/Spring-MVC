package com.tong.lesson.faqboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.qboard.vo.QboardVO;
import com.tong.lesson.safepay.vo.SafepayVO;
import com.tong.lesson.faqboard.service.FaqBoardService;
import com.tong.lesson.faqboard.vo.FaqBoardVO;



@Controller
public class FaqBoardController {
	
	@Resource
	private FaqBoardService faqboardservice;

	@RequestMapping(value = "faqboardListView.do")
	public ModelAndView faqboardListView(ModelAndView mview, HttpSession session, @RequestParam(value = "page", required = false) String page) throws Exception {
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);
		 
		int totalListCount = 0;
		totalListCount = faqboardservice.countforfaqboardlist();
		if (session.getAttribute("loginUser") != null) {
			List<FaqBoardVO> list = faqboardservice.selectBoardList(((MemberVO) session.getAttribute("loginUser")).getUserid(), currentPage, limit);
			mview.addObject("list", list);}
		else{
			List<FaqBoardVO> list = faqboardservice.selectBoardList(currentPage, limit);
			mview.addObject("list", list);
		}
		
		int maxPage = (int) ((double) totalListCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		mview.addObject("totalCount", totalListCount);
		mview.addObject("currentPage", currentPage);
		mview.addObject("maxPage", maxPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		
		mview.setViewName("faq/faqboardListView");
		return mview;
	}
	
	@RequestMapping(value = "faqboardWriteForm.do")
	public ModelAndView write(ModelAndView mv, HttpSession session) throws Exception {
		mv.setViewName("faq/faqboardWriteForm");
		return mv;
	}
	
	@RequestMapping(value = "insertfaq.do")
	public String insertfaq(ModelAndView mv, HttpSession session, FaqBoardVO fabvo) throws Exception {
		
		faqboardservice.insertfaq(fabvo);
		return "redirect:faqboardListView.do";
	}
	
	  @RequestMapping("deletefaq.do")
	   public ModelAndView deletefaq(int[] check_no, ModelAndView mv) throws Exception {
	      int result = faqboardservice.deletefaq(check_no);

	      if (result > 0) {
	         mv.setViewName("redirect:/faqboardListView.do");
	      } else {
	         // 삭제 실패 페이지
	         mv.setViewName("");
	      }
	      return mv;
	   }
	  
	  @RequestMapping("faqcerch.do")
	  public ModelAndView faqcerch(@RequestParam ("keyword") String keyword, ModelAndView mv,
			  @RequestParam(value = "page",  defaultValue = "1") int page)  throws Exception {
		  Map<String,Object> map = new HashMap<String, Object>();
		  
		  
		  int currentPage = 1;
			int limit = 10;

			if (page != 1)
				currentPage = page;
			 
			int totalListCount = 0;
			totalListCount = faqboardservice.countforsearchtitle(keyword);
			
			int maxPage = (int) ((double) totalListCount / limit + 0.9);
			int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			int endPage = startPage + limit - 1;

			if (maxPage < endPage)
				endPage = maxPage;
		  
		  map.put("keyword", keyword);
		  List<Map<String,Object>> list = faqboardservice.searchtitle(map);
		  mv.addObject("list", list);
		  mv.addObject("totalCount", totalListCount);
		  mv.addObject("currentPage", currentPage);
		  mv.addObject("maxPage", maxPage);
		  mv.addObject("startPage", startPage);
		  mv.addObject("endPage", endPage);
			
		  mv.setViewName("faq/faqboardListView");
		  
		  
		  return mv;
	  }

	
}
