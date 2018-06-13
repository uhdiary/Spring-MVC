package com.tong.lesson.note.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.note.service.NoteService;
import com.tong.lesson.note.vo.NoteListVO;
import com.tong.lesson.note.vo.NoteVO;

@Controller
public class NoteController {

	@Resource
	private NoteService noteservice;

	// 받은 메시지 리스트
	@RequestMapping("noteReceiveList.do")
	public ModelAndView getReceiveList(@SessionAttribute MemberVO loginUser,
			@RequestParam(value = "page", required = false) String page, NoteListVO vo, ModelAndView mv)
			throws Exception {
		String search = vo.getSearch();
		vo.setUsername(loginUser.getUsername());
		
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		// 검색창에 아무것도 없을때
		int totalListCount = 0;
		
		List<NoteVO> list = null;
		if (vo.getSearch() == null || vo.getSearch() == "") {
			totalListCount = noteservice.receiveListCount(loginUser.getUserid());
			list = noteservice.receiveList(loginUser.getUserid(), currentPage, limit);
		} else {
			totalListCount = noteservice.receiveSearchListCount(vo);
			list = noteservice.receiveSearchList(vo, currentPage, limit);
		}

		int maxPage = (int) ((double) totalListCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		vo.setSearch(search);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("search", vo.getSearch());
		mv.addObject("select", vo.getSelect());

		mv.setViewName("note/noteReceiveList");
		return mv;
	}

	@RequestMapping("noteSendList.do")
	public ModelAndView getSendList(@SessionAttribute MemberVO loginUser,
			@RequestParam(value = "page", required = false) String page, NoteListVO vo, ModelAndView mv)
			throws Exception {
		String search = vo.getSearch();
		vo.setUsername(loginUser.getUsername());
		
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		// 검색창에 아무것도 없을때
		int totalListCount = 0;
		List<NoteVO> list = null;
		if (vo.getSearch() == null || vo.getSearch() == "") {
			totalListCount = noteservice.sendListCount(loginUser.getUserid());
			list = noteservice.sendList(loginUser.getUserid(), currentPage, limit);
			
		} else {
			totalListCount = noteservice.receiveSearchListCount(vo);
			list = noteservice.sendSearchList(vo, currentPage, limit);
		}
		
		
		int maxPage = (int) ((double) totalListCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		vo.setSearch(search);
		mv.addObject("totalCount", totalListCount);
		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("search", vo.getSearch());
		mv.addObject("select", vo.getSelect());

		mv.setViewName("note/noteSendList");
		return mv;
	}

	// 메인 쪽지창 페이지
	@RequestMapping("noteCt.do")
	public String getNoteView(Model model) throws Exception {
		return "note/noteCt";
	}

	// 쪽지 보내기
	@RequestMapping("sendNote.do")
	public ModelAndView sendNote(ModelAndView mv) throws Exception {
		mv.setViewName("note/noteWrite");
		return mv;
	}
	
	// 파일 다운로드
	@RequestMapping("/bdownfile.do")
	public void fileDownload(
			@RequestParam(value="rfile") String rfileName, 
			@RequestParam(value="ofile") String ofileName,
			HttpServletResponse response,
			HttpServletRequest request){
		// 프로젝트 내에 파일이 저장된 곳의 위치를 얻어옴
		String saveFolder = request.getSession()
			   .getServletContext().getRealPath("/uploadFiles/");			 
		
		BufferedInputStream buf = null;
		ServletOutputStream downOut = null;
			 
		try {		  
		   downOut = response.getOutputStream();
		   File downfile = new File(saveFolder + "/" + rfileName);
		   response.setContentType("text/plain; charset=utf-8");		
			//한글 파일명 인코딩 처리
			response.addHeader("Content-Disposition", "attachment; filename=\"" + 
			 new String(ofileName.getBytes("UTF-8"), "ISO-8859-1") + 
			 "\"");
		   response.setContentLength((int)downfile.length());
				  
		   FileInputStream input = new FileInputStream(downfile);
		   buf = new BufferedInputStream(input);
		   int readBytes = 0;

		   while ((readBytes = buf.read()) != -1){
			downOut.write(readBytes);
		   }
		   downOut.close();
		   buf.close();
		} catch (Exception e) {
		   e.printStackTrace();
		}
		
	}

	// 쪽지 쓰기
	@RequestMapping("noteWrite.do")
	public String writeNote(NoteVO vo, String receiveid, ModelAndView mv, HttpServletRequest request) throws IOException {
		//파일 업로드 처리
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
			MultipartFile uploadFile = multipartRequest.getFile("uploadFile");
			
			// 웹서버 컨테이너 경로 추출함 
		    String root = request.getSession().getServletContext().getRealPath("/");
		    // 파일 저장 경로 정함
		    String savePath = root + "uploadFiles/";
		    //스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함
		    
			
			if(!uploadFile.isEmpty()){
				String ofileName = uploadFile.getOriginalFilename();
				
				long currentTime = System.currentTimeMillis();  
			    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
				String rfileName = simDf.format(new Date(currentTime)) +"."
						+ ofileName.substring(ofileName.lastIndexOf(".")+1);;
				uploadFile.transferTo(new File(savePath + rfileName));
							
				vo.setNote_original_filename(ofileName);
				vo.setNote_rename_filename(rfileName);
			}		
			
			noteservice.sendNote(vo);
					
			return "redirect:noteSendList.do";
		}
		
	
	// 답장 쓰기
	@RequestMapping("noteReply.do")
	public ModelAndView noteReply(int check_no, String receiveid, ModelAndView mv) throws Exception {
		mv = this.notedetail(check_no, receiveid, mv);
		mv.setViewName("note/noteReply");
		return mv;
	}

	// 쪽지 디테일
	@RequestMapping("noteDetail.do")
	public ModelAndView notedetail(int no, String receiveid, ModelAndView mv) throws Exception {
		NoteVO nvo = noteservice.noteOne(no, receiveid);
		mv.addObject("noteone", nvo);
		mv.setViewName("note/noteDetail");
		return mv;
	}

	// 받은 쪽지 삭제
	@RequestMapping("receivedel.do")
	public ModelAndView receivedel(int[] check_no, ModelAndView mv) throws Exception {
		int result = noteservice.noteReceiveDel(check_no);

		if (result > 0) {
			mv.setViewName("redirect:/noteReceiveList.do");
		} else {
			// 삭제 실패 페이지
			mv.setViewName("");
		}
		return mv;
	}
	
	// 보낸 쪽지 삭제
	@RequestMapping("senddel.do")
	public ModelAndView senddel(int[] check_no, ModelAndView mv) throws Exception {
		int result = noteservice.noteSendDel(check_no);
		mv.setViewName("redirect:/noteSendList.do");

		return mv;

	}
	
	
}