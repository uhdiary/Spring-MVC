package com.tong.lesson.suda.controller;

import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.tong.lesson.suda.service.SudaService;
import com.tong.lesson.suda.vo.*;

@Controller
public class SudaController {
	@Resource(name="sudaService")
	private SudaService sudaService;
	@RequestMapping("stsuda.do")
	public ModelAndView userCheck(Map<String, Object> commandMap)
			throws Exception {
				ModelAndView mv = new ModelAndView("suda/suda");
				List<Map<String,Object>> list = sudaService.selectBoardList_st(commandMap);
				mv.addObject("tit", "학생들끼리 수다방");
				mv.addObject("list", list);
				mv.addObject("check", "totitle");
				mv.addObject("table_sort", 2);
				mv.addObject("color", "#008000");
				int comment_count[] = getCommentList(2);
				mv.addObject("comment", comment_count);
				return mv;
	}
	@RequestMapping("teasuda.do")
	public ModelAndView userCheck1(Map<String, Object> commandMap)
			throws Exception {
				ModelAndView mv = new ModelAndView("suda/suda");
				List<Map<String,Object>> list = sudaService.selectBoardList_tea(commandMap);
				mv.addObject("list", list);
				mv.addObject("tit", "선생님들끼리 수다방");
				mv.addObject("check", "totitle");
				mv.addObject("table_sort", 1);
				mv.addObject("color", "#FFC90E");
				int comment_count[] = getCommentList(1);
				mv.addObject("comment", comment_count);
				return mv;
	}
	@RequestMapping("allsuda.do")
	public ModelAndView userCheck2(Map<String, Object> commandMap)
			throws Exception {
				ModelAndView mv = new ModelAndView("suda/suda");
				List<Map<String,Object>> list = sudaService.selectBoardList_all(commandMap);
				mv.addObject("list", list);
				mv.addObject("tit", "통합 수다방");
				mv.addObject("check", "totitle");
				mv.addObject("table_sort", 3);
				mv.addObject("color", "#A0C0D7");
				int comment_count[] = getCommentList(3);
				mv.addObject("comment", comment_count);
				return mv;
	}
	@RequestMapping("sudaDetail.do")
	public ModelAndView openBoardDetail(@RequestParam ("tno") int tno)
			throws Exception{
	ModelAndView mv = new ModelAndView("suda/info");
	Suda suda = sudaService.selectBoardDetail(tno);
	List<Map<String,Object>> comment = sudaService.comment(tno);
	mv.addObject("suda", suda);
	mv.addObject("comment", comment);
	return mv;
	}
	@RequestMapping("sudasearch.do")
	public ModelAndView search(@RequestParam ("keyword") String keyword,
			@RequestParam ("table_sort") int table_sort)
					throws Exception{
		ModelAndView mv = new ModelAndView("suda/suda");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("table_sort", table_sort);
		map.put("keyword", keyword);
		List<Map<String,Object>> list = sudaService.searchtitle(map);
		mv.addObject("list", list);
		mv.addObject("table_sort", table_sort);
		int comment_count[] = getCommentList(table_sort, keyword);
		mv.addObject("comment", comment_count);
		if(table_sort == 1){
			mv.addObject("tit", "선생님들끼리 수다방");
			mv.addObject("color", "#FFC90E");			
		}
		else if(table_sort == 2){
			mv.addObject("tit", "학생들끼리 수다방");
			mv.addObject("color", "#008000");
		}
		else{
			mv.addObject("tit", "통합 수다방");
			mv.addObject("color", "#A0C0D7");
		}
		mv.addObject("keyword", keyword);
		return mv;
	}
	@RequestMapping("gotosudaupdate.do")
	public ModelAndView gotosudaupdate(@RequestParam ("table_no") 
	int table_no) throws Exception{
		ModelAndView mv = new ModelAndView("suda/write");
		Suda suda = sudaService.selectBoardDetail(table_no);
		mv.addObject("suda", suda);
		mv.addObject("check", 2);
		return mv;
	}
	@RequestMapping("updatesuda.do")
	public ModelAndView update(HttpServletRequest request)
			throws Exception{
		ModelAndView mv = null;
		sudaService.update(request);
		int tno = Integer.parseInt(request.getParameter("table_no"));
		try {mv = openBoardDetail(tno);} 
		catch (Exception e) {e.printStackTrace();}
		return mv;
	}
	@RequestMapping("gotosudawrite.do")
	public ModelAndView gotosudawrite(HttpServletRequest request)
			throws Exception{
		ModelAndView mv = new ModelAndView("suda/write");
		int table_sort = Integer.parseInt(request.getParameter("table_sort"));
		mv.addObject("table_sort", table_sort);
		mv.addObject("check", 1);
		return mv;
	}
	@RequestMapping("deletesuda.do")
	public String delete(@RequestParam ("table_no") int table_no,
		@RequestParam ("table_sort") int table_sort) throws Exception{
		String list = "";
		if(table_sort == 1)
			list = "redirect:teasuda.do";
		else if(table_sort == 2)
			list = "redirect:stsuda.do";
		else
			list = "redirect:allsuda.do";
		sudaService.delete(table_no);
		return list;
	}
	@RequestMapping("entercomment.do")
	public ModelAndView entercomment(HttpServletRequest request){
		ModelAndView mv = null;
		sudaService.entercomment(request);
		int table_no = Integer.parseInt(request.getParameter("table_no"));
		try {mv = openBoardDetail(table_no);} 
		catch (Exception e) {e.printStackTrace();}
		return mv;
	}
	@RequestMapping("deletecomment.do")
	public ModelAndView deletecomment(HttpServletRequest request){
		sudaService.deletecomment(request);
		ModelAndView mv = null;
		int tno = Integer.parseInt(request.getParameter("table_no"));
		try {mv = openBoardDetail(tno);} 
		catch (Exception e) {e.printStackTrace();}
		return mv;
	}
	@RequestMapping("insertsuda.do")
	ModelAndView insertsuda(HttpServletRequest request){
		sudaService.insert(request);
		ModelAndView mv = null;
		int table_sort = Integer.parseInt(request.getParameter("table_sort"));
		try{
		if(table_sort == 1)
			mv = userCheck1(new HashMap<String, Object>());
		else if(table_sort == 2)
			mv = userCheck(new HashMap<String, Object>());
		else
			mv = userCheck2(new HashMap<String, Object>());
		}
		catch(Exception e){e.printStackTrace();}
		return mv;		
	}
	public int[] getCommentList(int table_sort){
		List nolist = sudaService.nolist(table_sort);
		Object nl[] = nolist.toArray();
		int nlist[] = new int[nl.length]; // 목록 테이블번호
		int comment_count_back[] = new int[nl.length];
		int comment_count[] = new int[nl.length];
		String tmp[] = null;
		for(int i = 0; i < nl.length; i++){
			tmp = nl[i].toString().split("=");
			nlist[i] = Integer.parseInt(tmp[1].substring(0, tmp[1].indexOf("}")));
		}
		for(int i = 0; i < nl.length; i++)
			comment_count_back[i] = sudaService.comment_count(nlist[i]);
		for(int i = 0; i < nl.length; i++)
			comment_count[i] = comment_count_back[nl.length - i - 1];
		return comment_count;
	}
	public int[] getCommentList(int table_sort, String keyword){
		List nolist = sudaService.nolist(table_sort, keyword);
		Object nl[] = nolist.toArray();
		int nlist[] = new int[nl.length]; // 목록 테이블번호
		int comment_count_back[] = new int[nl.length];
		int comment_count[] = new int[nl.length];
		String tmp[] = null;
		for(int i = 0; i < nl.length; i++){
			tmp = nl[i].toString().split("=");
			nlist[i] = Integer.parseInt(tmp[1].substring(0, tmp[1].indexOf("}")));
		}
		for(int i = 0; i < nl.length; i++)
			comment_count_back[i] = sudaService.comment_count(nlist[i]);
		for(int i = 0; i < nl.length; i++)
			comment_count[i] = comment_count_back[nl.length - i - 1];
		return comment_count;
	}
}
