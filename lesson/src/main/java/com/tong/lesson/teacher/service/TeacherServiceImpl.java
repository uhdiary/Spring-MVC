package com.tong.lesson.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tong.lesson.teacher.dao.TeacherDAO;
import com.tong.lesson.teacher.vo.TeacherCurriVO;
import com.tong.lesson.teacher.vo.TeacherInfoVO;
import com.tong.lesson.teacher.vo.TeacherVO;

@Service("TeacherServie")
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherDAO teacherdao;
	


	@Override
	public TeacherVO selectone(String userid) {
		
		return teacherdao.selectOne(userid);
	}

	@Override
	public List<TeacherInfoVO> selectEpAll(int tinf_no) {
		//선생님 후기 에이작스
		return teacherdao.selectEp(tinf_no);
	}

	@Override
	public int teacherEnroll(TeacherVO teacher) {
		//선생님 가입
		return teacherdao.insertTeacher(teacher);
	}

	@Override
	public int listCount() {
		//페이징
		
		return teacherdao.listCount();
	}

	@Override
	public List<Map<String, Object>> selectAll(HashMap<String, Object> map) {
		//선생님 리스트
		return teacherdao.teacherList(map);
	}

	@Override
	public int listSimpleCount(TeacherVO vo) {
		//심플검색 카운트
		return teacherdao.listSimpleCount(vo);
	}

	@Override
	public int listDetailCount(TeacherVO vo) {
		//상세검색 카운트
		return teacherdao.listDetailCount(vo);
	}

	@Override
	public List<Map<String, Object>> teacherSimpleSearchList(HashMap<String, Object> map) {
		//검색 심플
		return teacherdao.teacherSimpleSearch(map);
	}

	@Override
	public List<Map<String, Object>> teacherDetailSearchList(HashMap<String, Object> map) {
		//검색 디테일
		return teacherdao.teacherDetailSearchList(map);
	}

	@Override
	public int teacherCount(String userid) {
		// 
		return teacherdao.teacherCount(userid);
	}

	@Override
	public int updateTeacher(TeacherVO vo) {
		//선생님 정보 수정
		return teacherdao.updateTeacher(vo);
	}

	@Override
	public TeacherVO selectOneIn(String userid) {
		//선생님 정보유무
		return teacherdao.teacherOneIn(userid);
	}

	@Override
	public int insertEpWrite(TeacherInfoVO vo) {
		//선생님 후기 작성
		return teacherdao.insertEpWrite(vo);
	}

	@Override
	public int insertCurri(TeacherCurriVO vo) {
		//선생님 커리큘럼 등록
		return teacherdao.insertCurri(vo);
	}

	@Override
	public int insertCurriUp(TeacherCurriVO vo) {
		// 파일수정
		
		
		return teacherdao.upCurri(vo);
				
	}

	

}
