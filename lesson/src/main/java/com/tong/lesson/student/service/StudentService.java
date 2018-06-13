package com.tong.lesson.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.student.vo.StudentVO;

public interface StudentService {

	public List<Map<String, Object>> studentList(HashMap<String, Object> map) throws Exception;

	public List<Map<String, Object>> studentSearchList(HashMap<String, Object> map) throws Exception;
	
	public int listCount() throws Exception;

	public StudentVO studentDetail(int sbno) throws Exception;

	public MemberVO studentInfo(String userid) throws Exception;

	public int studentInsert(StudentVO vo) throws Exception;
	
	public int studentDelete(int sbno) throws Exception;

	public int studentUpdate(StudentVO vo) throws Exception;

	public List<Map<String, Object>> studentSimpleSearchList(HashMap<String, Object> map) throws Exception;

	public List<Map<String, Object>> studentDetailSearchList(HashMap<String, Object> map) throws Exception;

	public int listSimpleCount(StudentVO vo) throws Exception;
	
	public int listDetailCount(StudentVO vo) throws Exception;

	public int studentDeleteUserid(String userid) throws Exception;

	public StudentVO selectOneIn(String userid) throws Exception;
	
}
