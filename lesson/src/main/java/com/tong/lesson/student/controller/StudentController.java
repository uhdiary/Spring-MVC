package com.tong.lesson.student.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
/*import javax.websocket.Session;
*/
/*import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
*/import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.student.service.StudentService;
import com.tong.lesson.student.vo.StudentVO;
import com.tong.lesson.teacher.vo.TeacherVO;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentservice;
		
	@RequestMapping(value="studentsearch.do")	// 학생 검색 페이지에 학생 목록 출력
	public String studentList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="sessionid", required=false, defaultValue="1") String sessionid
			,StudentVO vo, Model model) throws Exception{
		
		int listCount = studentservice.listCount();	// 게시물 갯수
		int limit = 10;								// 페이지당 게시물 수
				
		int maxPage = (int)((double)listCount/limit + 0.9);	// 총 페이지 수
		
		if(currentPage < 1)							
			currentPage = 1;						// 현재 페이지 초기화
		
		int startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit+1;	// 해당 페이지의 시작 페이지 
		int endPage = startPage + limit - 1;			// 해당 페이지의 마지막 페이지
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		int startRow = (currentPage-1)*limit+1;	// 첫번째 Row번호 (게시글 번호) 
		int endRow = startRow+limit-1;			// 마지막 Row번호 (게시글 번호)
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPage", currentPage);
		map.put("maxPage", maxPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Map<String, Object>> list = studentservice.studentList(map);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("sessionid", sessionid);
		
		return "student/studentList";		
	}
	
	@RequestMapping(value="studentDetail.do")
	public String sutdentDetail(@RequestParam(value="sbno", required=false, defaultValue="1") int sbno, 
			@RequestParam(value="userid", required=false, defaultValue="1") String userid,
			@RequestParam(value="sessionid", required=false, defaultValue="1") String sessionid,Model model) throws Exception{
		MemberVO studentInfo = studentservice.studentInfo(userid);
		StudentVO studentDetail = studentservice.studentDetail(sbno);
		

		Float[] coords = geoCoding(studentInfo.getAddress());
		//System.out.println(coords[0] + ", " + coords[1]);
		
		model.addAttribute("sessionid", sessionid);
		
		model.addAttribute("studentInfo", studentInfo);
		model.addAttribute("studentDetail", studentDetail);
		model.addAttribute("co1", coords[0]);
		model.addAttribute("co2", coords[1]);
		
		return "student/studentDetail";
	}
	
	@RequestMapping(value="studentsearchdetail.do")	// 학생 검색
	public String studentSearch(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="toggle", required=false, defaultValue="0") int toggle,
			@RequestParam(value="sessionid", required=false, defaultValue="0") String sessionid, 
			StudentVO vo, Model model) throws Exception{
		
		int listCount = 0;
		//System.out.println(toggle);
		if(toggle==1){
			listCount = studentservice.listSimpleCount(vo);
		}
		else{
			listCount = studentservice.listDetailCount(vo);
		}		
		/*listCount=studentservice.listCount();*/
		int limit = 10;
		
		int maxPage = (int)((double)listCount/limit+0.9);
		
		if(currentPage < 1)							
			currentPage = 1;						// 현재 페이지 초기화
		
		int startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit+1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow+limit-1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPage", currentPage);
		map.put("maxPage", maxPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("toggle", toggle);	
		
		
		map.put("SB_AREA", vo.getSB_AREA());
		map.put("SB_SUBJECT", vo.getSB_SUBJECT());
		map.put("SB_PERPOSE", vo.getSB_PERPOSE());
		map.put("SB_LEVEL", vo.getSB_LEVEL());
		map.put("SB_STYLE", vo.getSB_STYLE());
		map.put("SB_PRICE", vo.getSB_PRICE());
			
		List<Map<String, Object>> Slist = null;
		
		if(toggle==1){
			Slist = studentservice.studentSimpleSearchList(map);
		}
		else{
			Slist = studentservice.studentDetailSearchList(map);
		}
		//System.out.println("map="+map);
		model.addAttribute("map", map);
		model.addAttribute("list", Slist);
		model.addAttribute("sessionid", sessionid);
				
				
		return "student/studentSearch";
	}
	
	@RequestMapping(value="studentenroll.do")	// 학생 등록 페이지로 이동
	public String EnrollMain(@RequestParam(value="userid", required=false, defaultValue="1") String userid
			,Model model) throws Exception{
		
		model.addAttribute("userid", userid);
		
		return "student/studentEnroll";
	}
	
	@RequestMapping(value="studentinsert.do")	// 학생 등록
	public String studentInsert(StudentVO vo, HttpServletRequest request) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		MultipartHttpServletRequest multipartRequest =
				(MultipartHttpServletRequest)request;
		
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");		

	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "uploadFiles/";
	    
	    if(!uploadFile.isEmpty()){
			String ofileName = uploadFile.getOriginalFilename();
			
			long currentTime = System.currentTimeMillis();  
		    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) +"."
					+ ofileName.substring(ofileName.lastIndexOf(".")+1);;
			uploadFile.transferTo(new File(savePath + rfileName));
						
			vo.setSB_ORIGINFILE(ofileName);
			vo.setSB_RENAMEFILE(rfileName);
		}	
	    //System.out.println(vo);
		int a = studentservice.studentInsert(vo);
		return "student/mainComplete";
	}
			
	@RequestMapping(value="studentDelete.do")
	public String studentDelete(@RequestParam(value="sbno", required=false, defaultValue="1") int sbno
			, Model model) throws Exception{
		int a = studentservice.studentDelete(sbno);
		
		return "student/mainComplete";
	}
	
	@RequestMapping(value="adminDelete.do")	
	public String adminDelete(@RequestParam(value="sbuserid", required=false, defaultValue="1") String sbuserid
			, Model model) throws Exception{
		String[] useridArr= sbuserid.split("-");
		//System.out.println(useridArr);
		for(int i = 0; i < useridArr.length; i++){
			int a = studentservice.studentDeleteUserid(useridArr[i]);
		}
		return "student/mainComplete";
	}
	
	@RequestMapping(value="studentUpdateForm.do")
	public String studentUpdateForm(@RequestParam(value="sbno", required=false, defaultValue="1") int sbno
			,@RequestParam(value="userid", required=false, defaultValue="1") String userid
			, Model model) throws Exception{
		model.addAttribute("userid", userid);
		model.addAttribute("sbno", sbno);
		return "student/studentUpdate";
	}
	
	@RequestMapping(value="studentUpdate.do")
	public String studentUpdate(StudentVO vo, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		MultipartHttpServletRequest multipartRequest =
				(MultipartHttpServletRequest)request;
		
		MultipartFile uploadFile = multipartRequest.getFile("uploadFile");		

	    String root = request.getSession().getServletContext().getRealPath("/");
	    String savePath = root + "uploadFiles/";
	    
	    if(!uploadFile.isEmpty()){
			String ofileName = uploadFile.getOriginalFilename();
			
			long currentTime = System.currentTimeMillis();  
		    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) +"."
					+ ofileName.substring(ofileName.lastIndexOf(".")+1);;
			uploadFile.transferTo(new File(savePath + rfileName));
						
			vo.setSB_ORIGINFILE(ofileName);
			vo.setSB_RENAMEFILE(rfileName);
		}
		int a = studentservice.studentUpdate(vo);
		return "student/mainComplete";
	}
	
	@RequestMapping(value="studentInOut.do")
	@ResponseBody
	public StudentVO studentInOut(@RequestParam(value = "userid") String userid, Model model) throws Exception {
		StudentVO list = studentservice.selectOneIn(userid);
		
		return list;
	}
		
	public static Float[] geoCoding(String location) {
		if (location == null)  
		return null;
				       
		Geocoder geocoder = new Geocoder();
		// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
		// setLanguate : 인코딩 설정
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;
		try {
		geocoderResponse = geocoder.geocode(geocoderRequest);
		if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
			
			GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
			LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
						  
			Float[] coords = new Float[2];
			coords[0] = latitudeLongitude.getLat().floatValue();
			coords[1] = latitudeLongitude.getLng().floatValue();
			return coords;
		}
		
		} catch (IOException ex) {
			ex.printStackTrace();
		}
			return null;
		}

}
