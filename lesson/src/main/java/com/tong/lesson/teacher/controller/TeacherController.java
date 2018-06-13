package com.tong.lesson.teacher.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tong.lesson.teacher.service.TeacherService;
import com.tong.lesson.teacher.vo.TeacherCurriVO;
import com.tong.lesson.teacher.vo.TeacherInfoVO;
import com.tong.lesson.teacher.vo.TeacherVO;

@Controller
public class TeacherController {
	@Autowired
	private TeacherService teacherService;

	@RequestMapping(value = "teachersearch.do")
	public String teacherSearch(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, ModelMap model)
			throws Exception {

		int listCount = teacherService.listCount(); // 게시물 갯수
		int limit = 10; // 페이지당 게시물 수

		int maxPage = (int) ((double) listCount / limit + 0.9); // 총 페이지 수

		if (currentPage < 1)
			currentPage = 1; // 현재 페이지 초기화

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1; // 해당
																						// 페이지의
																						// 시작
																						// 페이지
		int endPage = startPage + limit - 1; // 해당 페이지의 마지막 페이지

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		int startRow = (currentPage - 1) * limit + 1; // 첫번째 Row번호 (게시글 번호)
		int endRow = startRow + limit - 1; // 마지막 Row번호 (게시글 번호)

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPage", currentPage);
		map.put("maxPage", maxPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<Map<String, Object>> list = teacherService.selectAll(map);

		model.addAttribute("list", list);
		model.addAttribute("map", map);

		return "teacher/teacherSearch";
	}

	@RequestMapping(value = "teacherinfo.do")
	public String teacherinfo(@RequestParam(value = "userid") String userid, Model model) {

		int a = teacherService.teacherCount(userid);
		TeacherVO list = null;
		if (a == 1) {
			list = (TeacherVO) teacherService.selectone(userid);
		}
		model.addAttribute("teacher", list);

		return "teacher/teacherinfo";
	}

	@RequestMapping(value = "teacherEnrollPg.do")
	public String teacherEnrollPg(HttpServletRequest request) {
		return "teacher/teacherEnroll";
	}

	@RequestMapping(value = "teacherEp.do")
	@ResponseBody // 아작스쓴다고 알려줌
	public List<TeacherInfoVO> teacherEp(@RequestParam(value = "tinf_no") int tinf_no, Model model) {
		List<TeacherInfoVO> list = (List<TeacherInfoVO>) teacherService.selectEpAll(tinf_no);
		return list;
	}

	@RequestMapping(value = "teacherInsert.do")
	public String teacherEnroll(Model model, TeacherVO teacher, HttpServletRequest request) throws Exception {

		// 파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");

		// 웹서버 컨테이너 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("/");
		// 파일 저장 경로 정함
		String savePath = root + "uploadFiles/";
		// 스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함

		if (!uploadFile.isEmpty()) {
			String ofileName = uploadFile.getOriginalFilename();

			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			uploadFile.transferTo(new File(savePath + rfileName));

			teacher.setOriginalfilepath(ofileName);
			teacher.setRenamefilepath(rfileName);
		}

		int insert = teacherService.teacherEnroll(teacher);

		return "student/mainComplete";
	}

	@RequestMapping(value = "teachersearchdetail.do") // 선생님검색
	public String teacherSearchDetail(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "toggle", required = false, defaultValue = "0") int toggle, TeacherVO vo, Model model)
			throws Exception {

		int listCount = 0;

		if (toggle == 1) {
			listCount = teacherService.listSimpleCount(vo);

		} else {
			listCount = teacherService.listDetailCount(vo);

		}
		/* listCount=studentservice.listCount(); */
		int limit = 10;

		int maxPage = (int) ((double) listCount / limit + 0.9);

		if (currentPage < 1)
			currentPage = 1; // 현재 페이지 초기화

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPage", currentPage);
		map.put("maxPage", maxPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("toggle", toggle);

		map.put("lesson_area", vo.getLesson_area());
		map.put("subject", vo.getSubject());
		map.put("gender", vo.getGender());
		map.put("place", vo.getPlace());
		map.put("wish_price", vo.getWish_price());

		List<Map<String, Object>> Slist = null;

		if (toggle == 1) {
			Slist = teacherService.teacherSimpleSearchList(map);
		} else {
			Slist = teacherService.teacherDetailSearchList(map);
		}

		model.addAttribute("map", map);
		model.addAttribute("list", Slist);

		return "teacher/teacherSearchDetail";
	}

	@RequestMapping(value = "teacherUpdate.do")
	public String teacherUpdateView(@RequestParam(value = "userid") String userid, Model model) {

		TeacherVO list = (TeacherVO) teacherService.selectone(userid);

		model.addAttribute("list", list);

		return "teacher/teacherUpdate";
	}

	@RequestMapping(value = "teacherUpdatein.do")
	public String teacherUpdate(TeacherVO vo, Model model) {

		int b = teacherService.updateTeacher(vo);
		String a = null;
		if (b == 1) {
			a = "student/mainComplete";
		}

		return a;
	}

	@RequestMapping(value = "teacherInOut.do")
	@ResponseBody // 아작스쓴다고 알려줌
	public TeacherVO teacherInOut(@RequestParam(value = "userid") String userid, Model model) {
		TeacherVO list = teacherService.selectOneIn(userid);
		
		return list;
	}

	@RequestMapping(value = "tEpWrite.do")
	public String TeacherEpWrite(TeacherInfoVO vo, Model model) {

		int a = teacherService.insertEpWrite(vo);

		model.addAttribute("userid", vo.getTeacher_id());
		return "redirect:teacherinfo.do";
	}
	
		@RequestMapping(value = "curri.do")
	public String Teachercurri(TeacherCurriVO vo, Model model, HttpServletRequest request) throws IOException {

			//파일 업로드 처리
			MultipartHttpServletRequest multipartRequest =
					(MultipartHttpServletRequest)request;
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
							
				vo.setC_originalfilepath(ofileName);
				vo.setC_renamefilepath(rfileName);
			}		
			
			
			teacherService.insertCurri(vo);

			model.addAttribute("userid", vo.getUserid());
		
		return "redirect:teacherinfo.do";
	}
		
		
		@RequestMapping(value ="teacherfile.do")
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
	
		
		
			
			@RequestMapping(value = "curriup.do")
		public String TeachercurriUp(TeacherCurriVO vo, Model model, HttpServletRequest request) throws IOException {

				//파일 업로드 처리
				MultipartHttpServletRequest multipartRequest =
						(MultipartHttpServletRequest)request;
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
								
					vo.setC_originalfilepath(ofileName);
					vo.setC_renamefilepath(rfileName);
				}		
				
				
				int a = teacherService.insertCurriUp(vo);

				model.addAttribute("userid", vo.getUserid());
			
			return "redirect:teacherinfo.do";
		}
			
}
