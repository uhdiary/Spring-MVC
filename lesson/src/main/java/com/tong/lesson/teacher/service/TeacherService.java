package com.tong.lesson.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tong.lesson.teacher.vo.TeacherCurriVO;
import com.tong.lesson.teacher.vo.TeacherInfoVO;
import com.tong.lesson.teacher.vo.TeacherVO;


public interface TeacherService {

	
	

	TeacherVO selectone(String userid);

	List<TeacherInfoVO> selectEpAll(int tinf_no);

	int teacherEnroll(TeacherVO teacher);

	int listCount();

	List<Map<String, Object>> selectAll(HashMap<String, Object> map);

	int listSimpleCount(TeacherVO vo);

	int listDetailCount(TeacherVO vo);

	List<Map<String, Object>> teacherSimpleSearchList(HashMap<String, Object> map);

	List<Map<String, Object>> teacherDetailSearchList(HashMap<String, Object> map);

	int teacherCount(String userid);

	int updateTeacher(TeacherVO vo);

	TeacherVO selectOneIn(String userid);

	int insertEpWrite(TeacherInfoVO vo);

	int insertCurri(TeacherCurriVO vo);

	int insertCurriUp(TeacherCurriVO vo);

	

	

}
