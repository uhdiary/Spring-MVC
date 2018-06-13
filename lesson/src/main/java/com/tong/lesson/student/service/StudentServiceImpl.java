package com.tong.lesson.student.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.student.dao.StudentDao;
import com.tong.lesson.student.vo.StudentVO;

@Service("StudentService")
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentdao;
	
	@Override
	public List<Map<String, Object>> studentList(HashMap<String, Object> map) throws Exception {
		return studentdao.studentList(map);
	}
	
	@Override
	public List<Map<String, Object>> studentSearchList(HashMap<String, Object> map) throws Exception {
		return studentdao.studentSearchList(map);
	}
	
	@Override
	public int listCount() throws Exception{
		return studentdao.listCount();
	}
	
	@Override
	public StudentVO studentDetail(int sbno) throws Exception {
		return studentdao.studentDetail(sbno);
	}

	@Override
	public MemberVO studentInfo(String userid) throws Exception {
		return studentdao.studentInfo(userid);
	}

	@Override
	public int studentInsert(StudentVO vo) throws Exception {
		return studentdao.studentInsert(vo);		
	}
	
	
	@Override
	public int studentDelete(int sbno) throws Exception {
		return studentdao.studentDelete(sbno);
	}

	@Override
	public int studentDeleteUserid(String userid) throws Exception {
		return studentdao.studentDeleteUserid(userid);
	}
	
	@Override
	public int studentUpdate(StudentVO vo) throws Exception {
		return studentdao.studentUpdate(vo);
	}

	@Override
	public List<Map<String, Object>> studentSimpleSearchList(HashMap<String, Object> map) throws Exception {
		return studentdao.studentSimpleSearch(map);
	}

	@Override
	public List<Map<String, Object>> studentDetailSearchList(HashMap<String, Object> map) throws Exception {
		return studentdao.studentDetailSearchList(map);
	}

	@Override
	public int listSimpleCount(StudentVO vo) throws Exception {
		return studentdao.listSimpleCount(vo);
	}

	@Override
	public int listDetailCount(StudentVO vo) throws Exception {
		return studentdao.listDetailCount(vo);
	}

	@Override
	public StudentVO selectOneIn(String userid) throws Exception {
		return studentdao.studentOne(userid);
	}

}
