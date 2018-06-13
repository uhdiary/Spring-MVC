package com.tong.lesson.teacher.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.teacher.vo.TeacherCurriVO;
import com.tong.lesson.teacher.vo.TeacherInfoVO;
import com.tong.lesson.teacher.vo.TeacherVO;

@Repository("teacherdao")
public class TeacherDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	private TeacherVO teacher;
	
	public List<TeacherVO> selectAll() {
		
		List<TeacherVO> list = (List<TeacherVO>) mybatis.selectList("selectTeacher");
	
		return list;
	}

	public TeacherVO selectOne(String userid) {
		
		
		TeacherVO teacher =(TeacherVO) mybatis.selectOne("selectOntTeacher",userid);
		
		return teacher;
	}

	public List<TeacherInfoVO> selectEp(int tinf_no) {
		
		List<TeacherInfoVO> list = (List<TeacherInfoVO>) mybatis.selectList("teacherEp",tinf_no);
		
		return list;
	}

	public int insertTeacher(TeacherVO teacher) {
		
		int insert = mybatis.insert("teacherInsert", teacher);
		
		
		return insert;
	}

	public int listCount() {
		//페이징
		int listCount = (Integer) mybatis.selectOne("listCount1");
		return listCount;
	}

	public List<Map<String, Object>> teacherList(HashMap<String, Object> map) {
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = (List<Map<String, Object>>) mybatis.selectList("selectTeacher", map);
		//System.out.println(list);	
		return list;
	}

	public int listSimpleCount(TeacherVO vo) {
		//심플검색 카운트
		int listCount = (Integer) mybatis.selectOne("listSimpleCount", vo);
		return listCount;
	}

	public int listDetailCount(TeacherVO vo) {
		//상세검색 카운트
		int listCount = (Integer) mybatis.selectOne("listDetailCount", vo);
		return listCount;
	}

	public List<Map<String, Object>> teacherSimpleSearch(HashMap<String, Object> map) {
		//심플검색
		
		List<Map<String, Object>> list = (List<Map<String, Object>>) mybatis.selectList("teacherSimpleSearch", map);
		return list;
	}

	public List<Map<String, Object>> teacherDetailSearchList(HashMap<String, Object> map) {
		//상세검색
		List<Map<String, Object>> list = (List<Map<String, Object>>) mybatis.selectList("teacherDetailSearch", map);
		
		return list;
	}

	public int teacherCount(String userid) {
		//선생님 count 
		int a = mybatis.update("teacherCount", userid);
		return a;
	}

	public int updateTeacher(TeacherVO vo) {
		//선생님 정보 수정
		int a = mybatis.update("teacherUpdate", vo);
		return a;
	}

	public TeacherVO teacherOneIn(String userid) {
		//선생님 정보유무
		TeacherVO vo = (TeacherVO) mybatis.selectOne("teacherOneIn", userid);
		
		return vo;
	}

	public int insertEpWrite(TeacherInfoVO vo) {
		//선생님 후기 작성
		
		int a = mybatis.insert("insertEpWrite", vo);
		
		return a;
	}

	public int insertCurri(TeacherCurriVO vo) {
		//선생님 커리큘럼 등록
		
		int a =mybatis.insert("insertCurri", vo); 
		
		return a;
	}

	public int upCurri(TeacherCurriVO vo) {
		//파일수정
		
		int a = mybatis.update("updateCurri", vo); 
		return a;
	}
	
	

}
